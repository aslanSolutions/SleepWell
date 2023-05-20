class FeedbackMessage {
  FeedbackMessage();

  static String getOverallMessage(progressValuee) {
    if (progressValuee >= 81) {
      return "Your sleep environment is outstanding. You're providing yourself with the best conditions for a restful sleep.";
    }
    if (progressValuee >= 51) {
      return "Your sleep environment is decent, but there is room for improvement. Explore changes that can enhance your sleep quality.";
    } else {
      return "Your sleep environment scored low. It's time to optimize your surroundings for a restful sleep.";
    }
  }

  static String getTempMessage(progressValuee) {
    if (progressValuee >= 81) {
      return "Perfect Temperature! Your room temperature is ideal for a restful sleeping environment. .";
    }
    if (progressValuee >= 51) {
      return "The  temperature in your sleep environment is moderate. It could be adjusted slightly for an even better sleep experience.";
    } else {
      return "The room temperature is not suitable for a restful sleep. Consider adjusting the temperature to create a more comfortable environment for better sleep quality.";
    }
  }

  static String getLightMessage(progressValuee) {
    if (progressValuee >= 81) {
      return "Ideal Sleep Lighting! Your room light is perfect for a restful sleeping environment.";
    }
    if (progressValuee >= 51) {
      return "Sleep Lighting Update: The current room light is suitable for a decent sleep environment. Consider making minor adjustments for an even better sleep experience.";
    } else {
      return "Attention Needed: The room light is not convenient for a restful sleep. Adjusting the lighting can significantly improve your sleep quality.";
    }
  }

  static String getLoudnessMessage(progressValuee) {
    if (progressValuee >= 81) {
      return "Perfectly Peaceful! The noise level in your sleep environment is ideal for a restful night's sleep.";
    }
    if (progressValuee >= 51) {
      return "Noise Level Update: The noise level in your room is moderate. Consider reducing any background noise for a more peaceful sleep experience.";
    } else {
      return "Noisy Environment Alert! The noise level in your room is not convenient for a restful sleep. Take steps to reduce noise and create a quieter atmosphere for better sleep quality.";
    }
  }

  static String getHumidityMessage(progressValuee) {
    if (progressValuee >= 81) {
      return "Perfect Humidity Balance! Your room's humidity is ideal for a restful sleeping environment. ";
    }
    if (progressValuee >= 51) {
      return "The humidity level in your room is moderate. Consider adjusting it slightly for an even more comfortable sleep experience.";
    } else {
      return "Unfavorable Humidity Alert! The humidity level in your room is not suitable for a restful sleep. Take measures to regulate the humidity and create a more convenient sleep environment for better rest.";
    }
  }
}
