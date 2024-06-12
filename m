Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76502182AF
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162557; cv=none; b=t8wUn8Q80dNSAtdHCXjPEZdS4HD4n/9LfDuqc7P7TdBvtrVWnk1e8Fu72EPqLjTsKdrXNsEr6vUOIXIQ4bSk2EkqHpV8mRjO+KI4SRq5/stl/iNv8opTAcR7scjtTNPETvOKAdqZL6qZgt49Q47VAn126oPajYlZuzoKd/KcENM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162557; c=relaxed/simple;
	bh=3vQLJewM7A/Geq+2mtl9MG3S8/I7or5poldMVDHUffU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h3NTpX9l3wCvkLr3SV4sOTwNMWEZISE56Kr6lRgh5StICeh+7BrvmlD0io8ad1I+pKFhUPcdnfrpxVIRKJkM5c5lRvRk/74xzIN3AUDV9i1vGXhvK+D4nEMtR8+0svoxvYltDYRGRByfZ7Pr8BE1E55OT2x4kjkz6/9D6UqY5a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=QSLxk/1T; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="QSLxk/1T"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5babfde1c04so2393990eaf.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162553; x=1718767353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sPqlyzd37LZw//5daAriEEnJvbFkW2/YSHXEhmM+vM=;
        b=QSLxk/1TGNeRgK9L/AALJ1lQSbnE1Bsif1QJIs5DQ/ojzd5ZKKWQNKO0vjT1XwaOWP
         hGmmxzDW5H1PuXDyoP210XKYB6Gt8yjIcpk5eLLHqRFWHOgX+ynCnBtB83dhyzFyT7N3
         pjdcXSxalkjA8ojmRhrytIE16ZTaFbe0FadUHCGX36FqvHD+1bZVkL9G69zO4SNZ8Zoy
         WWLzbmmEcp4ozq0OoPmQ9ZSseTBwOHzP3CgYhMOOt2AeV8T9bJOpZuJIbFMhOtNOri/A
         Ij75pv1XlE1chgtlEXwP1C/bUU9+tPaC2SFiWoJuwXxgq17aOLWb4MSVSu6qVshb6Q8r
         8fIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162553; x=1718767353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sPqlyzd37LZw//5daAriEEnJvbFkW2/YSHXEhmM+vM=;
        b=IgosHa/vly28Z4gSw5iXiPqHiRWVq5QMiUM1+RC5fyxJ90zl9bp0WxgQXU1zxCAcoa
         SHt16H9sOZSibP848pK28xG5zwGsEWhWFNeFbi8zVO0ewcWKuCdhoWlsosM3gCxCDVGp
         V0Ub4l2adQfnZcu13T8LFVvOzQjUJYBJN+uTYPRKN/fRDFmfOmGjh+CjP4cXWY3lDbWn
         jVacGyUpLOPUma+fkTOlsmSYwuYxjI8P0LfLx1hOCG3PeULr5pG3/JNY3r2qVsmLYbRM
         k/DNS+hyOln04pFnsUGq0GAcw5O9o/eyltJCs9WYHCiQzJ4iKzfUeA6+2DXPU7w2GE98
         AVgg==
X-Gm-Message-State: AOJu0YzpgjFyMqwv5NbgBHqWtcDXlota6XBVaEyhmuxc2gy9YrWYFRpA
	Mf6Judec6gDPg6mG66p74zbI/PPhFFNALRDwm98ydJTMzUsX26LGmfNsmRYbf6s=
X-Google-Smtp-Source: AGHT+IEZA7Uc3m3GvJ4zHBQ4ikuHLoXEfVI/TL2RLEffgsJD0tQloMAFmjkgUtWpXaoLs8tr21M1yg==
X-Received: by 2002:a05:6358:5328:b0:19f:436b:f6aa with SMTP id e5c5f4694b2df-19f69d2a332mr92078655d.1.1718162553240;
        Tue, 11 Jun 2024 20:22:33 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:32 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 00/24] Staging: rtl8192e: Maintenance renames and cleanup
Date: Tue, 11 Jun 2024 20:22:06 -0700
Message-Id: <20240612032230.9738-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series v2 attacks CamelCase variable renames, removes
un-used variables and adjusts alignment issues found in
rtllib_rx.c and rtllib_tx.c.

NOTE: Patch #9 doesn't completely resolve CamelCase violation as the 
correct abreviation of megahertz is MHz as called out by Dan Carpenter. 

Thank you in advance to all reviewers.
~Tree

Changes since v1:
#09: Change bforced_tx20Mhz to forced_tx_20MHz, and update commit message 
#21: Update subject prefix with 'Staging: rtl8192e:'
#22: Update subject prefix with 'Staging: rtl8192e:'
#23: Update subject prefix with 'Staging: rtl8192e:'
#24: Update subject prefix with 'Staging: rtl8192e:'

Tree Davies (24):
  Staging: rtl8192e: Rename variable bHwSec
  Staging: rtl8192e: Rename variable bIsMulticast
  Staging: rtl8192e: Rename variable HTCurrentOperaRate
  Staging: rtl8192e: Rename variable HTOpMode
  Staging: rtl8192e: Rename variable bRTSEnable
  Staging: rtl8192e: Rename variable bRTSBW
  Staging: rtl8192e: Rename variable bCTSEnable
  Staging: rtl8192e: Rename variable bRTSUseShortGI
  Staging: rtl8192e: Rename variable bforced_tx20Mhz
  Staging: rtl8192e: Rename variable bPacketBW
  Staging: rtl8192e: Rename variable bBroadcast
  Staging: rtl8192e: Rename variable CntAfterLink
  Staging: rtl8192e: Rename variable bUseShortGI
  Staging: rtl8192e: Rename function TsStartAddBaProcess()
  Staging: rtl8192e: Fix alignment to match open parenthesis
  Staging: rtl8192e: Rename function rtllib_query_BandwidthMode
  Staging: rtl8192e: Rename function rtllib_query_ShortPreambleMode
  Staging: rtl8192e: Rename function rtllib_query_HTCapShortGI
  Staging: rtl8192e: Rename variable bUseShortPreamble
  Staging: rtl8192e: Rename variable bRTSSTBC
  Staging: rtl8192e: Remove parameter bIsAmsdu from rtllib_classify()
  Staging: rtl8192e: Remove variable IsAmsdu from rtllib_xmit_inter()
  Staging: rtl8192e: Fix alignment to match open parenthesis in
    rtllib_tx.c
  Staging: rtl8192e: Fix alignment to match open parenthesis in
    rtllib_rx.c

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  16 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |   6 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |   8 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |   2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |   2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |   2 +-
 drivers/staging/rtl8192e/rtllib.h             |  28 ++--
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c  |   4 +-
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c  |  10 +-
 drivers/staging/rtl8192e/rtllib_crypt_wep.c   |   4 +-
 drivers/staging/rtl8192e/rtllib_rx.c          |  45 +++---
 drivers/staging/rtl8192e/rtllib_tx.c          | 131 +++++++++---------
 12 files changed, 126 insertions(+), 132 deletions(-)

-- 
2.30.2

