Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020056FA0;
	Thu, 30 Mar 2023 14:11:36 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v1so19244363wrv.1;
        Thu, 30 Mar 2023 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+FoJdn0v3mxQP8H3rv8z+g2SXXjZfcMeYd0mBDcN58=;
        b=a49YjFIziZlCSUFnzcypUe3Vbs/P/pZFB1JfUdfg1cCflz0+0TpTIqRyvVav/hYc2O
         ygZG6EhI3MLhz+tAlP8PaSKGZO+aA7TZ9gnTwHIzlnqLSFuNQHVCAkQw6Lk4hLd6qe9q
         w9UgFcBtHjjzeUkAtDIxBBrtK2cSlYn3baAUx4G/V9wsUz4c2uZadquagx/bTH8m4zAS
         uSq18TxuF2jpOa+YaoLG/lRy8euHZnwQ3kRAdBkB3183bF8jbr2OgRyTRLbBStpc/+69
         avifYLVbfUYOfHZTAYLn7YnTnLsasqRktRAYcLK+FDxTWXCuXL8gZZQqrGeYjSEIUpFU
         lqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+FoJdn0v3mxQP8H3rv8z+g2SXXjZfcMeYd0mBDcN58=;
        b=KRwSdMJykLtxyWSvKl33J6i2/FxSYKdFyQX9L39i9wKI71xzBFxHJiL5orMa3NDWBN
         4FhL1OxZ3Nc7cTa335WEYo4gpsMCSxEuf2o0mSyFZ0TUkpQ1MBSs4VxR5C2pUynprpr3
         51+Ct8baLuC+OWrzVUFxfYgkq+P5yfhzIXV41FF+dvUOfip+roK+iXFqGhVrgbvCmoBz
         Og+LZa6Z2dYLEdiIuTg6QZvLJB/dV2EksjfVmVWHGJswqJFXcw0L0pBmczdIwbSwwVPm
         GtLwH117irXaXwcbS5k+jx6xwF96ftYYUVY4p1Z8J3uw0tKGoeqYTA4RBVz4lBQEN04r
         GGGA==
X-Gm-Message-State: AAQBX9dtDDBdFg3t81aN5f+i8nnTtgVgqA8GZ8F7SOeJHqYJn77xpQfK
	dwa4coZ5l4fapZWIKg+r8n3q+JafKwcJwDuY
X-Google-Smtp-Source: AKy350bWVUPToKKGL3iWneHoEStvcoEquC3yrNGYcOy60iAv+Ky8hm0FdCIU3pgtTNqsbC8TVFQoow==
X-Received: by 2002:a5d:500a:0:b0:2cb:29eb:a35e with SMTP id e10-20020a5d500a000000b002cb29eba35emr5019627wrt.11.1680185494763;
        Thu, 30 Mar 2023 07:11:34 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b5-20020adfee85000000b002c573778432sm32761705wro.102.2023.03.30.07.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:11:34 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
Date: Thu, 30 Mar 2023 19:11:25 +0500
Message-Id: <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680185025.git.kamrankhadijadj@gmail.com>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux kernel coding-style suggests to fix your program if it needs more
than 3 levels of indentation. Due to indentation, line length also
exceeds 100 columns, resulting in issues reported by checkpatch.

Refactor the arche_platform_wd_irq() function and reduce the indentation
with the help of goto statement.

Suggested-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 79 ++++++++++++------------
 1 file changed, 41 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index a64c1af091b0..dde30c8da1a1 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -158,49 +158,52 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 
 	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
 
-	if (gpiod_get_value(arche_pdata->wake_detect)) {
-		/* wake/detect rising */
+	if (!gpiod_get_value(arche_pdata->wake_detect))
+		goto falling;
 
+	/* wake/detect rising */
+
+	/*
+	 * If wake/detect line goes high after low, within less than
+	 * 30msec, then standby boot sequence is initiated, which is not
+	 * supported/implemented as of now. So ignore it.
+	 */
+	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
+		goto out;
+
+	if (time_before(jiffies,
+			arche_pdata->wake_detect_start +
+			msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
+		arche_platform_set_wake_detect_state(arche_pdata,
+						     WD_STATE_IDLE);
+		got out;
+	}
+
+	/* Check we are not in middle of irq thread already */
+	if (arche_pdata->wake_detect_state !=
+			WD_STATE_COLDBOOT_START) {
+		arche_platform_set_wake_detect_state(arche_pdata,
+						     WD_STATE_COLDBOOT_TRIG);
+		rc = IRQ_WAKE_THREAD;
+		goto out;
+	}
+
+falling:
+	/* wake/detect falling */
+	if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
+		arche_pdata->wake_detect_start = jiffies;
 		/*
-		 * If wake/detect line goes high after low, within less than
-		 * 30msec, then standby boot sequence is initiated, which is not
-		 * supported/implemented as of now. So ignore it.
+		 * In the beginning, when wake/detect goes low
+		 * (first time), we assume it is meant for coldboot
+		 * and set the flag. If wake/detect line stays low
+		 * beyond 30msec, then it is coldboot else fallback
+		 * to standby boot.
 		 */
-		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
-			if (time_before(jiffies,
-					arche_pdata->wake_detect_start +
-					msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
-				arche_platform_set_wake_detect_state(arche_pdata,
-								     WD_STATE_IDLE);
-			} else {
-				/*
-				 * Check we are not in middle of irq thread
-				 * already
-				 */
-				if (arche_pdata->wake_detect_state !=
-						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
-					rc = IRQ_WAKE_THREAD;
-				}
-			}
-		}
-	} else {
-		/* wake/detect falling */
-		if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
-			arche_pdata->wake_detect_start = jiffies;
-			/*
-			 * In the beginning, when wake/detect goes low
-			 * (first time), we assume it is meant for coldboot
-			 * and set the flag. If wake/detect line stays low
-			 * beyond 30msec, then it is coldboot else fallback
-			 * to standby boot.
-			 */
-			arche_platform_set_wake_detect_state(arche_pdata,
-							     WD_STATE_BOOT_INIT);
-		}
+		arche_platform_set_wake_detect_state(arche_pdata,
+						     WD_STATE_BOOT_INIT);
 	}
 
+out:
 	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 
 	return rc;
-- 
2.34.1

