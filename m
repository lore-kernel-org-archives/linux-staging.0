Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCFF2C181
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829283; cv=none; b=gUL53YUSM3621MU/gr5+wuHThh76AA/uwRXXhQv1hEaQLPfGHWvrLejN27utbS9G9FtlJFnpMXPS2Obx5ADxdR5vWaXmHPIqEwRQVEs25Irfo1+OLwHW3sNEUWNipAsuyNoHHLGf3p7/xAU5cd7AiucnqWmSCV0BCyOVdoJq63k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829283; c=relaxed/simple;
	bh=6UjVHgWcw+NAuWF4TfaTqzBTtglqOCTwnF8HsyVSDZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NVuyIfgySGPWTYnbNl0kQWK20VE3+NFy7q0zpjaXB6olKYnLrxG9lggoYkCt15NZ5zXzSrwUSZgHj5e82jsnsV6PFDIAfPjTHklGR8kerRe9ysPuqzCAsJyke67FQ/BBGgnXgb0TpfX3OO0WvCIa6N2UxRPFlQG4SgtDn8EwqoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fU4Yb9HW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fU4Yb9HW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9C2C113D0;
	Thu,  4 Dec 2025 06:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764829282;
	bh=6UjVHgWcw+NAuWF4TfaTqzBTtglqOCTwnF8HsyVSDZQ=;
	h=From:To:Cc:Subject:Date:From;
	b=fU4Yb9HWKgqXbRFIhzjM8vC0HsuQgpadpoo+XmiEX1IxtCzOi8N7mJ3XZCvyPqtnR
	 HPfZRE6AHw5hVY8zsbENtqjoyXoWzuP8PlmbSMkKvs0SEV86wVJgWpbX7jorHFcJGx
	 eNV8ovOPyNv9oWCGZLMyFodhpID+CeBOlyIOKKe6Z1m/jff1QvtGKMBoQLMNNgBqSn
	 PTqUW3r4SnVouJ6JSnk0Yiw4cdEFe0jh9tz6OCpDxPdiKIdJpy0PKZ8tJkj+JGcsJu
	 a0KQeY0AGCgkkGSGoDt1wO4IG+FoSzl4RKcmeXjrtemuJsaiSn2tv/p2CX2CGmkzCv
	 FV+uF0MRKMaKQ==
From: Eric Biggers <ebiggers@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yeking@Red54.com,
	linux-staging@lists.linux.dev
Cc: Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] staging: rtl8723bs: select CRYPTO_LIB_UTILS instead of CRYPTO
Date: Wed,  3 Dec 2025 22:18:31 -0800
Message-ID: <20251204061831.499181-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the rtl8723bs driver only uses the crypto library functions and
not the traditional crypto API, select only the required options.  This
avoids unnecessary pulling in the full traditional crypto API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/staging/rtl8723bs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
index 353e6ee2c145..414982893b6b 100644
--- a/drivers/staging/rtl8723bs/Kconfig
+++ b/drivers/staging/rtl8723bs/Kconfig
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 config RTL8723BS
 	tristate "Realtek RTL8723BS SDIO Wireless LAN NIC driver"
 	depends on WLAN && MMC && CFG80211
 	depends on m
-	select CRYPTO
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_ARC4
+	select CRYPTO_LIB_UTILS
 	help
 	This option enables support for RTL8723BS SDIO drivers, such as
 	the wifi found on the 1st gen Intel Compute Stick, the CHIP
 	and many other Intel Atom and ARM based devices.
 	If built as a module, it will be called r8723bs.

base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
-- 
2.52.0

