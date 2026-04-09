Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DE93C3444
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742648; cv=none; b=ad6TlPYXI/nez7Vt0YO9dAhOyDTdb2x4DI+MZ0QUAHu2gAOl/Cu47ugi/C9Djkrpe11a1qfhnBsWbsA2f2zcVsTTUcF4b262KrfUqYj4t4ExI5t8vPWJh/NiOi6T5iRz7XYUnvqHlLBzyi/PaXg05wlyx2DuYfw1RVuzMiAHw6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742648; c=relaxed/simple;
	bh=ocys6PlPZ1h4PMeC+ruKmzpJAmVkfssFUmVR0hzqROs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=us793o/YYaCm2PzkVpBemFZLNb/4XpcvvBt4fn0giAwLhAAXonOWL20XufoXGJ7NdTmUxohiwwdjJMT8tW2oi7yky49qyNjO2/K4Jtape54p9l+h0n9bK5SYflTv4QJoHfa8lwndP3wz3gNNGtSJuXzQgTUlu54v5l0jJpQsu3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prSqc/n2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prSqc/n2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b258576d8cso5839035ad.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742643; x=1776347443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEzEeIeBUIU5dwGn5ZBrwizmDcgRz5TSFp1p17Gl/qY=;
        b=prSqc/n2+P41TZQoviyFgdEAxk0hRnYXU4IalLaRBrkhTo70hlz6Mj4gSOJDgJUG4G
         8mXUYXnDXfcdm9cOgTzPYj7yWo3LgdRo17hRMkuUQrf0OTJ2fc8PYURuUa5ibqLWTwCq
         LZcOqNBLK0eVpYR6smUaFTCKkNJsGGHLYwUmotWDfLBJP8d5/yL8yw4umncTIAvvr0L8
         5rSHXhpZNfoICH05L3TSwu70bn8bk/dldfrZtLtzCikdN4SHxb5s5Jsjy2GFltMXLevx
         LuEgqzw3gJKQ4nDiGk4HlNu4pSulMvLfryXcdQZeq0UszPN6x71+hIaWOEEdr7I0jORh
         jEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742643; x=1776347443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEzEeIeBUIU5dwGn5ZBrwizmDcgRz5TSFp1p17Gl/qY=;
        b=HEsy5dnpFWEDUYHkJ19FfLTmvDTtRaVA0mSWPRcZXpte7gErGcwIbfsULXna6dpj9T
         mtjLPfhMCq7fT7WKZSODFWP8ohZ78OMHsebmy5fiIubY+QRLzCQ9lUULzDwoXBb0/h/i
         /T/dcCHYQuoCCsNX/ITmGaB9PvWHTKX5V2qR9K1KLbbKIp5sE3cBdVP2fC+7c4fpfhwz
         pepf1KfOIg42SqUVQR2PDJN2lzrnKhhI7sFlG5sNJEJiUg0Zd33wt6C4Pe4jim65S7CL
         lNwiSkG/3PvaZ0oHOL6STJqFG+xmR81d/jXzE3Zhdvmrrz5zLc6y2U9usqML1Ggr4P4Z
         X+Jg==
X-Gm-Message-State: AOJu0YxNMl4I+QYjjf6LAbLMal+edOrkIjHrAOekEOb5KZCrWHyObYoA
	shp4+fNDmNDBqqWWLWnUH/IdcO9b5+Thax8meWv1nKwKlFTECiIZNoQB
X-Gm-Gg: AeBDiesm3zB60RUqBtNmHcUGENQwY28d7BtE7OP98L3V/TZ18AFW3rSLSpAEuVsDAyS
	HEklYLj+YTNYWmSgsB42SJe7EOKRwAJIiraZXQnG9mDP7EVT0KCc2pR1CsioqZ09444887maiet
	0u0xXTCzayZrCeCsU8gODJd8L4zP8cp7xqOa+2SKWa06dS32u8fGjj47u26kiurcbqqKjCQcnaj
	gOodlE13Y+oLugJBXPmYKvsd0huGyMxCD9/HpbJkdj1YtbeUWCdikfwuNEW9ne8hjNPEan2UfxV
	s0k1Fv3ri8zBe18i59ZFIJnZNbiFyRnc9JIQjog9SboV08kIlOEvhCtTIJoTWszFqHPhGbkAILM
	Oc65K0jpdPm1v9+MSIyC7cBAOfgZsws3qDlbbd4ou3QpCgh5NAlyVeF8yE3Uj2wrzQFIr6+3qyY
	cgyOPqaEroma26+35DdzOC6uSKxHmwxn1a657em/nA
