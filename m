Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E73D6CDE
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512344; cv=none; b=fpRvVQcc/bPISwcbiFTbDw+lyWxizpjGuX0LShfGH2vua8NL6afv1IXowwLB75fVngkloRU8M4fYRZbEADo4aU7hP2/NRSI5/NqPvL5ON41L6MEcUMQdGjlVy6xPhWVBWG06Pu59cMGc5Qg1hdC3eH3T8n5K7sRuLBY1TQczAZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512344; c=relaxed/simple;
	bh=Uno2yHfO6vRZMPcSUaJToJ+vN4MPbjDNh2Ttx/1D3DY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TloY/uDhHphuOa6G4F/4ggCDlmJ8rRHGykxIuEuVEstK0hFpPHm/PqycZO2/GNhbUD4dbBGLpzj7zWhgaf9KrZxJrtTquH945+xgrELTjmMChzo/m+3Y8Tu2zUiBXNYUYGkVppLMzY+JwZYRcZWiOXLiN0r3sqKmSckPIo2q8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEM2rvBs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEM2rvBs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-365de41f8a1so621364a91.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778512343; x=1779117143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=haE4bS8JwUCpjpgBiMBFEursLJkSm5h8JymKWoD/p0Y=;
        b=HEM2rvBsY82bl/kvsCJQnCq3j4EIUfvOZvAN39YSKJeEm3RGWD0cVxGRAQSQ1FON4P
         0dU3MwKgbty7x+qBj124OE8wRGkkBa2WDbXesc+y9HqAmNprFlbLsH1cQZB1Jr3Yfg8h
         /0dgmhLT+xgf4qo7TmRM7NlZr/kPoOEF8V7J2o9FOrHysRecGSU3Tp+4OBBhx3+hm7E9
         CkkTSx//hIQqO7NMxRCYUl0AsFk/0U/Mjs2saMWblxhdkogaR3KLLcmIPvsYHGZNudYq
         clA+2bdNXn89oPGY4HtxPd7mFbcKAxZhLBPD5KQ4AgTf4tv4+nWnm4F0R7xfFp3TCGJM
         ZLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512343; x=1779117143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haE4bS8JwUCpjpgBiMBFEursLJkSm5h8JymKWoD/p0Y=;
        b=dA1+NfALkFxMEcFL8+TU++HLNmWCdoGv+uBiDac/pu8EAO//QFt8CrTYGNJqZ5vbMn
         j6hXc7H7yMkffknZu5K92LHkNt/QGdVuFcuLBbZfm1RkFc4Qr4PLJOlRXPup8h1b9HwV
         +SC9gkuXtO1aWX6JqPVWTkY9+UaRh9Q+A5GDqQ8NUeo9qBhMyPT90/RNegZk3+/ZrI29
         8QwJurUCcOu6noYQk7kr205Q5Pqk6+hkzrCMByIeNkGjSdYO9kfl3poXy2OpSf+egheK
         O6TXPDlqy9GFC8O0nB3nsZFqxxzUo1MHBfUSDxFkNjgLS/RdXIcSwrXWT4S3T3kYRbR6
         kLAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oqZKOoasMMgpqBbem8UM4bSs0M0SCaF8JjoF1yyhIiacXO/j+Jyy9Mgg6c93n3s2Eu0l4j+Ek1W1OTV/D@lists.linux.dev
X-Gm-Message-State: AOJu0YzOJrwSAhxVysRCPw/4KPtHNDXIiaRM+kH1waSVbCfEUeQYGfjl
	uQ/6UXwy+j/plC3Edg1B2vZ2pW7Kln9dIUxwqT3ULpADGSItntqS/9Ub
X-Gm-Gg: Acq92OFtyA55cSMRcl9wvp+5Mo+tm8SXquWQgWAmoY8a5LKrSRUR3QVTZRUFHky9St6
	tv5rGKpPbKsyl7EUlk0VUMOXm8Lp3Ugr6RelPQqOQMS2lSHSYL/0blSB6hywwTeYdB6yy0TRD1R
	0Qdpd5zSSCau4JiZVejmznhuUwMUR3JwfUb6ezfOuusdul7vZkR15rGipmqvSfkv7YToD+yqibJ
	PpI7wEtDhxijT3Zjv4zAYx59eetcPmSpUFeH2PFFuacR83yHgZc+nnonprm/k654sKxFO45Iq+a
	gfN0LlXE/UwqjlD7q/k1VDAIXeI3eOKDkqIA2/ixmAJJAe6s5QJHG3VD6z/GKTUVqmXtHwAfvTy
	HXYhFhdHS09hvnllQ423oBre/TxgeYaMAziqLYl0qxsdircUfsBNb91D3IMJn8WurWM5Yp1Sd+A
	ruNECjXaZwvJIcrYc8Lhb+ZQgS0CztpPwiXvcCWKpbgQqzZR65KrboHwXE5j6e2icThAyAK67Az
	+qtjVSBEQnZZ4FQ1Q==
X-Received: by 2002:a17:90b:2b8b:b0:364:be8f:1d86 with SMTP id 98e67ed59e1d1-365adadc1famr14169536a91.8.1778512342648;
        Mon, 11 May 2026 08:12:22 -0700 (PDT)
Received: from fedora ([2401:4900:bffc:e9a7:49ca:5a41:a2bb:6936])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fa7asm9932363a91.10.2026.05.11.08.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:12:22 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v7 0/3] staging: octeon: replace pr_* with dev_* logging
Date: Mon, 11 May 2026 20:39:28 +0530
Message-ID: <20260511150931.93382-1-ayushmukkanwar@gmail.com>
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
Changes in v7:
- Fix @pdev doc comment alignment from 6 to 5 spaces to match
  existing parameter descriptions in ethernet-mem.c
- Remove extra blank line added in cvm_oct_remove() between
  atomic_inc_return() and cancel_delayed_work_sync()
- Shorten patch 3 subject line to meet length guidelines
- Rebase onto latest gregkh/staging-testing
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
  staging: octeon: replace pr_warn with dev_warn in fill and rx paths

 drivers/staging/octeon/ethernet-mem.c    | 43 +++++++++-------
 drivers/staging/octeon/ethernet-mem.h    |  8 ++-
 drivers/staging/octeon/ethernet-rx.c     | 49 +++++++++---------
 drivers/staging/octeon/ethernet-rx.h     | 11 +++--
 drivers/staging/octeon/ethernet.c        | 63 ++++++++++++++----------
 drivers/staging/octeon/octeon-ethernet.h | 14 ++++++
 6 files changed, 113 insertions(+), 75 deletions(-)

--
2.53.0

