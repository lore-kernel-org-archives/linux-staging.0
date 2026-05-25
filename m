Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780EA2D592D
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725720; cv=pass; b=un0A0gq5yVBjMc955Jmtke00pjtSO6vBQlvQkHRkXER2J9BauMVgEL7CZuvo0JNWn1XDDbo1fr8kfxbRl3PFZg/HQvWi3lqPImCEXUn1n0BWdp60Jiy/yM8ZSiNKYZ9pwM0uru0fycS2B7xX8yV0Acy0RIU2TBlFYLP2J5xjsas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725720; c=relaxed/simple;
	bh=31lWgL7rRszME87e69h+HAvMDZ7Q4wYmWrJPYZF91vA=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=YqWhOQRWoqc8qQt/Xp2UYrMNhLPV4JSo0NtFWDp1k8aTDqJuX7ZVk7FWgn+QpV6aQi8nGhx6j35/l29Zb2t7yorMa3WW4P4IaBVDG78W2yEfmFdRehld85LsBYNXT2vUSMrw8qOIvUYOthSBAVeDqlBPuxg83JtBtEaGW4dnANw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=WytNgwDj; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="WytNgwDj"
ARC-Seal: i=1; a=rsa-sha256; t=1779725707; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=H25KuHE6vAhOCynJ5x+qZ5OGe3TvROfKcZs/PD4Ycarm3C4XqqmvEp6VEoaMJXqzd/sf03pzo8G1ESs7sK8sbGe7m9rM/A2TFXDp8heW2Gyl/wOYOvpHiDWBFJQOTVGWE5Q79iwAO2cGlKpgRqRP6t0mA2+hKLlnMaRdcIQOb2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779725707; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4/D3ZVk1g/KQX6fWV5B7LUKksuGO5srwLpNpriK86Bg=; 
	b=LkYNNaQypFhCfBff4KVZD91R3KgVQeghBER9Z29ln/ipfb36g7cITNMjCWb7Soa19McREYRq9GbU9VouVuK5waMolPlc9Q+YCw/poc1nFBJ1hT1MWUErH5De0nhnedfZFi7jZIzdYZq9FGue+K/uxAnvZ5qYYdLUmObhb5Okz2E=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779725707;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4/D3ZVk1g/KQX6fWV5B7LUKksuGO5srwLpNpriK86Bg=;
	b=WytNgwDj/WXRYSgXLQMXI6vst00r9vJwpU9LXUmrJ02Wptii+IBzkhmdOg6kK+l/
	1/YuCIoVzwlbg6WxmgNacXCAFSaZ+GY4CcdsPYds8g2l5I47OnjSOToCnp/hf003Zwj
	LBY6MzRWUZs42z7Dr+jl5Ue3Msp6cKk85ZPHI31s=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779725705895713.3716859499349; Mon, 25 May 2026 21:45:05 +0530 (IST)
Received: from  [117.99.195.86] by mail.zoho.in
	with HTTP;Mon, 25 May 2026 21:45:05 +0530 (IST)
Date: Mon, 25 May 2026 21:45:05 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>,
	"linux-media" <linux-media@vger.kernel.org>
Message-ID: <19e5feb2286.b0d1beb80076.1209164292362410446@zohomail.in>
Subject: [PATCH] staging: media: Remove deprecated Atmel ISC drivers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

The Atmel ISC and XISC drivers were deprecated and scheduled
for removal by the beginning of 2026. The replacement drivers
(VIDEO_MICROCHIP_ISC and VIDEO_MICROCHIP_XISC) are available
in the main media subsystem.

Remove the Kconfig entries, Makefile rules, and the
STAGING_MEDIA_DEPRECATED menuconfig since it is no longer
needed.

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
 drivers/staging/media/Kconfig  | 18 +-----------------
 drivers/staging/media/Makefile |  1 -
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 1aa31bddf970..52b4aab944f6 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -38,20 +38,4 @@ source "drivers/staging/media/sunxi/Kconfig"
 
 source "drivers/staging/media/tegra-video/Kconfig"

-menuconfig STAGING_MEDIA_DEPRECATED
-	bool "Media staging drivers (DEPRECATED)"
-	default n
-	help
-	  This option enables deprecated media drivers that are
-	  scheduled for future removal from the kernel.
-
-	  If you wish to work on these drivers to prevent their removal,
-	  then contact the linux-media@vger.kernel.org mailing list.
-
-	  If in doubt, say N here.
-
-if STAGING_MEDIA_DEPRECATED
-source "drivers/staging/media/deprecated/atmel/Kconfig"
-endif
-
-endif
+endif # STAGING_MEDIA
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 6f78b0edde1e..6fd7179733d8 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE)	+= deprecated/atmel/
 obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
--
2.43.0


