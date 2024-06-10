Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8C61862C
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998540; cv=none; b=sXtSVhB10rpcV9ZU+AlIw+AMpSgQhf0hYO7+MXQxigS88wLVqStrJn1tZbtGHOe5SGdxF0K1dnruKIsBhm/1xDlOp7TMyMbW98YsJcqxlYg9CP9BOlBDTa/Ih0B6O7/fxG9gWsG+kYZJN+nRl3JBKf4kNmRCtBcXlSMxPYNUFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998540; c=relaxed/simple;
	bh=bms1Ws3k7s8Pn4nPyg6h+fF059moWEuj8WzmZ/gedPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tLQ5cxtfyQGDbOjFmS7Mv+wWsXlQ1F4+KQnei12LuEfPlKhEN5wv6RriL370QDIh1SIQK6QafFX62RclkFQLZW5qQ1i9kiI1Sx3a1IWGKgp0Maoo4vgVSYT92Qi1T7cgLHryeRFVeyWjaCoXbky2CYxK4homzOQZY9IhuzgH3Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=APLz910z; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="APLz910z"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f44b594deeso32695675ad.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998537; x=1718603337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGXyZQ0AhWdPiVFf18ve/MIj+b/D+nKo1h7kD/lhLtU=;
        b=APLz910zcLT9V1tAU6u/YaUI86ExU+SvJD6Dr8UmPv9Ck65ArSUQBidVsZjYJ7ByFk
         ERTJHpQWGDFSIZdiCVS2yjCCnZwk6GZH7G7eRLc81p4FGvzhgOtoCDDwfWzKUtnRHZHa
         PfKLRc9dHk8QGPSy9EOT7uhemZVPV3DhPpUFSq0BSDC9S8q+uUhljyVC/Xw/Xu4zFgaP
         c0kkuDjsu5R+x7v2XdAsQoPscqdeqJpHMYoe0krDrz3O2R76t+crrwtua3XDQUOk+ZaR
         K2M24ph4D+8hJDtmfAHEigVyRhzutuG5dFdE6MgyRPPPf1j4s+3MmzOYIkTEbURMvhUT
         cQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998537; x=1718603337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGXyZQ0AhWdPiVFf18ve/MIj+b/D+nKo1h7kD/lhLtU=;
        b=TGhHIvhZMXcmyo+DIV13bb9T1pJ+VoSspr4MwoEkwkYjSDQjhBs4NU5TDgJ335m33H
         j8JUW05fk8Gy91AmtbJ4vZJainvHmQWu7UEUPskja6GJ/Vn2a5ue3BlGHwZCXMLyb5H5
         9S7ncXJiVxHPKAK54DRBydwP6OtNKfp0fJxyFfv8iHs6KqVWfsyc2mUCA8FPbTb2J+cr
         qs2fOKAfVkAJ6JhF2vnLqwftrv0mknM+rRcxHCI9naQNGYelZf23oKZm6gKluUkIC2IH
         sz2/UBVFqZVOrxG8zTz9vCZ68AxOSpduJLlODSkj39HfXWHm8Xa9ZVFevAQPApCqF44P
         Lr9Q==
X-Gm-Message-State: AOJu0YyMrm02j94hBz+u1H6woSf7p7ptwJSE+Di/kW/5Yu7TwmQ9HuOn
	MYeUSoAfuBXZbCLThFFD6iFoAPpNAe5lDIZmEZNJqvqRJTmwCKZlb4YVdYji70Q=
X-Google-Smtp-Source: AGHT+IFMxxwA/HgDSWHBK0vQ0QSReULjfORoxLkKeGsZKml2iVYQktdR8yJZIilL5zEqPi0X8+l4jA==
X-Received: by 2002:a17:902:c408:b0:1f4:7713:8f6 with SMTP id d9443c01a7336-1f6d0388ea1mr104816145ad.52.1717998537417;
        Sun, 09 Jun 2024 22:48:57 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:48:56 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/24] Staging: rtl8192e: Maintenance renames and cleanup
Date: Sun,  9 Jun 2024 22:44:25 -0700
Message-Id: <20240610054449.71316-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series attacks CamelCase variable renames, removes
un-used variables and adjusts alignment issues found in
rtllib_rx.c and rtllib_tx.c. 

This completes the last of the remaining checkpatch issues 
for rtllib_tx.c.

Thank you in advance to all reviewers.
~Tree


Tree Davies (24):
  Staging: rtl8192e: Rename variable bHwSec
  Staging: rtl8192e: Rename variable bIsMulticast
  Staging: rtl8192e: Rename variable HTCurrentOperaRate
  Staging: rtl8192e: Rename variable HTOpMode
  Staging: rtl8192e: Rename variable bRTSEnable
  Staging: rtl8192e: Rename variable bRTSBW
  Staging: rtl8192e: Rename variable bCTSEnable
  Staging: rtl8192e: Rename variable bRTSUseShortGI
  Staging: rtl8192e: Rename variable bforced_tx20Mhz
  Staging: rtl8192e: Rename variable bPacketBW
  Staging: rtl8192e: Rename variable bBroadcast
  Staging: rtl8192e: Rename variable CntAfterLink
  Staging: rtl8192e: Rename variable bUseShortGI
  Staging: rtl8192e: Rename function TsStartAddBaProcess()
  Staging: rtl8192e: Fix spaces/tab alignment to match open parenthesis
  Staging: rtl8192e: Rename function rtllib_query_BandwidthMode
  Staging: rtl8192e: Rename function rtllib_query_ShortPreambleMode
  Staging: rtl8192e: Rename function rtllib_query_HTCapShortGI
  Staging: rtl8192e: Rename variable bUseShortPreamble
  Staging: rtl8192e: Rename variable bRTSSTBC
  Remove parameter bIsAmsdu from rtllib_classify()
  Remove variable IsAmsdu from rtllib_xmit_inter()
  Fix space/tab alignment to match open parenthesis in rtllib_tx.c
  Fix space/tab alignment to match open parenthesis in rtllib_rx.c

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  16 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |   6 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |   8 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |   2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |   2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |   2 +-
 drivers/staging/rtl8192e/rtllib.h             |  28 ++--
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c  |   4 +-
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c  |  10 +-
 drivers/staging/rtl8192e/rtllib_crypt_wep.c   |   4 +-
 drivers/staging/rtl8192e/rtllib_rx.c          |  45 +++---
 drivers/staging/rtl8192e/rtllib_tx.c          | 131 +++++++++---------
 12 files changed, 126 insertions(+), 132 deletions(-)

-- 
2.30.2

