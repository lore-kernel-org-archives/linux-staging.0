Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D1370D72
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108556; cv=none; b=fZb3XUHhJUMm6ed6A9ND6idb7Na7ncirnDTOYhTjSyB0s151yrjtXZzXHKizvNerXiQqQUwKzBqaBBryOhXZFrzhvD8eu714rdnp9rpg0qhd26PD8PimMDNOeTux8hADSA030A5umM4PzGr+XKR9irRGWAUHdnRUsnOlKNNTt7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108556; c=relaxed/simple;
	bh=d/LSVlfUgjXRmUuSv1lxZjOKtcpxOqZWYLfYUzEBbLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwHq2u/DTZQEM75ZmMDXwtkR5Mx0grbnZHSWvobbumvcL3a5xSjuCOGhr5qd45TattP7RHZzrwT8PIE0UyTKGpI4Eb5zrCGv8/V7CGyffNWL/I2+Fm5Evq+x1CvOy4BBm9MNsDeDzVqs+WU/zuEqGSvLrpHSSRjRLufEfRG0zAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUDDXJHV; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUDDXJHV"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so672661e87.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775108552; x=1775713352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPLRWdohp6K8Pi31ZDdD4gtqJOjbcW/KJLTNnLQqGpQ=;
        b=rUDDXJHVLrX1gT/Y36bcynAL4Z6DWQ2j2eKu4beIT+gnulO691NfCdkDFAQgbe704y
         aA3ovrkNb2Q5KlR/XtuuiPl05P5m8Xt/Jx6e7adWm/w9o9tsGYuSJH9gt1wBFBqtMkMV
         rnpeZUny8wX1Pr+Cuy2W3p867Xpm4gWnBJKnCLFqVSJNTdpxX9gPnVn/z/gyErQ3tu+t
         K5uADBCfdZFSBb05ZClMtEDD7jBhmCtomPx59eSizIUxuibYEjpC3JJsoRghgHEnngLr
         uiEgQhOnclBuZZLEcxDzYk/JSWZ5CAbs/sOFT41dA6nqXQHkR1mu2yS19YIp/S3T387M
         DDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108552; x=1775713352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zPLRWdohp6K8Pi31ZDdD4gtqJOjbcW/KJLTNnLQqGpQ=;
        b=TWdcJVaX/hW8IQCmAi6vqV5/cL+3Yq59suKUVWZwwEbx0Mho/Z43tFMMsHV8TFpfuy
         4Efz9biCVsdLTXWdZmxl2W2Z0H7g1rImNgVk/a0A95pJHdIW6HgUIEtX0VG5Zf+95hgd
         CSLh+HJrpxxhhBDf4AM3kvti5CBZCXJK62W8+MQ7guaZZ1r1cmTn5fFqcKhm7VJbmi4E
         PBYM+h9blPh3udOUccC6umGxk5a2Yk2Z/89NRNXVPTI0DEYqtIWrFIuZSXF9ul4n2YaM
         ycxpEYuNQGOFHw37leCkXH8vfSa8nC24+yz4MJnUbqKOTQ4N3W2785SOx86JcETk0BZm
         +4oA==
X-Gm-Message-State: AOJu0Yy9FptcbtNWBMdsYbB4iGKF+/gwnA+ItaAZ7QsyfgGvzopa9crD
	3iI5XfuKgUDQY+hSO5mxoeHlV7CnOlmBdg+69o9t0/1h2o9Kq+DTzNAu
X-Gm-Gg: ATEYQzwWuSBhkymkBJkFXY9y6dyBK6VQ9V2BIy1DmOprKYgsoJVnOoW4V9XKuwQf9wQ
	yUVt5s5TYr88ECUHtRU3A3NXA8VwyKUAcOi/ymPDojz0bzCpnPqIRCEz09wlOAltM/qm41JMI7C
	VoUImhczCCKcs3yMPBpFpI0ryyRD5bGu0DzAVnFmFC/WRCiPCZyeE3sfaVp/zSvf7u7x9hiM/HD
	UDsNCFNIAVxgJc2dR17Hn8W6LrU68zAiUbGFmAMIVnxLAhRSGAy0/2nnGk7sq3XYJbgTt7GP16o
	7J0NYrfs6Th2TipPxFrIHonNPPATA63gom06LI8Tl783PLYLMXdvCttVdz+V03bKcHq2lT6/TUP
	2HNdkiRjHkXb8ER7LuFuB+QUraBouJovYYhf58UPuLbHG91FUmrT7X+wKj5wsHq42iqkPCKJ+uu
	L/DirqWpozbVQSg9/YgKODn9rrbfuMqX4jw89vfwk=
X-Received: by 2002:a05:6512:b86:b0:5a1:1d29:e749 with SMTP id 2adb3069b0e04-5a2c1f0cf3amr2205233e87.12.1775108551408;
        Wed, 01 Apr 2026 22:42:31 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c644basm460264e87.0.2026.04.01.22.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:42:31 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v5 1/7] staging: rtl8723bs: rename global function Efuse_CalculateWordCnts
Date: Thu,  2 Apr 2026 07:42:09 +0200
Message-ID: <20260402054215.271981-2-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402054215.271981-1-linus.probert@gmail.com>
References: <20260402054215.271981-1-linus.probert@gmail.com>
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
v5: No change

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

