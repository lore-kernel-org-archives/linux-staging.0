Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8772744C
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748756; cv=none; b=Ek2AshFck3nZ/8MOJZvmyahKIqPU2AbDNT60c2imMol6LjgGzolFuBvEsCveVjT5dTvZvOja+tm2UJKYGHvF8jMpF2kG0HV9vtJeUZR3jHgzelkKQJGZ8Z5AFTGBoOCEOSWLUQoQ0TPtpqYeJpjEllMaxvmNhhHi79PHUUUH88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748756; c=relaxed/simple;
	bh=qXSzaE9bVH2Q8DDXlnO3VvXrcu9RLi+wQbEvYhWZFao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PdkJskFUsMifKZiguAy6nmrkux+clcosHBp2CxhaSBFJOTxUq087e8bgMAlBxbC2C9VXlV+FeZWFYIWZWh6Q4SJfK5OhbJ7nKtRs9RXb/nSwSfiXtWbw7MJBTIb+SY2gaWnUsCGYb4zUtIC32nM5HD7NhYFJmefYmBFfs73HOo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=LLKQrhYR; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="LLKQrhYR"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6f0f07746a4so3118072a34.2
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748753; x=1716353553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGK0Y+Ay79UTLYMwgp4ltlyyvJGTL7iwngRnNpkI1QM=;
        b=LLKQrhYR6KPAsetiK/6YvODEoHqYjkJvvYmJ1l8kcO+FttThPn4ViSZpPWNgbnQ06/
         FoLDrTcvtikm3ngslE32I7PkILq3sHQvhk3c7bdiUwhgy7As4Vy06LK6MtEerY5RWRio
         DMQP4MSVlt4JBOiWO0xhv9f0kr4JLUEM6r0JN9ZtIhmSYgLv2rqRz46KN6/o7RvwlyWT
         gGZRlD3OBG9yxUP68DySj8ML+eHbgpbNv3VcJxSMVn1F8bXoj03p10NAoA1psWYn2z3q
         cXG9ZtBjgrg5ifdRUX3ag0p7OIp+SAV5j8kphw9t7R8Cexqr5vBJwWUWRVKXetN52k5O
         U3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748753; x=1716353553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGK0Y+Ay79UTLYMwgp4ltlyyvJGTL7iwngRnNpkI1QM=;
        b=Fp/Q6n7OtbItF7yvMDLKJyP0OPngNPKYMYtI3AGH/GOULgz467EMWqi4YUyVP8TgZo
         KC++ktOs/pfxxkkPbK+WK/OIHKVZOYZ8JP2jWmMc+BP2fBmgYXcp0Kj5eKn906lFQkYR
         jf1dF6pbjYkcDCwF8gL3+MelOe/q50dw5pqG1CTA8PjNYC5duskZBDh2/TP6l8qqbZPr
         DjAe1JTPQk4IOiSbB7ze0Aa3Ac6h3tRHY9Usle1wBkkVpNsbuxQHdVIorYn7nJMMj+QB
         fBlcWtK9oGN/V9hT0DKpGZKa4CdvG+0Y9072/S+vahqCrabBw34haukNfHk1tUM59edT
         vkdQ==
X-Gm-Message-State: AOJu0YzdN6AIOwnWqRAs/uLUUrMBZuDD22Zu9iuAg/j9rvsdTfPa9qUS
	JAqiJZcjObGJWMA8lIZ+bGrKGj6BEQZH85eC2n10uR020q2VWpOPDMxmD8z9aO4d6/xQV33J9p2
	C
X-Google-Smtp-Source: AGHT+IFxuM53qOVs3ZUC+MFrcNzBV3wB/ku0AmJDncPC0wqaV/WkA3xgyK8oeZ3c9x4vTfzd6YGnBA==
X-Received: by 2002:a05:6870:452:b0:23f:dd5:f89b with SMTP id 586e51a60fabf-24172c2fad7mr17839507fac.51.1715748753515;
        Tue, 14 May 2024 21:52:33 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:33 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/31] Staging: rtl8192e: rtllib_rx.c Rename camelcase variables
Date: Tue, 14 May 2024 21:51:57 -0700
Message-Id: <20240515045228.35928-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series renames camelcase variables to meet style
guide requirements. Thank you in advance to reviewers.
~ Tree

Tree Davies (31):
  Staging: rtl8192e: Rename variable IsPassiveChannel
  Staging: rtl8192e: Rename variable CountryIeBuf
  Staging: rtl8192e: Rename variable CountryIeLen
  Staging: rtl8192e: Rename variable bWithAironetIE
  Staging: rtl8192e: Rename variable bContainHTC
  Staging: rtl8192e: Rename variable MBssid
  Staging: rtl8192e: Rename variable MBssidMask
  Staging: rtl8192e: Rename variable elementID
  Staging: rtl8192e: Rename variable rtllib_rx_Monitor
  Staging: rtl8192e: Rename variable rtllib_rx_InfraAdhoc
  Staging: rtl8192e: Rename variable IsLegacyDataFrame
  Staging: rtl8192e: Rename variable RxReorderIndicatePacket
  Staging: rtl8192e: Rename variable RfdArray
  Staging: rtl8192e: Rename variable Decrypted
  Staging: rtl8192e: Rename variable AddReorderEntry
  Staging: rtl8192e: Rename variable pList
  Staging: rtl8192e: Rename variable nPadding_Length
  Staging: rtl8192e: Rename variable LLCOffset
  Staging: rtl8192e: Rename variable ChkLength
  Staging: rtl8192e: Rename variable WinEnd
  Staging: rtl8192e: Rename variable WinSize
  Staging: rtl8192e: Rename variable IsDataFrame
  Staging: rtl8192e: Rename variable bMatchWinStart
  Staging: rtl8192e: Rename variable bMBssidValid
  Staging: rtl8192e: Rename variable bWithCcxVerNum
  Staging: rtl8192e: Rename variable Frame_QoSTID
  Staging: rtl8192e: Rename variable CcxRmState
  Staging: rtl8192e: Rename variable IsQoSDataFrame
  Staging: rtl8192e: Rename variable RfdCnt
  Staging: rtl8192e: Rename variable prxbIndicateArray
  Staging: rtl8192e: Rename variable bPktInBuf

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |   2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |   8 +-
 drivers/staging/rtl8192e/rtllib.h             |  36 ++--
 drivers/staging/rtl8192e/rtllib_rx.c          | 184 +++++++++---------
 drivers/staging/rtl8192e/rtllib_tx.c          |   4 +-
 6 files changed, 118 insertions(+), 118 deletions(-)

-- 
2.30.2

