Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5566C145358
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291856; cv=none; b=hJb1t+BobiQlU8XE/ChsY0Wmrua8xW/YrqjMJm61H5NQwIzqEKh4psPkLcCkLNK0+GQ1wSB806Wemkhb+s/l0ECcuBwmEimy2A7Wylcl0aqUqauZnCnl308d2MSyZWtukdJzAKVAp3axjNikgL1Sj4b11fRBgdhfVs/AwQOtI3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291856; c=relaxed/simple;
	bh=kJFBG9EnhnvVx5BtGyWc4wfBumRieRFADNoy3amDwa4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=psCgRWzbWzi88Ktjnuy0dD4Q2Y18ZDgLbJs9q6ATOAaoxJz1FbUxlb51iZIGibPRZpHLG6RBpsRdzA5pBuMPJ6IyVy1698O02nT8EESD5CL7J4wILtJiZKGu97442IHT8hpYs3fYQ4K14Qj8iDPdC19COWz0fAfCAxto8ndr+h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdVURKiJ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdVURKiJ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c85a7f834so1608520e87.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718291852; x=1718896652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zWZ9jwhxEyNAmvATs50sdCbv0Ojx6ZhooJEx919ELJM=;
        b=WdVURKiJ6yq7qWbYVbbj/S11xwoskcLVn4wc//MDeCq6Xt8IENZkHVOyMMumj6ow/M
         mRKKF+N5FDggy8+K/tvgTb367w9GzSn7cygn371fY2A97pRqZIal3ICGWyw6iGf92oHp
         iCQ3yMqTaDXJFL+ruvQKI6LMTwmbuLHAOWRqeaUmdmPEZAVQ2X4pghpmVBFMecX9OASh
         KSvbyrU77vXihRGrou9YcBOnbhDdGiHL84Emc3vk1CZuwAQHDXHSHBKXyioElMK0neIh
         kWvMAEXuQ3g4SFjVegNQ/jJj7MAotWnIa0AySoyvCCXdrEPcxkNPMRRticnGCy1tCqkQ
         bksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291852; x=1718896652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWZ9jwhxEyNAmvATs50sdCbv0Ojx6ZhooJEx919ELJM=;
        b=I0kgBOr+OoWbHFeB3IhC9SUKc3fs74ewvA1xipLcVo1BP+yXeTlsw2SXo5BLxNCUhR
         Tv5eq04oCQ5mQtSCyWXxMlt382aDrUdns5R96QTvOAJzRM7bhCTAsY+hR4XK8W2t2p7I
         amSqrcewwkTY+W8SOpMOI/+qna7m6dTSmC2Yq+YF96cEJuiB4PILK2KBlUJ8rPVL7ye5
         MPsJ9w+OchRzYPQmdZEzNO28Ayf8CkAmJafLfLmNJm4dwO4u7ZoNtYv/yimF1BW9FsOO
         58G0QdBcxzNmTABIfSevtZSKJ/M+Ips3A77LIJdnUs/lPLWEQmMbqYxONZjwj+QJigmw
         8W3w==
X-Forwarded-Encrypted: i=1; AJvYcCWHVeiOnnx576HZLxv/N4D82aDic3IpyisszW+ApWRj/gT51LtjHoNT5fWhQCGreNO1JkY/5PrJrdhjF8QPhJqHwsQKMyiLo8BP1Ko1VQ==
X-Gm-Message-State: AOJu0Yz14tT5LYa/nZTVRS+tY6ymuH3eIPOVlGx4gudHV0qGFsbaKUAT
	5SXuYKI9FtfqWnPBNWT3YFgMUpvBa/2q2x4WfWwt2SwUvExIaPT6
X-Google-Smtp-Source: AGHT+IHuZh1G+bIi5eoLswQ+gWxOBBBqkEkfB8P5li66QJlx752XejcutCtA5HmkAxyskmhTlXe7vw==
X-Received: by 2002:a05:6512:4806:b0:52b:8455:a9df with SMTP id 2adb3069b0e04-52ca6e6dc25mr31340e87.34.1718291852188;
        Thu, 13 Jun 2024 08:17:32 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm1856978f8f.76.2024.06.13.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:17:31 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH 0/6] staging: rtl8192e: Cleanup multiple issues
Date: Thu, 13 Jun 2024 16:16:31 +0100
Message-Id: <cover.1718291024.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused constants, macros, and structs. 
Capitalize a constant.

No specific patch order required.

Teddy Engel (6):
  staging: rtl8192e: Remove unused constant IC_VersionCut_E
  staging: rtl8192e: Remove unused struct phy_ofdm_rx_status_rxsc
  staging: rtl8192e: Remove unused constant WA_IOT_TH_VAL
  staging: rtl8192e: Capitalize constant RegC38_TH
  staging: rtl8192e: Remove unused macro dm_tx_bb_gain_idx_to_amplify
  staging: rtl8192e: Remove unnecessary pre-declaration of struct
    net_device

 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 8 --------
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h    | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     | 6 +-----
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.h    | 1 -
 5 files changed, 3 insertions(+), 17 deletions(-)

-- 
2.39.2

