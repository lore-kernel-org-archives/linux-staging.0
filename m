Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756B3539B;
	Thu, 30 Mar 2023 14:11:34 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p34so11003201wms.3;
        Thu, 30 Mar 2023 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/11lbx2+OLsP5+4dMf0d4+77ejtkZtCxn73BU3ygIA=;
        b=hHjrk15GcvrQeufjkpCutHUhQG02cItQfcmF1eCByAc5XP/3GRJ3l+/Z5DqtxBEpzo
         vSjKRI4KxOkNLJfwrBRBPCM3jJqrNGioGh2W6VOtTnAKcjyIaPGCsb8y9oxGycPYHD9d
         R0mHuIILIRhID4cmurz77CsOeN95ATFZet0cca6to3YDoqyHE5E0PWOt1uz//rDLNQPw
         f8SS9FRgCMPUBCYipLifK2+sXSCA/XNIjVdTLMTQP3CGbSoTtf5xp475GCWFDsO5Phgg
         7h6onpoZfL8r9xvMceXS4dGp0LssRSROyideVcC79VX2uppc/ts7Wul6RcYBxAlzUdJd
         Nmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/11lbx2+OLsP5+4dMf0d4+77ejtkZtCxn73BU3ygIA=;
        b=IqjdApGW7o6m5eOxN+4d/Xvh8bdJcpKtsVaLbi6oH+vpuRJlx0OqG3wtiiwCp3pu0D
         rh/1CPOB2zMLcibPvJkSS5EFvmuOavhwgyRsMVFlfc30HFTlH9OzvgkJH/UIT28TwgU/
         VeU7cEIS4dAmlB1mhuS4jRSahZvVXZ1KWMHO8lc5jAJA0Gkuw6nhA+iRXy/zdA2iFYYj
         /nrEWdUkullWDS149YstYXDDtNxQ4fULNsqYakHb3ZPPVTpKg6Nd0J3OE+9Qgzs6b74/
         U51FUxcL3CI5PPokiZmrHsmKRhO99tdG3CmGOAbGXMTN8IO9JrrHIC9kkmQ4HzhFRQew
         V47Q==
X-Gm-Message-State: AO0yUKXnkLPsb4UfQSQSxtf3HctHHjBTEvNrxudN2O+DkHjQF7z673S9
	yMsbaXU4ioFztzHThEv7bSfi29vTKAC0sxdR
X-Google-Smtp-Source: AK7set+0v3qdSi/olNwk5smzxmld9SdjfWJXtXnVbwWl/UlS7cLg4FLwT34Cf0kqEwRjVI7Gm/yaYA==
X-Received: by 2002:a05:600c:2049:b0:3df:e6bb:768 with SMTP id p9-20020a05600c204900b003dfe6bb0768mr17449957wmg.24.1680185492312;
        Thu, 30 Mar 2023 07:11:32 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b5-20020adfee85000000b002c573778432sm32761705wro.102.2023.03.30.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:11:31 -0700 (PDT)
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
Subject: [PATCH 1/2] staging: greybus: add a single exit path to arche_platform_wd_irq()
Date: Thu, 30 Mar 2023 19:11:24 +0500
Message-Id: <e670baa9bde47a3bdb02e59ec37a438a62c52dd1.1680185025.git.kamrankhadijadj@gmail.com>
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

arche_platform_wd_irq() function has two exit paths. To make the code
more readable, use only one exit path.

Suggested-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..a64c1af091b0 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -153,6 +153,7 @@ static irqreturn_t arche_platform_wd_irq_thread(int irq, void *devid)
 static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 {
 	struct arche_platform_drvdata *arche_pdata = devid;
+	irqreturn_t rc = IRQ_HANDLED;
 	unsigned long flags;
 
 	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
@@ -180,9 +181,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 						WD_STATE_COLDBOOT_START) {
 					arche_platform_set_wake_detect_state(arche_pdata,
 									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
-					return IRQ_WAKE_THREAD;
+					rc = IRQ_WAKE_THREAD;
 				}
 			}
 		}
@@ -204,7 +203,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 
 	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 
-	return IRQ_HANDLED;
+	return rc;
 }
 
 /*
-- 
2.34.1

