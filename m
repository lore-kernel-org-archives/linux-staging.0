Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6472727EB
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303079; cv=none; b=o/JnNclDmS1tqSWJ8yRxqz3DqcHH3cADSJnAobWwIfUZoGCp67+wbvzUWJzfK9gDy2i3HeA8BNpNAN71iEkVGKPKFXYRdUamf1DwlgJr38REcXxXNySmdXV85DoX4HYh+IGM9Ggsg1LkZyeADv5KtRD3o5e6FIz2SVz1f3AYPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303079; c=relaxed/simple;
	bh=s5bvPcPyNNrUb+9raWHqJ224ALUsb339+uFEi0OQn1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uuS0f5+uWlZtuZFZucXbG/kYJooQYho2wNdC9zIWcXu36LHZQbQUMgmHAJC4AYGAMqBmgA5Fr/1MXAZEkaX2Ltfp03GYmfl46+0C42fBuvPVDsvQ73+xyW+vYRieiiZ4mL9ttbHz17RtIP8sxo1w4nqZtR0jV+DBFNk+x0us6O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sL4ubnXD; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sL4ubnXD"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c70c38515d3so195549a12.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777303078; x=1777907878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9WOMjsU2c/RPBFFrc3kLBuPV/u3CAkTOWTslSs+Jm4g=;
        b=sL4ubnXDZOPsBk+rZhu85hSRg4JSw7m0UI+zs+H6kvOqHWLxSzRkprV8KgoD7coLER
         ffoT+WXqah9NaoRRveKQVF2UyBe9N0F9HkJf+0Akj1RlNPcbAyrdbSp3K/4Peis0R1OF
         JYQqbCbIaFVi2hH4CTxEk9odrfdi8gvkKO59Uskk+gyQgV0rTJJSAvLljcUjejp+oPd0
         Mg0W28sqhjb0gJxtSI8fZLmnHIA5ixSrWkM1W2PDedWTE14ag6dWTNnYaaP0eV8a+Sxn
         QEM3PGIL1bfFC6Y3PYYXGI2JkaD8DpE43aWfVzHzao9/64J6JIDK1IYKYiLHSK0ap4s0
         8svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303078; x=1777907878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WOMjsU2c/RPBFFrc3kLBuPV/u3CAkTOWTslSs+Jm4g=;
        b=TFbMYBa+AxSKK4p2EXOHxetm26j+j/rVlthi/3rLmQhw+aIwYWTS5fp8R4OP2ybke2
         KaaI6JJE3bDisxqKW+gvDpKqvwt3ZJseQ7XPWx/xgYKQT0m0ZVvAvEwMrJ9W81DdoHwF
         Q8oI8clvuQiry09XIc++7p7WDnu1z1z5gxYgyr1EdwJ1kcayeHt/2rAvHpWtEsibTcvP
         k7a5Y/zSDm1qhOymCdmoK5RoUabUYyM0MHrO/f2K8s3SHLHZX2/sS6Y3MG42iADg6NWg
         vlv56+tXCL+DuLT5lBraJmBl8Kauvf/nwMxHKm7D8CMktk+jMAJFiSz5lpI9MjRzTCY/
         L+CQ==
X-Forwarded-Encrypted: i=1; AFNElJ9k5RmMSLUO7Fnm5hWg8jR0+jWpCSVRRhcoPi8jSbHOUGtw3ecJGlLZloyOstNaEoTUJ4LBtG0J/2jsn3ua@lists.linux.dev
X-Gm-Message-State: AOJu0YxM9vFgKiSfQcYbEEvjTPjeeNI6YF3OcdNP21t+uO4Rxy7FxjX3
	zB7AVTH9R3V81rdAoXbXWCc3ep4FYohmxqT/5xTn3YEMKLeukOM+QPIHSxWLUg==
X-Gm-Gg: AeBDiettFjC9jCaHRJbcXoDZC7IkAZWSaUxnfJmHK4KQ1dJluVY+NADWTSydBar4vtX
	dPhlNLtIT7mpcfyr7ax3kZgz6uzL2n+Ym2HS4V6yOyS2ylHHDh/2zWkzlfms1P27UN+JbhbdWLi
	t+0mIsrT9voLAtMAAPqVja/JisMgQgcQTTun7YeTQkUjo88Dh0iIMQAY8s9AxOW4gQQEm/vVzKo
	+Eme+0hXyTQkj69fOQdJIw7Q+jhAei1TIC4zFTS+JLOiFHyDuO1P01I5S30INhXfXQ3bu0ZLUTk
	a4CycW6B0h4lbPFvcwp9QaZ0upWUryVQdBdD1xaG/SiExoXtRNPAbYboF5wgR82Sm7xzLSPPAZh
	Jl1bLOh32zFh96sZi6u5k5AcyTTl+FzN9qkAoN0Ut7m5KEGO8j1fJie2h5GgDPjfe60Vrc0rt54
	dZ+7v1SQs/tWiCdUBnIjEkrt5cDd4UTnPh7J+az6pkuGVGk7E7BtgTLOqNthqSukrWmZRRfFUNM
	dHCmEJonyfJ+7VVlNAmfcXlri8=
X-Received: by 2002:a05:6a21:4014:b0:3a3:18d4:2590 with SMTP id adf61e73a8af0-3a318d46f24mr12219497637.3.1777303077770;
        Mon, 27 Apr 2026 08:17:57 -0700 (PDT)
Received: from fedora ([2401:4900:d824:7468:545f:3159:76d5:30ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm37652931b3a.58.2026.04.27.08.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:17:57 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ayushmukkanwar@gmail.com
Subject: [PATCH v5 0/4] staging: octeon: modernize logging and refactor to per-device state
Date: Mon, 27 Apr 2026 20:45:51 +0530
Message-ID: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series modernizes the logging infrastructure in the Octeon ethernet
staging driver by replacing pr_warn(), pr_err(), and pr_info() calls with
their device-aware counterparts (dev_warn(), dev_err(), netdev_err(), and
netdev_info()), and refactors driver state to be per-device.

Patches 1-3 convert logging calls to include device context in messages.
Patch 4 moves the static rx group array into the platform device private
structure and passes struct platform_device through the call chains
instead of struct device.

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

Ayush Mukkanwar (4):
  staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free
    functions
  staging: octeon: replace pr_warn with dev_warn in fill path
  staging: octeon: ethernet: replace pr_err and pr_info with dev_err and
    netdev_err
  staging: octeon: refactor to per-device state and pass platform_device

 drivers/staging/octeon/ethernet-mem.c    | 44 +++++++++-------
 drivers/staging/octeon/ethernet-mem.h    |  8 ++-
 drivers/staging/octeon/ethernet-rx.c     | 49 +++++++++---------
 drivers/staging/octeon/ethernet-rx.h     | 11 ++--
 drivers/staging/octeon/ethernet.c        | 64 ++++++++++++++----------
 drivers/staging/octeon/octeon-ethernet.h | 18 ++++++-
 6 files changed, 116 insertions(+), 78 deletions(-)

--
2.53.0

