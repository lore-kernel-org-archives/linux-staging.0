Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7802F3C0E
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781439749; cv=none; b=pApJH/n2Ualx/r+Ko01W2d6xs6MkDtqgUjmomLbZhF6Q+QYDqCyrV2wULEnDXpCpeFW3esB2tvbCfulnUW2iewBnpSBqCinf1UpFdwq7G1QOqD5jbhpmORAYttv7UWrZULmbGqAdyj26WqugI06Q+mCxG5zybhmtV2tVZ0SFb/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781439749; c=relaxed/simple;
	bh=EgSqvrPHAo+vQxXRcTb+G7KcLQc9swU8roVvTO0GPNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ra86RB95Ffsmyx9cPWDRDJw+QAul6x5v1PjCNpZfrz24NLgCt5MvtHzqVuHbRLnfEnlLsYe97+wVIeH9GvcZCL1DuE7IdIDKiOuFckzzlYoniNcoBt2LjAiGFUVudFcE5jIFf2I7j4xiZ+1ZujhHEL805ECDjTubO+cr/HUt6JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnuaeVrP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnuaeVrP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf237e1433so29500975ad.1
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 05:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781439746; x=1782044546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FIA3UKdpBs+j7JFkJDu2sdF4l5Hd9ZrN2EiP7fWZUGA=;
        b=UnuaeVrPom4sMKlGrmMNlXLAwLXMU/14cz67VSTBTwHE5DD+ffbUQokAB7K65T9wPm
         eMV28rP+aOsdBt/616/8WedLAVmSXcpAarR+N3y+2ByNK+hSaiIPFsD9g5EsLscTm7Gm
         ILsG60x0/NKi07zzAGmaEXH1864uTYO3mNbhDt5qG5i04jRe4hIdaW+pevcjGtmKNdqi
         ngRPK/USQ7a1RG2iqmHc0nhK6HOFG/h6MogSx89x8IZylZjJNLXw2/4vc36z1VH+8ibj
         Q8eN4+YtYgi/JYOXOL8Yhdy913KYy46VEq+AAfjPqT+osJLWkaOGo9bUZBcAAwyqu2yw
         x3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781439746; x=1782044546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIA3UKdpBs+j7JFkJDu2sdF4l5Hd9ZrN2EiP7fWZUGA=;
        b=aJ6okdECYgLCjp7RgpDOR/BcxOZY1yXsaU7wgegOmw2Nn341xPlarpZVzMPQudzQuW
         JWGfafDQ3Zow/exy5lRSltPOEWk4vCvNePxQ7CHYgli3kOpTDGnIgxynEucHXTRp+6+w
         RgWmvEW1p5LbfFBWDuab/E2GmQTGecpN7xmTfw1aiB+1+QV+beNVzT+7PNx4Dz3BCy5T
         sZRb0Qch3M2LCIvq0DcLt6Ks/ExpiTJ0ODA44aoJgqypIwXTB5BPAN15ZHlnoHUt9jtR
         DxWHvkCjg3O0s3sHsHUFPFxIf4u5EnEk2hl2hqZJ4DEvrKuSs8A0U9Ptn8ASH4NKLwL1
         Zq7A==
X-Gm-Message-State: AOJu0Ywj3rZkdRS9vfOLlydepK1ICMaO1ljhBrwlx72CdkNglONr/WiD
	Tz506LbuFv0yvCd9CUIfQS/A+V5MiZ1SNBEJjE90iQNgTRC+UtSGn8dr
X-Gm-Gg: Acq92OE3/4OF70++TEfxGIwIjFrch6EvIKth56RlPvPBi5YYgtweX6FFMXfn1Mf85yB
	iolBmhQeZXpE84lSn8+5lwNCvPCz/Jy7tG4c7Txb3PqBg6+SGPXB40RDmKTW+85kA3+QcIIUPSH
	p7ZaKJ+87S6WNbld9I/sOpJSJDI29BH8a53N1DYuprKvXHTFwr0LHR81U71gLMpyJDchsUNxxju
	EbJm6txtHJej0mXSd6+t+TGYpcNB9k34K/cG1yCItOtQEVJMqLpWPMZjxpjfy2nDN0m7ltLC+PA
	lm5JKCzL/jW9K6lDOagaJbXvztOtsIRP35xhJRDquI/dQiChZAMkXkfD9nDtWgPvD7u0girOdlg
	gwd4vUI6l5HRR73vBCVJauo7phsjc2iLjGWalmN5W6nd8hW6t+awCoghupqoopvUb3s4Bv6Dof9
	hbEqbnWL/kwohduAi1AQ2hHavuJTfUUDL8vcgSw4lbC0TiL1BLMc/shQB+sv2qwsZ20Vy5zoFZs
	iBI
X-Received: by 2002:a17:902:e812:b0:2c1:b8af:18ab with SMTP id d9443c01a7336-2c411d7a10bmr116842365ad.19.1781439746283;
        Sun, 14 Jun 2026 05:22:26 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([103.58.154.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43326b085sm69157995ad.70.2026.06.14.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:22:25 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v1 0/4] staging: rtl8723bs: Fix missing spaces around operators
Date: Sun, 14 Jun 2026 12:21:51 +0000
Message-Id: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes missing spaces around arithmetic and bitwise
operators ('+',' -', '&') in the rtl8723bs staging driver. These were
flagged by checkpatch.pl with:

CHECK: spaces preferred around that 'X' (ctx:VxV)

Each patch addresses one file independently.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>

Moksh Panicker (4):
  staging: rtl8723bs: Fix missing space around '+' operator in
    hal_sdio.c
  staging: rtl8723bs: Fix missing space around '-' operator in
    hal_com_phycfg.c
  staging: rtl8723bs: Fix missing spaces around operators in
    HalPwrSeqCmd.c
  staging: rtl8723bs: Fix missing spaces around '-' operator in
    HalPhyRf.c

 drivers/staging/rtl8723bs/hal/HalPhyRf.c       | 8 ++++----
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c   | 6 +++---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 2 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c       | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.34.1

