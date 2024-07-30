Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FFF20326
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722322871; cv=none; b=Oo/vBD3TwDlEeVMtPYdrh+QteQFifMUShP+mLmueLH2/zaoPUC38mkstFlpkjdQwgwpjWAjKWSiXBuTYVMhS018Lphlu3d5K4uTV5fmIOsy5boK9S/XfoP6+OFj7WhuKxOah19F/VVKEVArX/Rfn5IBcbwQBZcKZURmzsXeaeiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722322871; c=relaxed/simple;
	bh=+Fg95AQU2XFNZXaOZIdHTqlcBPQdSIH6AWjhJ8ITK2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L2znMSqoqZpd41OgkkJuoAic6ogI9RlMXSqvrPyL/M3JiAgMU3eA6xQSuTlUiW1hSKwmX3D9Is2pqZX+08R6OPxjyaa2CVPorCUMHUHgTr117Xki7NcrYr8xO1qFZVzOdfPQ3Rz+ie7Kn5FmNpy0SF7XxtYbVJwNvV9Ru+A8DhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=TPhbawKs; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="TPhbawKs"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WY5jW1BFMzDqD7;
	Tue, 30 Jul 2024 07:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722322863; bh=+Fg95AQU2XFNZXaOZIdHTqlcBPQdSIH6AWjhJ8ITK2I=;
	h=From:To:Cc:Subject:Date:From;
	b=TPhbawKs1xVWPE2L/cSgX1q2K6YVgtryK4+FtFVFessOa3Xwaqu7e86m65b5fzuF4
	 pjkBW2IBP07irg7j5EILohAvZo553vntOwtkPGPYrN3lLAXW1pBPt802sgfRnEN9oY
	 fTIxvWrxlX921BQ8mmmsG7R3Pqy2bGHt95vmjezE=
X-Riseup-User-ID: 139F3A5E64ECC82600FA85DA30FCB8E43FFC72F204D403D5D7236024C332F8DF
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WY5jT4qVjzFrwt;
	Tue, 30 Jul 2024 07:01:01 +0000 (UTC)
From: Emmanuel Arias <eamanu@riseup.net>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH] staging: rtl8723bs: replace indent space for tabs
Date: Tue, 30 Jul 2024 07:00:59 +0000
Message-Id: <20240730070059.33210-1-eamanu@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error code indent should use tabs in file
hal_pwr_seq.h:104

Signed-off-by: Emmanuel Arias <eamanu@riseup.net>
---
H! I'm a newcomer, this is my first patch to the kernel :-)
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index 5e43cc89f..b93d74a5b 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -101,7 +101,7 @@
 	{0x0007, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x20}, /*0x07 = 0x20 , SOP option to disable BG/MB*/	\
 	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, BIT3}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
 	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT2, BIT2}, /*0x04[10] = 1, enable SW LPS*/	\
-        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
+	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
 	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, BIT4}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
 	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, BIT0}, /*Set SDIO suspend local register*/	\
 	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, 0}, /*wait power state to suspend*/
-- 
2.20.1

