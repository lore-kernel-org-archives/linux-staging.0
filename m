Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2C223392C
	for <linux-staging@lists.linux.dev>; Sun, 27 Sep 2026 01:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471866; cv=none; b=Dwy1qM9SrIDFvRYZyDXPDmR19BFomCClWFBMLEF/JH1d091LLxh+ntKGPAF73XQXMfgOx3vS6tiM9lKI4+zIT2cUvg/vx7R9Rl9MH5gM2EZP93kEJmf2BB5dlIU1SuGeeESQf+fRdC2elOCCInJ8YF/4XqDxb92o/0qs/eRoQZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471866; c=relaxed/simple;
	bh=ojIfIYiLNwKGUCwfRMq+sJKc82ZrSHxoMcK5YvDm24Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ss0GayMvUBHlQdQqQ7yeSYBAadm4mvVdOHqrZQaV6/H2QqbZ72j29sjaqjXOA7s4RF324gdQhalfMdlzdThWRWZdCTY6i4TVt8v7yLUyLbgySQXhCI5hHpU+cPlk8Jf6Nn1MjgMQ41he76LihceWy+NKbk0iG79Loe9cZsS487k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qG4Z4KJg; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qG4Z4KJg"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98514b4115eso1346842241.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 18:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790471864; x=1791076664; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxuHtglGUwNxO72nXrw7LQ7sLx6MsCcN08fhdwpG59E=;
        b=qG4Z4KJgk4UdALGTLXCMwe1q9/7+7tbxceIROziO4RSnP+J1Z5p/wGmiDxd4DM9/6v
         lUSs5AlPOdO6IbPiP74SVYrlkfMV07uszqjblQRBEu+VcGbUDKiiZSHhZm0cD4kVMEz3
         kDZRcbp8wjfvlGU+ev8etmCh7InNkp0s2JHTzdoKoShTbHULDb1GViR0SC3Te8flArRJ
         RUZGpWw4I6I6ylEch24IKsXKFwax6zkFJbl2dL7XiwMZRW77Qo+CjSXYs3Fr+p4f0HY6
         uHC5WPgVyyF6cGnE6hbhqjjTNCD+IfeJrO85NQIRdpEx3FQGzTmjUrBl9/sEaXNSCaEn
         4BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471864; x=1791076664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxuHtglGUwNxO72nXrw7LQ7sLx6MsCcN08fhdwpG59E=;
        b=sHLvgaEtYWkbwLdAOGvTGiFhl2Na/6tuirRJDE1PfnctrkDJkTzztu2TnsTwRjfytH
         tVLT24kmGQQ/6SPYpJS+PTVg1owzuT5HosXlYJQpUPYQbFT5cGVO2JilxafMkHR5yxUW
         0rczR/UaxWKHdD0uSgaUsVL/fC12G2b23bKuQ2UR07PfBLwZGJVZKI118qC9ygYu2Q7K
         wZyJ6lEAoyIDUwYtjEyfhpdocIwg5JnoymyBuBGsocAubYIT27jK6NJ0R05RUC7Jm3YX
         5Pzcjex4w7hfg3q4t59fbld5RnVTAjV4f1hn5TG/SXWNH3SYiPckiNPdywkC69dbu7qL
         1uOw==
X-Gm-Message-State: AFq9FYKwNjwTqaRctTQIDuIuuRG+1WltMqqAkNVz+6Eg0oaFX0b6oVby
	oBvPlq9HlGnAo0mhNFlHLRbv7BO7996vNaKfeGKhcGxDbRPtULGqZXaW
X-Gm-Gg: AYBFou2yUArG165FMbLanGAAXDAmVZNTFB8nY5aw8nhWT1HbcuKJd0pbpIc/k5FsHj9
	Sk2/jx5stHtAclATI8IeDiLBN/EfgIIA/o55Vc/xtp//v0nO5XeUaNLx/q+SJAIYXEI91zqxRmL
	PE70ClA1I5VKveE087Zy65Td+8Y3MWeO4oR397zuQQOOeVDTiNSx/Bp3HCTidNVG9zxbpmxmUF0
	DRc2yvbLHL5UVjc0bCn9JSjQ82S+RGhLJ8X8hJX5e7hgQLqYKibvoguYdncdtjd1b6tZl6O5obr
	r8UyelJAH9cqSAoax6RvqdXGMvMr1RxLv5GooZlQfVpdrh5X0PM/unFF6ZQgi5sm1RlVsfn7iC3
	si9B4uPeQQ5QbHcmLudePJAVlIee7flFZwQzi1/ACMYvEhMnUHbKlcfrFejdvw68IhegTfE1cLE
	Iw8JOW3WDaGgXV6DM6APbwdX4MQNs6v1Nflg8BGuMIhufwdmXxIUrlR/c=
X-Received: by 2002:a05:6102:41a0:b0:7b2:c1b1:1d0 with SMTP id ada2fe7eead31-7b2c1b10440mr1622109137.11.1790471863919;
        Sat, 26 Sep 2026 18:17:43 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:78b3:5cda::1002])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1d413asm820433241.10.2026.09.26.18.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:17:42 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Sat, 26 Sep 2026 22:12:24 -0300
Subject: [PATCH 1/4] staging: rtl8723bs: rename
 PHY_ConvertTxPowerLimitToPowerIndex()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-rtl8723bs-tx-pwr-limit-v1-1-989dcbc113fd@gmail.com>
References: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
In-Reply-To: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790471854; l=2525;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=ojIfIYiLNwKGUCwfRMq+sJKc82ZrSHxoMcK5YvDm24Q=;
 b=dDBZ6vmrra7dribg0vNPtu7/3sUET5kLgWL2zGvqlQkVMVase5+g7aWBc4iSHpL/BW9jaFV1Y
 Fu61sdux+itBXJHe5D5hblv4LCXCrZN8syi3CS4iZ5oVAVKcUVZRUKW
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

Rename function PHY_ConvertTxPowerLimitToPowerIndex() to
phy_tx_power_limit_to_index().

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c    | 2 +-
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index df0eaff4c84114eb583c9b91ca7babdafe6a28da..1228be0cbc839041384f3e434d22b4f039d69986 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -739,7 +739,7 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	return pwr_lmt;
 }
 
-void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter)
+void phy_tx_power_limit_to_index(struct adapter *Adapter)
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
 	struct registry_priv *r = &Adapter->registrypriv;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 737e2a818c18d7708df8d743f4947b86461cd0f3..44b4dd69af3a03b21abf4307a515c639863efb42 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -352,7 +352,7 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 		if (Adapter->registrypriv.reg_enable_tx_power_limit == 1 ||
 		    (Adapter->registrypriv.reg_enable_tx_power_limit == 2 &&
 		   pHalData->EEPROMRegulatory == 1))
-			PHY_ConvertTxPowerLimitToPowerIndex(Adapter);
+			phy_tx_power_limit_to_index(Adapter);
 	}
 
 	/*  */
diff --git a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
index cb7c7ed74146844032add0736eb7dc41b4b4a6d9..a20b4c233de8128fe20e41dee2b303a4662f4de4 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
@@ -97,7 +97,7 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 RegPwrTblSel,
 void PHY_SetTxPowerLimit(struct adapter *Adapter, u8 *Regulation, u8 *Bandwidth,
 			 u8 *RateSection, u8 *RfPath, u8 *Channel, u8 *PowerLimit);
 
-void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter);
+void phy_tx_power_limit_to_index(struct adapter *Adapter);
 
 void PHY_InitTxPowerLimit(struct adapter *Adapter);
 

-- 
2.47.3

