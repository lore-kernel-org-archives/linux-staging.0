Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0984BDF4D
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919789; cv=none; b=Xbt27uGNWrbRmv6z8YiZURGKOmmQfGP5zHmGjbPtiq2lnXU14050kIBYdNfjiAlm6C0K+mjwd2j3gVpTOCyUyBo/WFn29u5lt657PKgBlGY/RJG6XlageppcaN1hKlkET9eopwq5+7GvyzIzz0gtVUGEXSKJS9DgE4cwvX0uKHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919789; c=relaxed/simple;
	bh=Akvks8mysTGqZ3S0NHAgtT01VFH4LkGymJmxDNEerl8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C/MA7VLgZRaTb6kLrwa8SVZLHf5WQh/JLaU8vjOV80l1fAZbu89TnW/dMaV3XjfPemgD9DCedOv7IH484i1O3m0E3RPw6NAH1O1UHA9rhgHQeXyMZ6/TCb8DRI9ThpCIoT/OwnetIuUgNxgV8f2lII7q+7wP77tLWwde00FHnIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=eFtn+UQr; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="eFtn+UQr"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dc1e7c0e29so9450815ad.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919787; x=1709524587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXRMbMGYCa9+7pITYo8YHSxedJ9Dm/1lTly2Fj7Ci9A=;
        b=eFtn+UQrBSdq6jkEVNa8AYfvI2Hf+8GAeYAmDhrwBoAdN8vP3mJTivJw43oyLgR8Xp
         ZAmBhnUyOkPVq2uW/PGj8ujfy0+m7+8Y4UmLAchKsJ/2p3UkIQHcs+v6t4pr7sWA5Y4C
         EtyFy9qMtanhxfr+DtAP2tzxb7JPxrsOUIWDPgcg3RRjUeTJMVq6fGjfyYdonaAmDZT3
         b8hGm1b/A/QCOgubRS6nCKMSql+e1YUxp+FMY/jOxlTdtvLsYkhSoxoJn1a6G4Y+yvSw
         JpheIcHfs8dOKQbAinaTFDGfe2KfwqUYFN46Wrl4f/do3FYlPJNkfNb027/aMusa2CrK
         CVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919787; x=1709524587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXRMbMGYCa9+7pITYo8YHSxedJ9Dm/1lTly2Fj7Ci9A=;
        b=CO8FH2XXdnIFKxikbRwtTWv9B2/OGnx+xjnF578zFRA/yqxcCEucRKPXzdKsFMZCu+
         ACZe/wc2y3Blidmd+cyjKdrTHMTm4xEO+agnPOM72FdeIYf8s0OrUCkaeqoZmPoV5LIc
         zFx+rqYL/a+bdiX+BAQkoRP4N7niWL8UF53+tN3N95TE6cpxnIYQok5RZeA8IkDaW5zg
         qUFI8FXiqIE7XarH555OJ2pH2jNNmXVWXphELaXc6VSCZkrxHl03pMvGAAnhh8JRHH4z
         x0DWg56SRzAxdt1JX7ZA/McdpPANtrK/NiNkADKm2MxPwCYr7TqoEUQS9iUaGVRlVOfG
         acEg==
X-Gm-Message-State: AOJu0YyppvNOq+kpTznXmM8h2TBPN8PdCnsFl16RZg7fmd9pjSfCGrhW
	QkkCdS6ZJMp3jhD2MmkwIn2M8kT1p8cS77mDgq1l6v9nOCRivQ+X6FTpgzDYnjs=
X-Google-Smtp-Source: AGHT+IELyXa3g9jmLECyXHKmyyOk/LaUxz0KsP7lM23d1DJLzWPodlN6L1byaxDaUzXSSNZP+U6zBA==
X-Received: by 2002:a17:902:e806:b0:1dc:5ad6:b6e4 with SMTP id u6-20020a170902e80600b001dc5ad6b6e4mr6846108plg.4.1708919787233;
        Sun, 25 Feb 2024 19:56:27 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:26 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/20] Staging: rtl8192e: Fix checkpatch warning for rtllib_softmac.c
Date: Sun, 25 Feb 2024 19:56:04 -0800
Message-Id: <20240226035624.370443-1-tdavies@darkphysics.net>
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
 drivers/staging/rtl8192e/rtllib.h             |  22 +--
 drivers/staging/rtl8192e/rtllib_rx.c          |  30 ++--
 drivers/staging/rtl8192e/rtllib_softmac.c     | 128 +++++++++---------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |   4 +-
 7 files changed, 97 insertions(+), 97 deletions(-)

-- 
2.39.2

