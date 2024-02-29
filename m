Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5257286A7
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 02:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709174614; cv=none; b=SsWf13nksXJZAX7EJCrqG1B8kpFqEeFll/BpGF9BX0XIFXbKQSu7gzPMrCklvXfqz+y6uw05PkbpnJM5LfNjIzZ6zl0OMhgXGZx7v2kzAqfys+3rWT6NcD+OzuMD9PuhJiuVdpp+ygsjNz7/qe/N4NFcWZBM6uvRcHV9XEUKTe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709174614; c=relaxed/simple;
	bh=7/cR9VrrZ75MJ0y1I9vqnz7EMFlDVEgY9zQSNI9n5xg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VfGAO/2ZVEInNJ2vH42xXZe6diHarWtNYG9Jmr074GW+c4J0cSz3AoEmpNFb6lImHsj7rwJAvPUGaNCDYEE57vG4GuKufEI6L4003Zeg7ZceauA/doLMhqUAXOofTqUK3LhfbE7gZKB7RM1xiITlIOFnDHPS2ZauG9p1Ne3+1ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ad69xgKe; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ad69xgKe"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3651b948db6so1898515ab.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 18:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709174612; x=1709779412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aHu2J18/kfwLvYeLsu+wqPWa0ETUgopQTH+/Wz4pq6M=;
        b=ad69xgKeN2gpWeDx5uTIMVNY1E+zD7TUrKfMdpQ8WLbsLnyViMRg5dxfoHHiQU5QJ1
         MaHj4VgsRHR4l1IErMVzrPWxvJlbl7WrfHSCrHmYtG3HHDsHtn+9Netroa/KszJSxVdi
         PXAsoP/jDaBgPGWEwK41s6828h2/dmqUAgIaAIX6cYONmXx1UiUilTy6rQ0NGa76T26k
         oVMsyDem3UVGHFpaIRq45kUK2SJc5f19nsRiNFIr2cwycAEoSxP8txEc0n3iVTyjw5iB
         kGMW40FIsZ611AIgY16mYZ1HGpGPO1Rvj5Rj2gpF6/613+W8wt69KO5MiU1B4pIV/zP9
         7/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709174612; x=1709779412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHu2J18/kfwLvYeLsu+wqPWa0ETUgopQTH+/Wz4pq6M=;
        b=tfbTVopBrAireVN7O2BzffFv5e6KxqfNVBX+Qpgxj9c77ClHxQMm4/k1UvmRrhJ0/l
         m+IDOTquyJEDFW1WxPYVlhBclHxaCQqIY1AP7F1un8GsH5MD5DKe4fdTP1HqywV4sTck
         hMgScQWlK9fikwcfBL5P8mXEuC14RfXSmAZV0fjpjyzsO1GyDw7z8wiF7y8jL9OxGQuK
         bc70HcA5d1JOrHf2iULJJEtyT0KipHGAWSBXbOhcGU7JGq55nikt9Jrv/WGkr8MAGFmp
         Kini+VO3ZM21Rj2KMAldPDiE94L0HJNDh867zU7TH1t4oxw3G5AxqWyrlGHkSZXZIy2p
         lj0g==
X-Gm-Message-State: AOJu0Yxwbp6yx6HuaWtmmmHxlzj/Ze28dSIt8t7d5OEqJRX3G8V06l2n
	uVuOpOmXuXzDHLerkrOtf/F2y3YliAz+HLHvMOen899IQc5bykRRNJWTDNrL5UA=
X-Google-Smtp-Source: AGHT+IHxml76LrK1ytaduUzOOE9pLYz+ECrfmVRkOs8zfvnVPPu5R2gcYriLGEe24YnSsVViTRt25Q==
X-Received: by 2002:a05:6e02:2148:b0:365:25c0:c82d with SMTP id d8-20020a056e02214800b0036525c0c82dmr1272926ilv.28.1709174611731;
        Wed, 28 Feb 2024 18:43:31 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id u23-20020aa78497000000b006e5092fb3efsm141504pfn.159.2024.02.28.18.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 18:43:31 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 0/8] Staging: rtl8192e: Fix Checkpatch warnings in rtl819x_BAProc.c
Date: Wed, 28 Feb 2024 18:43:17 -0800
Message-Id: <20240229024325.453374-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the remaining checkpatch issues in rtl819x_BAProc.c
These patches are to be applied after patch-series: '[PATCH v2 00/20]
Staging: rtl8192e: Fix checkpatch warning for rtllib_softmac.c ''
Thank you to all reviewers                                                      
~ Tree Davies  

v2: Change commit message in patches 7 and 8

Tree Davies (8):
  Staging: rtl8192e: Fix 5 chckpatch alignment warnings in
    rtl819x_BAProc.c
  Staging: rtl8192e: Rename variable TxRxSelect
  Staging: rtl8192e: Rename function rtllib_send_ADDBAReq()
  Staging: rtl8192e: Rename function rtllib_send_ADDBARsp()
  Staging: rtl8192e: Rename goto OnADDBAReq_Fail
  Staging: rtl8192e: Rename goto OnADDBARsp_Reject
  Staging: rtl8192e: Rename function rtllib_FlushRxTsPendingPkts()
  Staging: rtl8192e: Rename function GetHalfNmodeSupportByAPsHandler()

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   |  2 +-
 drivers/staging/rtl8192e/rtl819x_BAProc.c    | 66 ++++++++++----------
 drivers/staging/rtl8192e/rtl819x_HTProc.c    |  8 +--
 drivers/staging/rtl8192e/rtl819x_TSProc.c    | 24 +++----
 drivers/staging/rtl8192e/rtllib.h            | 10 +--
 drivers/staging/rtl8192e/rtllib_rx.c         |  4 +-
 7 files changed, 58 insertions(+), 58 deletions(-)

-- 
2.39.2

