Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC8D3905E7
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590716; cv=none; b=XqAABDrBH3ihdNlk52Hk6tiYkyZBW5yfcNP6sYT2OXjpT6T88dmty+8mFBCoB5YJWJIN2hpStdVbXoT98LGDfRK2Hw6ZpxXxcLNdCrzmF3fqo/GW2LlZrPsjdELDu4WHJLig0QknT3PnEjlBR4dx5MROjRZpQCc88cWeohUmWn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590716; c=relaxed/simple;
	bh=xRDjdJZ5zWR8d8RBfWAy36czIYZbkJb4Kxdm1Ok/G3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fxQLud2KLqxTcmKAESz+fEwWQXBtGqKVAY/fjfgTghMmQZPif8ZO88ZTwdKCVTugBktHzIGSK3vOKP4WuEo0Ag5dvlzHdBgQoq4E0g7KfJbh1g57b4sFKXU4Mb6HFsirfQuibgw7oBP7ane5bnGKFUZJ7QggrfYSkxXoVnwWb34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOCleDa5; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOCleDa5"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-393925cb1baso56268671fa.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778590713; x=1779195513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9XTNgjfnJ37+OORYfhqe5TWCZSnDmJeVDLR4LVeIDg=;
        b=BOCleDa5wyx/2SLFoM1z6Rs76e6e3kpu57GATmebHvZztgr6iDQFiqOruW5p6mzDO4
         RgT75M4/XQkehta3LiHUpMccUCu0D65brq1duv1Sew/V5iKJBa7N6Gr0F/M0jLm2tNaQ
         MkMyfTtab6m2Ppggr7y+RBIDJ6ZEZWGmUIW8ZCPG8p2ovaqPxgz3dSYz2kaoOB7BK2Kb
         6HTuv6s0nOQpoiIxUAcd+UnsfJUN03HfkGSlY9z1fDdkG55ZDUjbAd0ErjcC0p1UJwS9
         gYNJWuKMUGPOYFQmatV3uF06A8j+fHr5/C64AmkWF66rZRIy0zjc/oqKOSrAcsX50h0G
         E0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590713; x=1779195513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9XTNgjfnJ37+OORYfhqe5TWCZSnDmJeVDLR4LVeIDg=;
        b=l2ws0WHnGitZMWo7VFuARH3aNcAlmnptmw0wDMp47xqX7dLyVfI11PLmlP/+UU7nl3
         wlsQen4XcmOwBuL5sgQnOz7X+13vF/cJ3b+FpmodOGrq8rQ71c10/J/ixhLRvO+KOmq+
         HrUR4ag9JhKa5oTXJge/8wHY2b8I0RMvVM08pzBYxwUK6IfRBlK69vgePTURfkAc8+Y1
         yvoeDH+UMeUGIv9RyMYzduQaUyjVodsQqhCx6ypXc0pZnjzfomLMtj/TEjo0BTKW2ARO
         99XasCbmc0lwM90gzSigbwvXdw5zeX2wkw2k4iTRALFzGh0OGD/H8IOU/TTQJfi9vc0t
         sawQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KLGiaLCSCT7g6aOajxTbVKmw7Ix+DPLB1ce8zpZB+vmZDPy47q0noKZu/x2eRzPYzIX88kKSs+YE31w01@lists.linux.dev
X-Gm-Message-State: AOJu0Ywho9cpMHytPOBnA+3NdDhCrKmB8bhBDt/lT/sGZoJSpqM816pT
	55QB2YtvVhCLdFCXDjRumYgjJoYDYyn3gE2Zs6TmcBhDMP1LLsoz3qj1D8fnhQ==
X-Gm-Gg: Acq92OF6SKbF3DGkalLx7E6jxkiVQdN0FvpieGNKwMIF0g/HL1LQen5GJp2LqfOJhb0
	FPGupwMqG1yC45cArdz0QYMfJWUZod5HBHJ318h+ElbzGQhD7DzLNNOagRV38Fr2SSIvkx00cNO
	c6Hl2P3RReZl95rx8zkB2BAeN9O+Jn4gK/QZcG61OBN/5FATFhL7Gk1gr2F13kbUBoZGv4kVBfs
	n/yAvFH6CqtlRo5WBsKiyHy7kigCgB/sBmHooDsoCPv1bTlIZ+S2fiXFO1snxagFoko68spbsED
	PraKXECRK4XcsAMKvBJWQgW1aU/IDOM5lR7cG1SHn/MQFsjEBRjk0sLFVoDyntXn/jbPayuapCL
	OH8NHPLnI7+Z4UYiImlcXCqG6vVErt3UIuhL2FD5kXg34aSXcK5M1Rho3XcYM+9XP46e/PCa9B3
	YBpZ/MLuneoG77WLEJVc7C+25ZoatPvIJD2tk=
X-Received: by 2002:a05:651c:150e:b0:38e:27f6:41e2 with SMTP id 38308e7fff4ca-393c41c7586mr111169871fa.18.1778590712456;
        Tue, 12 May 2026 05:58:32 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6131c08sm34949831fa.30.2026.05.12.05.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:58:32 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 0/4] staging: rtl8723bs: remove unused sys interrupt
Date: Tue, 12 May 2026 15:55:30 +0300
Message-ID: <20260512125703.6878-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes fields 'SysIntrStatus' and 'SysIntrMask' from struct
hal_com_data.

'SysIntrStatus' is actually unused.
'SysIntrMask' is initialized to zero and never changes.


Changes in v2:
	- update the commit message in patch 3


Nikolay Kulikov (4):
  staging: rtl8723bs: remove unused SysIntrMask from struct hal_com_data
  staging: rtl8723bs: remove empty InitSysInterrupt8723BSdio()
  staging: rtl8723bs: remove overwriting of current IMR settings
  staging: rtl8723bs: remove unused SysIntrStatus from struct
    hal_com_data

 drivers/staging/rtl8723bs/hal/sdio_halinit.c |  5 -----
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 20 --------------------
 drivers/staging/rtl8723bs/include/hal_data.h |  4 ----
 drivers/staging/rtl8723bs/include/sdio_ops.h |  1 -
 4 files changed, 30 deletions(-)


base-commit: 6abf0b2df0b1c2205a4c0591425e6461afa62edb
-- 
2.54.0

