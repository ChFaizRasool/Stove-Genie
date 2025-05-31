import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/bloc/state/recipe_state.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';
import 'package:stove_genie/pages/recipe/widgets/category_dropdown_field.dart';
import 'package:stove_genie/pages/recipe/widgets/recipe_image_bottomsheet.dart';
import 'package:stove_genie/widget/custom_text_field.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();

  final _recipeCubit = Di().sl<RecipeCubit>();
  String? selectedCategory;

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      _recipeCubit.addRecipe(
        context: context,
        recipe: RecipeModel(
          title: titleController.text,
          description: descriptionController.text,
          calories: caloriesController.text,
          time: timeController.text,
          image: _recipeCubit.selectedRecipeImage?.path ?? '',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _recipeCubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Add New Recipe"),
          centerTitle: true,
        ),
        body: BlocBuilder<RecipeCubit, RecipeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Image picker section
                    _buildImagePickerSection(),
                    const SizedBox(height: 20),

                    // Form fields
                    _buildInput("Title", titleController),
                    _buildInput("Description", descriptionController),
                    _buildInput("Time", timeController),
                    _buildInput("Calories", caloriesController),
                    SizedBox(
                      height: 52,
                      child: CategoryDropdownField(
                        selectedCategory: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Save button
                    ElevatedButton(
                      onPressed: _saveRecipe,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        "Save Recipe",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildImagePickerSection() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: _recipeCubit.selectedRecipeImage != null
          ? _buildSelectedImage()
          : _buildImagePickerPlaceholder(),
    );
  }

  Widget _buildSelectedImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            _recipeCubit.selectedRecipeImage!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                _recipeCubit.clearSelectedImage();
              },
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                showImagePickerBottomSheet(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagePickerPlaceholder() {
    return BlocBuilder(
      bloc: _recipeCubit,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showImagePickerBottomSheet(context);
          },
          borderRadius: BorderRadius.circular(12),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                size: 50,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              Text(
                'Add Recipe Image',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Tap to select from gallery or camera',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInput(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomTextField(
        text: label,
        controller: controller,
        validator: (value) =>
            value?.isEmpty ?? true ? 'Please enter $label' : null,
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    timeController.dispose();
    caloriesController.dispose();
    super.dispose();
  }
}
