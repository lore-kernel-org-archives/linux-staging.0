Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EB03CBE8D
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160740; cv=none; b=CTquiIpewAFCygv+uzaxpUO9cNegO9OdF+ClW3FgEp199p7ywx/3G+gHjP2zU2SDYPTpaOE1sFvOBhHXJIezGY9HNw2Wy3s6v8DXI2/KbIHBz4D156r0rP2WhHsD47tiQsEDE1NuUQPwjWdrnh8JRxUKNpmpEaB70tLUyyHugdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160740; c=relaxed/simple;
	bh=GvZoxViM8A4CfX7zE+icmmi0kpT+NaMuU7KiKCvRjCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ia0QoSaWcf9s81x3ofL5sahSMxAhS7llZKVESukOcmFqMjqcRk6lp9fV82YdiSjPquCqcJtRvSJxC662Z36q3ZwRYhrSbg8UzrxlVOd9oMNMrt3VNjf+kQy2UwU65OclGrkpKqj2qNgnbSAGPIBHNJsoUThK6hVrVKbOTVUXl+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtXmb/S8; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtXmb/S8"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so7369486e87.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160738; x=1776765538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOHHk6lkQypsp+UDP/NRQu6rNa9m8dXlhY+trkEr9d0=;
        b=PtXmb/S8klR53/QajeLOvlxwTf26lwamaLiPcaY4iRTwtkGSfMzzLvJfCkJuCCDv7S
         FbIpzbDuoHZJMMPeSYII7BqYC0balmxGJVfbFOiNL+HToljr9DtVac1Pt4EjQ42Ml71x
         FZO9E5NQpyATTh057PU7NR9Kx9ccgTVjIZe0eNnvNu8stEKZfs8NEczyMizuKxfCiPJg
         LBRraQHqL19ce5Tk30ZIt8YeBEGJASYoFuxOLOXq7PfUwBg0KdaWINWLgje++N5HX+za
         oDfEtyFZrbZALVCENluCkNQY58mO2TA6cVFKJVdQLns2sdgKVtB5dud/QXTaYv6gbBwd
         Ifjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160738; x=1776765538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOHHk6lkQypsp+UDP/NRQu6rNa9m8dXlhY+trkEr9d0=;
        b=Vs8aQEvm/mK+LntRBjPMvt04enfDs8NCJ9gglYjvBPJkRHu549KuILhrTJLiVeByoh
         nvHRXrbOaM5dEQ3wBiFNORG/iUYzN5VstLMFfq5T73g5c87Ie1YmBceSql6sgqv34XgK
         W2iBUB5Ao2o2Khy+YP4yVB/BjLMknof+m2DJ+76YuPbAkg9ktWIpn5dWwCBUppPDMI81
         gL/4+ED/42wO7KmpAtHYV2zUG5Z3PcwJVmWM/ZLIM/0gDl6oOa3/E0VOvWj+FLUZhZuP
         JYRnQyAf40XkXoLcgyOlvLFOlFQPbcTfB6KeFqth+RIc4NGTmh6ImHc6J8lyyv7FR/35
         RFHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DwdV+S/Pb80tSJyLcfrSgrY8e3KmS4ij98Na8QruHlhTpm15ZpzlmYn9SO+fsO7XkJkkb84uE7HBv79lQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwcVryAqgjZqwaHbgvX1a1bUr7JEcRhvWc5VnwLyWioHDbxqWf6
	po/2sheydAeAcIqS38hDkhw3gmjNu0yjdeWJFW+9aLQYs4xw2I0jyKOy
X-Gm-Gg: AeBDiev6g+eTI8bgmNlMfw466oOIbMYqC0DLe7nfQ9oR6Skc3vILc7gzfnc6BcRRhlH
	dKfX96z5SeavhXK148HpVHsqBie5HN5mp21BFSJY7NJwNQXTpZlSSyi6E0/yHEN7t1hfmHVUd5w
	EAhS3nT8lRORy5xQPk+2mOCaiTBiE/390VJo2mJXgJ+71Xj6ZOQn2sDStQFI5sCIYQlzJZhzUPo
	TVPxdNr8FaaziG3I4mg/e2woeHN8jtVmvdLBlR4ihMjFx8oGMBaa6OhSgHpxMj13YJCoYsRrecp
	ETM7Q6aza3PhI71HZC01J/+rcC8X36dm2fvWI4gm0IwffAQTJayOz6dUNJyBVHvSpbdXLuahWgl
	kGLvY0zcgvfY/8cLVP3KjHRFCugc30cJ5eTnHcuZyZoNdfM9w5tK+bnhOnplFbwTnvT6L+agVGu
	6VGLR6j3n2zumVnw==
