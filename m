Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0E4AED8
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709568655; cv=none; b=qMaFKZk1p4/7F7r5ctjfteFYz5JXYo/IplairXebZLk5WreqMi77XNQO3K6fV33FvfdvkNaR+59oWeQMlql5BAoKuxkEG8M4f7lOagb3n2QP3XSoCDZ4DxLGZkPNHTMPm8MnmXskLtEyF07ljcd+i3yIQ+uahLDeQ/HeZ//1/MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709568655; c=relaxed/simple;
	bh=dHq0DKGqX9xEFsFLh6i7JCdWBtfyDQ931akUkFp0FUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YYplGFapk/5kFzjZlbDYfsoG+aReQ/9ozOuUQDHlIDfd6vsgs3eGkIAI99i9vh8TWMsdamSGbRRC5sAB+SB4Hw1s+HCqmC/fEBrYkkKgFXuJ0JPsR66JWBpOFpsCIqldTUGbtkjgNW8lHr7NLzITuIHQ03lsdlIQwyCD1CA7Ie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkXjeBYi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkXjeBYi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412e4619e5eso7246695e9.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 08:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709568652; x=1710173452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwRon3YDC+GD9jnJ5kPZT5CVostWJPWX7LavrbEpoio=;
        b=NkXjeBYib7p9t53I1cKkere7kL7PPKzjTnJ9/aiC8yD8WYJQY4SiVDjM/4HUA64J57
         sQ8DQ+sKJ2z0gIsjCJjs7v/9rcZTNfbiB/zzjVzy/3/taarxXZA3aYPQbNgraNvcl+Ie
         sF0d5bJzunmUAVDemzJZQA/7MPqaH3F69CAMfXr35xhmytaTmYehAYWLmjSjbY0JGgQW
         JN8JpHsKSFa4RBOqWXbVlQIM+UeDCA7fRzlDA9uxuScgtz21BSDsrWVh9TcJb+p0MLJJ
         PsE38BXoCwqOu8+FBd4UKyFwdlZL8ciJfwuMRNmOx0Aq/5U8EctlkLoTO9KcwEc3hthW
         kiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709568652; x=1710173452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwRon3YDC+GD9jnJ5kPZT5CVostWJPWX7LavrbEpoio=;
        b=LpPef3qwUVzST4w0Roi1BosLLvOXUddK1Q0z5On6lhsmUCmciHgUhcc2Ub8VMo5f+P
         sc1tUAXurrlbvaB1oUSPzzk2K7yIJDGMEfklcC6Xz/EDn2jPxaWRyYu8L6EzbqkBP5Z8
         GFbTTQXvMxjowoL+cE1/X7PtXndvsFA+MTonVQrSlDDF3nnsu+M+uiTDo3M5HtJBffqo
         6ympe9Pa/fsYZ9gP4QvaINgoWuq0UN1JdrQ/y4xDt3r3Mf0D2z40Jxx/vyJXEixrESuW
         DlycElJSV9+Mvc3QLypJKh1iimMEbFKQ3t3cjbm/8+GfdyVdqLK2tEdRRjLo82vEiNUw
         +yLg==
X-Forwarded-Encrypted: i=1; AJvYcCXkCvXomBMuTFWqqdKeCEH9VYYubh5WKhFFKvfCdJsoLldhKfBgXZIVSTiQBenzNhAQceI9RGdc3VFd6fNBXSINeab5lt6OXIqFDRdoiQ==
X-Gm-Message-State: AOJu0YwIeJdUr8kJNciLomFZnEWvrGvPEjjYuvX/HCUkXAeZnt9HbKX6
	0hPbXQRjXDlH4rKDrlX+pcfqqC1PTTk2VnUbnaU++bCSLAFgUEGt
