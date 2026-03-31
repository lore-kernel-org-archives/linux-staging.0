Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E973A9620
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955916; cv=none; b=DRAoQrZI8US8ZvUG2A5R25SdMH69hdT+IYWZIw2ivgGgLXKxhITEDcGNB5BfIxZLQHWiRRlhQkXpHuwHOAw27Xw3KZ9BhgDCcg37GJD4vbOGqgZZuvJrECTNrj6xnSnZoi2BCkA7lONIOkneSiBFOAkrQO43Ldnv3DIYI3Hm8nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955916; c=relaxed/simple;
	bh=ReC4p4kYqnl7g6WnPuWJKaekEj3iVKvPdHW3wEtfdr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpPSayXjpVfVjHybiOoLtLdplMrHWs3ofNkQGiy8Bf2IjlmrsB7kxLi/ww9UVSw6RcPxex5fdQ/agqjWUupE2DYQExDKCBKHhruq2aUJZ12vyso9/jOKGOqxSdLyt6O529kg4KBzndlgfTg3cLHs1w4WHxaddaHF9mWQ/VrrBbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2qPGZDP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2qPGZDP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae3a007bd1so5082845ad.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 04:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774955914; x=1775560714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYGlZpICaFZPVaxPXhfP/+SYdKF/mwmIuNpGZOe4ICg=;
        b=B2qPGZDP4MelENDnAWuClvnO9vgJLjQPvAJFXKItFl66yJLVIbVWLrpW5SnYkQjPcx
         6tdKR9uTFtL5dycHhyAHelVTWdhyVIJsmF4OgZi6UAKdLDl6hRtLaksk0VIfJ4sw7Pih
         iLQ2rjASKTzSwC5cEMkBDYCbQ5KI0FaVjqQwEjgtwfCD2DwiwlwaqCpkRw5rW54xs3m3
         85rgLv93flNSCykFj708vRKTkc7y7xfGCyrOOnOsweVTOilc8jpdzcvGn+7C8fgE4OeA
         fxI00BDaX2+0odi6Funsh1MjJenTeavadz1nKvBcXfjH2awZWNbEjDwhJTxdCaFgupro
         qJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955914; x=1775560714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYGlZpICaFZPVaxPXhfP/+SYdKF/mwmIuNpGZOe4ICg=;
        b=GW12vfN/Dq9m6HFaNqYjwooQHTgFihKih144XY7iReHsBm6oc1NLlXWfbBueIHMzwf
         1ERif0TM+RZ0QPVLU3FbXC12W5BCablfsQx5zpHYq6h6jh8rSg0xrdDIRQNg22OKUUxt
         yIaIck593ERafo6tHnu7Nhda/8Ozskxg42P2L7oxBrrXjb1Ib3XuCn5SVZkShP0ra+tG
         VH3/FGYh8lYWLk+R9+EhUiOu5Gvudkizjx9hAEGAp+T/p4eMzHLzBqOQBaVAZ9MAoLv8
         rAqybsCXG4C1vqaHzq3MVUcI8687VFCSuFf7ww0vqjHjQAIEJMeCs+9rYVzaFM7myEQd
         fXHw==
X-Gm-Message-State: AOJu0Yz+HfgTlrgJnqMw3M7N5394aMCa1z0TXJ/V0akI/KnuhBpSYY+v
	Iivw6doSb8vm1GFTxEodb/9SXiWUdKMLDKS5TnwhSjcwOILuKfSn2qfzCkZz4YYf
X-Gm-Gg: ATEYQzw/X6NH29xZxtYuXwok5fFK+F300PtcKChHEJaC9rDALF6COJYtxgjKIp+KR42
	NWpv7KURrsmKGZ3d5d9kVqLnmtZTsR9id1gzY2nE4UyVV6nUpKkGZyJyKPJRt//z0tM3+P9JVFN
	X9MXPA2Y2JzDnZczrWRrT5slkoy7+JCvJKOsjzOoqusIi5tZG7H8R5iF4wQq+zUi+709NBIpyMs
	fbFE3gJrFUiemF9Ml9E6Y5lZDXGEBVgjKO434o1xee0JesZwgXKspjryecfs/wScTcwdJrh8bXk
	oEUyjOk30VZEIjJPwXB2HnAll4C/T1dZnvxOVsS5PgRxwQtJcWJQvtfhx9r7pp/JiTsqQW9S/I2
	YQTjVXZ8hA7DKOJE+a/hRPRHwwsiGrwV+B2itsDJlGB1RK86R6h1WZsoD00Ef8mReRC/GMPUNdy
	xk++pboANLK+DIKrdMddP87eTkUyA=
X-Received: by 2002:a17:902:d550:b0:2b2:48a5:45c3 with SMTP id d9443c01a7336-2b248a54b7fmr68309785ad.1.1774955913561;
        Tue, 31 Mar 2026 04:18:33 -0700 (PDT)
Received: from fedora ([2401:4900:86e0:ee11:14b4:e5e5:9799:983f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242766203sm128901145ad.40.2026.03.31.04.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:18:33 -0700 (PDT)
From: AyushMukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AyushMukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v2 0/2] staging: octeon: replace pr_*() calls with dev_*() and netdev_*()
Date: Tue, 31 Mar 2026 16:47:55 +0530
Message-ID: <20260331111757.110703-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026033119-endpoint-jimmy-6b83@gregkh>
References: <2026033119-endpoint-jimmy-6b83@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_*() calls with dev_*() and netdev_*() across the octeon
ethernet drivers to include device information in log messages, as
suggested by Greg KH.

v2:
- Instead of adding pr_fmt() macros, replace pr_*() calls with
  proper dev_*() and netdev_*() calls
- Thread device pointer through call chains via function parameters
- Introduce struct octeon_ethernet_platform to pass device pointer
  through work queue callbacks via container_of
- Store device pointer in oct_rx_group for NAPI poll functions
- Use dev_id in interrupt handler to pass and retrieve device pointer

AyushMukkanwar (2):
  staging: octeon: ethernet-spi: replace pr_err with dev_err
  staging: octeon: ethernet: replace pr_* with dev_* and netdev_*

 drivers/staging/octeon/ethernet-mem.c | 26 ++++++------
 drivers/staging/octeon/ethernet-mem.h |  4 +-
 drivers/staging/octeon/ethernet-rx.c  |  6 ++-
 drivers/staging/octeon/ethernet-rx.h  |  6 +--
 drivers/staging/octeon/ethernet-spi.c | 59 +++++++++++++-------------
 drivers/staging/octeon/ethernet.c     | 61 ++++++++++++++++-----------
 6 files changed, 89 insertions(+), 73 deletions(-)

-- 
2.53.0

