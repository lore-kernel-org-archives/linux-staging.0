Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4388A309EEB
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255618; cv=none; b=qe7dJyzAtlEqVDMPKjpI3RzaR0YYRmF0RgwMmSnRt0xMg+StfAXYYGjw2i1l6a5C5FUjDq6NHPfRxQFW1SPiH0cYYiccUtYJp/J7bZOSs4qxra25m8i6tDG5Lda0O0E8kqLF4nKBojOnbrWNM9L4EBbg6FDxRiMLVULktaHZW94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255618; c=relaxed/simple;
	bh=RgwXxaIMGN7QULYYb/3aBy3StFfF6P5QhhUcRP7Il9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNDePP0zJ8qho+D8GMtMPL8gGTmUUhsSKHzuXC0s+P5dmtENdv3lRbFmI/QT2IMyAnYcgCz2XZEFAlloKvVPSwzXGSXxgzdHgcdlZb4x8Qq2N+i0SuuuWTF4wJ3U/FYMIY5sBzMc6AAscrKs0u3bkwMFvagsYr1PV5l+vcOnbto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLj6/AOS; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLj6/AOS"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2c9932781so2231067e87.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255615; x=1775860415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dkud9izQMEtnaJFEFvluK5XZP4IWaUWvxi07yz+sUKs=;
        b=SLj6/AOS8VR+b5DwYbePPpKqZJV39c5P9W1DU1hnHEKvr6bIynEAjYWLpP3AC/xws7
         3QO1fkvZwz1JJhfIYT/PyMtTOs475VpUBSDgfQ4+y4cBG2t1sxYYOseJfyYv4UcCt1bT
         sr+ZHIKMXniWYcL0upp2FcRdIkYPm8IVrY5mWwdzBNY7hFXh9rwtOZnbwHcBubLjTpxu
         YRkuYXg+stmD56WbIqbV7o7HNlGqMU+ARKwQoHTWKKNMt0q/E/q2+Wd3ZlZSb7Xnxpu3
         /b6oqA1LSF/UzN4dgdHRKVu3+9JBiKtnCFlf6eYtLVNCUHC6nm/ILWX53rcWWCo6nrw/
         J0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255615; x=1775860415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dkud9izQMEtnaJFEFvluK5XZP4IWaUWvxi07yz+sUKs=;
        b=CtrmnHOSKFdBTTD1hfFO+qrfXgbHiPoFPCdMrW86fgSraD3tABThfGyoh95oj5V1+j
         1BRYfxzV1KYE2VJa/qaBMh1YyVLeNuTcjD5wOFTZIR5cc+Xc+kxbM8LG62qiiA+nZw5Z
         jYZTn+iKDfaQ/lSePmf7aBKXMsuv4/nHnYlS7SJ3dQ3Y4XAmxgLJfC9/YVMzbqidoFyV
         dXpWCVerD05nLvg3gm5WbCtN1uwhpaEhKf78PXN+YrpFoqUO9O/kZ4xHVNVdvAGYfo7D
         YQY70o95yfJqpNh5gREM++DSLDv4Dt1raxJ9a2+d9K855HMI8+02b58szySZL6kp4+NH
         jsMQ==
X-Gm-Message-State: AOJu0YwiG66mh19q8dGlyS9a+t+Yr5ePwLX7z/FVJHYCOtUhqzqXrbwo
	FGmycXlebT649LJOCId1v243kqupf8eh05pudHGH1CHX3zvBMg9tUedc
X-Gm-Gg: AeBDiet6GZciZxflFtsmP8fablsoCwhUytg/igxnk5CKgJR1mierl947oE+Hx2XXqCo
	e+c2Y97OsxhqduGoGBpnFhG+1AuVfcH2maciWaq2BrQ4q7Xi2oyu/MwKM50XHhXHVgJ7L9UThd2
	rKkU6juxLExykoSoGH27ad6WJ0jYByytfyyFlGNt1p0CNiLW31c2yZ04LYN+nWedpdh3K1ltV3L
	GYfyJYg2N4X0PYqr3zSuVFpE5z5Tl/+vtUHZ2O1kwdWvtsC0KGIKZkaXtPJisOj9tWsuyqG9J8U
	tMq8NwdFMnw0RJW2RCdxh6iVxKAxeFUF/1kZ0INaJMJXNNw0dH62rxvz8jotQGC2lPCXiUinmXq
	4KUFP+pdnrldetixt7EPT+BvSXMdmURsuQEsoF7Sr1zRGmDyeDCxQt0CwqqeyWzU+gFl7xy5MM/
	Dp4Itn3XMsgmlEnAZeZSVuUqqc/cy2YrqszcDXhc9AYOOmrRB4BrLY
X-Received: by 2002:a05:6512:39c3:b0:5a2:c962:59f1 with SMTP id 2adb3069b0e04-5a32f7e8553mr1412705e87.16.1775255615191;
        Fri, 03 Apr 2026 15:33:35 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd30d6sm1710617e87.70.2026.04.03.15.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:33:34 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v6 1/7] staging: rtl8723bs: rename global function Efuse_CalculateWordCnts
Date: Sat,  4 Apr 2026 00:33:21 +0200
Message-ID: <20260403223327.1831215-2-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403223327.1831215-1-linus.probert@gmail.com>
References: <20260403223327.1831215-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames the function Efuse_CalculateWordCnts to
rtw_efuse_calculate_word_counts in order to conform to linux code style.

Discovered with checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v6: no change
v5: no change
v4: distinct subject
v3: created

 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_efuse.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 099320e4eb50..7fb0c4ad7583 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -10,7 +10,7 @@
 
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
 u8
-Efuse_CalculateWordCnts(u8 word_en)
+rtw_efuse_calculate_word_counts(u8 word_en)
 {
 	u8 word_cnts = 0;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..652127af736d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -687,7 +687,7 @@ static void hal_ReadEFuse_WiFi(
 				addr += 2;
 			}
 		} else {
-			eFuse_Addr += Efuse_CalculateWordCnts(wden)*2;
+			eFuse_Addr += rtw_efuse_calculate_word_counts(wden)*2;
 		}
 	}
 
@@ -779,7 +779,7 @@ static void hal_ReadEFuse_BT(
 					addr += 2;
 				}
 			} else {
-				eFuse_Addr += Efuse_CalculateWordCnts(wden)*2;
+				eFuse_Addr += rtw_efuse_calculate_word_counts(wden)*2;
 			}
 		}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 191ffdf593d4..df430c9fd25b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -68,7 +68,7 @@ struct efuse_hal {
 	u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN];
 };
 
-u8 Efuse_CalculateWordCnts(u8 word_en);
+u8 rtw_efuse_calculate_word_counts(u8 word_en);
 u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
 
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
-- 
2.53.0

