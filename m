Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FEB2BDC1C
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 17:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803000; cv=none; b=AhNM8QebUk3uKsjU2j1DP5/SfV7rD4BMljRuxKwA2qdoCJwOvj6Ar55lFX/PJpAYReBiLWP7fu+yhqEV70XpNMnmCp7vGFllcelUipkKD9OHWf9HN8szi3vNMx4IY6Hia1SqGW+5ES+B3s5jqbidZ1NuXle2+H0G4sYS5VMVInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803000; c=relaxed/simple;
	bh=yJspR7wFr8SqDMjOdt1TA+HW9unItz0H2VQExFv5J7E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PUZ4xB1tTQ3Ww3XTN8QXgiN32IMUCVueTRnp6kMHSbk3KwUBwa08UPP1ij39VsYmNFVHipakwU8TSOdiYeWAHl+gWFa1pkanEIyUIXpXkWJpqdJunrlaawXdBo6PoeerjbBUn3XzpxwocbKZcSI5M0niKjC5l13IRUPjapSUShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMq5emdW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMq5emdW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d032846c95so41150575ad.1
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 10:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788802998; x=1789407798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1yY9/7CoYAVqETL1xE3pKSFH3fmncve399GczAwR2k=;
        b=KMq5emdWthWneGVVmCPjBx/eK82gnjl7AvSN3KYJHX8sxxa/w3Icp3cNECN+v60Ym4
         DjEN1XXuXPOjPqxMF058wgq71EJfCp9xh/q3gqtJZrE3SSFF7ifC++bV4vaOT7RbhO3M
         Oq4izdSQ/2KDWgydMIfOOVw1u1qHYUnL7FL665a2gjDOP/f99l1Ahrrq5RECL8A7GI5m
         Q3RimEG57qORlJsJwteyCalqXck5NK+OWNTIrBGfDAIP2SHFR613TZuYsfj62whNOvI5
         n92WFrhOTtua29+XQdvMMdkHwJdqKd0O987QAcykx0SjRjwZxNOWPoQOywzUcmlJ0T1g
         b2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788802998; x=1789407798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1yY9/7CoYAVqETL1xE3pKSFH3fmncve399GczAwR2k=;
        b=slBeF8cCvBFXdL0AbCelvnulHvMMMNccBCnBwBcuSWOlEU71Z3GR3ZVHqXHM/45k7z
         slw7VX9mNKGA7qI8j9ey7fQl8dkPr3TJF/Vz0TsZohWGToRm1vqZPTCcuB2iE4lgDyXd
         5LjDSxJ1MaWKfiXFXNanyRqBj/eCaOLXKUb4BGJiZCzkSZxgLuFibY4qI+P9bQgqeeX1
         ude8sRSYBArGp57tQ3oLzOvR+jtTmceqlohHNil228Gd3AGVB8k9odCZ22ak6Phouj6F
         11245eeOblrFpne+Kw9MgoTanD0Dk6F6L3c3sQphA45DbS9cIEwbZ982mVu2rgj+XEn3
         oCxA==
X-Gm-Message-State: AFuF++kFL44qrSjiCBgrB3SJ4lq1FuMLLMWrrKezDQ0Ib9MmhpsJupYD
	fSh6UlSCWZjQNkRWoVMNqusvL0tJNbgikCOCEhlGV0pUx53dLhseV4y+RXT2nA==
X-Gm-Gg: AYBFou05u7iYGqoqgUTp4Yqr8iL9axrzueZ9Dbr6Bb8OQfDgAhd/J13BEVklWL59mGO
	qz+L2Idb8Fap0PZK0/7xzh8DynSYbSyChXJvnURinpOLOLsj7fGfB4zUCtfxQySrSlsVOfz4ez0
	0qiCgm4WW6TsaEFwG/+TgGyY3sMweXI6bJBXpLdcpxn8tPrSw8LUpVpLihlozzuNfMdj0npfr7g
	VrN7TAPTgRxfXKpn1EqcAU22sDdK/NcYTsFfOV3X2tQ45lY713KHulUYFD/TQ5G0WTSzTV2nG08
	u1s8cXTjnLG2rhRCqLCwuRfQoFu5JuJUkqL4QF/Ohe71g48VtQZBU4bNQqUnBZiRCkI1pR3tpvN
	gZPYNYg8DT8j2Hg757SF8rxyVWKWnHwnVRI9j9YpQIoHMuuUDwH52o7Ybbu7Tj0udwu9uZPDBCF
	oUITnBOu/NS5iIfzvenJAxL6Dvn0zfiGp59pj6ytK2JD3fMWVh+9AZL3ZPmEX/WMcjZpFI0Oo=
X-Received: by 2002:a17:90b:394a:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39b2613150amr33159886a91.6.1788802998237;
        Mon, 07 Sep 2026 10:43:18 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1433171a97esm27431320c88.12.2026.09.07.10.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:43:17 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 0/2] staging: rtl8723bs: remove commented-out code in
Date: Mon,  7 Sep 2026 10:43:08 -0700
Message-Id: <20260907174310.5924-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes commented-out code from header files in the
rtl8723bs driver.

Jennifer Guo (2):
  staging: rtl8723bs: remove commented-out code in hal/ header file
  staging: rtl8723bs: remove commented-out code in include/ files

 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  1 -
 drivers/staging/rtl8723bs/include/drv_types.h |  1 -
 drivers/staging/rtl8723bs/include/hal_data.h  |  6 -----
 drivers/staging/rtl8723bs/include/ieee80211.h | 10 -------
 .../staging/rtl8723bs/include/rtl8723b_cmd.h  |  1 -
 drivers/staging/rtl8723bs/include/rtw_ap.h    |  1 -
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |  1 -
 drivers/staging/rtl8723bs/include/rtw_ht.h    |  2 --
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 11 --------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  6 -----
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  1 -
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 14 ----------
 .../staging/rtl8723bs/include/rtw_security.h  |  1 -
 drivers/staging/rtl8723bs/include/rtw_xmit.h  | 26 -------------------
 drivers/staging/rtl8723bs/include/sdio_ops.h  |  2 --
 drivers/staging/rtl8723bs/include/sta_info.h  |  1 -
 16 files changed, 85 deletions(-)

-- 
2.34.1

