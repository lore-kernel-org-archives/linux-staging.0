Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD3272
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 12:01:07 +0000 (UTC)
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
	by mail.ispras.ru (Postfix) with ESMTPS id 42A2140D4004;
	Tue, 10 Aug 2021 11:53:04 +0000 (UTC)
From: Evgeny Novikov <novikov@ispras.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Evgeny Novikov <novikov@ispras.ru>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dewar <alex.dewar90@gmail.com>,
	Colin Ian King <colin.king@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ldv-project@linuxtesting.org
Subject: [PATCH] media: atomisp: Fix error handling in probe
Date: Tue, 10 Aug 2021 14:53:03 +0300
Message-Id: <20210810115303.9089-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were several issues with handling errors in lm3554_probe():
- Probe did not set the error code when v4l2_ctrl_handler_init() failed.
- It intermixed gotos for handling errors of v4l2_ctrl_handler_init()
  and media_entity_pads_init().
- Probe did not free resources in case of failures of
  atomisp_register_i2c_module().

The patch fixes all these issues.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 .../media/atomisp/i2c/atomisp-lm3554.c        | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index 362ed44b4eff..1e9432d6ec0c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -835,7 +835,6 @@ static int lm3554_probe(struct i2c_client *client)
 	int err = 0;
 	struct lm3554 *flash;
 	unsigned int i;
-	int ret;
 
 	flash = kzalloc(sizeof(*flash), GFP_KERNEL);
 	if (!flash)
@@ -852,12 +851,12 @@ static int lm3554_probe(struct i2c_client *client)
 	flash->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	flash->mode = ATOMISP_FLASH_MODE_OFF;
 	flash->timeout = LM3554_MAX_TIMEOUT / LM3554_TIMEOUT_STEPSIZE - 1;
-	ret =
+	err =
 	    v4l2_ctrl_handler_init(&flash->ctrl_handler,
 				   ARRAY_SIZE(lm3554_controls));
-	if (ret) {
+	if (err) {
 		dev_err(&client->dev, "error initialize a ctrl_handler.\n");
-		goto fail3;
+		goto fail2;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(lm3554_controls); i++)
@@ -873,7 +872,7 @@ static int lm3554_probe(struct i2c_client *client)
 	err = media_entity_pads_init(&flash->sd.entity, 0, NULL);
 	if (err) {
 		dev_err(&client->dev, "error initialize a media entity.\n");
-		goto fail2;
+		goto fail3;
 	}
 
 	flash->sd.entity.function = MEDIA_ENT_F_FLASH;
@@ -884,12 +883,23 @@ static int lm3554_probe(struct i2c_client *client)
 
 	err = lm3554_gpio_init(client);
 	if (err) {
-		dev_err(&client->dev, "gpio request/direction_output fail");
-		goto fail3;
+		dev_err(&client->dev, "gpio request/direction_output fail.\n");
+		goto fail4;
 	}
-	return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
-fail3:
+
+	err = atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
+	if (err) {
+		dev_err(&client->dev, "fail to register atomisp i2c module.\n");
+		goto fail5;
+	}
+
+	return 0;
+
+fail5:
+	lm3554_gpio_uninit(client);
+fail4:
 	media_entity_cleanup(&flash->sd.entity);
+fail3:
 	v4l2_ctrl_handler_free(&flash->ctrl_handler);
 fail2:
 	v4l2_device_unregister_subdev(&flash->sd);
-- 
2.26.2

