Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B575F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:08:32 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id x13so1033741wrs.9
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wUJdzQc6vGqaF/tH9fjrVo5h9ptifyriz2mlBFMVazk=;
        b=MRR4QO5AiRIwwXG4y8t9iiQv4w64a7HkwnanCJD7qbLzg9B388whJgj8We6h0L6J0J
         yV7oEcEd23/V6iu9M5EA3bMUuydsVIYord96BohBOFT/u90NgQhFVLBiO81I5QbYLBtb
         WYftikXIomG3z5w16KyreWl5XZGTzt4lt7sgCbHlsrlpPouiFzGUgAp0gEQiK8mmtHB7
         TZdg/FHHHfGlOqnQ/yVGnilWnXwb47xhilA5FUehQS4v0c237hGgJQlwhIzAEZN18tOX
         sEyxPPm7b0TJ6p29EIWC28y55Lt0wyTr4tBXPaS989eRa8ycmJMykgPefijW1SQkApSR
         cH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wUJdzQc6vGqaF/tH9fjrVo5h9ptifyriz2mlBFMVazk=;
        b=PoIp0uU7TeTOTJx3JaQu/XY5klnVg0k/UqCWgSoklX0Fjmnvt4RAvzmniYqSN3uOyD
         B4uiXQT7O5bLu1yPa/zDo8iRr6eyQAzwjlcwnUYbHHEMjNTz64+QuSNHQQar+hTIGrhE
         UvjKQmpirVrasnDSNm97sjdsw52sEp5xpqQdiYInpuY/iVXltD3a55eZDiWwzr/3b9IX
         rJU4hHhqWf9TQuGUUgmFRq0CQSImtHaV4x4mcOT0803oXFIbpwOCd9eaWjVP1YDa8WKs
         n0g+1dlPL/uUnmGc9YqSxFrFaACs4QbiUGOFyljmXPFvdBonkgw1J1MX4i8RUXjd5csa
         X8UA==
X-Gm-Message-State: AOAM533p+Q6LiKgUcAw8uuu38AjIEWrlsbqkUV5MeJKQ+4J+P3uege1F
	e/RJNNu7NWHdNpHhZGUssxA=
X-Google-Smtp-Source: ABdhPJxdgy8DJO+g1gU1IIdvU1b1sjuvWBitFUneRSVeAtmNRykqv/kB6WPB5qc8GdpOe/0yZeuIhg==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr8370069wrd.47.1617268111249;
        Thu, 01 Apr 2021 02:08:31 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:87e9:fdd6:2b7a:c720])
        by smtp.gmail.com with ESMTPSA id 135sm8193856wma.44.2021.04.01.02.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:08:30 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH v2] staging: greybus: arche-platform: Ending line with argument
Date: Thu,  1 Apr 2021 10:07:54 +0100
Message-Id: <20210401090754.116522-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove checkpatch check "CHECK: Lines should not end with a '('"
with argument present in next line.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
Changes in v2:
	- correction commit title
	- correction commit message
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

