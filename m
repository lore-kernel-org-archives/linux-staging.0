Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1642C3BB36
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114959; cv=none; b=OcrAMaoJaYaRkLapZ99jw5x3nBAu43PNImgqMQhAvD9g9dQ0j3Af7v/i2owjI6bbzLqAUrbsqxmLMPURsxpXt8zrFtGeDtm1zEh33NVGkJSuWO9fYDaHBXaj1dwqDNTPICndbwVjX8mHnn1JnA3o3Rbwgy8CiN0fX9c/xI6KTeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114959; c=relaxed/simple;
	bh=Lx8R7Ns/zJeNrBeSkWcZhjE2NiQwGZT+uegyvL7H6c4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sEkf1gtawFzck5vQRteodJBlBHXj0YiV4JrEnRFS33Rm27/t0J0XAhTkJv200SJmoyqHROMaVPukxGbTg2G1BBoUkE4xil9KT/vCP9JZiD6mcFlwFUIHw9Aj6jKUbw/Nl7xmzntq553fIhD6ZpIy2ZDoi4qLPRlAcY70OKRb6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=SZsAcoQi; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="SZsAcoQi"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29bf9bd1907so260588a91.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114956; x=1710719756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6H0JVyCwyLSV4/m6odG6yGR8O8dG3rICgQm+UVRa8uo=;
        b=SZsAcoQijjiqyy8Pa/raVI4RI55PQSd1Cd6xgz5yXE8i8xBDjVD5s6lma361RNHkeM
         ZhAwaPk2t4opNBvX60w+Cv3RVK0Ks+PEm6ChaISYq8PX9IkRzmxpMziLvOHjbP9aRUov
         bQ1ptbE6J4srjT4EGyVLCj+iN/KOdAgN9PBK2/SMFarDnXaOLj/v+jCAHOIiTIT91JjG
         iSZIQ2p9YZqiKVwv17XAmi8AUvtMyZDi/jSseyVmAFKUzefbiPxhCPQpZ0/aMZwEpw+A
         wLqLU0dUAWke5WkzPBSdxeEuu+5zyWMwT9hdRXQugJtrPWnkN8/Ljrj4Cf92eL331xbI
         ZN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114956; x=1710719756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6H0JVyCwyLSV4/m6odG6yGR8O8dG3rICgQm+UVRa8uo=;
        b=InJQcameb7ARmbTCjzbuuDrgCwh3z/nALtX0y5vklokF8S0Q3RqC9tOr21dlaEN9rN
         3SFxhcxhKlUHPT5Sd63jmif6CxHVmOSkKMraFFwCkqG2tYIRReX5oJDYHpW8JeL+1ai+
         KxT/xVJjrCG9RNqgKf+tr9/MvDMIObtI6ettwRsCuW9Tfzgjqh7GVBreCsTSNXMiWabm
         pyWR+/7A5WHEz4g7+6cW3vgHjxNbbQjwKddkv0ltBeDUkB9/6BhsWKIUZK9ryHjI9PG4
         KzK7YmLWmr3SHOV4hs5yvtJ/7VNuhdpf2iHrBfoh0CT2gIUw8wDC3UWP8XXUGESAJdIC
         nqMw==
X-Gm-Message-State: AOJu0YzfZM++nUI9BNSzWHlH7dBxrhruOVMZRHC7GxYj//FKKEcUZpzU
	OHe7VFwBZ1x4k6+bz5Etk1dRKibBAMTBtVIMmH/ekt6ex+tt4Pfeea5Qv5PH9Zk=
X-Google-Smtp-Source: AGHT+IG9e52qcnmm+dmxxYGEwKPes1qWkmDYqztLxPAQvILCEoFwj9dibTYJzUwaBRY+y2zFxWsezg==
X-Received: by 2002:a17:90a:df92:b0:29b:b1cd:4ea5 with SMTP id p18-20020a17090adf9200b0029bb1cd4ea5mr3700742pjv.11.1710114956209;
        Sun, 10 Mar 2024 16:55:56 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:55:55 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/11] Staging: rtl8192e: Style guide Renames and Macros
Date: Sun, 10 Mar 2024 16:55:41 -0700
Message-Id: <20240310235552.4217-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

10/11 patches in this series rename variables to fix camelCase style
guide violations. The 11th patch implements the use of the BIT macro
instead of regular bit shift operations.

MOTE: Because patch #11 changes DEFINEs the compiler issues 
redefinition warnings. I don't know how to address these as part
of this submission. 

All changes Tested on Hardware

Thank you in advance to reviewers.
Tree

Tree Davies (11):
  Staging: rtl8192e: Rename variable ReturnPoint
  Staging: rtl8192e: Rename variable TimeStampLow
  Staging: rtl8192e: Rename variable TimeStampHigh
  Staging: rtl8192e: Rename variable Frame_Order
  Staging: rtl8192e: Rename variable aSifsTime
  Staging: rtl8192e: Rename variable posHTCap
  Staging: rtl8192e: Rename variable bRTSUseShortPreamble
  Staging: rtl8192e: Rename variable pBssHT
  Staging: rtl8192e: Rename variable bAllowAllDA
  Staging: rtl8192e: Rename variable WriteIntoReg
  Staging: rtl8192e: Implement BIT macro for bit shift ops

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 16 ++--
 .../staging/rtl8192e/rtl8192e/r8192E_dev.h    |  4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     | 24 +++---
 drivers/staging/rtl8192e/rtllib.h             | 80 +++++++++----------
 5 files changed, 63 insertions(+), 63 deletions(-)

-- 
2.30.2

