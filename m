Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0495A26289
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850739; cv=none; b=eTO9HEywkIH6R0b9NvL9jkiuHdJe+QBWHhCb7S1tN4O5N/XBss/kcQffn3Eezkk2Ztnwn+GJ0tzWgsIyOMIDPYopE30uU830GJ4Zekn0CO1WTMZGRrqWW3Co7dVcgBVuVV7QV1fwaBKfbj1F5Dq2pYBjRQlZB0SpWrLaACccHIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850739; c=relaxed/simple;
	bh=hWtc2TMQzYArSZCTJVqpI6y6EAGLzb1H6co9VghXly4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsHz1t5s/i33AUwNO3ghgbe6qdW4pUSjzXidocG/oH1EoEudLX8gfBvZ3R2UyhVR43olhJfFWSMT+Fb7Lle27ZDEOM0ZRMKvtcsTJktS5psSnNmBDQkGJsJ6PgMmHaPuIJxrAsvA6Tk7P+2LJxAcbOJUQ3MNR+4KwFz0eEvWjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Qgm7DSJL; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Qgm7DSJL"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af590aea813so1426072a12.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850737; x=1745455537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKNoONM8uHf8I5HWZGCiXygPJAKjFYdPbm+RmwKQe7U=;
        b=Qgm7DSJLdiBAA0X33Vq2DYoIRzjgtAzZgFgHqOSOtpxJC7xwDIIpxGkiQreMlpZhCx
         6RskJbE3PMa4u1A4DetXlbpJxT/xbN+fUhXcaASjlJa7v5+la9eZZxyubwthtZJAsgHg
         R+NsYC9y2lN+OFe0uRr0ApcFxaeT4cxPYby56kyJAxPUcrO3wnNHrNvvO6LSjirP86QM
         9p1JixHvtC5+5xk3IMC6RRekORzREijGRv6h1fRL4/9FEvHb1VLdxTwOWquBXbI0NC1+
         uy3yqDxp6qaTTmu6psddF6CpU4OXCtVbktLjtffPk7+zDEKZ7A2HvSCI1uUvcj4R+sZC
         uk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850737; x=1745455537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKNoONM8uHf8I5HWZGCiXygPJAKjFYdPbm+RmwKQe7U=;
        b=TofvUK/b7B4Fh17ApP34BpDmlKRMD3cyJ3TRrUsKRA205mz9boGZAKmuejDxv01Dkv
         h6wB5gDv6zS537sUCmgDyx3PUPvuCCmWXUGUgHB4tfHwaSA08EzMN7qhqlz7qCF+XxZ9
         B+pdJ9PFO8zGxU+O8yciZO3MU0SjrnP2lI/P+W5f/hBIngLpbF7PezlymH9YS71kF7yd
         7gAKXYVK6nL4xWAm408Qy7lIl21Z4fNVMCrO/rKvq2dRzl+FWNVUemLKRxPCU3ZbAZN/
         DRVOZhCxnhBcMe7ymzo39WmnC+2PJzcp/hgQxKI6q0okQXIS6armp72k7WJREzrDdDYZ
         QvHA==
X-Gm-Message-State: AOJu0YxB/k1TavtoPE7ncs9Wg+zUif1yTRUTviQgiZ1ojxb/QaDxAE+N
	ceHTDAOy2OGIjYmvKqMLWhmDoHfphCk3viqZZV2cVHF9XprN9xV4UXF1XpdSyTwytyIk1h7u8iE
	=
X-Gm-Gg: ASbGncv7JntoYMPJzKHXf8Yu1ZlKVLVMuUKgZIZA+0J+MinCZZH79WrR3RkrMgod3ro
	cmZJ/At5sPBI8HRBXzg0Tpu8FcCmcZJB38FFVqu9zAm5ytoZ+lO6tAeW1OL6fPDA8O9F9Wd1o9M
	cBS3Lca6p7aKVmyEHHuCka7WnoK7w2L2rHVPh7+YNjnGxjw16/tGxAwoUQqXZbtXWbsPRjh/RrT
	G6L5K3m0YE7dONN+QT4592xHKQ0tJYYd3vRsiPJBvn7BHmmK0fCR1ZRedDQuKbmukgcnPMQWgRw
	D8tfIauKtcqSK3mmtvOHhA+U8EmZeXRgG+FSgLIog/1Gk5ICjpofUPhD4vXa2FA/hn+hhoAAMxy
	OoeidyLOU5/5jN6wT
X-Google-Smtp-Source: AGHT+IHD/ezfhhhdCFoElxOp6X8UoFGIPbV9GQY9PV9X8L/OMYg7u5S5FApq2IAxkIrVHD6nS2zl0Q==
X-Received: by 2002:a17:902:d488:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22c41d8ee50mr10139005ad.21.1744850737274;
        Wed, 16 Apr 2025 17:45:37 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef3e88sm20911265ad.51.2025.04.16.17.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:37 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 00/14] staging: gpib: u8 and u64 over uint8_t and uint64_t
Date: Thu, 17 Apr 2025 00:45:19 +0000
Message-ID: <20250417004533.86765-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preferring u8 over uint8_t and preferring u64 over uint64_t to adhere to
Linux code style.

v2 as some of the patches in v1 did not apply cleanly. Sending the remaining
ones.

* Patch 1 - Patch 11
	Reported by checkpatch.pl.
	CHECK: Prefer kernel type 'u8' over 'uint8_t'

* Patch 12:
	Reported by checkpatch.pl.
	CHECK: Prefer kernel type 'u64' over 'uint64_t'

* Patch 13 - Patch 14:
	Reported by checkpatch.pl
	CHECK: Prefer kernel type 'u8' over 'uint8_t

Michael Rubin (14):
  staging: gpib: gpib_ioctl: u8 over uint8_t
  staging: gpib: gpib_user: u8 over uint8_t
  staging: gpib: agilent_82350b: u8 over uint8_t
  staging: gpib: agilent_82357a: u8 over uint8_t
  staging: gpib: cec: u8 over uint8_t
  staging: gpib: gpib_os: u8 over uint8_t
  staging: gpib: gpib_bitbang: u8 over uint8_t
  staging: gpib: hp_82335: u8 over uint8_t
  staging: gpib: hp_82341: u8 over uint8_t
  staging: gpib: ni_usb: u8 over uint8_t
  staging: gpib: pc2: u8 over uint8_t
  staging: gpib: gpib_ioctl: u64 over uint64_t
  staging: gpib: lpvo_usb_gpib: u8 over uint8_t
  staging: gpib: tnt4882: u8 over uint8_t

 .../gpib/agilent_82350b/agilent_82350b.c      | 22 +++++++--------
 .../gpib/agilent_82357a/agilent_82357a.c      | 20 ++++++-------
 drivers/staging/gpib/cec/cec_gpib.c           | 16 +++++------
 drivers/staging/gpib/common/gpib_os.c         |  8 +++---
 drivers/staging/gpib/gpio/gpib_bitbang.c      | 20 ++++++-------
 drivers/staging/gpib/hp_82335/hp82335.c       | 20 ++++++-------
 drivers/staging/gpib/hp_82341/hp_82341.c      | 26 ++++++++---------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  8 +++---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 16 +++++------
 drivers/staging/gpib/pc2/pc2_gpib.c           | 16 +++++------
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 28 +++++++++----------
 drivers/staging/gpib/uapi/gpib_ioctl.h        | 16 +++++------
 drivers/staging/gpib/uapi/gpib_user.h         | 26 ++++++++---------
 13 files changed, 121 insertions(+), 121 deletions(-)

-- 
2.43.0

