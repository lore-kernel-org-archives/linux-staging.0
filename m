Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB223FA5EF
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972419; cv=none; b=aWlllDVCn8irmdGc1UHi1AmD4Oj8d1Ao4/YCv0xQXsYe7T9x6vnXVexGjNCb/0vWB6IVdLG1lT+8cZQphPoG1KNj7UGkvcAKPMBF0LTNBBuZW8KJtut2caLeBcr6YFoVHzI8/iUMIHOwzIQmttbZvMBL40bh+XMM2QYcuymi5E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972419; c=relaxed/simple;
	bh=EDHvjlZVYO6CDP1kFTnr5zAaWXCePH4is8RbZEtlczo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scmZPhwZ6wEb7qAX6ySY0JGVcx0mN1QyWAGxIdEoQ+dr/FFC6v6MSAfxahsvWH19gztQYjSlYe3Ca9vMzeAk2P0VbiJihdWA20Wa5kqc+i81Y0bxvFJyCAvm7aNUph5M8pBZ/Io2i/PILng4CMQHcVJScZ3bhZhe0mB0H9zIvzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGZYFprG; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGZYFprG"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so95581fa.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774972416; x=1775577216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4YxtIKWBOtp1YZ6pLq2fSGVzcmFEu1fIf1TG86rkG0=;
        b=gGZYFprGiTd/iCkoDnO6VS2Bc+plyANM6ESd8jXuisrXtaQoQ0Save3cXtSdPLI6Qu
         x2tDQzH/obAXSeQSkg7yFqHfNU1s3tHSUga/jt9GDo0yLzOoEaTGb7l2i05uNg35yKGE
         yGquga6s/QXz8078ti7CDZTpGKtoCsepJ4ErCGoL/p0vvX3nmi9339a8XOCyf4CbXGax
         kc8sJPD1a7xNvoy01KeZolmbWvMtKbgWg9woxFmfe8vZAfPLeZ4AVcjrTHS3VD4vNwe9
         M4shvpGLFFOGMY2/D+zYmyCgwabJCGplUfrZvqK97S0FBbAJ9SDoG4uFWnAknbgQFHVi
         97aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972416; x=1775577216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4YxtIKWBOtp1YZ6pLq2fSGVzcmFEu1fIf1TG86rkG0=;
        b=Gsw3i1C3WHOgEK9UsavDGodDQsHrlKWWF/nifN/HtwuWPuB3OMQievLtovt/9i+ewd
         lIjCaOVRRvrAdSPAeS1l9CCK5BQFySWBmudKKYijOhcMDGKolqOOnmAA2Axd1UX6BBXf
         jKgszAk1kqpi5MA7POOhaKoxUbizI+mcGnGYB+beqfQkWFVdgnWeY7jJPmwoEZ11aI+s
         r4Q6gMZAAKIwGmT/6lnCBQ/qUu1KKa0p1VOEAt6uQ43pk4rrsl1bLwfU5mNVJKpC+0PT
         1lkY+V+6n4gtZkEpZ+SSTORHe1D6OOaSI53ebGDgiSP7Oykt4FDcHKRDsHWT+RA1s/fG
         FfpQ==
X-Gm-Message-State: AOJu0YwgWXvFSn9UdW/Vox6EDXmQwNy7RzzhBoRGJlkNNwnTVZf32JNk
	1qRxw9QySeRglbB7ll/EgscgudbRNZ/iJnUowekZJWVGphHyzDBceGxj
X-Gm-Gg: ATEYQzxNd12+PFI5Y1hWxJYTkTvj6kQE00zIlIScz/GWXIRkiP2R7LST2NR4Gw4uRNe
	sRHfY8UJ6iVlE4AV5KCaas5mlwGuaVV39ebXIkAn8fJy/aOEZ9T1iatQ21yuOkFiXQvVDj6fpk5
	0kK5Cj7ZMhKxxO7KwLlYjhNgC0XtELcL8w2cui/HTmUUi0ILSNH4Amok6Hc4Fz8+PedrsK4L2q4
	+jw6/kkfSwl4yPKP50cAwlVH09YRk/ruCKoWgUnSlN5w4LXMEIcPFVVNdBjLAIoJqq6h8Z81Ghf
	3yWkJQOfuQsTMoEFnFqsNqcivkwmLgh4AnIov1byqmBoMcKWYYZYojzrZTfvSZCZBlTOgDJZtLW
	uFPHk62gwueexQ7f2+1JOU6EIaDIKA7VFkZc2IkPRmLiLwtjE3s5PENkbV7ad6SK0S2aUIP3t5L
	iXrEvYtTsg6U5uNaQ4Uqa7TYL1j3HYqtdj1JOIkcMcPeN9TOLW1x6mVf6fdPviCw==
X-Received: by 2002:a05:6512:2313:b0:5a1:53a8:fe20 with SMTP id 2adb3069b0e04-5a2baae136cmr1419733e87.8.1774972415350;
        Tue, 31 Mar 2026 08:53:35 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13ff1ebsm2488014e87.24.2026.03.31.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:53:34 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v3 1/7] staging: rtl8723bs: rename global function to snake_case
Date: Tue, 31 Mar 2026 17:53:12 +0200
Message-ID: <20260331155318.185117-2-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331155318.185117-1-linus.probert@gmail.com>
References: <20260331155318.185117-1-linus.probert@gmail.com>
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

