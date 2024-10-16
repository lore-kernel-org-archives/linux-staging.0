Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425DA2076D0
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077337; cv=none; b=fd0jbl7FXiwOuJaIlkQX/1NnqnFPpfn4CYwPFyRD3tNVJbgQJMtNGIZncqCas8z15vZ6fz8FjCGpk+3fSazLsBL+arEANuV8cefB+NUj0zh4mhDc0MvJAgovq56W94fUNfgtjzgUtR1atmAbZRrKOHFxpQq0lgkPF/2u83j9kwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077337; c=relaxed/simple;
	bh=PnKyfD1m++t/ESBaanaHFxre9JZMG6SEZCiStCCLHIM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aM+0Qv21+O311/1yV8TpWiVl4265HnkolEc1m73BvG/uqpGTm8wTrXfr4Ig9CCpiStNFKs9lqL8K/xrOgRikji9665KOrh3fsKcIkURHh9JM2y53NQT3DZG5vP06zcgvmLjq22O69FpyCFdy1CFReTcHzeEhtqkXrRF4EJzt4ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtlmrF74; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtlmrF74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A937CC4CEC5;
	Wed, 16 Oct 2024 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729077336;
	bh=PnKyfD1m++t/ESBaanaHFxre9JZMG6SEZCiStCCLHIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EtlmrF74ueEx7esgzke+nR7A3XjOJDGzXC1F5plrv0HtqQ9pMhdJFOmc889Xr3a4G
	 5K0D33Z+BanipIV5BlhkE+Prha/moEkZdavLo8L3nRp50j9eX5d0FD/Oixu0Oh7VwW
	 54dtUVGt1kKw8A3c/om7ViGvsxl4A7dVpieQ++MjVqs5laFGvHG8OIYxjIPhFeTv5K
	 qK8AkEqPVd1r/lbpWBzJd0I5NiAbtmWFd05e1zie12ht0j+2vnjoIussRud0SOcqPC
	 O41Cmy7dP2xT5aIwwJkPaWfEt/Pu4USgavf6SMQzhBH7E/4psgrvbr/E9RvGzWcSNu
	 Awc2OgXsUJffQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5/7] staging: gpib: add bus specific Kconfig dependencies
Date: Wed, 16 Oct 2024 11:15:19 +0000
Message-Id: <20241016111521.1143191-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016111521.1143191-1-arnd@kernel.org>
References: <20241016111521.1143191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A number of GPIB drivers fail to build when CONFIG_HAS_IOPORT is disabled,
which can be avoided with a CONFIG_ISA_BUS or CONFIG_PCMCIA dependency.

For completeness, mark all of the new device drivers with a dependency
on whichever bus they use, and hide the symbols for chip drivers that
are already selected by teh device drivers using them.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/gpib/Kconfig | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index f5541624eaa7..8c550f669958 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -34,6 +34,7 @@ config GPIB_COMMON
 
 config GPIB_AGILENT_82350B
 	tristate "Agilent 8235xx PCI(e) adapters"
+	depends on PCI
 	select GPIB_COMMON
 	select GPIB_TMS9914
 	help
@@ -57,6 +58,8 @@ config GPIB_AGILENT_82357A
 
 config GPIB_CEC_PCI
 	tristate "CEC PCI board"
+	depends on PCI
+	depends on HAS_IOPORT
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -68,6 +71,7 @@ config GPIB_CEC_PCI
 
 config GPIB_NI_PCI_ISA
 	tristate "NI PCI/ISA compatible boards"
+	depends on ISA_BUS
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -89,6 +93,8 @@ config GPIB_NI_PCI_ISA
 
 config GPIB_CB7210
        tristate "Measurement Computing compatible boards"
+	depends on HAS_IOPORT
+	depends on ISA_BUS || PCI || PCMCIA
        select GPIB_COMMON
        help
        Enable support for Measurement Computing (Computer Boards):
@@ -118,6 +124,7 @@ config GPIB_NI_USB
 
 config GPIB_FLUKE
        tristate "Fluke"
+	depends on OF
        select GPIB_COMMON
        select GPIB_NEC7210
        help
@@ -140,6 +147,7 @@ config GPIB_FMH
 
 config GPIB_GPIO
        tristate "RPi GPIO bitbang"
+	depends on ARCH_BCM2835 || COMPIlE_TEST
        select GPIB_COMMON
        help
          GPIB bitbang driver Raspberry Pi GPIO adapters
@@ -149,6 +157,7 @@ config GPIB_GPIO
 
 config GPIB_HP82335
        tristate "HP82335/HP27209"
+	depends on ISA_BUS
        select GPIB_COMMON
        select GPIB_TMS9914
        help
@@ -172,6 +181,8 @@ config GPIB_HP82341
 
 config GPIB_INES
        tristate "INES"
+	depends on PCI || ISA_BUS || PCMCIA
+	depends on HAS_IOPORT
        select GPIB_COMMON
        select GPIB_NEC7210
        help
@@ -210,6 +221,8 @@ config GPIB_LPVO
 
 config GPIB_PC2
        tristate "PC2 PC2a"
+	depends on ISA_BUS
+	depends on HAS_IOPORT
        select GPIB_COMMON
        select GPIB_NEC7210
        help
@@ -227,7 +240,7 @@ config GPIB_PC2
 
 
 config GPIB_TMS9914
-       tristate "TMS 9914 GPIB Chip driver"
+       tristate
        select GPIB_COMMON
        help
          Enable support for TMS 9914 chip.
@@ -236,7 +249,7 @@ config GPIB_TMS9914
 	 called tms9914
 
 config GPIB_NEC7210
-       tristate "NEC 7210 GPIB Chip driver"
+       tristate
        select GPIB_COMMON
        help
          Enable support for NEC 7210 compatible chips.
-- 
2.39.5

