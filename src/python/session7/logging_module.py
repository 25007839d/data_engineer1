# simple steps
import logging # first Import module

# Configure logging
# logging.basicConfig(level=logging.INFO)
#
# logging.debug("This is a debug message")
# logging.info("This is an info message")
# logging.warning("This is a warning")
# logging.error("This is an error")
# logging.critical("This is critical")


# let's take example to process txt file.
import logging
import datetime
current_time = datetime.date.today()
file_name = f"csv_file{current_time}.log"
print(file_name)
# Setup logging
logging.basicConfig(
    filename=file_name,
    level=logging.INFO,
    format="%(asctime)s : %(levelname)s : %(message)s"
)

# Common format specifiers:
#
# %(levelname)s → Logging level (DEBUG, INFO, WARNING, ERROR, CRITICAL)
#
# %(message)s → The actual log message
#
# %(asctime)s → Time of log
#
# %(name)s → Logger name
#
# %(filename)s → Filename where log happened
#
# %(funcName)s → Function name
#
# %(lineno)d → Line number in file
#
# %(process)d → Process ID
#
# %(thread)d → Thread ID


def transform_file(input_file, output_file):
    logging.info(f"Reading from {input_file}")
    # print(f"Reading from {input_file}")

    try:
        with open(input_file, "r", encoding="utf-8") as f:
            data = f.read()
            logging.info("File read successfully")

        # Simple transformation: convert to uppercase
        transformed = data.upper()
        logging.info("Transformation complete")

        with open(output_file, "w", encoding="utf-8") as f:
            f.write(transformed)
            logging.info(f"Data written to {output_file}")

    except Exception as e:
        logging.error(f"Error while processing file: {e}", exc_info=True)

# Run Example
transform_file("input.txt", "output.txt")
