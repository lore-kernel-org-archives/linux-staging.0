Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA125F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 20:25:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so3022954wma.0
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 13:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gi9OUsUoRxjAcioEAF4TQW9mJ2fTHnHNzeSFEtVk1Wk=;
        b=FhezNaAYqaHT6VhiYQCDNq6ndWAbOd8uPtZWcvln9/4Ha0ctMuPzJr32kuGiG1RJ1M
         xWXaPh0XHlgJL3tHCQjhyzrRtx4R7n9If58CaT/jwZl1i+TRKFGtDcsbWB1YOPj3PD6A
         xp6r51Wufdf2+DHOM/tdy1zE1W8IZCuMjUFNsqvNGxkLwrZEoepPsRR3MjXT+i1ztSRV
         +N6O7vNuav8nphw+acRW8Zr1Uk16iIEu3YgcsxCRbeXhXaML4FW7Sg+7DA4hEIaZ8bA6
         r/tWEjNWSuU4660KSi5eiN/0Hd4R7Nq5wcGz9Vi3Df9O6wNTvVFLJ/nBQxibjfQ0Rds7
         KwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gi9OUsUoRxjAcioEAF4TQW9mJ2fTHnHNzeSFEtVk1Wk=;
        b=boCVirLGN6gQasWXf9XVR0EKsaMcP8fJ/1lirygqPRMDY47NYnpsBf1dOmOOYmJc4n
         xX77+3KMgi7ugMUw71+ARiZ6boBKlHzzBUYpgf72Qfsqv/f9f2JjPPbBQjGUhbXy1nVd
         gGJApWLxTERhYNP4646wiNIld7uMkGEJiO/Hd3cNNn1qJXVHnlxKGruPbl0J9k8GlQAm
         xJBNtd8cMznKRO9IJ4HozjSHiQsD+fk3xmPfarAVktDfwousMlc6mlMLGcEvsNsfoQvX
         Ta0CSjOPxui5+3cSIvOYHQotVKyVW/4RQoe2fiz0BReaaCj//r+VoJiw/eZP0Py8tNAs
         YN5Q==
X-Gm-Message-State: AOAM532XseIaqq1OB80OBgK5wBxMczcrrjwt8zt9Y6bFVTgFDH55R2Gj
	zvTW79YAAj1ExenKvJlcXDw=
X-Google-Smtp-Source: ABdhPJzqSgyQVibalW7B3aVhjcAgmvHwW8HWc7q4lM9+ie7AzcVPs9VcvFZsoFPnVCxpDbyCELPK2A==
X-Received: by 2002:a05:600c:4f94:: with SMTP id n20mr4701240wmq.18.1617222331572;
        Wed, 31 Mar 2021 13:25:31 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:87e9:fdd6:2b7a:c720])
        by smtp.gmail.com with ESMTPSA id u3sm6138637wrt.82.2021.03.31.13.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 13:25:31 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: greybus: arche-platform: Fix ending '(' warnings
Date: Wed, 31 Mar 2021 21:24:45 +0100
Message-Id: <20210331202445.108678-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch check "CHECK: Lines should not end with a '('"
in arche-platform.c:80 and arche-platform.c:184.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index eebf0deb39f5..e374dfc0c92f 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -77,9 +77,8 @@ static void arche_platform_set_state(struct arche_platform_drvdata *arche_pdata,
 }
 
 /* Requires arche_pdata->wake_lock is held by calling context */
-static void arche_platform_set_wake_detect_state(
-				struct arche_platform_drvdata *arche_pdata,
-				enum svc_wakedetect_state state)
+static void arche_platform_set_wake_detect_state(struct arche_platform_drvdata *arche_pdata,
+						 enum svc_wakedetect_state state)
 {
 	arche_pdata->wake_detect_state = state;
 }
@@ -181,9 +180,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 						WD_STATE_COLDBOOT_START) {
 					arche_platform_set_wake_detect_state(arche_pdata,
 									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(
-						&arche_pdata->wake_lock,
-						flags);
+					spin_unlock_irqrestore(&arche_pdata->wake_lock,
+							       flags);
 					return IRQ_WAKE_THREAD;
 				}
 			}
-- 
2.25.1

