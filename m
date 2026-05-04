Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802AE3E51DC
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 17:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916659; cv=none; b=JISWn6qJsp9lC78OmBuWtw1+yevoB6UH+GhJd9wBmUyNYlCNdijVIU7M9YzPdr8o/dlyeXU1gKMAlBbOO6qxSKANwg7ZnMAcfIxAGI/5yuLNnSJK8ODMYs12GYKDBfM70syWJE0KRjqzSXWChR4yiPT0rvcq7qPtfQfpqK0LZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916659; c=relaxed/simple;
	bh=3O80B8Tg08neR6TboYq1DJB9Z8QdMxLgQcw+sTohlis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rJe1PO23lHqAsduLmnDiIY/KAC7IPSQI3Op+u1LKhzAxOUL8ClDaZw7AV1jAm4vWI1ntSmDxKFHShhciaPXUMnxRBolDLlRKmK0CfK7RH99lQPxUOAmQM2Qqzbe+Xwvdk7cqb/0/uh3uRUwYgz5gYK78Kl9X1A/6PhGhAu/5y8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kx1/5jSy; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kx1/5jSy"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c796914c062so119344a12.1
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 10:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916658; x=1778521458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krTIcQ2JQt6+k4WUKnvXQX31gKlIsDNsE0LIvDRf6ww=;
        b=Kx1/5jSyi5rQQQqYwrdFx58ebdY0YTbfktMdZMtBOP0RHJSeTLj+4AwGPddXC/GoTM
         k2z4aGqmnM9Tl24QrRc16zlZEmuziQpt4cJ1Qz/QXTSzH3hAHwj69YoiQorrq7PAAXu4
         A7LZYabGNQRQMUdZBNrO+brp/VvkaSrechReQ1XekxSbOJm7KOIU66JlrssKPMgPU2fe
         oz7eHHzxe/vJMtiznVscPHvhOHSmpVuG9kSf5bAIKRBt9bc0/2jA78WUiuNjT2mK5iiX
         4Xe4g+5ptlq6Q5RobQOQo2hkY+Dy471lmL3uH1Zhk1G1/cXXeg2RAqwavxJ9gMxHyDwr
         fRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916658; x=1778521458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krTIcQ2JQt6+k4WUKnvXQX31gKlIsDNsE0LIvDRf6ww=;
        b=O9lZvmXRWwgiZcTQSm++v8vgd+9Ai7l3iEz9bCsDWytwMjyUdAaoXJ18UG/azxwFZQ
         CXcwvtx+ncJ4QfmNVoWAW9P3UzD2CKqF5ncxDrDnKEvG51dksP7KnqgWGhAFn31cRR9M
         ku61YfHSXw+in/7EcU7TrAqhV31eMSQfVo3DtPI2AC/2mBHib8WV2orvABYf7pwKaikv
         RLL1b69Da6v4UDCm92rE5IykLKVafHN3A/QuPBS8pgmkEf5D1/SHVw0PeAOchT09Eijh
         vAJ8/I0TFa4ZILNM9rgz83Hy8uiC+Rd4XxodHxOuXuvOmK+3auTs9FjlTndoxead7VI7
         bT7w==
X-Gm-Message-State: AOJu0YwE4+4zp9slJ1QcEtjvS/iN+MzJIjuSmNmwisgWmynYXZDWyoll
	qRwC0AWzTT3bpDh5G/ttnVv0c3nsXVMbkbYqwwPs9L03CbxI2v1YtKd9
X-Gm-Gg: AeBDieudn/BUA2+XFuu77PPlAOTDZSLfjvJdnzpQV11sdhayocIxOdSKmAthu7E2rqj
	DCF+0qxg+jQCGWokfHhofwIwWY33JagmNYYGoD39V0t+Vj+UDhI1+Sx+oZKTRBSxkJQcU0AlWMf
	9G46CCOdSyD50tb4AuinTjtM+9Od/VSchx+/Ed2g8wYBgld6bRVyP9pFnTRKpg6BVMDz1j9Gn/V
	A83s+0TJcVlieXlOckqq6Yfj+x4/aCzBR2TkWHu96gUCt5G5AKZlVBYC0J1gtVNrLRkfcmnWKo0
	KdoVUZt1arN+YwSczNIOmD17D4gSp5NoGrxA6v0Fj7tO6L7kb4Jc4jCZjYvs1FzJNNJ0Lx6JU3q
	H021vWNhNnuMZ8267ZynhIYnn6dUsTHhy9XIATExtjlVZ4IEc2AwGAWKffHiciCpP7yJKdsDpme
	n0arlqEvIthLj2I6NoJ3/HZ43JRPIMFbczjHenowSuHHoVH6Q9dmGHocacvoIYyuPcjwFH3qjhj
	SOlpv7wFzslRwMQ384nwg47VZ6EpYwLI8/Fiw==