X-Received: by 2002:a17:903:4b4c:b0:2ae:4cb8:484a with SMTP id d9443c01a7336-2b28182068amr274618155ad.17.1775742642861;
        Thu, 09 Apr 2026 06:50:42 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm315288855ad.28.2026.04.09.06.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:50:42 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	tmimiharoen@gmail.com,
	filippo.muschera@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	rayfraytech@gmail.com,
	david@cardinalsystem.net,
	weibu@redadmin.org,
	dharanitharan725@gmail.com,
	ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	suunj1331@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	bryant.boatright@proton.me,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v4 0/5] staging: rtl8723bs: Code cleanup in drivers/staging/rtl8723bs
Date: Thu,  9 Apr 2026 19:20:21 +0530
Message-Id: <20260409135026.137904-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
majorly focusing on fixing checkpatch warnings of constant being on right
side of test in comparisons, deletion of empty if block ,use of
read_poll_timeout_atomic(), and other code simplifications.

Changes since v3:
- Rebased the patches on top of staging-next
- Remove compilation output from cover letter
- Add changes in each patch version in cover letter

v3 link: https://lore.kernel.org/linux-staging/1D11A73B-4869-47DB-B8F5-FB3F0D7FF932@linux.dev/T/#m3190af744bc1e1f151e9e8503c7d20951fe27534

Changes since v2:
- Create patch series, each doing one logical thing
- Use read_poll_timeout_atomic() in _is_fw_read_cmd_down()
- Use single return statement instead of if-else blocks containing return 
  true and return false, in IsFrameTypeCtrl()
- Remove unnecessary changes from the patches
- Convey testing status of the patches 

v2 link: https://lore.kernel.org/linux-staging/20260403094647.fmgop6xh2cjpit3s@inspiron/T/#m3d08fd012119772ea55df48eea80abbea34e8548

Changes since v1:
- Check for more changes of the type of placing constant on right side of 
  comparison/test in drivers/staging/rtl8723bs/

v1 link: https://lore.kernel.org/linux-staging/20260323145214.ubhshy2gwp52j5zh@inspiron/T/#mc3b693b37c49fbdde89171b7f1bf61b7ba8eb964

This patch series is compile tested using the following commands, which
include setting the necessary configurations:
        1. make defconfig
        2. scripts/config --enable CONFIG_STAGING
        3. scripts/config --module CONFIG_MMC
        4. scripts/config --module CONFIG_RTL8723BS
        5. make olddefconfig
        6. make -j$(nproc)
        7. git rebase -i --exec "make -j$(nproc) M=drivers/staging/rtl8723bs" HEAD~5 

However, as Luka reviewed v3 - since these are only style changes, testing
is not necessary, so I dropped RFT tag from the patch series.

Prithvi Tambewagh (5):
  staging: rtl8723bs: move constant to right side of test in comparison
  staging: rtl8723bs: remove empty if statement block
  staging: rtl8723bs: simplify boolean return in IsFrameTypeCtrl()
  staging: rtl8723bs: use read_poll_timeout_atomic in
    _is_fw_read_cmd_down
  staging: rtl8723bs: remove duplicate rate checks in
    PHY_GetTxPowerIndexBase()

 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  4 ++--
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c |  5 +----
 drivers/staging/rtl8723bs/hal/hal_com.c        |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 11 +++++------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c   | 18 +++++++-----------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  |  4 ++--
 drivers/staging/rtl8723bs/include/wifi.h       |  5 +----
 9 files changed, 29 insertions(+), 40 deletions(-)

-- 
2.34.1

