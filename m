Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634753264E9
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070501; cv=none; b=mvFeLfZ7BWATCWsEKbGsKAbM9lo2jwl/I9UG6x0SoahthudACsDGVyLjkkDpp90c5ln/qZ6Us0V6DFZ8DU8it30a1SSyu+EIzlQ5ZUaAqLUMHFGYQdup5jlQFy1k/M7q/71XFSJAsDmBSUaugzEuhyFJhaeiVcYQk06Z8VUxqq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070501; c=relaxed/simple;
	bh=t5njXpDbYgSY9RYU96y3Y3LH1F+DWJemkbkJlxEeTyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLhr9woy5uwm+Nq01oVpOpPGPxkbmCHkCuWcq790cmFvsp+AGns8PI1MmAh0WipCmSo0CfJheyWaf7axG8gDrzOah/6fjE5zUJNtPj4gq4tC+Pm3lu/1UK6rhPbspwGabgtpf4eaZ6Ak3xW949fMYQRjACnVAVmUn9nZaxpxO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+MVs651; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+MVs651"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2a5236811so143822e87.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070499; x=1775675299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=paa+Y/OeAASpkRWPkWx92P7W6ONiKyR56Fp1rYOvDm0=;
        b=T+MVs651XcGtS7mUpLBtVTQ2IVJ42keTwR7LEHzN2EZxCqkP+Iq5RA7fnFiAYiQ/Mm
         Y+VdDcw+hJq9quKZxUXUHC3WwbG2ENAX+iORyfHMeOChl6Vc8haB9gOzPIDp3XWLogVI
         qdTiwu7xxES4snDtCpQDB4FKFWfPHdufs9nXIZQbYIguGl5Phq0+FGTbyn3/sIIPZcdk
         gq5zBMQx2vv98qppJKO9ZW1B4YB5k7dINyAbonIDV1fQHx8rJbBFLdbo3U+akh0vqv0j
         pP0DxNQihk8RZ8LPSNfyDJAaiVRIUDOTTCyHjEpFljKSkfGYv8ALBe1iYdAr07vJMe0o
         fYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070499; x=1775675299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paa+Y/OeAASpkRWPkWx92P7W6ONiKyR56Fp1rYOvDm0=;
        b=WqSpEVN+bRca7HliaPqisTFki310vmoiprse3KuosiYE2GaE2lxB4ywOKvATYJ77X/
         xAzNFarKdwpg3OmgE2GWbWXpHBWGlHps3lgaFHBJp8Y6RI6CQ9ZsRavWiS9G7RkVXuLx
         U8fTYnvQrRbS8atuDJ7ydhwFm5IH7r1dYNh+wfx1utlqBZT1N+A8f+MEm6pWnCmhV7rz
         7d54fy5wyva+wih3x96YgMRirgtdTgSk05ydKclGDqOd85YRf0Ytd5ePa6f+FyDbDmTv
         yMM59G1OWb+HpMOLcbKaa9L1XBLZLhHzfgEnHNhKrX5qsDIGWxHF8MQFQ+MiP1tMWVUg
         Soqg==
X-Gm-Message-State: AOJu0YzcupJ62KSLxbb6tn3W72Z/+Fjo1/YvrR+tv/+QiiIWoEWyAx00
	iM/ySaLZZkzWiBf8fX9CI4DEvgUsfL/3NXxuoiYntdKg7HSXlpcBnFaO
X-Gm-Gg: ATEYQzyJi9AywsnfMKdc42o6i5dtNsTSfdv4QFNVFytvFmk1ebEZhpvycRyINml5tcA
	6xqW994n7TxWKHecDy4cLOsghScb5ukxN8fmT0TxoYLcmvLlVy4okKPgesUrHi0n59wMfhh+X0O
	zaNufymfNdLg3EUO4cnpmxv8WsnE3iVBFwmJKP3c80u32hikaEmlnurEKP7zG7TxpFtYlAs/zFR
	aplYs12Mm38oS3mhc67ZM2O/W1EPY+kfA6tPvQF/77NAJpI68cMVoNi1uScR8XWcMjTDypDs/sp
	+GQJ0Em3CcqG+CXKSFGif+W/APHIQhqmsYLCItOOr6Yfctma3CSFrvG/aomJOfbqLMBBlqmgnAS
	TOCLwe+YxzsZ5eF42E7lzZ0tpAiC5QqdRY+EFxk5O0o4PjHrs7y0xOSifsBXXIeTq/SeO0dBUPO
	oe/ssUJFJJAyloCQ+UAz04PjFeSbTp
X-Received: by 2002:a05:6512:1445:20b0:5a2:c686:9ccc with SMTP id 2adb3069b0e04-5a2c6869f12mr356030e87.43.1775070498358;
        Wed, 01 Apr 2026 12:08:18 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95149sm146926e87.5.2026.04.01.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:08:17 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v4 0/7] staging: rtl8723bs: rename/remove functions
Date: Wed,  1 Apr 2026 21:08:07 +0200
Message-ID: <20260401190814.216333-1-linus.probert@gmail.com>
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

Changes in v4:
	- Distinct subjects on renaming patches
Changes in v3:
	- Furher split renaming patch into separate patches
Changes in v2:
	- Split patch into series

Linus Probert (7):
  staging: rtl8723bs: rename global function Efuse_CalculateWordCnts
  staging: rtl8723bs: efuse_OneByteRead() -> rtw_efuse_one_byte_read()
  staging: rtl8723bs: rename EFUSE_Read1Byte() to rtw_efuse_read_1_byte()
  staging: rtl8723bs: EFUSE_ShadowMapUpdate() -> rtw_shadow_map_update()
  staging: rtl8723bs: rename EFUSE_ShadowRead() to rtw_efuse_shadow_read()
  staging: rtl8723bs: remove unused global functions
  staging: rtl8723bs: remove space before tab

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 22 ++++++-------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 +++++++++++--------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 14 ++++----
 4 files changed, 37 insertions(+), 34 deletions(-)

-- 
2.53.0

