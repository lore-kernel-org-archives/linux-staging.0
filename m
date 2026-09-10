Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E8849B5CC
	for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 22:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077852; cv=none; b=JKmIhf6pnAZ8sdI1MFoo7JjGghbXQDlsplAS8DWOK64oKz2oR3GTfelXkXRqTshA7MEclnZYzhHBFDAgggUUeWlxIMt6a5GiPAuryreZXtWkE0pSiP1KKPoJj8uqCRyrTxm9R2beMuadcR4C9nBJ0FRu4K7JLkGsIp3r1okKI30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077852; c=relaxed/simple;
	bh=Cfs3++8j7nPgW/u4byiQeV05NU9BKXkdSObIUSiHc2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SdXykNUIolNrFR0b6pIpJo8TIjhvsASGpK/Pxx1T9ZrLJsZSvHkiN0+uX4/5+2i934xVVD0TlUVEyaMAqXahpTs0WDRgJN+idPIVOHujKtCU8AKyC19zGn87OkuuTCLDuzpe7V/UM6T4rgqE7twMl/yLLWQlnOqITG77w8TyhrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bg+y65xF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bg+y65xF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db18e5cb56so2376695ad.0
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 15:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077850; x=1789682650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhJcJgWpQfK/ZjXxFl7DMf5xoOpby8bLFUBu6AdOvOQ=;
        b=bg+y65xFip9dc0j62jnAYWkjpjzwwx3+J2wVQHsb6CqBJAhoTp2zq+8vJMG5TlNoWG
         SWSiDsp8BOdqFOAmn/xmspMb1eGlE20+h9cqw0hXbUEtfKLUphW2OYbLZnUIBnE5eWzb
         Q1+b/xi71sBPQa2oui4vx2fPZf9HbxHDrfTrn/CaJsCLYd7SeS+hfWyfEYGUkcDECCjI
         ET1ii7ZSsxX3Fv9+yPYZ1EYOoLkCf3cV+VqblSFfrDrG9mMUXqxoM96hAqb7NL7eSAyt
         x6wx7VfCpWOlee5BDZKhOCm+ekvIGBJhJSdM3Q1oLm6rqL0n35tH/cdSEN+fz1mA4RqX
         GeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077850; x=1789682650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhJcJgWpQfK/ZjXxFl7DMf5xoOpby8bLFUBu6AdOvOQ=;
        b=cutzYDFlVq3ZZvfNCyXuO5APPYJNYfGpsEl/7fJZhXIVTEmhh5/U5JzPr8lvQB44S/
         WYumdA7tJX+vCr1y3nEsIsPCESdiP07NBfHKZvpZfIT8RLCvECYuU7S468nsvPyrLZ2L
         KkwPfnuBGscv4Jn/aa5no7IXu8vxxXoK4u60Xjwd6Uwu+1hYOOVVxti9eaNURxRJgDS1
         FsJshzo0MfKOlhrWwnrjdpka76rQEpkeEQ9trkXEb2c/93dIl/ad0WfoNVGKG9lL2rhy
         p4swDHODReFotltPaS8O0++PtVxdqakhus/crzuTjl/obGkhD+Mfol5ShRG8JUjzo/WD
         Fqmg==
X-Gm-Message-State: AFuF++nb4PUHXWxUe2Kx5wE5clDF1wpZoe0FYC1MwmQXxd5uasc6IKr1
	2QvHmu9mELhEMuIGTBu7W/Xf3YmLMvZmvxWXWtJpdnXehoM1RMDgMTK+XkwdPA==
X-Gm-Gg: AYBFou3R4tcEhNDLXX1NmJlf8Pwc154yuS9ee+fJLCokYk2FaNSvjx2jlxwpxwNV733
	bUlPTc9bewZrG9dVdaLoxMQLJEMmelRApRkRUPL3qRmd5W07gR8rQbczKzFPDSpizcWIySsl7dP
	ZPsATxODIm5A52dEJfaUXATwNj6e2im9GqvOcYMDTUPtuRBfLjGv2Nrq9F/JlOvr/nlzY9iBeFh
	y3rfW91+ikRWvM4rd8RpcBSB6+n5Vl8wAwMIh3H9wGUOmnwpDHG2NE6DikY9UyKTMkzPBRw/Skp
	z1D0K6rqZnFbPuVjjocFnQX/Wtny9wJ53Bca1l+B6OIfLblrqbhorhNGE8cSRsVxuHiti2AeFeK
	H1etdhhjmuIdq6EJaoAchABvHJ/GJtx/cfdai2NrZcFZ7iLRQa9okk2QvLTx9i51Siu1NV9Mrg6
	WZ8zrcKNnBqlMxw09m3VOhMDcMHQ/h7S/HnIeZG0hrD937XM8l5wX1RRzxrXDqLWsB7Ez3iWTF3
	/UCUyDh/E1i5i3pRMJg
X-Received: by 2002:a17:90b:3dcf:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39d9bc44857mr1455198a91.7.1789077850225;
        Thu, 10 Sep 2026 15:04:10 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm997755eec.16.2026.09.10.15.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:04:09 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 0/3] staging: rtl8723bs: delete empty comment lines
Date: Thu, 10 Sep 2026 15:03:56 -0700
Message-Id: <20260910220359.6683-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset deletes all empty comment lines /*  */ from include/
header files, and adds a newline back in where appropriate.

Jennifer Guo (3):
  staging: rtl8723bs: delete empty comment lines in hal_com_reg.h
  staging: rtl8723bs: delete empty comment lines in rtl8723b_*.h files
  staging: rtl8723bs: delete empty comment lines in header files

 .../staging/rtl8723bs/include/HalPwrSeqCmd.h  |  2 -
 .../staging/rtl8723bs/include/basic_types.h   |  2 -
 drivers/staging/rtl8723bs/include/drv_types.h |  3 -
 drivers/staging/rtl8723bs/include/hal_com.h   |  5 +-
 .../staging/rtl8723bs/include/hal_com_h2c.h   |  2 -
 .../staging/rtl8723bs/include/hal_com_reg.h   | 92 +------------------
 drivers/staging/rtl8723bs/include/hal_data.h  |  1 -
 drivers/staging/rtl8723bs/include/hal_phy.h   |  3 +-
 .../staging/rtl8723bs/include/rtl8723b_cmd.h  |  8 +-
 .../staging/rtl8723bs/include/rtl8723b_dm.h   | 10 +-
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  4 -
 .../staging/rtl8723bs/include/rtl8723b_spec.h | 72 +--------------
 .../staging/rtl8723bs/include/rtl8723b_xmit.h | 10 +-
 .../staging/rtl8723bs/include/rtw_eeprom.h    |  2 -
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  4 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 -
 drivers/staging/rtl8723bs/include/rtw_recv.h  |  2 -
 drivers/staging/rtl8723bs/include/sta_info.h  |  7 +-
 18 files changed, 15 insertions(+), 216 deletions(-)

-- 
2.34.1

