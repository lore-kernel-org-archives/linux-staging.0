Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260D0177991
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823599; cv=none; b=oQL7w7KddwG15pQXr4dkQV6uaaAPzZ/aSGgnuC3EATBsqDPuXbef8ELo0NIOrpCTPQfXDhGinxUeb8Hk0U7BQNroeedXI/tgWhe2DzBwzpeu62ZuNAEEO3jyUmV+Fc8b9KwuW0uEo3oVz6ZAW6r6i7balwNb4e5ZKW112eTFQ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823599; c=relaxed/simple;
	bh=oh7xOrezfXMdj70gDloEJiPeQiqg9Utd1dlbZvZkL6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rv6jlQKIrQZZbG+H3n9EdufISk6lPbJELkRTl+rejd4uFU7uKdOue1DybKZOUhrEe3LG41DMBVqLKVG3d/G8HoEsHuYIoefq12o/BTd2YgLCJGDfvPVaQvy5LM5SKXVONfAfINGASwA4JeUN0Q5J/pYdZrWSv1D3dfzDWDBpjBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=EGw74K18; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="EGw74K18"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2055f630934so27753285ad.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823596; x=1726428396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne6OZwDJfzyuEIzacv15rMgDT3QaEj2vd9EVCE5bpQQ=;
        b=EGw74K1811VH8MqaWYpd4Ce/rx9qfsUPEN1w0LpD23RopMVtQQNm4yldx6rsr+3fFP
         xISq/1aTB/NCaCbT2NCJDxvvz61m41rGN9p9/OOygf/+A6hQwW+P2I+O2ao6wF0UMZ0W
         G47WpbYG52002bWMTqf4RLxB1WaQuE0DnWDmJP016X3ySRNA3uF9t/5vwKVhFkiMko5k
         v7fn4WEOKRUDJTX0Xp1fkn0sWqbWD0gko3YwHDACRsfOhiP4brbiNy6/FuCFSh3D0GI6
         Dwvzl5v9n0EO6Xmt3N+jQH/7LD/C+m/w/ZGfg/6Cfhx7nD4lsiqWIr5J/o7hlhL4/i6A
         W6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823596; x=1726428396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ne6OZwDJfzyuEIzacv15rMgDT3QaEj2vd9EVCE5bpQQ=;
        b=KnIhf/oVry/n5W8UoznWAESMgRgk9DlufWbzk4speDDMk/ZAwQ1yIoneyxPKWOhZp+
         6giliOJZ6vjyNcI17o8qpMgKSKboY+0zOt91TKGM8qAQntyCG6s1qUxhfDRtcy6CJux5
         tBfFJitl0MX1nwhfZ548XMmqpgXiGsrm3cq+KrwcHSkB17Otnwzp9YjikJKCvRswlNbD
         QIDez5Coh/rODXnqXOAUNFBWC+nlce3SnYuLtavuwIBCjc6pHmv+UecB/nM+Mh3uIR89
         C6qJLwKmEl1RbRJLRuKLUSRE6FsgJYmrwtZcWEo1UOtRXl+BnNQsQHa7AdnEQDOM3bfJ
         d5FQ==
X-Gm-Message-State: AOJu0YxTcwhMGiKhs4UVnDua2TEeV2Op/d0Z0HeTfJEX0FcscbEHAoi9
	6dkJgUIj6wGUL1BF5ds8wWmAdLffxq6F5++sIP2saHoMi/LSsq/VnXD9b9lNVBs=
X-Google-Smtp-Source: AGHT+IGmXMHK3iudCDKeF1n9Plkrrg7jMkPEXUB3BKTDnDHUcbjFCBO5C0lWmpQ6h08ASHTfH6OYrQ==
X-Received: by 2002:a17:902:daca:b0:206:994b:6d53 with SMTP id d9443c01a7336-2070a553890mr66411705ad.30.1725823596236;
        Sun, 08 Sep 2024 12:26:36 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:35 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/16] Staging: rtl8192e: Cleanup even more camelcase variable names
Date: Sun,  8 Sep 2024 12:26:17 -0700
Message-Id: <20240908192633.94144-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series performs variable renames
~ Tree

Tree Davies (16):
  Staging: rtl8192e: Rename variable pReorderEntry
  Staging: rtl8192e: Rename variable SeqNum
  Staging: rtl8192e: Rename variable SignalStrength
  Staging: rtl8192e: Rename variable pFrame
  Staging: rtl8192e: Rename variable bPacketToSelf
  Staging: rtl8192e: Rename variable Para1
  Staging: rtl8192e: Rename variable Para2
  Staging: rtl8192e: Rename variable ScanOperationBackupHandler
  Staging: rtl8192e: Rename variable Operation
  Staging: rtl8192e: Rename variable bAssoc
  Staging: rtl8192e: Rename variable SignalQuality
  Staging: rtl8192e: Rename variable isEncrypt
  Staging: rtl8192e: Rename variable nStuckCount
  Staging: rtl8192e: Rename variable bAddNewTs
  Staging: rtl8192e: Rename variable RxBufShift
  Staging: rtl8192e: Rename variable RxDrvInfoSize

 .../staging/rtl8192e/rtl8192e/r8190P_def.h    |   2 +-
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  40 +++---
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  22 ++--
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |   4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  14 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |   4 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |   4 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |  30 ++---
 drivers/staging/rtl8192e/rtllib.h             |  32 ++---
 drivers/staging/rtl8192e/rtllib_rx.c          | 116 +++++++++---------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |   4 +-
 11 files changed, 136 insertions(+), 136 deletions(-)

-- 
2.30.2

