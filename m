Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BF71
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 15:51:14 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so5661788pjb.3
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KW9angPw3uBUocOgesJzJUAk5OzLa/Lg9bikp5kRKbI=;
        b=FMbOqziRLgDKIZoWVAdq8CFZExQjsUcNnzkU5XVLJrZgi4uqiPGSGOLrfd8gxVRxIq
         a9PRb8Ser/wJRuid5nhVLdrRQa7OpTvgP6evYiZH+aMKFVkTIlET5hKudlwh/Ve+QQ1K
         WtteAcDqv6cTEjySsyVmOAS4CNILvov/RMbODt11213ToyFVMBbFTMpEuRDqHQStzi1p
         A1lkt7pOCBFQfjvPovSIA1N7e7MjiycBBdQ29ApmUdc7oOdRr1VMFDCyYLch073JG8ia
         nVaPLr2cuCsutc8xEQZFwJG7nPC/k23LqEdm69KaMWmav7i6C9Cux5JPVRZ6mu0sY+m9
         tA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KW9angPw3uBUocOgesJzJUAk5OzLa/Lg9bikp5kRKbI=;
        b=WtguGUIhxTKKxwL5SZGSsG3iv4i5FVLB1aYoOUjYcjcjI7A6oTLMd9g1FYPjtSQK52
         drlKQVMYYeRNOLrRxEbSA/sG6mJEmLc3oNQl8UlLbJe1l4027CneOOwAZtPgWm7Kgbt7
         XH8nbTEBPR8BxNq/w/34Ffu1Pt171XN9TdMEG5lZOrZq02ug2wfsWsROZ/sgFg3rg6hI
         g/bq1Giv+29xeOxuYPYNOgQR06JjH1DM1HWST9ebx7im9F+E4bgqofjqwgCtQZyc1MvR
         v4HfL2mv5ZvGcLsmmrjO/4tlWGMEtI3pV1QfFMeGYr5fFlTafGsn66InbCxvTZvwrvj1
         DA6w==
X-Gm-Message-State: AOAM530FQzTlZvtRWLFINAj+Hc7vhbuX1xsfCS+foNE6jzY0qx+ocUlz
	p1oA9jQ3ya3o/KSv2zoDLUQ=
X-Google-Smtp-Source: ABdhPJzBzF8qJsOJYgA1P8WydvG77IGPxwaK/mnu+iKrKmuJISR7ik1B3/24JEWJNshZ5QPZPVIuNA==
X-Received: by 2002:a17:90b:703:: with SMTP id s3mr5660936pjz.69.1621525874481;
        Thu, 20 May 2021 08:51:14 -0700 (PDT)
Received: from andromeda.localdomain ([103.192.117.174])
        by smtp.gmail.com with ESMTPSA id v8sm2279270pff.220.2021.05.20.08.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 08:51:14 -0700 (PDT)
From: Aniket Bhattacharyea <aniketmail669@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aniket Bhattacharyea <aniketmail669@gmail.com>
Subject: [PATCH] media: atomisp: Replace whitespace at the beginning of line
Date: Thu, 20 May 2021 21:20:13 +0530
Message-Id: <20210520155013.929465-1-aniketmail669@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces the whitespaces at the beginning of line with tabs.
Identified by checkpatch: WARNING: please, no spaces at the start of a line.

Signed-off-by: Aniket Bhattacharyea <aniketmail669@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 135994d44802..93ac7e183344 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1041,9 +1041,9 @@ static struct camera_sensor_platform_data acpi_gmin_plat = {
 };
 
 struct camera_sensor_platform_data *gmin_camera_platform_data(
-    struct v4l2_subdev *subdev,
-    enum atomisp_input_format csi_format,
-    enum atomisp_bayer_order csi_bayer)
+	struct v4l2_subdev *subdev,
+	enum atomisp_input_format csi_format,
+	enum atomisp_bayer_order csi_bayer)
 {
 	u8 pmic_i2c_addr = gmin_detect_pmic(subdev);
 	struct gmin_subdev *gs;
-- 
2.31.1

