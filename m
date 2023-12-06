Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDE134CFC
	for <linux-staging@lists.linux.dev>; Wed,  6 Dec 2023 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOP-0007jl-QU; Wed, 06 Dec 2023 12:48:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqON-00DwyG-VB; Wed, 06 Dec 2023 12:48:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqON-00FR3i-M7; Wed, 06 Dec 2023 12:48:39 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: 
Cc: kernel@pengutronix.de,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 109/115] staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
Date: Wed,  6 Dec 2023 12:45:03 +0100
Message-ID:  <9c0af08b9a1264ec0068fd7b0bbdce95f26403f5.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5372; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=xdfnHoqW89a1vj4lwoIM5ofzSNxkWX4r3zykvXN5j7o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF9dCPQMjdyIwAzcKNzlVIBgLaVXdbd0Vt3J0 2O07s3sPhKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBfXQAKCRCPgPtYfRL+ Tp0kB/9nHkfcryYE+8Bimo2909m4svSYlvv/A02esvaMNlz2TAhIlqIeMNSdNZ8PWErdiBwMRwk nsXbHjtvH3D94U8sD9fHxH5VCPtfv7syc0Y6H+UwpDBTOarp/cQ7MtNAwwZfOco+CNgG5ncIg0p HQrbW8lpwnCyl9XuFsEr3A4Ew9NQ/sqrxTuI2NDBEe2KTQbuHC0epRBwpcwDmQsA32VBK8+AK/B LvgwNoZw8H9lZA8oRjpbKZSwPpwHF7MLWJ+Qffpbm5AJWMnc4suZmpaAS68dUYZ73ikJ/BjtsxX vtfPuOTX1fyXIK3buEZ4PRjbxpzmJXYFJQ4SapcZSSN0BWfh
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

This prepares the greybus pwm driver to further changes of the pwm core
outlined in the commit introducing devm_pwmchip_alloc(). There is no
intended semantical change and the driver should behave as before.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/greybus/pwm.c | 75 ++++++++++-------------------------
 1 file changed, 20 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 75e0518791d8..a90f41c374dc 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -16,26 +16,11 @@
 
 struct gb_pwm_chip {
 	struct gb_connection	*connection;
-	u8			pwm_max;	/* max pwm number */
-	struct pwm_chip		chip;
 };
 
 static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
 {
-	return container_of(chip, struct gb_pwm_chip, chip);
-}
-
-static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
-{
-	struct gb_pwm_count_response response;
-	int ret;
-
-	ret = gb_operation_sync(pwmc->connection, GB_PWM_TYPE_PWM_COUNT,
-				NULL, 0, &response, sizeof(response));
-	if (ret)
-		return ret;
-	pwmc->pwm_max = response.count;
-	return 0;
+	return pwmchip_get_drvdata(chip);
 }
 
 static int gb_pwm_activate_operation(struct pwm_chip *chip, u8 which)
@@ -45,9 +30,6 @@ static int gb_pwm_activate_operation(struct pwm_chip *chip, u8 which)
 	struct gbphy_device *gbphy_dev;
 	int ret;
 
-	if (which > pwmc->pwm_max)
-		return -EINVAL;
-
 	request.which = which;
 
 	gbphy_dev = to_gbphy_dev(pwmchip_parent(chip));
