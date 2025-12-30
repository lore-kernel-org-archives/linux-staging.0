Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244022DC344;
	Tue, 30 Dec 2025 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767076031; cv=none; b=OOHlpzFfHWMDTtry+/8Xz0f9MjZQ/cJN5p3twE8vad3TzlE8NiofgoCcJdi3WACzR/OBNnyaG+H9Z4f1dLmPLeXTQa6xFSV7NmVQtIpUdDNpHggOqlDKFtHJCfF+BwyjSpNVL/M/dI2JnNb16Z6KAV/hnSkDFQ+pruACFH32c4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767076031; c=relaxed/simple;
	bh=3aQrbE9LkiUgtGb+JI7M5QgaHgQ1GkGnpkE+IOO463M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a7icnW58I0pjn1HVXIxPXU2BtO1SwpgR2tTzbq3MpEUbITM+w6ySKh2K96XB0fi73IDEbQguZOBidG1U+xsqDt5Q788Q0/08Hpt9CyOTbwbpEldyryoQE3VNo7nSnD03GirzHSvMBUkbcz8hKNKT+lhEKxYsk//RzxhlFaN8F+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bq3wyLlA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bq3wyLlA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=T0LFWDsTRHcdccaHeIxD74ix0q1QgkGIfA+ExJTok6o=; b=bq3wyLlABzaQHg9Xya3OuWMcoY
	KZYK4JICm8PQObdDNutf0Dic/RrEkMzbkzy0eMtTeWzfB9D+rjXULkSFjkQp4NU8LnSWolWuexUXg
	ih1VzAP35SpsX5PGnZKf7RAdlLASQAIEQI08svXcoUmTyRFKHvaBMsn2eHChQRe+3I9LNwgYYpd9q
	nZLpSMzgRWPKz0uL3ZUFldHaNLteOFy9c1ziOjcOXTDPnRVagBLH3G1kv/pfVc2XjnQjAQKf9f4hx
	DYYPz0jttx9BaTUQ9SfYCee2sAAs/xjbNLtAPysS98XLzgXQTovRwGJ6m6Aw2jQPwrAtZ6UUBDl+U
	pdH0+aFA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTCE-00000004Szq-0w56;
	Tue, 30 Dec 2025 06:27:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
Date: Mon, 29 Dec 2025 22:27:04 -0800
Message-ID: <20251230062704.3339404-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
tree. Drop it since it unused.

Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev

 drivers/staging/greybus/Kconfig          |    1 -
 drivers/staging/greybus/arche-platform.c |    4 ----
 2 files changed, 5 deletions(-)

--- linux-next-20251219.orig/drivers/staging/greybus/arche-platform.c
+++ linux-next-20251219/drivers/staging/greybus/arche-platform.c
@@ -23,14 +23,10 @@
 #include <linux/of.h>
 #include "arche_platform.h"
 
-#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
-#include <linux/usb/usb3613.h>
-#else
 static inline int usb3613_hub_mode_ctrl(bool unused)
 {
 	return 0;
 }
-#endif
 
 #define WD_COLDBOOT_PULSE_WIDTH_MS	30
 
--- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
+++ linux-next-20251219/drivers/staging/greybus/Kconfig
@@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
 
 config GREYBUS_ARCHE
 	tristate "Greybus Arche Platform driver"
-	depends on USB_HSIC_USB3613 || COMPILE_TEST
 	help
 	  Select this option if you have an Arche device.
 
