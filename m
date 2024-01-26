Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D43BA5E
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308298; cv=none; b=A53aTc75y/RE3MgK1f2YncTq64f5wtfIhnE87ga9b3sF3aS4kdabzhG9rYBBwtoi9BiwyCHwWsg1fGaL0IORDbQ4RbrlHR5NjkLFdVrWziyvm+H35ua67okiW5ZLcowrQh3lIdBWXi3tgRheVxBS2TzlwL10hc24p+8WWQelSkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308298; c=relaxed/simple;
	bh=5Htmkefxszs9S1elm636bmCy6zXLYX6OrmtB6icqdiE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pkc/rFIJHV0T+DqW7HzjaV8w0CbF1EVoKUuORxKDGLnXEW4bvoU+wQwqsdfA71VKTLzV8fnQ4b+66YBuvNheVNwloBsgcZQ0g8AcLIoZDktmZZl7WXCt0n6A3ddxVMRa7+RtxF+MfbV+js9xdehZiGSd/P/V7lS9eEBn/OvW7jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=W6PWtuji; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="W6PWtuji"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-28bec6ae0ffso649882a91.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308296; x=1706913096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3n0LpUSFJ5lo4205sO6CjYx3DDIcvcU0+vDAsWWwIMI=;
        b=W6PWtujipOrJi5XdKXtWWWYMDR15/b5U/1w+puHvB3ZFdkZahTQ8BTKWEdXiv1Qr/R
         3yzuAlGKLHOgZ9M41JEGwN4k9QbDbxw34Rt2vXzlH3EIXHfnl9fUu/4P1fO31Va8Jgq8
         lYZyiP4oybsyK7dzUuQUkIatW20JasOPLK65AnU/DB6xk9H5b2533uUW4xjEvUx/ijA3
         ZG45Se3dF0xCkEUv719JWP0xeHO2zJbY4jzxXxuqAg4UN0bJHPsNTYycMNis7k3w9qCN
         ApXFAq0z0qjwX3K1++zVqjtNAhuq6ugobTkBKZo62S/L83PQ3Sa/TvBorr5ZDGIJAX3/
         NlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308296; x=1706913096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3n0LpUSFJ5lo4205sO6CjYx3DDIcvcU0+vDAsWWwIMI=;
        b=g/t6DMR3jhZC8a2RkvT2TA9UDcCimMQT8uef/MoHswi0HkP1fKAEymgPGrRW6TcshR
         AIz9lDV1iQQkxijLh6dmJ5F/9xUpKIO5K47AxSssdrVDjCmRdrs6wS5NI9qWhAWxNFPD
         1CL/PvjV/Im5OeYHS4sRtBVlJ+O/IxwVjsVvOg8mrhhRzRnq5Zq3oq40i6PBeCPSYiVu
         557eTZsJRmcAf3YW1oGaa2q1agfYlHRnYSsOImxZrm/qm4WGZZWOIvoxTkM6uxdphW3r
         N1k2xHPiKLZ18FSRwIcrspfu7BcSccncinvXTtCsseGHYpSLeFrBUeAQwGYAcgvrCimn
         8IUQ==
X-Gm-Message-State: AOJu0Yz4wFWr36m1SXpsE1xQcd+VfX1EA7HXXUIFPERb6Mz9dzAHRoDy
	W8vq6xEz0KR4n/L5351WVtHVfM9+y/6xNsjw9mM3ToW11aQ8wR5LyPOtGPiEZNE=
X-Google-Smtp-Source: AGHT+IHCsOMgyPUvEkLCbOFsI4A6F5kXRbMkMPZNZexE2B7YNB+V3LEbyxfrM9tX0VuhhH8SNt8p3g==
X-Received: by 2002:a17:90a:bf13:b0:290:6b49:e686 with SMTP id c19-20020a17090abf1300b002906b49e686mr522859pjs.88.1706308296160;
        Fri, 26 Jan 2024 14:31:36 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:35 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 00/18] Staging: rtl8192e: 18 Additional checkpatch fixes for rtllib_softmac.c  
Date: Fri, 26 Jan 2024 14:30:48 -0800
Message-Id: <20240126223106.986093-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Version 2 

Another checkpatch fix series to be applied after the series titled:
'checkpatch fixes for rtllib_softmac.c' submitted by me, to the list, 
on 1/5/2024

Thank you in advance to all reviewers
regards,
Tree

Changes since v1:                                                               
- On Patches 2, 5, 6, 17                                                        
Update commit message, to fix max chars per line.                               
                                                                                
- On Patch 13                                                                   
Fixed spelling mistake in Subject line

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