X-Google-Smtp-Source: AGHT+IEdMQwzgNiAneqscWzS9EICOuVeppTy/0OTasXHdy8KD6a7dFoAuwIugLDkT/sqDpRZDhZupA==
X-Received: by 2002:a05:600c:470e:b0:412:c3cf:ee2b with SMTP id v14-20020a05600c470e00b00412c3cfee2bmr7689936wmo.12.1709568652173;
        Mon, 04 Mar 2024 08:10:52 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id g8-20020a05600c310800b00412b0ef22basm15161814wmo.10.2024.03.04.08.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 08:10:46 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Atin Bainada <hi@atinb.me>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: rtl8723bs: remove redundant variable hoffset
Date: Mon,  4 Mar 2024 16:10:45 +0000
Message-Id: <20240304161045.769912-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable hoffset in functions hal_EfuseGetCurrentSize_WiFi and
hal_EfuseGetCurrentSize_BT is being assigned a value but it not
being read for any useful reason at all. The variable is redundant
and can be removed.

Cleans up clang scan build warnings for lines 957 and 1050:
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:957:5: warning:
variable 'hoffset' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index c5219a4a4919..7a5c3a98183b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -954,7 +954,7 @@ static u16 hal_EfuseGetCurrentSize_WiFi(
 #endif
 	u16 efuse_addr = 0;
 	u16 start_addr = 0; /*  for debug */
-	u8 hoffset = 0, hworden = 0;
+	u8 hworden = 0;
 	u8 efuse_data, word_cnts = 0;
 	u32 count = 0; /*  for debug */
 
@@ -1001,16 +1001,13 @@ static u16 hal_EfuseGetCurrentSize_WiFi(
 		}
 
 		if (EXT_HEADER(efuse_data)) {
-			hoffset = GET_HDR_OFFSET_2_0(efuse_data);
 			efuse_addr++;
 			efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest);
 			if (ALL_WORDS_DISABLED(efuse_data))
 				continue;
 
-			hoffset |= ((efuse_data & 0xF0) >> 1);
 			hworden = efuse_data & 0x0F;
 		} else {
-			hoffset = (efuse_data>>4) & 0x0F;
 			hworden = efuse_data & 0x0F;
 		}
 
@@ -1047,7 +1044,7 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 	u16 btusedbytes;
 	u16 efuse_addr;
 	u8 bank, startBank;
-	u8 hoffset = 0, hworden = 0;
+	u8 hworden = 0;
 	u8 efuse_data, word_cnts = 0;
 	u16 retU2 = 0;
 
@@ -1085,7 +1082,6 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 				break;
 
 			if (EXT_HEADER(efuse_data)) {
-				hoffset = GET_HDR_OFFSET_2_0(efuse_data);
 				efuse_addr++;
 				efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest);
 
@@ -1094,11 +1090,8 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 					continue;
 				}
 
-/* 				hoffset = ((hoffset & 0xE0) >> 5) | ((efuse_data & 0xF0) >> 1); */
-				hoffset |= ((efuse_data & 0xF0) >> 1);
 				hworden = efuse_data & 0x0F;
 			} else {
-				hoffset = (efuse_data>>4) & 0x0F;
 				hworden =  efuse_data & 0x0F;
 			}
 
@@ -1114,18 +1107,15 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 	) {
 			if (efuse_data != 0xFF) {
 				if ((efuse_data&0x1F) == 0x0F) { /* extended header */
-					hoffset = efuse_data;
 					efuse_addr++;
 					efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest);
 					if ((efuse_data & 0x0F) == 0x0F) {
 						efuse_addr++;
 						continue;
 					} else {
-						hoffset = ((hoffset & 0xE0) >> 5) | ((efuse_data & 0xF0) >> 1);
 						hworden = efuse_data & 0x0F;
 					}
 				} else {
-					hoffset = (efuse_data>>4) & 0x0F;
 					hworden =  efuse_data & 0x0F;
 				}
 				word_cnts = Efuse_CalculateWordCnts(hworden);
-- 
2.39.2

