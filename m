Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D568726E711
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255615; cv=none; b=C15nUCX1Ns9hU4XvD4kw7eaXEEvjmWhv27DYGvyUBKVULMaEx0mAiSMxBg/PgvppqtlDsVSL7QxCfs2Vs8qphML1gIngr7vBqyBBTO8ANnDLUDtEspUMBIkbuRHfd3QRTFn4BIXZ9xrmex1dUrDc0AOYFk0maSgnfRnFIo2CuN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255615; c=relaxed/simple;
	bh=ET1z3fDqPnotUmNTky9pKxtNHUywc/PNvPnXxW0uMes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tf9bKu8Idh9L8B6wniQnC2VQNjrJ0BS2Fyf5yr1AEv3EJ8NwageHJo8hnFF+ugkbED0VVGemFbTrJEvJoZS7zpySU2fmm4wxZ1Wm0AWnbQ0S1v0ttp3ltAoeoX5Ml923Z5ZeIM03X10WYBnEkIsehWUev7rXPoBnHKqRRY18Cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nihqi9VM; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nihqi9VM"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so2775906e87.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255612; x=1775860412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0Qx7wRnRy4m49I2DvoAj8wD81qWeI+G7vfBRggcZYs=;
        b=Nihqi9VM6UCpwTpYlGy7Vu/8RMvOIwmKLajeP8iwVKuqigHJ7ONnmMc0vJls76JdTY
         DB/kvg7i8OKqrA6fwZyE0vYBYjE059KYFYA6GzdtVao6MoeXJciRvytW31Mxj/JaZWIn
         YlnE5MZyzSk6iwboT9cf8SoZaoViLFoTYehR8MKUT+AFHCd0CqclDOPEM0XZ3CK0gCNO
         DRFW+gv3bnjEVfETzdzFlfR30merq/YmNtQJH94Dp5ZgZ84ZdFfkVIq9AaUM1OjMUfwl
         D0/FtuNN2pfgTykbgYuATb9MiA3gDpivqr1pPPFu55Msq/mDI2HG1cR4h/Ouj37hUac8
         46GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255612; x=1775860412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0Qx7wRnRy4m49I2DvoAj8wD81qWeI+G7vfBRggcZYs=;
        b=sqdC9UCVuItNDPA1Y28h+F/tMrYF7HU9Qx9N9dbl1xSfztAbPrSS4vKRDbxPeuNwb0
         bhO/8G3gvDyPRsVe2NKCIhlXb2Av+9j4AAmrMjPEoWU06ugFZ3TMwE+IKPw3hcao+DwF
         oCJQIv39dV0mDaLAIY0vOVQusU933pGUqRC8260vQm9YC5szg0E9RjOOO8ZaZQkCSvJW
         nswkd59MrPznvG+8rv+Uhir/bM5hjSFSf347gUGSNSmv1Ku4FzU6f9IBfSzXxEX2ZEWe
         3p4fPsPy9DA0d1WtjngGBSU16m+LRrCswf9yORvWpLz7HHI9ddmqJe49w8RR1MLsAwar
         dEqg==
X-Gm-Message-State: AOJu0YzICIcOQYvGmL7e/TdW/6BmN5hiTbvfmI5CKB1ejiI7v3HWkvV7
	6Gva/Oe+p6KFuRHuBFwhVWAolL18Sb8BsDhGRI4vLkUQAcSg/IeAWzHp
X-Gm-Gg: AeBDievIv1lhwBgrwMFyclIjUO6vT3Nsc7cZ6+CoOxcDnTuD8DtPDWfACgwhVu3h6l5
	vJLv/IYeevDEbehVw67kzKtWBLgs6elahfdSeOswrUnGaC4o9tkLGC9oS0EDBIiqhcYf1vR0Qqo
	/JXm9UjtaDGuRlVUDSrGmt/+wq+9as8HSd/D1G4KfG4Xca31XoZo1ZfG9bIRaXpUhqe5YLBDtg4
	4CajtXSEllUX3Tr9e7tqfC4/K/azSCHDBsHtm6jSCbjGeBg6Y2tsWLgMagqymM2UZ+O19XNh4KC
	L3xiJJlyFxEs1VnjKh4hTO1JoeRHE12GD/Jo90dL+XHKGXbL2q6kTOuJnRr9yoAcAScy0tMayhD
	2XSidSdSjkRWSzTlGoC+EW1tf9KCdY/a2z25+pG/atxHj8pZjdvMLQPR3PBVToeU6zMGTpJFxyQ
	TTmmdSuTCSKoojkW64GZarE7teXwfi8Hcj/YI26Dvg6n5B0K1MS9I2
X-Received: by 2002:a05:6512:3983:b0:5a2:bb8e:d4f4 with SMTP id 2adb3069b0e04-5a3375656d1mr1250381e87.15.1775255611776;
        Fri, 03 Apr 2026 15:33:31 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9c3b6sm1690785e87.19.2026.04.03.15.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:33:29 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v6 0/7] staging: rtl8723bs: rename/remove functions
Date: Sat,  4 Apr 2026 00:33:20 +0200
Message-ID: <20260403223327.1831215-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames global functions in rtw_efuse.h (1-5)
Removes a space before tab in efuse.h (6)
Removes two unsued functions in efuse.h (7)

Changes in v6:
	- Fixed typo in 3
Changes in v5:
	- Reworded subjects in 4 and 6
Changes in v4:
	- Distinct subjects on renaming patches
Changes in v3:
	- Furher split renaming patch into separate patches
Changes in v2:
	- Split patch into series

Linus Probert (7):
  staging: rtl8723bs: rename global function Efuse_CalculateWordCnts
  staging: rtl8723bs: efuse_OneByteRead() -> rtw_efuse_one_byte_read()
  staging: rtl8723bs: rename EFUSE_Read1Byte() to
    rtw_efuse_read_1_byte()
  staging: rtl8723bs: EFUSE_ShadowMapUpdate ->
    rtw_efuse_shadow_map_update
  staging: rtl8723bs: rename EFUSE_ShadowRead() to
    rtw_efuse_shadow_read()
  staging: rtl8723bs: remove two unused function prototypes
  staging: rtl8723bs: remove space before tab

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 22 ++++++-------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 +++++++++++--------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 14 ++++----
 4 files changed, 37 insertions(+), 34 deletions(-)

-- 
2.53.0

