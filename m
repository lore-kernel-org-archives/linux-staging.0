Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE4339871
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576250; cv=none; b=Mq7bJyqhS8CFZYXubaZCPgj+DAyf8slOpvcVLW2d9vAgxJ6VcfeO8+pdWvJd1Lgml5wNRPvsw0kVdrnFkE1WlwmaFYmV1Pd1AM06D/OjyM8muR5W2bDIFCKosjTVaj5vh+d/+b9UFMzSVmJml/BPXa3si8yE2qA/jyiho4RiWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576250; c=relaxed/simple;
	bh=KAmQbneNjAoT0Tyj2KEWbYtDUec0ZL1SBM9esH9JZy0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pBx2/KmldbBMMN91N8x3MGGrf1DbRkIQ5NljXg5yOkPf6btkv/PZSzTiz8lYO3YbZ3fAGL4wHgNA9ixQLgMmwNx/A6jt8lsd1i4v1awIEcnPfBtBNeEYCWKvNjxJYEBBD6eq4rZLwKVgYdLEv2Fx//xoDYAH2TNax+L1TkN3rYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfzeohVA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfzeohVA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so1170420b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 07:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768576247; x=1769181047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oh+MjJmafXC7fjCHMo5BCoaEMiKvWqXR7Bbz5SP9Syc=;
        b=gfzeohVAdT9AxJG5gXXJit9iQQiqdpCQHnlCl59awl44d5Bd/99NccU22qQ48xPJSJ
         8Xg5CnFYm0lHiBcN03/UX+uSjxjf5qm8EkqoebBeykRQuYNKmnAvfLL8tyf7yoL3yW2d
         JQLWtlOXpGp+newflDOmHq3hzC/l5HvK076or+7pVIU5SZXOgFQ57UIOOFJh0d5M93cH
         QszByFzxLAtji2jN+TwQhxSu2AGlAbxjLCG5C/Set1fONVKZrUlLrgtLb1P0BDVnFEnN
         Kt46xtbbBAjMTF5heiSzFP3Evrly4IiMARKGLENbyBrSaDgkhImSOO7Pt9ghJrqkJ9tC
         yWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576247; x=1769181047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh+MjJmafXC7fjCHMo5BCoaEMiKvWqXR7Bbz5SP9Syc=;
        b=K21eKpxIhhCTjVn+zKDESqah1yxGaWRlv+wa6IYcBoEAZVhYaYexliPkrs0NqxWri0
         zdHKAJbEmNx7y3hM9yYXF48d7JiCMITZs9UcQ6HG16gVNk2HobQTMMcOFtFULH+UwwdL
         pBhAaqj9LVOeUn/HSY6l7mypOsEKVKpGXcEYbiOMt1hlbLVOF7CTwtFMQcdNncDCuN2s
         t1BPgHLwRLkDXRYm0BzvKyKPXe9PNo3q2uW49uQCH0EvLqXG+RnGH93wiijy2oXhadvh
         4Dq3fX+VAjk10jb2drfluYHvLXQVdZeYYZITjaZ8QIO8grM8jsp6h0dtO5kUIrFIG1fO
         h3hw==
X-Gm-Message-State: AOJu0YyEDjukmWJR2KGFPTS2NKlghUceiyFf5HboGBLAhVMZYD5iVrqS
	9I0/WO5PG6Xgmil/L3WoZM+KM8MmDz93yPTyAIGoNqSHPolGPF7MD0x+3E9mvLLB
X-Gm-Gg: AY/fxX5QDfPSldAa26Gdy+EtZiaS7pwbgk1JmXsKZyJlb5PHSRUw/qNqaqTFezcR5UF
	mVHNbaPnj5/jiRYmdhijbHV/Y9zU8P1vED4tS7Tw6t+fqwqT2/YyANDpPq2TRWRUZxM2IfbzF6Z
	7OprpIcf3ASIzbSbaB/77ZGWCSqYZf3cYWA7+Wmm7qzhUZL4Ag2uWihNRWFARrubRIHAr60eog6
	QLQVUwEMunScAXpfjZJH0DX1udtc+hbP6yFZwYV/u6CLPnK5ePdy3v0ivbI2p6lPcHrK7tDYh+K
	Pr2faEuN6E8zAtgI2lQFRypLfsQSn8iKnh0Ce+ghsCvei34XJkS66hxa4EIXrHJojhh+TP+hMdQ
	xYP8hPPEqBwqgWy8vjTxeF2D1CZUmAKZEEA+QkwJNLXG0aCNpYC543jo2br9hoAFgT0kdCVXo2S
	M324l16ZIizGy17wNTUMZ8GY+uEuuvXA==
X-Received: by 2002:a05:6a00:9088:b0:7fb:e662:5c8 with SMTP id d2e1a72fcca58-81f9f6d348emr2813994b3a.30.1768576247292;
        Fri, 16 Jan 2026 07:10:47 -0800 (PST)
Received: from debian.ari ([152.58.178.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10e6ec7sm2353920b3a.28.2026.01.16.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:10:46 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: fix remaining coding style issues
Date: Fri, 16 Jan 2026 20:40:36 +0530
Message-Id: <20260116151038.23519-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the remaining coding style issues in rtw_cmd.c.
Patch 2/3 from the previous series (blank lines) was already applied.

Changes in v2:
- Fixed double spaces around '+' operator as requested by Greg KH.
- Rebased on top of staging-testing.

Archit Anant (2):
  Add missing spaces around mathematical and logical operators (+, -, /,
    |, ?, :) and remove multiple spaces around operators to comply with
    the Linux kernel coding style.
  Align arguments and conditions with the open parenthesis of the
    preceding line to comply with the Linux kernel coding style.

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 46 ++++++++++++------------
 1 file changed, 23 insertions(+), 23 deletions(-)

-- 
2.39.5

