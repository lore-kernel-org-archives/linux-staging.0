Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CFF1CD30
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919961; cv=none; b=MDD4TX6+9n4hdeFr8Mw8CwPu3Dl/VBJRqnejK/Hk/R/wQrWUJOHIBivZ1GQHWLbbQWVz4ZgtdcQ8KzuAFK8Ixzmy9EQ0vgFW54PNtzEHtRBXitSMflMd0o9R0m7ipAyH9QOlE03uXY7P9Hd8UiZMcip6+lt8JxjphCDuHe+Mp+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919961; c=relaxed/simple;
	bh=618httmeWCIIGJJeFM0I/PfO2VgZGTGYJmRi/GlI1l0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I3LN1408VpZAJ8UlLueONPUf886Z0tT6UNCKAfWpzKsGa3kPM0G5kMki1F++MPY5NTi9Aq3pm4tbVeyZ7dYQzfDKQwzbYLPPCRFkZEEgoL2MBwZbCWYEDwuYmPgBPM/BdDqnsgvUT9zHt9W72VBvEAOm6oHucSIFT+NHrpqjEj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Ci4I9eJH; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ci4I9eJH"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e459b39e2cso1357119b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919959; x=1709524759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOsrd801zJsct3pzB+qM0qFvoaKTOFPWMLrZ/GwwX1Y=;
        b=Ci4I9eJHcWXWoMNBSd1JRA8VASBVLMMin4bz2eJU4B1gxvREmj0blghKCrgopmD9Nc
         pP0X07eAInSjac14Iezr+XBkm94LTLaSylTaYUy/uWaIwXzOUAdImO2jvi9QWy49Lr4Q
         tE15Z3qGcLAEmIS+eGs64YtL0TgLZdr3PMduMUx3j6SShIcyjQRFSqA+lYWA11F4ad8e
         ZNzvL40ULAxl8nMBXjutMqk5Y7RoCjcZHNzke9k2hhKgk+S8u+wjib/W//AATw0LSN/I
         +IZCC+TRbLobiGdh5RcyzMdh9VyhSa5HbZWT3H1Yoafma+MyvwYaULg5ewYAPx2v4wcX
         Sqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919959; x=1709524759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOsrd801zJsct3pzB+qM0qFvoaKTOFPWMLrZ/GwwX1Y=;
        b=rzAl9G3oszEz0MsBZ82+EUVSRcMMH0N/Vu27HgeDSNstmi6Ssuh5xaKCfYDRQoxR23
         FXmr5bVmKxwWlB3UJA/P5NCZPtcXncSsfxeocqr5SQUpvWhZvlOrAlLFAl1ek9tDWxfV
         9KtOLr/KxnFbir2MYzUE8hC4XoQIFv8F0hcsPN4rQaUoye425lfVy8u7ZftutcijG1No
         MMDVPd0IA9PCPFv3iIZedO1IZwndkaQw7LxLRQQoziLAfW5hiXF+QvQyzlW4AmtIciIs
         u4BtEohtbjGBkiDGB7z9bt/GI6zgM/lms6sPfEh9zac5zF3wjuu9/g8TnPbaurfvi2yK
         jyxw==
X-Gm-Message-State: AOJu0Yxx9/qpXODNKT3ufzFmejX9hkedGPw04veA3/xadFf4Yvi2ODq7
	G0dCut3CMYVXIZ0ButvFJlm7yF5TbNohAAdaIMnjlqee/bjezwNeEMnxkOoUY/s=
X-Google-Smtp-Source: AGHT+IHnQD5q9kiyidY9XUm4GTNj/1IOQwkucBz96milIytJRdhSpAhuFAR4zIocKpdP2sWYK36cqw==
X-Received: by 2002:a17:903:182:b0:1dc:88bd:64db with SMTP id z2-20020a170903018200b001dc88bd64dbmr6045943plg.21.1708919959609;
        Sun, 25 Feb 2024 19:59:19 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001da105d6a83sm2893426plb.224.2024.02.25.19.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:59:19 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/8] Staging: rtl8192e: Fix Checkpatch warnings in rtl819x_BAProc.c
Date: Sun, 25 Feb 2024 19:59:07 -0800
Message-Id: <20240226035915.370478-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the remaining checkpatch issues in rtl819x_BAProc.c
These patches are to be applied after patch-series:
'[PATCH 00/20] Staging: rtl8192e: Fix checkpatch warning for rtllib_softmac.c ''
Thank you to all reviewers                                                      
~ Tree Davies  

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
 drivers/staging/rtl8192e/rtllib.h            |  8 +--
 drivers/staging/rtl8192e/rtllib_rx.c         |  2 +-
 7 files changed, 56 insertions(+), 56 deletions(-)

-- 
2.39.2

