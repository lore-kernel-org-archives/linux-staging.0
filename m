Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0D5111A
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:52:42 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id e18so1971409edj.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1V0D7g9msPu8a6+/7FcOIu4QO4uKpG+49B4mm720QMo=;
        b=niJSuOFGRclob8bhd9d5H3VQs8OHKfgamiLz43grGd3kzsRcTb+rBVOo9b1oNEcJir
         GfSp/FWfGqvHp7y19EDA6It9UfYcemwhHrElZ7uYDaZITAG2mXEmHZoB7GTwGOCi56g/
         Lotg6qT46sbnNmgvEZoDscQpwB6K+TbW2sI2v3vGEj4ToEe3R/CG7mqwqnTf+dG5Z+nt
         Ep/kfE1PERgScXjtOALFZoL8b/H2qPQGRbO73JVjlBErPh05EMJwQ/rD53xCrPNfCv9R
         3xS1De8QLVEOVXzdOmT8vJXc/BmTJLSLkHFrXko9InOREL6DlYWiAYt6+o6VjA+9K4b0
         Pe+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1V0D7g9msPu8a6+/7FcOIu4QO4uKpG+49B4mm720QMo=;
        b=1ANRgxMFx4uejVvc9WoGue6JbCbA5+vQDaUu7YOdE8cX90TC002ym6N9bt5iqTqTgZ
         yAUFeAub0AHgGZFBTwLyesKojSQerHIIPU+AFJbejJGOw0FyJe/HIczuS9PB60AOzRbq
         JQTTW75oIl+Q9AqKHQdYwBqRJEMvu0n/EejowN9M8OQj3Ip+xwO6kQp0vGfGPCX0b0Do
         iUVFn9M1TgCITDGtjsdQxR1/+J3pxed3mCuwSV0cvy+tyEKFiQbkBt4WTNvxjrJCzccO
         b3Bwr3umvz5GQjYzyVn/EalKleea3APLmGxySlWTtXGZyyxkz/u/+suJyF6FBK7a+wHp
         BhKw==
X-Gm-Message-State: ACgBeo0MGjs2E7b84judTqc7eDkWfFe1wkPeXb1oyt2BClTrdFWXlAEc
	4YCyGo0GzwShrBSStSV8kmw=
X-Google-Smtp-Source: AA6agR7BP6fvV8AgyA1KKeVceZSAq4x4kFmJ0OKgHMPKI2+x0sMhGtX8ZmhOFhnyT0QT4Yp1MnQr1w==
X-Received: by 2002:a05:6402:34d2:b0:448:9fac:206e with SMTP id w18-20020a05640234d200b004489fac206emr17352011edc.171.1662112360625;
        Fri, 02 Sep 2022 02:52:40 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm959601ejx.160.2022.09.02.02.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:52:40 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/10] staging: rtl8723bs: remove IsHexDigit
Date: Fri,  2 Sep 2022 11:51:59 +0200
Message-Id: <8c70ecd9bea1dff2cb8f69e12bbef6aa4ee39977.1662111799.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111798.git.namcaov@gmail.com>
References: <cover.1662111798.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function IsHexDigit because it is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 19 -------------------
 drivers/staging/rtl8723bs/include/hal_com.h |  2 --
 2 files changed, 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 010a097c3afd..e42556d03bce 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -859,25 +859,6 @@ bool eqNByte(u8 *str1, u8 *str2, u32 num)
 	return true;
 }
 
-/*  */
-/* 	Description: */
-/* 		Return true if chTmp is represent for hex digit and */
-/* 		false otherwise. */
-/*  */
-/*  */
-bool IsHexDigit(char chTmp)
-{
-	if (
-		(chTmp >= '0' && chTmp <= '9') ||
-		(chTmp >= 'a' && chTmp <= 'f') ||
-		(chTmp >= 'A' && chTmp <= 'F')
-	)
-		return true;
-	else
-		return false;
-}
-
-
 /*  */
 /* 	Description: */
 /* 		Translate a character to hex digit. */
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 76ad979c2a36..6356b8c2ef81 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -147,8 +147,6 @@ u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
 
 bool eqNByte(u8 *str1, u8 *str2, u32 num);
 
-bool IsHexDigit(char chTmp);
-
 u32 MapCharToHexDigit(char chTmp);
 
 bool ParseQualifiedString(char *In, u32 *Start, char *Out, char LeftQualifier,
-- 
2.25.1

