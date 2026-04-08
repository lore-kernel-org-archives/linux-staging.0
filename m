Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E61737D123
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775646844; cv=none; b=jWNgecr8nUmaa17HX6iO1dZvCywDcsa3oz6NEm6VM1xy054q31Orpatuo5o12bh4KiKyBBVZhQu+eRPboAFKRnZfTx9dC+CNF2/iyqpzYxAXyUAjw5prK+nSwOtGZkdwu/4bM4iMEwfYlWnvVBM3/yPz/ryJyawqv9LarP8k8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775646844; c=relaxed/simple;
	bh=VGrV1SiYqVwgZrLKF7//JJykL1zd5FsidxgDbSXaYt0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fBL6jc89CTTiPIJDhWjsdr2VQEAgunkrsu9IX8we7eJi1kGDUERKpyRNHdqR5UnGZ74WFw7j89HXZAOQU3DE3xCG/uNj9tXp/5LbStXvxrPYhnGlteW/KOsK8UUafcl3Ed/Gl/EKst7bW/zQBjQRDlE3EriAynZ/S2o0L4NFrzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsLkymVM; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsLkymVM"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso620860eec.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 04:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775646842; x=1776251642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4OSQ4tDvoQtzoYMD/bz0QAuKfhGHjN7yfi7bPFxs21M=;
        b=nsLkymVMbuwJrC2Y3np1QRCLdg7pNnEvpymplLmKtS0+p8fBr8prlU5jsFiQz2BPr/
         C4OVqBueERf01oa9sSv84ZOo1TCEtEX2qupBCsA55oRiYZ5/2eAbeZ1/7mcVZDQmY1OG
         YsNsmahE2znT75BLgdJQvbKeCKPpJzmxiPdQX0S8xkjiJoa8lQF0csj7XwAzH+i3C7tt
         /7uf/Fi1iSkIa356pGyaiXGsOhMRMgJJOyVv9hQ3eDe0SI0RSyTaI7BXWVOiqXRQmWUM
         kI7fFEd3GfI7KyUHv6Ipj8aV4ODGeOAiUoGWQjPjiWuKXwueTaxq5kGuSpFr/6L4o6m4
         g0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775646842; x=1776251642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OSQ4tDvoQtzoYMD/bz0QAuKfhGHjN7yfi7bPFxs21M=;
        b=eblu8UFVoSJp3W/V4+C6O962mBOu0isu4PndqDeF8QKZQjr5gEH8tbgGE7kyTkRyHi
         v4GMJPXcavbfBNuwNaeqY5SLwJ5FXqlRItyIchIGZU6KpkeWN0ahZgwLlsL3UMc6QQg+
         KWVWRrQcxnk9/uAKKIA8JDaCFg+kNNArdPcp4Qm4GI3GwrUWCOEBgX5beLKuMg9iuj7i
         bz93aNykUycadh9ib4nA0xEFOCYGdakx62ssSn193CKgNd/1cTNrA7wSWobRpnwFtNW6
         9nmsSmP2fS7D3lEeZaLaXgPUdHl1PuXwMPE5xbrd6Ekqjt3ia4fXExTyHqBT2MBPKc6Q
         6gRA==
X-Forwarded-Encrypted: i=1; AJvYcCWzFg+lRkLex7g4jKy36M6qjGXK7xh+e5eVrbV13/TVsbwOkpLGXQ1JfvOE9HBpmyjALPuImTB1uMZDCUdJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyZJxb6PDRAF1MWpTaxXJI8m7ApIEoOWbtM/JZTusgVTmiL13tg
	H5LXdvYb8PLjryrNv3iZLkCqMMSlveoD6nu+sPnaNX7Vt/1yCphXqF+1
X-Gm-Gg: AeBDiesy7388qBwgvTV8R+2itOJGA5IIjHqrNzxRJUwjWbXYckcd2IXssDLqGn6iHM8
	F+GF0Qagl8lLcpds1+ZLxetAAmHg4S+8t6ypXgNC5Qxdt3n+f73PVH0AbVo6l8Wz4Hnn4/2BNab
	sUkuwx87GFOoM0MVBrwemdluFqlbSjHepatOINBYwDXsUwbKH7lgObLQVg9RbXp6eK5W4+lz5TS
	Qg7PK0pzBG8bTNwq5EBTyQmv4SSqp8eTJe3j3E3dEZso1lunZUeAg8dK1nL8cP9VtSQWpfy7AN8
	NS8BQtrcc/UzZgmztytYUAkTBiBAsDfxA5juPFUbgHHrQ7Tscvc7SQ4XM66RgQMX/IRtQtKemm3
	orwemOO25gH8CCwxvMC1L6MpnozMPfV5P/E67oCHbw4pODfShqwziHvkd0lxhVxomN6TwDHmVlu
	KCO8l0q6zY/izfRagcKImb1oVx3wbHbA6zjdBa4P8K7XzKPi9Y6RJ7rO4=
X-Received: by 2002:a05:7301:3f09:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2cad7e3729fmr9106145eec.11.1775646842117;
        Wed, 08 Apr 2026 04:14:02 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm21228019eec.17.2026.04.08.04.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:14:00 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 0/6] staging: rtl8723bs: convert xmit init path to errno
Date: Wed,  8 Apr 2026 11:13:08 +0000
Message-Id: <20260408111314.19329-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the xmit initialization path to use standard kernel
return conventions: 0 on success and negative errno on failure.

This replaces the use of _SUCCESS/_FAIL with proper error
codes and improves error propagation.

The changes are split into smaller patches following review
feedback from Dan Carpenter, converting one function at a time
to make the series easier to review.

v5:
- Fix trailing whitespace in os_intfs.c

v4:
- Split into a series of smaller patches as suggested by Dan Carpenter
- Convert functions step by step to improve reviewability
- Ensure each patch builds independently

v3:
- Rebase onto latest staging-next to resolve conflicts.

v2:
- Rework xmit init path to remove _SUCCESS/_FAIL usage
- Convert allocation helpers to return standard error codes
- Update caller to use direct failure checks
- Address review feedback from Ethan Tidmore

Hungyu Lin (6):
  staging: rtl8723bs: simplify _rtw_init_xmit_priv control flow
  staging: rtl8723bs: make rtw_alloc_hwxmits static
  staging: rtl8723bs: convert rtw_alloc_hwxmits to return errno
  staging: rtl8723bs: move rtw_os_xmit_resource_alloc to rtw_xmit.c
  staging: rtl8723bs: convert rtw_os_xmit_resource_alloc to return errno
  staging: rtl8723bs: convert _rtw_init_xmit_priv to return errno

 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 138 +++++++++---------
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |   1 -
 .../staging/rtl8723bs/include/xmit_osdep.h    |   1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   5 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  13 --
 5 files changed, 74 insertions(+), 84 deletions(-)

-- 
2.34.1

