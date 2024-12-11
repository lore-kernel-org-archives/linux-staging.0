Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC6A19F131
	for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733935500; cv=none; b=aa7ADF/Z2y7P6zmnmtipjeZZaFRnPMv++HJFIQLrWwJvv/ML0GZz3kNZuNgr9jiwYK337I9V2tjVR1ZLt8MWVf6DKUL0maaPZfnJlHnV0HRS4pXA5iiFT7+XRqpghXYx4HpaW5Ok4xsbMSexf1/UIQrMHBAYBvDFKTi93iY8Dk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733935500; c=relaxed/simple;
	bh=vikcd8r7ScZCxNhv+OmusSOW7Hh8BXCcQ9OyvL9igoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q9mDciVjjtQWAA2oDNpXlqRT0K1dzzC50nnWDSkC9c9ivHu54XVzMa/Lv1JqU1G/y3y8oNH93hMC8gkp8pNhpgyHYmhIO1xFrRCwhlt96eUS3udvBOLXKHFUE97kB2uonB0dBiUyCbpwemPnun3f0LEtQh2qe9zndvicRArg/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSGKGUHg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSGKGUHg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e3621518so4404686f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733935497; x=1734540297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6Qqu0nEFq5zDjW4RPJaEsHcxHnClrN0XqD2UdNAltY=;
        b=NSGKGUHgoaIUFynwzhcD0KpeawN8UKH3RPm74b00PU9L4iD96ZWGUa2jl8IIhx4I8Y
         XGcRpVGwYphvtBUZzUmuxKVb0BB1LCNQjTCrB1GqwdDogAWk4QWi4YOQs8y7zA14024D
         IO2ppi0rdEz/5Fu6EaJ/z0StKTEiDnyTA5seHXCqXmwHY6O6XVQQbxcLJlgLLvkbwFh1
         gkdIq2LX6xabA0AP2ktKxrwbrYuXrVFoU8Ild4eVBtqQtijEWS96zbItU605oHPVJzbm
         vZqM4hJ0U4vZNze7yzwRhXt4K2rIsF+RbVXTppnyCWcMil5Y5sjYiJdEDYaC+spjygjQ
         aLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733935497; x=1734540297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6Qqu0nEFq5zDjW4RPJaEsHcxHnClrN0XqD2UdNAltY=;
        b=w91pUZkY560JAufiswmU9F4POGoNiuCh1BNN7zEKV2gDwSuuvCcgr7MkLwaHofsecG
         ynNxfU1+UlNjrcLyg1OmxdvcIY0PXLmIY5sYj+/EXJJL+2BKMDwmjdTXLeQzeYg1QIKH
         +iJ1Yth9UALj0UMPeJeJKz1TOIhCoB43H7a7zfzHCI0PzqA5kJu/mVIEG3MOTaE/xR5E
         PBkU2Ybkjn+tfuQp1XX0feYr2ZVG0kW36EKWL6NkZno0YE7KWnl2VarPdIil02QTmD+f
         LKRk7Y/2cOc41Tx+HYiaxlO2UEBEA9QbKg3/fX5lhoE4C/ZMvBGB57iSXX0XPkOigQ9p
         VGJw==
X-Forwarded-Encrypted: i=1; AJvYcCUSw6G13yHzsWIYXQhIuyQfWmmjegxm94zjoqg6ggXFZwcz2F55D1wZUrHyu0CiNaDAqbuFFBkWEGFwH4jF@lists.linux.dev
X-Gm-Message-State: AOJu0YxVIt18m8xAmTd4nf1ERq4oRBcOhumt7ek/fCYiWa+7E5MUiOmG
	rhp1sMvDWMGlwnoOIzRtnvRK9gfWJ5/GM7tv9mQsqp2ELZWv5O1/
X-Gm-Gg: ASbGncsyDASrTg4jUikGLUaS/Ljydqyg8Gtn4dzFKXC51cFHuLvPEzA0ZivXVpLLt5A
	OfUY96x3OUfLzggaP+i431j1oyyg8Fo1egZCs4SR7StNOvatz7CY4kEN2PcBiC6dgTi1uOlS6Lo
	hQqrHX1FwaXGpQvYgiT435LPn6nPoJpL+NSBKeTd0S9auYifh/wn0nz0zJs6gLsujqEU9ReY+Lq
	ok7FqcVf4ZFGHbBTRIrchRR6O28CG7RtSgWAZHC5H/HxYHO8lUC46mzWmEqIro1DU0DZWLfXGZ/
	9KAK7r8GLPrtMA==
X-Google-Smtp-Source: AGHT+IHtb8YXfS+3OJUaIz2+dOdJU4ffLMCPGWuDmWhDzBy2fdggeuYKtd6THPiFxztWcEPU256ldg==
X-Received: by 2002:a05:6000:a14:b0:386:4a24:1914 with SMTP id ffacd0b85a97d-387876af3d1mr239766f8f.37.1733935497063;
        Wed, 11 Dec 2024 08:44:57 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514dd9sm1637501f8f.69.2024.12.11.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:44:56 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	geert@linux-m68k.org,
	Dave Penkler <dpenkler@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v6] staging: gpib: Fix i386 build issue
Date: Wed, 11 Dec 2024 17:44:52 +0100
Message-ID: <20241211164452.27464-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These drivers cast resource_type_t to void * causing the build to fail.

With a 32 bit build and PHYS_ADDR_T_64BIT enabled the resource_size_t
type is a 64bit unsigned int which cannot be cast to a 32 bit pointer.

Disable these drivers if not 64BIT and PHYS_ADDR_T_64BIT are configured.

Link: https://lore.kernel.org/linux-staging/2c6c7e9d-ca10-47a9-82a7-a2e26b1f51ef@roeck-us.net/
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
v1 -> v2 changed pci_resource_start to pci_resource_len for second parameter of ioremap
v2 -> v3 add changes for cb7210 and tnt4882 drivers
v3 -> v4 disable build of drivers when X86_PAE is enabled
v4 -> v5 add missing signoff
v5 -> v6 Non x86 builds were also failing. See discussion under Link above.
         generalise the build dependencies to exclude the drivers when
	 the physical address type does not match the arch word length.

drivers/staging/gpib/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 95308d15a555..36a29b52ba30 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -50,6 +50,7 @@ config GPIB_CEC_PCI
 	tristate "CEC PCI board"
 	depends on PCI
 	depends on HAS_IOPORT
+	depends on 64BIT || !PHYS_ADDR_T_64BIT
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -64,6 +65,7 @@ config GPIB_NI_PCI_ISA
 	depends on ISA_BUS || PCI || PCMCIA
 	select GPIB_COMMON
 	select GPIB_NEC7210
+	depends on 64BIT || !PHYS_ADDR_T_64BIT
 	help
 	  Enable support for National Instruments boards based
 	  on TNT4882 chips:
@@ -85,6 +87,7 @@ config GPIB_CB7210
        tristate "Measurement Computing compatible boards"
 	depends on HAS_IOPORT
 	depends on ISA_BUS || PCI || PCMCIA
+	depends on 64BIT || !PHYS_ADDR_T_64BIT
        select GPIB_COMMON
 	select GPIB_NEC7210
        help
@@ -176,6 +179,7 @@ config GPIB_INES
 	depends on HAS_IOPORT
        select GPIB_COMMON
        select GPIB_NEC7210
+       depends on 64BIT || !PHYS_ADDR_T_64BIT
        help
          GPIB driver for Ines compatible boards
 	 Ines
-- 
2.47.1

