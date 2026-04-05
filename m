Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0983F27B340
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775398428; cv=none; b=HkkxI+LIm/aoeaWcxK7zTIv5lfCsxZXYr1/diDdWXz9+ezzX5N0uuv43JzGAEsfXuLEu4L6SnbqbyYOT1e2DlxG0WcKvOAHTVFKyymTRe1NKWqID6jj47s062SRRmM6WxP4G7n9leQuYeHsZeUy/ZfCUtJXGb0Lk8ke9qCGS1aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775398428; c=relaxed/simple;
	bh=LCByrm3qBFwmC/Ujrr6yPv2z2tZElUiXIM2rRfiWbNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZh6YKTTjWzehs46LjxUlTMFw3c0HWI1n5OTtb+yttSRYrLtyWOhn9IXd8+68738C6TIlyAh4Gt3C5RWGpbHQnCDHClHLNXTFFkrIsh26KvyFkNzRU3ai5/9AZHAuimchE8X5Vu3nE1w6OhlSlw0F5y5u6RQbqFrxwAooOx3QFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouvK0BY3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouvK0BY3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b0baebcb55so9809465ad.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775398426; x=1776003226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1KZdVAVFannIGaVBXV4NXwlYvxIIEVHQeK/pF6ZlLsk=;
        b=ouvK0BY3ESHvOcnrD0pWr6g7MgUxt7AxflN9s3mD8d7C8WJstOcBFYeaRovGpf7KlY
         R3fDfbU2xlVu9FzN4WMts7Z+gOCv83/3PX9tDEP/kXgXVcZpG94huJXREJkx03Ixq7EH
         vkEmNuZylLKYAuGymwHyHSryMOF2j4+9TUXXi/SFgCCPXTOaq2ayvQU8A4B7LWbIMeCX
         rTAsY7pdjVLULWGClTpKXh255cPq1vofNSoPWyUOQ2prUNWPi+YtdkOYTqWyOajpdct1
         +7dIlXAx3K+j1Q8dvfeHpoI+wkxPPmQfryOiGVwMyhtF8qulf00971lWSyJDrU0h2mhW
         dHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775398426; x=1776003226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KZdVAVFannIGaVBXV4NXwlYvxIIEVHQeK/pF6ZlLsk=;
        b=OXpQtxJyeRmgZL7Dccw7Htz+TWXTA2/xnAW2hJULGcWBj0iPZs/1Q6LdY3J9Ch3h7C
         W6Bi0i+Q9geeuEOcXYHVxmJfacq41PVfC28i5dkIjnsQhQnTMBsP35I0qV9vRww/ii84
         YwiZkjsz5RiewPN9+8S944X9VDukmkr45gFxoIueEipsEMClMwI//mSZyp5cTM61k8EA
         LSJ0aellxdbYlPS3C3OkjVqH1qsJRVZHQtrsWEpsv6GCnzeJzsTLwDUAmwWdOdCjFg0j
         CCEHFW5UN78XZ/LHgtYsL5+qAchojeVZzgQR4VRIoxoUHVYUO0bbDbpEFjbLM6VNqudq
         hGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQWdoIKnOHZRmy1Oom2+vnEtbT6ZeSEQXmP9AmjgsDTO5bysorIT3PhB1Pg+Ysr3QHgZYY4sF7G0SVHO0N@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9tXQHnBTdIEKTYp3g8NcyCMGzUQvMwOlp28MFNek/Bf3hu7UH
	WnZSIDtpYprneubSZ7l2I+ItWpTkxs60YdcFOlMRMzjjSvQLOPv9b8ry
X-Gm-Gg: AeBDiesAi8J5nbu2e2Vf6UD7xR/XDSks7+ePi7KXpyOtx7GZU6L8O0mnftaBN78bg4K
	dcJzXbvfLC95AEoIavEG1X0G1bqG93508kfGeDGCEHwqxu6Yrw81M+4BuZci5KGwk/I8ELgSVZm
	ECsNQk/Xxqi+L++91dtFC9fnlrnyZdtXtirAQZzRsv/Hvrh0VNHclQjgw6OD4gciS7VkQD+7LkT
	2CIupoGz4q9vTXhMusQoZ6wCHrVgFs90Dky62/2Ustw0DhQcuHOBVcK2FGfcQ8p/H8TCE1m/UAU
	tcmr/oqWmIVUPFVaNqqLypyG2voXCT++BB/xI6XTJnWDd4zFRG8Zc8gso0MlHHJ/uNnyFlgATYw
	nJSFlkjQPQiABl8bXuSZKGJUFXo4Gtu8tmSZI59OxwlI4Tcf1TesX3Kle4ERoNVsfc9Kd7g/6cy
	QnOVXiUVQ7rkIGLAQHryVI3g+LuXQh
X-Received: by 2002:a05:6a20:2d08:b0:39c:9ef8:8979 with SMTP id adf61e73a8af0-39f2f0ff78bmr4928895637.7.1775398426295;
        Sun, 05 Apr 2026 07:13:46 -0700 (PDT)
Received: from fedora ([2401:4900:82af:33ce:56b8:b90b:816d:c3d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm11244051b3a.0.2026.04.05.07.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:13:45 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v4 0/3] staging: octeon: ethernet: logging and struct cleanups
Date: Sun,  5 Apr 2026 19:41:07 +0530
Message-ID: <20260405141111.87925-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces pr_*() logging calls with dev_warn() and
netdev_err()/dev_err() in the octeon ethernet staging driver to include
device context in log messages.

Changes since v3:
- Broke the series into much smaller, focused patches to ease review.
- Removed the global cvm_oct_rx_refill_work by introducing a per-device
  struct octeon_ethernet_platform, allocated during probe.
- Retrieved the device pointer via platform_get_drvdata() and passed it
  down the call chain (NAPI poll -> rx refill -> mem free/fill) as the
  first argument to avoid global state.
- Note: Dropped the ethernet-spi.c IRQ handler conversions from this
  series for now, as those errors are SPI4 bus-level.

Ayush Mukkanwar (3):
  staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free
    functions
  staging: octeon: replace pr_warn with dev_warn in fill path
  staging: octeon: ethernet: replace pr_err and pr_info with dev_err and
    netdev_err

 drivers/staging/octeon/ethernet-mem.c | 42 +++++++++--------
 drivers/staging/octeon/ethernet-mem.h |  4 +-
 drivers/staging/octeon/ethernet-rx.c  |  6 ++-
 drivers/staging/octeon/ethernet-rx.h  |  6 +--
 drivers/staging/octeon/ethernet.c     | 65 ++++++++++++++++-----------
 5 files changed, 73 insertions(+), 50 deletions(-)

-- 
2.53.0

