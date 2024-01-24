Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260115F551
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136299; cv=none; b=c4mkaOg2PL2kxjDzi5juhbzdXFxWsloO/aUJ6f4tDFeABOd/jP8ERlh8HCZGDW+dxrjSk7plchK2VFO9k9fpjPJhIYoYy04KeO5h21WBUQivj3eKSTvy+MkF4PgEcA6i7k+xzQoQc25cOh15BQtV65JOQIxqUZEZBg9/8UcPAOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136299; c=relaxed/simple;
	bh=2LI+n0NSZxIFwasn14oMhGM67wNVvtAwhMC/6gpzngg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LaGKMYF1Dw9j4gsoyfVZaU06eP0mJxEZ3jG0vm4RlrWKH9szL33p0Ust+pdS9Q7lJIpmenMKUE7JCcX8g7LXusUSQw473+TXAsXZAZinKZML0FPlob3e+Y/cHscS8Yi6yYRIdaIk77013Z0zAG05eTsiebqMQB8owzh0DUFN/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=BXu6OJwN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="BXu6OJwN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d746856d85so24087975ad.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136296; x=1706741096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVA/7PiRf+yK+UXU506sZM4NUP/OQ32pk51Oj1lxJ5Q=;
        b=BXu6OJwNVzRemRANHL8YbQMoxBprMSXrZJ2HaqFI8h+WbMtcQwyU4K+5Y7uxkzwIct
         cHjHJzNJo3lt4g0U9OvyIHIn+omAuCCNG/ZZ1yS+OvKLheIjEiAV6LKsbyoyP4A1BThm
         7U6Ym9SiYxN9MdHjHbe62CsBRNTXSi4brGznyvtVJImjVnu4qL+UXP+XOjSninlA/zOu
         98U59XBoJrxqi1VfXoc6S81yw/SnA7/+iRY3hfjhv9WudlBCHbhuGXL8iETT/sDkUILC
         I+qmeMOqSpE+/sFVmZh5If4GeRm4gx89QboXaJ4PI+xcFTgLG12Zor4eg1P9j4nGsSvf
         n+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136296; x=1706741096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVA/7PiRf+yK+UXU506sZM4NUP/OQ32pk51Oj1lxJ5Q=;
        b=A3R41uL+0dyc+57Fqwp89hgUADYhYs6Faby0WBimPesj8OCwDbwDYtTc4iOkV6x7Hr
         WinnnUsk9AzvNTIRQnJmvmfoZiz1q38WtIQxwL20h/Ul0BMENIoBZxoDlr7Q+31XjV/w
         POtxh54Zb2NjtbuAdlTfXWWlTA2ffbFWAxpZgSxfnmRq8+QEPI5QSd62xXlsBzGGA9H0
         lz5xrj4HbFmYBK4QyX9xMLL6scCuJThmParPb2zCVL/2zSX4MiS5bG/3jbWHeSvjCJzI
         rp1RDF3uhQcF+W2GuEwEWmY09dj0PVsTBEcg5KOBJmVIOpm6snwPb5DY9HWhx9+Zj5sw
         9x1g==
X-Gm-Message-State: AOJu0YxnlmwJhNcyyQq7K67zdZfkBjNVq+sWvw+NIsLn2iEUfAj6Zqq7
	GXxuk8lzGXPKUsO+tjRxwM506R86P4bTqF8Cp5HV7OgwmO8e+E4+w2Gw3Vu0/h8=
X-Google-Smtp-Source: AGHT+IE/utPrHKSYmmpRHBP60l+OqEUPiPMjyxbXstmF5/R5lyXgM4fY0AwbCmOxW+rUVwgAJD/XBA==
X-Received: by 2002:a17:902:e5c4:b0:1d7:92c3:bbee with SMTP id u4-20020a170902e5c400b001d792c3bbeemr135448plf.38.1706136296343;
        Wed, 24 Jan 2024 14:44:56 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:44:56 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/18] Staging: rtl8192e: 18 Additional checkpatch fixes for rtllib_softmac.c  
Date: Wed, 24 Jan 2024 14:44:34 -0800
Message-Id: <20240124224452.968724-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another checkpatch fix series to be applied after the series titled:
'checkpatch fixes for rtllib_softmac.c' submitted by me, to the list, 
on 1/5/2024

Thank you in advance to all reviewers
regards,
Tree


Tree Davies (18):
  Staging: rtl8192e: Rename variable FirstIe_InScan
  Staging: rtl8192e: Rename function rtllib_rx_ADDBARsp()
  Staging: rtl8192e: Rename variable LPSAwakeIntvl_tmp
  Staging: rtl8192e: Rename variable LPSDelayCnt
  Staging: rtl8192e: Rename function pointer SetHwRegHandler()
  Staging: rtl8192e: Rename function MgntQuery_TxRateExcludeCCKRates()
  Staging: rtl8192e: Rename variable PeerHTCapBuf
  Staging: rtl8192e: Rename variable PeerHTInfoBuf
  Staging: rtl8192e: Rename variable LPSAwakeIntvl
  Staging: rtl8192e: Rename variable SelfHTCap
  Staging: rtl8192e: Fix paren alignment for
    rtllib_disable_net_monitor_mode()
  Staging: rtl8192e: Fixup if statement broken across multiple lines.
  Staging: rtl8192e: Remove unecessary blank line
  Staging: rtl8192e: Fix if statement alignment with open parenthesis
  Staging: rtl8192e: Rename variable Octet
  Staging: rtl8192e: Rename variable LpsIdleCount
  Staging: rtl8192e: Rename variable NumRecvBcnInPeriod
  Staging: rtl8192e: Rename variable bForcedBgMode

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 18 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  6 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  2 +-
 drivers/staging/rtl8192e/rtl819x_BAProc.c     |  2 +-
 drivers/staging/rtl8192e/rtl819x_HT.h         |  6 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     | 32 +++----
 drivers/staging/rtl8192e/rtl819x_Qos.h        |  2 +-
 drivers/staging/rtl8192e/rtllib.h             | 18 ++--
 drivers/staging/rtl8192e/rtllib_rx.c          |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c     | 96 +++++++++----------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  4 +-
 drivers/staging/rtl8192e/rtllib_tx.c          |  8 +-
 14 files changed, 100 insertions(+), 104 deletions(-)

-- 
2.39.2

