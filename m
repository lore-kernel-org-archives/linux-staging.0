Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDE51C6A3
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551119; cv=none; b=SI7ykxwWxM4dqmTL178v08hRgP0IkqIQYooJzbrOKScsN37Al2Twfw0ccVC+SXPoXW7Nm0NhHwxF2PAygM5KmG1QrXTA9/204GWVKfC3izDgFnIsIkSPqZBqvTh1IzhzvvGTHBjv45a4nfi7WvXSB5WfWpJ0fXaAcJVhJJyMFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551119; c=relaxed/simple;
	bh=vB/6gPefa12QWCfO9e9MQ0H+EUnjA7We5BRFa/kPRmo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hOTqe6VMRRSPs2ZRUzjmUQO/bYnt4rlEiwejiEr9O/kWuiBLeecJwTYVNIepJIuC6uHXM+4Lo2Cv8ajqUE0F0J4dvw2najMDlcLN8+xSaIxUAKIK9C13tWsXCkNAQ3k58R8WBiMQR84hnoOxEm7C2oEL7LlAk1u7lJZ1U5qoh5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=iEaAWOnk; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="iEaAWOnk"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7db0fb03df5so3927477a12.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551115; x=1727155915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4+rbOwWS2DJD5HVsT+VzMKozNo+bnQY21oBRpMmEKE=;
        b=iEaAWOnkvf0tUpx/YoCE/QqHASd74YJBLM/VmaUZErEL+2JwqrT2ud0UCu4Vw0aB62
         ux82ID8oMl/mKQS3GjohVF9v/6du8Do/VpOexxGgY+X0p6TCZ4hNYBbimN/bE5KM8ZxC
         MRdFmTS6PfAAAwDL9sjdHCFF14K08l0XUqqg1W+ku3yfBCCrdN/hOvHXVW1GOBSUK8as
         nVHMI3O4+BeONPaST5FDEEsmNCrZqG2BJnY8ZJNIbBb1zc3NZIVLYqvvRDj0SrhTEPO4
         6K1TyKTS+FUL5VtNVIonoF7Xpmf6OGGYK+TuT+KaAqrSeBsdXGEkjAwDZ+HbZ1PVnzTu
         2PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551115; x=1727155915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4+rbOwWS2DJD5HVsT+VzMKozNo+bnQY21oBRpMmEKE=;
        b=D8poMah6ssZ/ZmKybAkqzjstB4nopug2elFYp4ewn8XO41rUAV2/0cbmAzYyUtLrrN
         E6h3CDfy7ClPbgM2HZqjQf40FdJKMbyTieRgKWYV4pCQp8HlZuJH7dUSizUJeWZApFCO
         PGuo9pV4t5vIdEFs3+dlzecGlcPWkxNfgBjTuhNL1yTQRZH+x44fG20LcIa0eLIwmNAf
         TRqBzqdVIOQIYRD8QnSmkkI8gGPJ+JR7FeBx2/deaedY8lsNp72sZE3hU4DBhzo24Dmo
         /y5I1ZE8FBtwkZLCnmhNBByuUQt0rdCaP8EmB//rhQy5LqmU5cU9zUy8dNKU7XexfwJ5
         zlLA==
X-Gm-Message-State: AOJu0Yxqvt3P59FwTtMhw/2J2TCO850einK5FsHv3W0b+1iIv+CPiYFx
	nmUBHlZ+Sx2kUMSxcb3c6K1g5UuMtDHsylTv+1IzG70hBD7gaJrgQZCuHHlEZvQ=
X-Google-Smtp-Source: AGHT+IEce3aewCe+0Wdm7Lx+Pv1FczWLHVBy3xP5BWihRV7NTQtpgjIcFBlcxur2cIxwgHHBt1Xjpw==
X-Received: by 2002:a05:6a20:d808:b0:1cf:50ce:58d7 with SMTP id adf61e73a8af0-1cf75f65c3emr26253133637.29.1726551115409;
        Mon, 16 Sep 2024 22:31:55 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:31:54 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/18] Staging: rtl8192e: 18 more Style guide variable renames
Date: Mon, 16 Sep 2024 22:31:34 -0700
Message-Id: <20240917053152.575553-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes camelCase variable names
Thank you to all reviewers.
~Tree

Tree Davies (18):
  Staging: rtl8192e: Rename variable nDataRate
  Staging: rtl8192e: Rename variable bIsCCK
  Staging: rtl8192e: Rename variable bCRC
  Staging: rtl8192e: Rename variable pMCSRateSet
  Staging: rtl8192e: Rename variable PreCommonCmd
  Staging: rtl8192e: Rename variable PostCommonCmd
  Staging: rtl8192e: Rename variable RxDataNum
  Staging: rtl8192e: Rename variable FwRWRF
  Staging: rtl8192e: Rename variable bFirstMPDU
  Staging: rtl8192e: Rename variable bPacketBeacon
  Staging: rtl8192e: Rename variable Rx_TS_Pending_List
  Staging: rtl8192e: Rename variable bPacketMatchBSSID
  Staging: rtl8192e: Rename variable bToSelfBA
  Staging: rtl8192e: Rename variable Tx_TS_Admit_List
  Staging: rtl8192e: Rename variable Tx_TS_Pending_List
  Staging: rtl8192e: Rename variable Tx_TS_Unused_List
  Staging: rtl8192e: Rename variable Sbox
  Staging: rtl8192e: Rename variable pMCSFilter

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 50 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 10 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  6 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     | 10 ++--
 drivers/staging/rtl8192e/rtl819x_TSProc.c     | 36 ++++++-------
 drivers/staging/rtl8192e/rtllib.h             | 34 ++++++-------
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c  |  6 +--
 8 files changed, 77 insertions(+), 77 deletions(-)

-- 
2.30.2

