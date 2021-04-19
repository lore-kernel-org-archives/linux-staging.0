Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325C52F83
	for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 19:15:10 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 10so14972982pfl.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=06QZL6AdNEJNLxU+QdyqLASrEfF3FlUiStWVtENL220=;
        b=l/n06LGrrmKMQk0UvGuADT3Nr2w8LGfmTVnDSOehCwSTSDzY1j8dPwa+Esu+wLly2h
         ILW3mXo0QqBU4uuXhw5l1w0K4JH4SeuvdZ4jPbS4XFwpIEFZI13yk4wTsftK4LS+DPpT
         MALfLXQRMqGBaRLuBCKPgWs2OHgPYqfxuhh1jjHm/GBV7UwNqPDClHYsQquu7HtXzE1p
         zV7hFHxIYz/4V52aB2Nmvj8FEJoU3cdXjcruJRE7lBLnTYb4Y5/ukzwLnRnKfzagVWOQ
         orkj+oD6AuwT9CDpmZqPV/o+AsEEsEf5sdZ3Ds9oLxNfomDDLzJDy1FBBvFbzK6nzxse
         NUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=06QZL6AdNEJNLxU+QdyqLASrEfF3FlUiStWVtENL220=;
        b=oC/ZPY4HKE9h0Pb5UfLQ0c/jMviBK2ouX5XiI4/aF4el11us9bRDIVSSLtHIr3ODJU
         z/6+HiNN6+ZnAICvn/cLCybaPDdaAgNKlo4c91rfDtLU8NYf6D1TPL89sxJRZuZsTNx5
         8ijHYQ2y14cmcS6Dcva5ZSGSt4/qScHr/Ifb9qBgRynwZWp9ZP3oIabFLdJwyje14KTI
         6nJeGEkeYgh5ylSMM8Ci5EJGlR4ZtQNEugw4zijeAUByyRagzP5Zdfoe/iE4Lv7/FeeN
         EtPODgH24BN5IoN3BjOzmIFgMEYMbwWPqOopw3sZGphr8xMxWmbH4Z05b8N01YBAjGsy
         qWhg==
X-Gm-Message-State: AOAM530tH6DOepByG29TybRJS9nXyBlfQ27yVxzyOHe4TWuQpI+aUkng
	c4UgLkrQvx7IAAo1IufN+eI=
X-Google-Smtp-Source: ABdhPJysS7sfKldg2q2aFgttLZYbRaeQvM92gADFLo6yShNhnVppLOcZzwFsUsRp3isAMiOV3WanPg==
X-Received: by 2002:a62:3892:0:b029:250:4fac:7e30 with SMTP id f140-20020a6238920000b02902504fac7e30mr21475850pfa.81.1618859709696;
        Mon, 19 Apr 2021 12:15:09 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id x62sm13072884pfb.71.2021.04.19.12.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:15:09 -0700 (PDT)
From: Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date: Tue, 20 Apr 2021 00:45:04 +0530
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: mh12gx2825@gmail.com
Subject: [PATCH 4/6] staging: media: atomisp: reformat code comment blocks
Message-ID: <7cf7b8253550460e7273c94bae005939000679fd.1618859059.git.drv@mailo.com>
References: <cover.1618859059.git.drv@mailo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618859059.git.drv@mailo.com>

Reformat code comment blocks according to the coding style guidelines.
This resolves different checkpatch script WARNINGs around block comments.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 .../media/atomisp/i2c/atomisp-gc2235.c        |  8 +++----
 .../atomisp/i2c/atomisp-libmsrlisthelper.c    |  3 ++-
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 22 +++++++++++--------
 .../media/atomisp/i2c/atomisp-ov2680.c        |  3 ++-
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 548c572d3b57..a585d73665a6 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -747,10 +747,10 @@ static int startup(struct v4l2_subdev *sd)
 
 	if (is_init == 0) {
 		/* force gc2235 to do a reset in res change, otherwise it
-		* can not output normal after switching res. and it is not
-		* necessary for first time run up after power on, for the sack
-		* of performance
-		*/
+		 * can not output normal after switching res. and it is not
+		 * necessary for first time run up after power on, for the sack
+		 * of performance
+		 */
 		power_down(sd);
 		power_up(sd);
 		gc2235_write_reg_array(client, gc2235_init_settings);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
index b93c80471f22..750b3484eb19 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
@@ -57,7 +57,8 @@ static int set_msr_configuration(struct i2c_client *client, uint8_t *bufptr,
 	 * By convention, the first two bytes of actual data should be
 	 * understood as an address in the sensor address space (hibyte
 	 * followed by lobyte) where the remaining data in the sequence
-	 * will be written. */
+	 * will be written.
+	 */
 
 	u8 *ptr = bufptr;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 465fc4468442..160bb58ce708 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -478,7 +478,8 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
 	/* Note: current modules wire only one GPIO signal (RESET#),
 	 * but the schematic wires up two to the connector.  BIOS
 	 * versions have been unfortunately inconsistent with which
-	 * ACPI index RESET# is on, so hit both */
+	 * ACPI index RESET# is on, so hit both
+	 */
 
 	if (flag) {
 		ret = dev->platform_data->gpio0_ctrl(sd, 0);
@@ -1019,8 +1020,8 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 		dev->first_gain = AnalogGain;
 		dev->first_diggain = DigitalGain;
 	}
-	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +
-	((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8); */
+	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +		*/
+	/* ((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8);	*/
 
 	/* set frame length */
 	if (FLines < coarse_integration + 6)
@@ -1035,7 +1036,8 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 
 	/* set coarse integration */
 	/* 3A provide real exposure time.
-		should not translate to any value here. */
+	 * should not translate to any value here.
+	 */
 	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
 				REG_EXPO_COARSE, (u16)(coarse_integration));
 	if (ret) {
@@ -1044,7 +1046,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 	}
 
 	/*
-	// set analog/digital gain
+	 * set analog/digital gain
 	switch(AnalogGain)
 	{
 	case 0:
@@ -1069,8 +1071,9 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
 	*/
 	if (DigitalGain >= 16 || DigitalGain <= 1)
 		DigitalGain = 1;
-	/* AnalogGainToWrite =
-		(u16)((DigitalGain << 12) | AnalogGainToWrite); */
+
+	/* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
+	 */
 	AnalogGainToWrite = (u16)((DigitalGain << 12) | (u16)AnalogGain);
 	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
 				REG_GAIN, AnalogGainToWrite);
@@ -1096,7 +1099,8 @@ static long mt9m114_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
 }
 
 /* This returns the exposure time being used. This should only be used
-   for filling in EXIF data, not for actual image processing. */
+ * for filling in EXIF data, not for actual image processing.
+ */
 static int mt9m114_g_exposure(struct v4l2_subdev *sd, s32 *value)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -1297,7 +1301,7 @@ static int mt9m114_g_ev(struct v4l2_subdev *sd, s32 *val)
 
 /* Fake interface
  * mt9m114 now can not support 3a_lock
-*/
+ */
 static int mt9m114_s_3a_lock(struct v4l2_subdev *sd, s32 val)
 {
 	aaalock = val;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index c17615149f46..91dca275a08e 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -732,7 +732,8 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
 	 * existing integrations often wire two (reset/power_down)
 	 * because that is the way other sensors work.  There is no
 	 * way to tell how it is wired internally, so existing
-	 * firmwares expose both and we drive them symmetrically. */
+	 * firmwares expose both and we drive them symmetrically.
+	 */
 	if (flag) {
 		ret = dev->platform_data->gpio0_ctrl(sd, 1);
 		usleep_range(10000, 15000);
-- 
2.25.1

