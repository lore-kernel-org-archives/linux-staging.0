Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA12D270ED9
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765356594; cv=none; b=TdCae9/fj7xWq+N5PtKF+gS+okNd4EbAsCr2wvzAQTLgPQ/gc6u0aCqTr7T29IF9yNHzlYkbd3z+6Sa9lt4tzS5LFWZwvEi6B01BNZ1MU7DtaKFh0a2vd7M/2xJ77vGzYjvEd2JY9dZ4A7uS5bHZw4Ju1cmTmZV33dTZc0BOtMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765356594; c=relaxed/simple;
	bh=Pms9rGKQrV/wWRMG+vyjpUCSrq1fJ3AkYkgjY3zlwIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iDm+p8mb2J27EFJh4dvprtA+FhWIFl5bzzxyJFGAYHcMb0OuJjvQEEmCSEggQ8KMm2EuVJ/wCztBejHQ819u1n/Dht+zpent8e27PBPynOPKWqS8bOsH7G87U/kdjTQ1ajDp45s5gpP3L//91mVs2bauhLAtZAGVBXlP7GQDpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9ukw5PR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9ukw5PR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297dc3e299bso55955685ad.1
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 00:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765356592; x=1765961392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95BH0/uinAOxOXcQXE12PRP1dAEancDYlQp6ik6Xv4U=;
        b=l9ukw5PRSzcIiF6OU0UVjzQLv4R5+IdIU0uPhMiASZRNQeAODi8cXFidSOFWx9QF0s
         LsWZIToJw90sKQLgcLPo5sLDZshkYAUuWFdOls7yv8rjeyfY8T0i7SVJIVIh7Zr9jBsj
         EksZi1M5wLqSrPFYSBN4yK8Dmm6vcRIInOjjkf8GaHzs+tKZp3WHE1dTYWDMs5Bxqd+B
         d3JXmXf8CmJIl7Wxg5pYF8KhKsU3zyvDyn/zVeYpdLUryOL+xNTLerbFf7oXl1FOknTG
         hJGc1PptEkP0YvrZtp80bb4ZDf+N1VcGpl3NUQNC/JJWPeHcT1rjv2uwbk0rKmjiZkW1
         UmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765356592; x=1765961392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95BH0/uinAOxOXcQXE12PRP1dAEancDYlQp6ik6Xv4U=;
        b=moJLB0DVf6UXjhzzXQDP3dUr5FmJRDw3Glpl3+UfRbPPeiumLVfHs1sM1Pfe6kQmfK
         oBlyRJfH/iFQSRNPyWN4soGKNfyN59ALqlCLWDxdJSr9MQb0svRMwilWKkuQvR4W1ZX8
         2RKXPcRXOIEIOZ52J3Qd4l6TF3sCRNNOyecXigQ9z62qua8hk2lRmRAAFQfkg01RiE5i
         6niOMNW0KgNJSIILfCQ65dMbRVrddwDlimnPi9zqbAHFO5ETUMjfuexLD90Sxj35ryfW
         cGwHQUNiqtnFU1H2lEXoMj51CeVgLveyf3CsSQp2waAoq0BSLE+kH5W/8YXPGYQIIUg+
         m9/g==
X-Forwarded-Encrypted: i=1; AJvYcCW+hHTDi/BKEjKey9d42MVdpFj8E/nKdWC9IbHH5obqTakRgs7dLSBkfSagCILQTfVLk2TbE4y1cM5XjsfJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyWLrlW9brWj8ukD+fvEaijd+LpYSoLyH2CDkQMtJAEoMrFpfEg
	wFYBtH7/nAmJTpr81feTuvBDxDX88eC8A5XuxrMuON4REKBX4XBw2DGg
X-Gm-Gg: AY/fxX4zjKhS8nvurVMVZsjO2vmN0oRtsXJpEeJnpWu4Vzu1zb22gmGONt8xR+lJAsE
	FbJL5F8jcdz3XuPRBgH5AYcQoy2fA5BHfnBv59VyAxBTdzW/TR99EMmH7FWuFMVphM0Icc1JRMB
	fTNzxrXAlHSJlJqgRZlJVfsKoEjX/LMGHR56avZJ6VOGNV0urO/mNSG1XEFGleqGnZgx6JKbPAW
	GzkU2AedUpqLATu28iWGS5xdLd3d5kx7RlZnSTPsRgAzLrJ/c/w7XwnSsvBvLvKGzSHTc32y3YS
	6f20Qcw61DxtiHIavDeE9p2OBg9sy1ZSHLnJkP5mdXEzEsddbLY+jE/WXt/LG3UGL6gZezgFdN6
	zaBrodD9CgU6ZAdWa2AXEIZLN6vh75G6s9GA3NeIP9bg0l/n3X2DzAdR45lKN06CAdprnME3RXu
	O3hiwKPOGHiN+jgU6cIqzCToh24xi9xsnM571Y4WM=
X-Google-Smtp-Source: AGHT+IFmj1bjkQtCg9vIEJ/F2lg4ak6G1pJYIfG6cUi7R++G/g2JFMCCxQ10yK8/5Y1SfMmo75aN6w==
X-Received: by 2002:a17:903:94b:b0:29d:df04:fcb4 with SMTP id d9443c01a7336-29ec2325129mr17348175ad.24.1765356591956;
        Wed, 10 Dec 2025 00:49:51 -0800 (PST)
Received: from SIQOL-WIN-8.localdomain ([49.36.67.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf7csm176332285ad.79.2025.12.10.00.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:49:51 -0800 (PST)
From: Arjun Changla <arjunchangla7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove trailing whitespace
Date: Wed, 10 Dec 2025 08:49:15 +0000
Message-ID: <20251210084916.4000-1-arjunchangla7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error by removing trailing whitespace at line 2021.

Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..ff4e668f199c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.43.0