@@ -71,9 +53,6 @@ static int gb_pwm_deactivate_operation(struct pwm_chip *chip,
 	struct gbphy_device *gbphy_dev;
 	int ret;
 
-	if (which > pwmc->pwm_max)
-		return -EINVAL;
-
 	request.which = which;
 
 	gbphy_dev = to_gbphy_dev(pwmchip_parent(chip));
@@ -97,9 +76,6 @@ static int gb_pwm_config_operation(struct pwm_chip *chip,
 	struct gbphy_device *gbphy_dev;
 	int ret;
 
-	if (which > pwmc->pwm_max)
-		return -EINVAL;
-
 	request.which = which;
 	request.duty = cpu_to_le32(duty);
 	request.period = cpu_to_le32(period);
@@ -125,9 +101,6 @@ static int gb_pwm_set_polarity_operation(struct pwm_chip *chip,
 	struct gbphy_device *gbphy_dev;
 	int ret;
 
-	if (which > pwmc->pwm_max)
-		return -EINVAL;
-
 	request.which = which;
 	request.polarity = polarity;
 
@@ -151,9 +124,6 @@ static int gb_pwm_enable_operation(struct pwm_chip *chip, u8 which)
 	struct gbphy_device *gbphy_dev;
 	int ret;
 
-	if (which > pwmc->pwm_max)
-		return -EINVAL;
-
 	request.which = which;
 
 	gbphy_dev = to_gbphy_dev(pwmchip_parent(chip));
@@ -176,9 +146,6 @@ static int gb_pwm_disable_operation(struct pwm_chip *chip, u8 which)
 	struct gbphy_device *gbphy_dev;
 	int ret;
 
-	if (which > pwmc->pwm_max)
-		return -EINVAL;
-
 	request.which = which;
 
 	ret = gb_operation_sync(pwmc->connection, GB_PWM_TYPE_DISABLE,
@@ -263,38 +230,37 @@ static int gb_pwm_probe(struct gbphy_device *gbphy_dev,
 	struct gb_connection *connection;
 	struct gb_pwm_chip *pwmc;
 	struct pwm_chip *chip;
+	struct gb_pwm_count_response response;
 	int ret;
 
-	pwmc = kzalloc(sizeof(*pwmc), GFP_KERNEL);
-	if (!pwmc)
-		return -ENOMEM;
-
 	connection = gb_connection_create(gbphy_dev->bundle,
 					  le16_to_cpu(gbphy_dev->cport_desc->id),
 					  NULL);
-	if (IS_ERR(connection)) {
-		ret = PTR_ERR(connection);
-		goto exit_pwmc_free;
+	if (IS_ERR(connection))
+		return PTR_ERR(connection);
+
+	ret = gb_operation_sync(pwmc->connection, GB_PWM_TYPE_PWM_COUNT,
+				NULL, 0, &response, sizeof(response));
+	if (ret)
+		goto exit_connection_destroy;
+
+	chip = devm_pwmchip_alloc(&gbphy_dev->dev, response.count, sizeof(*pwmc));
+	if (IS_ERR(chip)) {
+		ret = PTR_ERR(chip);
+		goto exit_connection_destroy;
 	}
 
+	pwmc = pwm_chip_to_gb_pwm_chip(chip);
 	pwmc->connection = connection;
+
 	gb_connection_set_data(connection, pwmc);
-	gb_gbphy_set_data(gbphy_dev, pwmc);
+	gb_gbphy_set_data(gbphy_dev, chip);
 
 	ret = gb_connection_enable(connection);
 	if (ret)
 		goto exit_connection_destroy;
 
-	/* Query number of pwms present */
-	ret = gb_pwm_count_operation(pwmc);
-	if (ret)
-		goto exit_connection_disable;
-
-	chip = &pwmc->chip;
-
-	chip->dev = &gbphy_dev->dev;
 	chip->ops = &gb_pwm_ops;
-	chip->npwm = pwmc->pwm_max + 1;
 
 	ret = pwmchip_add(chip);
 	if (ret) {
@@ -310,14 +276,13 @@ static int gb_pwm_probe(struct gbphy_device *gbphy_dev,
 	gb_connection_disable(connection);
 exit_connection_destroy:
 	gb_connection_destroy(connection);
-exit_pwmc_free:
-	kfree(pwmc);
 	return ret;
 }
 
 static void gb_pwm_remove(struct gbphy_device *gbphy_dev)
 {
-	struct gb_pwm_chip *pwmc = gb_gbphy_get_data(gbphy_dev);
+	struct pwm_chip *chip = gb_gbphy_get_data(gbphy_dev);
+	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
 	struct gb_connection *connection = pwmc->connection;
 	int ret;
 
@@ -325,7 +290,7 @@ static void gb_pwm_remove(struct gbphy_device *gbphy_dev)
 	if (ret)
 		gbphy_runtime_get_noresume(gbphy_dev);
 
-	pwmchip_remove(&pwmc->chip);
+	pwmchip_remove(chip);
 	gb_connection_disable(connection);
 	gb_connection_destroy(connection);
 	kfree(pwmc);
-- 
2.42.0