X-Received: by 2002:a05:6a21:600b:b0:39e:df5e:edc2 with SMTP id adf61e73a8af0-3a7f1a13ea9mr5741758637.2.1777916657653;
        Mon, 04 May 2026 10:44:17 -0700 (PDT)
Received: from fedora ([2401:4900:a3fd:82cb:c080:4c49:655c:41ba])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83707fab756sm5923388b3a.44.2026.05.04.10.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:44:17 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v6 0/3] staging: octeon: replace pr_* with dev_* logging
Date: Mon,  4 May 2026 23:11:43 +0530
Message-ID: <20260504174146.117026-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series replaces pr_warn(), pr_err(), and pr_info() calls
with device-aware logging functions (dev_warn(), dev_err(),
netdev_err(), and netdev_info()) throughout the Octeon ethernet driver.
To support this, struct platform_device is passed through the memory
allocation and receive call chains. Additionally, the receive group
state (oct_rx_group) and the rx refill delayed work (rx_refill_work)
are refactored from static globals into the per-device platform data
structure (octeon_ethernet_platform).
Changes in v6:
- Squash the structural refactoring into the same patch that
  introduces the platform data, so each patch is a self-contained
  logical change with no inconsistent intermediate states (Greg)
- Rename local platform device data variables from `plt` to `plat`
  to adhere to standard kernel naming conventions (Dan Carpenter)
Changes in v5:
- Pass struct platform_device instead of struct device through
  ethernet-mem and ethernet-rx call chains (Greg)
- Move static oct_rx_group[16] array into the platform device
  private structure to eliminate file-scoped global state (Greg)
- Update kdoc parameter names to match renamed parameters
Changes in v4:
- Broke the series into much smaller, focused patches to ease review
- Removed the global cvm_oct_rx_refill_work by introducing a per-device
  struct octeon_ethernet_platform, allocated during probe
- Retrieved the device pointer via platform_get_drvdata() and passed it
  down the call chain (NAPI poll -> rx refill -> mem free/fill) as the
  first argument to avoid global state
- Note: Dropped the ethernet-spi.c IRQ handler conversions from this
  series for now, as those errors are SPI4 bus-level
Changes in v3:
- Use netdev_err() instead of dev_err() in ethernet-spi.c
- Pass the netdev pointer directly to request_irq/free_irq
  instead of dev->dev.parent
- Move the device pointer to be the first argument in helper
  functions
- Fix checkpatch alignment and line-length warnings
- Add missing @dev kernel-doc parameter descriptions
- Wrap commit message body to 75 characters
- Fix author name formatting
Changes in v2:
- Instead of adding pr_fmt() macros, replace pr_*() calls with
  proper dev_*() and netdev_*() calls
- Thread device pointer through call chains via function parameters
- Introduce struct octeon_ethernet_platform to pass device pointer
  through work queue callbacks via container_of
- Store device pointer in oct_rx_group for NAPI poll functions
- Use dev_id in interrupt handler to pass and retrieve device pointer

Ayush Mukkanwar (3):
  staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free
    functions
  staging: octeon: ethernet: replace pr_err and pr_info with dev_err and
    netdev_err
  staging: octeon: replace pr_warn with dev_warn in fill path and
    refactor rx group to per-device state

 drivers/staging/octeon/ethernet-mem.c    | 43 +++++++++-------
 drivers/staging/octeon/ethernet-mem.h    |  8 ++-
 drivers/staging/octeon/ethernet-rx.c     | 49 +++++++++---------
 drivers/staging/octeon/ethernet-rx.h     | 11 ++--
 drivers/staging/octeon/ethernet.c        | 64 ++++++++++++++----------
 drivers/staging/octeon/octeon-ethernet.h | 14 ++++++
 6 files changed, 114 insertions(+), 75 deletions(-)

-- 
2.53.0

