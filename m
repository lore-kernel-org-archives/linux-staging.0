Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6761B87C6
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733326580; cv=none; b=MBjgVCnHWufWXkgqpHeG+5YsdC4f9sTozWQx7WYJ9q6i2YQ4enRpeGfNgd3yE+fbkS9L42rulJ2sqLkZQ44q7xW79/4zPrUMTr0PxuZ0ZxGq+DJoyE7v70LHwPEnQzmPkdVirIhLhxQNQhCkCMfIbmAR0MER8ReGV3VDLjBXZPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733326580; c=relaxed/simple;
	bh=SOg4U58pctz73sCbUo9T2j2IOYdIASzSlvdlUNsaXHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FU4UhQZ8BYQ8BuDCgTe+4TBsoSkKkKFIFg8p1Av6+04VW11I/j3SRyBbjEHp2S7nnT0Log8H02m5CakcwQ+tvdw64fRHtV4vF+6Hzo7X6X4xGialsSZBGfO/hc9ZtpLFCRAa2U5oGB8NyZiTISr0Da59fzQygmCtPJR3Ca86xkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9g06sAH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9g06sAH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so3132205f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733326577; x=1733931377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zclw9J11Yaq/On5xckpqjl4TPnhtbhcGF/0oEDc114s=;
        b=X9g06sAH5IcM2aDbPXkvi77loDiF4EBbdFHiLEj/n0uyIhzNJDrPa55ETgzUblUs40
         HNvRbhvFCnfg8Af8qyni2zPnSdhEsOwv8atAzCUfKI+5f3alg6INXx3G9IIzzXV5/QMW
         3ZMcm+iV+fnIgszYOxYUeLTIfEN2rq17ENTYpJVGChXqhfHu5rZN7gxBoT5zM0I+/pKI
         m6n051EeZ0/ASd0wZ3EIytDy2NDtPu6Y/fS7iRYHziMRnAQdLFqV2MTZ+dgh9GbxVIZy
         xcHYvpje/T25m9qIIMxp25Mp+3ZrO8a/57nslYD/8Lq5UUDDxiC2wjkYh2OUWBkBEoPG
         QeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733326577; x=1733931377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zclw9J11Yaq/On5xckpqjl4TPnhtbhcGF/0oEDc114s=;
        b=WQzJPZ9pSZsXJh5G8UBa6W9yoVQ3tyW+yF3pcjwLj9FuXIcp2ONXhbJqZTb7te+t0t
         m2N/zWBghyB6azxBI26kJ4KMEr78EHMF8cs1PZcmSI3V/RPihjGL8IVVSoEYS79V/VO6
         ILDHqikCAiIyDVxYT9j91NLNJkxyld5jk1XYjk8xhvzQ5Ql/zfdTvLXwM+ykJ1pO8irM
         7036j9pKLfw9AZLI3tjStnqaLtIdnbU4V4FNXm9UaiZCbwIkfs2fVtTu/uJtyXp4JURD
         GqFiJmwPGd1b4FalbXGgpckj3TN9W3M7vf2eyQ9oqlAW0u7fz+zlBYSDdrF0YdjAJiPK
         3ZPA==
X-Forwarded-Encrypted: i=1; AJvYcCW6ita70GCtwZWGGD0u07ChSlQ74IDALEqQfjjE2N7sjtqhyVhywAYDYN0+81CYTRltnuihE3yWmLaBwxar@lists.linux.dev
X-Gm-Message-State: AOJu0YzszkuyFSXG9NoJnOrLDUfOK+aXME3FI1evS7BTy0ZhJvPwxbsf
	wjYCCnQx8r1oKngl4bAZBkotkduINeoEPNq7Mm9eQQx9SV8uvqsC
X-Gm-Gg: ASbGncvuYpOz3GwWz4K00RkoUWWAnOuHbo2Ee4iocs1ecdUMfomRejOpUXOoZ7lNM4x
	h42I5cUT89SPs+qU+h/CTT5W/ZYGa8+PSooGKnm/yE4IIMoB0tINZdA+eBU1eAvuYo4r4QNHEmF
	If8vUR1IGOuYr3kBFO6MUlqM1BMIA3KZdGIvWkKgnnxleg9SR5tke97/jCYA9rYugrTNbhbQoKZ
	ir5GQgyzCS2PgeVMrIfDvfcBwPdQNbSNDVy+6eSAqp1vZPFS+JjzxqjwINvoAlLf7tYXSjzJOJ6
	wdpDn+JyUA==
X-Google-Smtp-Source: AGHT+IEkTfaXH/Z38oXTKSr37ArhtWR8oYC91y2lJwJ5Q1vNBAtYyQtIDtg8OhhBBlD800tMKVZ61Q==
X-Received: by 2002:a05:6000:460e:b0:385:ee59:4500 with SMTP id ffacd0b85a97d-385fd423b55mr6331141f8f.39.1733326577501;
        Wed, 04 Dec 2024 07:36:17 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52b6854sm28921025e9.42.2024.12.04.07.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:36:16 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4] staging: gpib: Fix i386 build issue
Date: Wed,  4 Dec 2024 16:36:12 +0100
Message-ID: <20241204153612.22867-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These drivers cast resource_type_t to void * causing the build to fail.

With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned int
which cannot be cast to a 32 bit pointer.

Disable these drivers if X68_PAE is enabled

Reported-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")
---
v1 -> v2 changed pci_resource_start to pci_resource_len for second parameter of ioremap
v2 -> v3 add changes for cb7210 and tnt4882 drivers
v3 -> v4 disable build of drivers when X86_PAE is enabled

drivers/staging/gpib/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index a9b811165f6b..a62d7d36ea85 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -50,6 +50,7 @@ config GPIB_CEC_PCI
 	tristate "CEC PCI board"
 	depends on PCI
 	depends on HAS_IOPORT
+	depends on !X86_PAE
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -62,6 +63,7 @@ config GPIB_CEC_PCI
 config GPIB_NI_PCI_ISA
 	tristate "NI PCI/ISA compatible boards"
 	depends on ISA_BUS || PCI || PCMCIA
+	depends on !X86_PAE
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -85,6 +87,7 @@ config GPIB_CB7210
        tristate "Measurement Computing compatible boards"
 	depends on HAS_IOPORT
 	depends on ISA_BUS || PCI || PCMCIA
+	depends on !X86_PAE
        select GPIB_COMMON
 	select GPIB_NEC7210
        help
@@ -174,6 +177,7 @@ config GPIB_INES
        tristate "INES"
 	depends on PCI || ISA_BUS || PCMCIA
 	depends on HAS_IOPORT
+	depends on !X86_PAE
        select GPIB_COMMON
        select GPIB_NEC7210
        help
-- 
2.47.1