X-Received: by 2002:a05:6512:39c4:b0:5a3:e5f3:daec with SMTP id 2adb3069b0e04-5a3efb2b6b1mr5364342e87.21.1776160737466;
        Tue, 14 Apr 2026 02:58:57 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:58:57 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 4/9] staging: rtl8723bs: add spaces around binary operators
Date: Tue, 14 Apr 2026 12:58:28 +0300
Message-ID: <20260414095833.76480-5-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
References: <20260414095833.76480-1-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces around |, &, +, /, and % operators in bitfield OR
expressions (SCR_* flags, BIT* masks), array index arithmetic in
HalSetBrateCfg and rtw_bb_rf_gain_offset, and the register offset
arithmetic in rtw_hal_check_rxfifo_full.

No functional change.

Signed-off-by: Marc Finkelbaum <regpacy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index be8b5e1dbab5..2f76d04aa9d3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -540,7 +540,7 @@ void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *pst
 	/* b/g mode ra_bitmap */
 	for (i = 0; i < sizeof(psta->bssrateset); i++) {
 		if (psta->bssrateset[i])
-			tx_ra_bitmap |= rtw_get_bit_value_from_ieee_value(psta->bssrateset[i]&0x7f);
+			tx_ra_bitmap |= rtw_get_bit_value_from_ieee_value(psta->bssrateset[i] & 0x7f);
 	}
 
 	/* n mode ra_bitmap */
@@ -548,13 +548,13 @@ void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *pst
 		limit = 8; /*   1R */
 
 		for (i = 0; i < limit; i++) {
-			if (psta->htpriv.ht_cap.mcs.rx_mask[i/8] & BIT(i%8))
-				tx_ra_bitmap |= BIT(i+12);
+			if (psta->htpriv.ht_cap.mcs.rx_mask[i / 8] & BIT(i % 8))
+				tx_ra_bitmap |= BIT(i + 12);
 		}
 	}
 
 	psta->ra_mask = tx_ra_bitmap;
-	psta->init_rate = get_highest_rate_idx(tx_ra_bitmap)&0x3f;
+	psta->init_rate = get_highest_rate_idx(tx_ra_bitmap) & 0x3f;
 }
 
 void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
@@ -571,7 +571,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		u16 reg_scr;
 
 		reg_scr = rtw_read16(adapter, REG_SECCFG);
-		rtw_write16(adapter, REG_SECCFG, reg_scr|SCR_CHK_KEYID|SCR_RxDecEnable|SCR_TxEncEnable);
+		rtw_write16(adapter, REG_SECCFG, reg_scr | SCR_CHK_KEYID | SCR_RxDecEnable | SCR_TxEncEnable);
 	}
 		break;
 	case HW_VAR_SEC_DK_CFG:
@@ -582,9 +582,9 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		if (val) { /* Enable default key related setting */
 			reg_scr |= SCR_TXBCUSEDK;
 			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
-				reg_scr |= (SCR_RxUseDK|SCR_TxUseDK);
+				reg_scr |= (SCR_RxUseDK | SCR_TxUseDK);
 		} else /* Disable default key related setting */
-			reg_scr &= ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
+			reg_scr &= ~(SCR_RXBCUSEDK | SCR_TXBCUSEDK | SCR_RxUseDK | SCR_TxUseDK);
 
 		rtw_write8(adapter, REG_SECCFG, reg_scr);
 	}
@@ -770,7 +770,7 @@ bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 {
 	/* switch counter to RX fifo */
-	rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xf0);
+	rtw_write8(adapter, REG_RXERR_RPT + 3, rtw_read8(adapter, REG_RXERR_RPT + 3) | 0xf0);
 }
 
 static u32 Array_kfreemap[] = {
@@ -802,13 +802,13 @@ void rtw_bb_rf_gain_offset(struct adapter *padapter)
 
 			for (i = 0; i < ARRAY_SIZE(Array_kfreemap); i += 2) {
 				v1 = Array[i];
-				v2 = Array[i+1];
+				v2 = Array[i + 1];
 				if (v1 == padapter->eeprompriv.EEPROMRFGainVal) {
 					target = v2;
 					break;
 				}
 			}
-			PHY_SetRFReg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET, BIT18|BIT17|BIT16|BIT15, target);
+			PHY_SetRFReg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET, BIT18 | BIT17 | BIT16 | BIT15, target);
 
 			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
 		}
-- 
2.53.0

