Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320C1DED5C
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926356; cv=none; b=Z5PscJIXOW5a59k0yvTzEeUnOq3Ps6aASOQ1icwaBSQ2zqljShA6qGnFOGp91xMbvX8V/rmMSeXcrt/PAlayBRSyENgTWcMw26Ulfebxyc9FeC8YIp4wUqxMHlPsRvN6jujS8GL+GXGDdhXtxzBGC9rBb8OTx561q1gSidJgu2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926356; c=relaxed/simple;
	bh=8vu0T1JjKy2Umh4nld2ZECV5gNm/Rdb0x3lyEWYuyos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qaio/m5noeVe7lXGMdY+9BJMEHu3ojGJEhmUTi/U1/TpfBU6ulEsm7htMZeqLYw5JHVmaiupWEuu+sXgQ2je3RIeuOSSYlkTADQVJi2tppFs60xyKWzwxO8FcHPOmbVUmpyxTrPdWb9T2KMII62e7hdSv6W4Dhwr0+ZNN/GPx7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKh5E7M3; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKh5E7M3"
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-38dadcaf0f0so674099a91.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 00:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783926354; x=1784531154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6z1IOKsG7sMmiySm0MY0f/rVwkKgpfLmnIdYJqFznnU=;
        b=NKh5E7M3SaT45y+uC1IrIte9hLeJzy9/yJ7Pst8R4u55G5NrQ2Fly1eIChggIlQUIs
         1jtjf0gbBuhTLtHfnby7yehuoWrI8vjUV5xfTexN/wB9lgVj8w8dF3dm2c96xU2fCBqt
         17qy/2S+U5PMH+Do+zAVRJhkSKaja/0it0h/ZbcRl+b8Lg+bDtzIzgFWOuYKEbLkqQGp
         oVgJIZ7V6NuYz96tGX7xsJUXKSBu2gsFsqsuDR2tg+mEKVPaxepyct2GgdVhFeKpb2Ze
         VcY7lFGG/qsGNAuD396GqTTXE/rXJs9lr86JzMYOV9kDo2u7RFBMxFok3OLOADAj1F+F
         4Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926354; x=1784531154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6z1IOKsG7sMmiySm0MY0f/rVwkKgpfLmnIdYJqFznnU=;
        b=NwhjD3eNlJ9Sd2ArAFtnLe9QGdaltllCP9FSS8p9DlgBES/GCCl4Cub7czqbugsLmh
         Y2TcbuE5L/QTRDO9wJPQMUsyW8GI5t7sMPGNSFfTtH3chHL0doC1TRGdckbnNPfw5K75
         S2TbkV+c8XkH2ehn3/EXdBCdaJdQ3M7dtLVwm+7UuYEJ+x+LtrI7bGRCQmQdsfn2IUYl
         uE0Ko/jlRlkwHe+dX/x6zJ+Yx0DTiXXWZoptUE9KO5OYuK94sy/y1eUh2/QmTOYgGG/+
         IkrvTZ3us7JKneAWrPW9+S0iCiSyNNkzdsFdhhiIK9er9juILCXnJge4Rnke0hmpVWQY
         PCtA==
X-Forwarded-Encrypted: i=1; AHgh+RrHk/ftAqubIwLWhXNmzIpWbsQcCUbbCFocE1p3F/glyXfjnYVaeCdp7QqF++fnXT2P96MQ0VP2i88cpK3Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwFanWLGyL1kG4wWI9P2VNcpZt8csZ5JMFrizJcZEmLnhsni379
	WhFGlEZm/RAbJN+NQoRQ7JihZjw2SW1/8JP3dR2hO1XkvJKpr8fAqOvV
X-Gm-Gg: AfdE7cnj1XQ30iM3Lv98ATd+FGTiwwiegUVPw0WFaM2Rt9BZtJWRZhmy/6XASqi9LOG
	o1kfHybqwiJzDFE0bEu0f0lF7xGB74+mtspAhQWq8Ig5YqHW4Bd72Die+THbMHfRHu7sxYR6QWo
	R3XKPvM6bA4MNkVPAS/MbxkT3wsfihQ2mt9r/u+SKXhMclUlFx53eLV+srl2nnS7FC7hh3Ktom1
	0ME35E7U0hbkQVRLQ0BUYMfLav0pKg5mkFmoiKDkxkptCw4AwINjhLosiVZfm8naR76Ao5nyIxv
	DG+z9H77NEimjhuB/8jLFJ1Nhvft3MrhipWw29485Ff4u5XLi+2iwxPLseyWRUclDP/T4MJ4Jfa
	qkjaBKkKRg9oBghtqHY/0JSaBzdbsqoP5rfUtHHDBatMAF+nDgwtSNt57eItSQyGRk/WGZBmaw/
	9M6SV/tbm+0zFd6djy6u8u6AMU786YMCrpLZBYShOtfFFf
X-Received: by 2002:a17:90b:5744:b0:37f:9cdf:f03c with SMTP id 98e67ed59e1d1-38dc7b8dd32mr7324126a91.31.1783926354238;
        Mon, 13 Jul 2026 00:05:54 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm33971943eec.28.2026.07.13.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:05:53 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 0/5] staging: rtl8723bs: convert xmit helpers to return errno
Date: Mon, 13 Jul 2026 07:05:32 +0000
Message-ID: <20260713070537.15903-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series first simplifies control flow in rtw_make_wlanhdr()
and rtw_xmitframe_coalesce() by removing redundant return
variables and goto-based error handling. It then converts
rtw_make_wlanhdr(), xmitframe_addmic(), and
rtw_xmitframe_coalesce() to return errno values while
propagating errno values through the caller chain.

Hungyu Lin (5):
  staging: rtl8723bs: remove redundant return variable in
    rtw_make_wlanhdr()
  staging: rtl8723bs: convert rtw_make_wlanhdr() to return errno
  staging: rtl8723bs: convert xmitframe_addmic() to return errno
  staging: rtl8723bs: simplify rtw_xmitframe_coalesce() control flow
  staging: rtl8723bs: convert rtw_xmitframe_coalesce() to return errno

 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 45 ++++++++-----------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  2 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |  4 +-
 3 files changed, 22 insertions(+), 29 deletions(-)

-- 
2.43.0

