		
		
			<form action="" id="validation-form" role="form" class="form-horizontal col-md-8"
				<fieldset>
					<div class="form-group">
						<label for="name" class="col-lg-4">Your Name</label>
						<div class="col-lg-8">
						    <input type="text" class="form-control" name="name" id="name">
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="col-lg-4">Email Address</label>
						<div class="col-lg-8">
						    <input type="text" class="form-control" name="email" id="email">
						</div>
					</div>

					<div class="form-group">
						<label for="message" class="col-lg-4">Your Message</label>
						<div class="col-lg-8">
						    <textarea class="form-control" name="message" id="message" rows="4"></textarea>
						</div>
					</div>
						    
				    <div class="form-group">
				        <label for="validateSelect" class="col-lg-4">Select list</label>
						<div class="col-lg-8">
				            <select id="validateSelect" name="validateSelect" class="form-control">
				                <option value="">Select...</option>
				                <option value="1">1</option>
				                <option value="2">2</option>
				                <option value="3">3</option>
				                <option value="4">4</option>
				                <option value="5">5</option>
				            </select>
				        </div>
				    </div>

				    <div class="form-group">
					    <label class="col-lg-4">Checkboxes</label>
						<div class="col-lg-8">
							<div class="checkbox">
								<label>
									<input type="checkbox" name="validateCheckbox" value="1">
										 Option one is this and that&mdash;be sure to include why it's great
								</label>
							</div>

							<div class="checkbox">
								<label>
									<input type="checkbox" name="validateCheckbox" value="2">
									    Option one is this and that&mdash;be sure to include why it's great
								</label>
							</div>

							<div class="checkbox">
								<label>
									<input type="checkbox" name="validateCheckbox" value="3">
									    Option one is this and that&mdash;be sure to include why it's great
								</label>
							</div>
						</div>
					</div> <!-- /.form-group -->

					<div class="form-group">
						<label class="col-lg-4">Radios</label>
							<div class="col-lg-8">
								<div class="radio">
									<label>
										<input type="radio" name="validateRadio" id="optionsRadios1" value="option1">
										Option one is this and that&mdash;be sure to include why it's great
									</label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="validateRadio" id="optionsRadios2" value="option2">
										Option two can be something else and selecting it will deselect option one
									</label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="validateRadio" id="optionsRadios3" value="option3">
										Option two can be something else and selecting it will deselect option one
									</label>
								</div>
							</div>

					</div> <!-- /.form-group -->

					<br />
				          
					<div class="form-group">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
						      <button type="submit" class="btn btn-success"><i class="icon-ok"></i> Validate Form</button>&nbsp;&nbsp;
						      <button type="reset" class="btn btn-default">Cancel</button>
						</div>
					</div>
				</fieldset>
			</form>