Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CBE1FBA
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 00:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724631451; cv=none; b=ulz+TjIaecWF7YzuT3vMaiob7pNvGs8+YEC9tuIF/YltX+7egxpQTINrF/9TbjtTlWZf7UtauThEjLiPTK0nk+VUrRgpjDbgWNdIA+NV4SeDF3Dy5aYVtncAdApVKSNzKGG1dzYdVQKCgJ8l4m1zYjDI6uou+S9wadrG8Al2pv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724631451; c=relaxed/simple;
	bh=NAchry0aDCVtnJjkkBy+w8YQSt5OWV82Os48Ej37PTk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XO0ccYXpjout/zPDo2aHwW0mwzKlIQX09UrMliiUNRZF6wAkd+ogE7DiMK3Kx5R88Z2DpOOx7JqVrevUekCunTNr0wSCi3o/n7DF0iiueWOzBY2R/mXm41yLFgLUsXwOMqqtJeMshT8DDFJLZA7wxO+DoGN73yFynWrM0KoGuHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=FXT3B2ga; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FXT3B2ga"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7141285db14so3371061b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 17:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724631448; x=1725236248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FxwrIexHDfQAJvt4m/cxS0b+MNbREQHM2nv/b10F9zw=;
        b=FXT3B2ga14+7IhinhaJ1pRbvloLmHpRSSvs/mt46YfDTv6bN+PKpo32GF2iMMim7CS
         Rqv9SMgwfjqe0ld02H1hNSvWw+qe0mN14tuzLuKJDvb68QW1x4TLjDuz0BK2W8SM0HMF
         OMK+ecDYw88hN41CkRVZ0/taWzr1CKCtHvgmgd65eBThcFK5H6F7RsMbS2G6TryMQJCu
         ArB1VigBx+z4lx/emdMMVkdF+oMJZ1Y/rLvq4f07oMe26pDf+UWQyo5C8NgyPx/ZnP4a
         AEtUAunrbwgB0azXdzAyBbwsTLHZJNO7MDZNS1HXuPUq4KJtzbpPdoQ99rxjg0Q40tAy
         hvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724631448; x=1725236248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxwrIexHDfQAJvt4m/cxS0b+MNbREQHM2nv/b10F9zw=;
        b=ANzJJHcogM6tE9ssVVfc2SuuRbZwNIuc/Vs4mlNYfd9PA7alPYzZ6zALn0ukYJ83G8
         fvfybB2L+inU0ZAbZeK234W45QLjrbvMTzflnEVToo/856I3O1g4DXm5nRaHRQwcAG3l
         SxlQpinnYBteLj7Zif4RBeW42mk4sL2s+iZyilClBDoxo2Ma5cTbPMQHT25rnYYNxJkN
         svjhNhgiz2WXowdLhqXm5Q5mk1a24McpafNReeghVXrCNtADINQjHubHzsBpaVCbPxql
         WlU8iibrHrBbhxG1MsMjgkSAAXCjsdnZQh42+fvqfryIdeVbmsK8NaZl5JAmRgJnEtD8
         LQKw==
X-Gm-Message-State: AOJu0YzO0T/pekH0VsiBYY3iPxCahfJPviQbngF9uJpaBji8UK7Gnwxm
	Exs2MD2+Ln4CukJ5fIE9VDM3JfM08PHfh03cP36xOAR7tRNZXYxVd4VPCvJq47I=
X-Google-Smtp-Source: AGHT+IGp+p5DxtAbqeUrS5pPr1JMjSHySSu21bUTz52Q9QYdWlE/PcqzSKUqH/bORi4aCeSCzfqWTg==
X-Received: by 2002:a05:6a21:78e:b0:1c4:8bba:76e4 with SMTP id adf61e73a8af0-1cc8b61b54cmr8913801637.50.1724631447732;
        Sun, 25 Aug 2024 17:17:27 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203857051b9sm58695955ad.234.2024.08.25.17.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 17:17:27 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/6] Staging: rtl8192e: Rename vaiable cleanup
Date: Sun, 25 Aug 2024 17:17:18 -0700
Message-Id: <20240826001724.274811-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleanup up camelCase variable names

Tree Davies (6):
  Staging: rtl8192e: Rename variable CurPsLevel
  Staging: rtl8192e: Rename variable bLastIniPkt
  Staging: rtl8192e: Rename variable CmdID_RF_WriteReg
  Staging: rtl8192e: Rename variable CmdID
  Staging: rtl8192e: Rename variable msDelay
  Staging: rtl8192e: Rename variable bCmdOrInit

 .../staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c  | 10 +++++-----
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 18 +++++++++---------
 drivers/staging/rtl8192e/rtllib.h              | 16 ++++++++--------
 4 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.30.2

