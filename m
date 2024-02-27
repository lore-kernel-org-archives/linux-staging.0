Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD48D4CDE5
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008925; cv=none; b=X/fwx9BVdvRS05EfmP/Iz0b3pcLmc7dVWmc9byoElk7eX5S8tpTwAwjKtDnkvioU/PkUjnWo/AvOGLB3/vSap2e8EkPfDnMbZ+lNZ98h+ODV2zGKK4DJfVlSeC2mVbNxl4F0v5qtD5Yk5BzyFNF6excPkheF+IeJbEPndj6r1UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008925; c=relaxed/simple;
	bh=AWQdU3kluKJoPz7o6Ua8Eu/5RWK0WbDEPD6Ctry4hsY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q8zl5UTM3n5iyoZNIQ57bqSJRP4I2v4c4AR+7Ps5clpYw/wyHN7lKYdLb8MUd0WKPO48nL4w4XamcBu7gPWH3gzcBqQLvdKPYETLU5mv9lLHxlej3NIZvxu2gP3lysyF2pGvOBxeTAmgbR5OgX/Ng+jabDdqJqrDQX64I6AiqYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=k3XAwtXL; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="k3XAwtXL"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-21e5fa2f7efso1833956fac.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008922; x=1709613722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HY0NP7LwBEVPmbCQopnpQZWuVE0uOUptWypnv7hOyd0=;
        b=k3XAwtXLvq4KReo4ektK/daZhd0Bc2BjRQexulwFvU/rNK2X8DV+1D2jvqakWtT9z5
         MKTvcZT9NIQ0e/+ZHSStYUWlEiJyXMD3SC5RSVt85dzbKSibXkzrF8LopGpMV7tdtMNl
         92Sup8T70kSzIyD/G0cBx6sMExMmgySZX6w148rU+wBTJChq1H5mPWmTVdm7bPalVbVO
         ZRUDtg5Y4JrI94OVAlhFhcVYtNZ91jCcMMumtrErDAMqgCExmH8pJH9dy2F4ZoKq4QP1
         3gWmmHN27+06ZNh4JOAB/ZrJ07fSoDhUXhT4lpVMv9T17+9DTqCYMswDF1LKPS01VDA1
         FfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008922; x=1709613722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HY0NP7LwBEVPmbCQopnpQZWuVE0uOUptWypnv7hOyd0=;
        b=XH1TEengFS/tqxwCqbJzIbx27dHAcGhLU8Mxppm65GL6R6uKt8o5OQAsK0Ysx/NWYC
         4ANUXg5JNzC6vLAd8y/vop5sxAGPDuHIUGeXjp2iulh+Kx/poKtXVJETvK3L9d8VT+k0
         TqwOnstilAr6Vt6JFyp635TICT39OVntTc8yuPhM09PCwrpqeb3hGzstz/JVe4Oa0yNR
         FmM1fMENONs1np5SV9iirkZEjZsDal04xbQujftgjf9gbIR/BhZkFwaS9L0hr3dGREhY
         9hixoAIVNM1B4wX0TcgNMPYTjpOEWduHqktMXTVwuFLTon2VSSBoMrrv+FH1ifR9p1rW
         +TfA==
X-Gm-Message-State: AOJu0YxBTx4jWIDelmDBGvKBiZllSf7k54dEhaGs3j52QLjCViuzzfCR
	gZDyavLod8ucfhsg9RFB6rpoiAUZ7hdGg141zoZcu5O4Y+RK6Vk5G62orJFU/1g=
X-Google-Smtp-Source: AGHT+IGq3R67hDCiBxtzlyXfpYYQ3rKc6mjiCveNfVzVaPM9pbPsxdkbXPgOX9OsNR61VLXSrmcqpQ==
X-Received: by 2002:a05:6870:918e:b0:21f:c7f9:a4d7 with SMTP id b14-20020a056870918e00b0021fc7f9a4d7mr7687168oaf.3.1709008921774;
        Mon, 26 Feb 2024 20:42:01 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:01 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 00/20] Staging: rtl8192e: Fix checkpatch warning for rtllib_softmac.c
Date: Mon, 26 Feb 2024 20:41:37 -0800
Message-Id: <20240227044157.407379-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series attacks checkpatch camelcase variables warnings found in
rtllib_softmac.c.
Thank you in advance to reviewers.
~ Tree Davies

v2: Fixes a few alignment and commit messages which went over 75 chars.

Tree Davies (20):
  Staging: rtl8192e: Rename function rtllib_rx_ADDBAReq()
  Staging: rtl8192e: Rename variable NumRecvDataInPeriod
  Staging: rtl8192e: Rename function SecIsInPMKIDList()
  Staging: rtl8192e: Rename variable PMKIDList
  Staging: rtl8192e: Rename variable Turbo_Enable
  Staging: rtl8192e: Rename variable osCcxRmCap
  Staging: rtl8192e: Rename variable bCkipSupported
  Staging: rtl8192e: Rename variable bCcxRmEnable
  Staging: rtl8192e: Rename variable CcxRmCapBuf
  Staging: rtl8192e: Rename variable BssCcxVerNumber
  Staging: rtl8192e: Rename variable CcxVerNumBuf
  Staging: rtl8192e: Rename variable asRsn
  Staging: rtl8192e: Rename variable AironetIeOui
  Staging: rtl8192e: Rename variable osCcxAironetIE
  Staging: rtl8192e: Rename variable CcxAironetBuf
  Staging: rtl8192e: Rename varoable osCcxVerNum
  Staging: rtl8192e: Rename varoable asSta
  Staging: rtl8192e: Rename reference AllowAllDestAddrHandler
  Staging: rtl8192e: Rename boolean variable bHalfWirelessN24GMode
  Staging: rtl8192e: Rename function MgntQuery_MgntFrameTxRate

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |   6 +-
 drivers/staging/rtl8192e/rtl819x_BAProc.c     |   2 +-
 drivers/staging/rtl8192e/rtllib.h             |  25 ++--
 drivers/staging/rtl8192e/rtllib_rx.c          |  30 ++--
 drivers/staging/rtl8192e/rtllib_softmac.c     | 128 +++++++++---------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |   4 +-
 7 files changed, 99 insertions(+), 98 deletions(-)

-- 
2.39.2

