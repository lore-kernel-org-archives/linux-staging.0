Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D509234E751
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604224; cv=none; b=AATbNQOrHSKwHGcVWLd018Qwhr0TFadrPpyFFw3GfLXlyDb+WnXgiePfHUsRNWbBjkoX1tAkP7+qzo17qgx6zhbFHIQ0ZWuWICQ4qnPdkCCnYhTNTIPWQ4wU3PX9Oav+a/o98SyfJiNCBCIVzBdpG5R7b8nKvC6C2KcWzXcK3UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604224; c=relaxed/simple;
	bh=PJRojwFH0zpPSw3EoRMOoKCW1cvGTMdT6wOVEPANCfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxIccYYYWz6BQA0A/gh6GMZFeez8O/61k0qvqYDafySOXOMcqAGaOV12ZHxCXV9Wdyc7ciLptMH1e3yZlKW6G/JB/et47BlQMVystZWd1zkfcc6pkT1TTcrOpXyBVFn2nxiJ3j6g/wJhc3Xp1IidVvl6PC0lJ+mXCKIPmHEdN7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=QRSvr0fX; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="QRSvr0fX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604219; bh=PJRojwFH0zpPSw3EoRMOoKCW1cvGTMdT6wOVEPANCfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QRSvr0fXXRpdwTvvIVStoRdqj1UpGSxfWW18iizUVoN0k4ijthd+9oyhh3su2QqEg
	 mhDf6D6bniiFwkpuMtHKGbqm6TG3jPIVEcFpq50Krt9cJA5fCfDQNTYn64F+KpWLia
	 WdsTdROAVTnUYc5EL21roqT3U6WX4sVx9GKxZPvgVZOhRDHNhCTRSLTwQkLUQK+GIM
	 +dVwoLzU3LEpzX26V79NavjjURFTYQLrII1BFCgDCYVapwEEvm7s5HRj08W394NSLd
	 vtPY+ohKlLxgkBIPwrZFNkoUS4rfGUzMKJiT1KoztC9Le65DahnNb+pDkGvJeIPPr/
	 LpxMRf5o7L53Q==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id 247CC4068A;
	Fri, 20 Feb 2026 16:16:59 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] staging: rtl8723bs: Drop unused _kfree(...) declaration.
Date: Fri, 20 Feb 2026 18:15:16 +0200
Message-ID: <20260220161611.2398915-6-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220161611.2398915-1-plaes@plaes.org>
References: <20260220161611.2398915-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index cf75760d364a..59fc2cdb195d 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -49,8 +49,6 @@
 
 extern int RTW_STATUS_CODE(int error_code);
 
-void _kfree(u8 *pbuf, u32 sz);
-
 int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
 #define rtw_netif_rx(ndev, skb) _rtw_netif_rx(ndev, skb)
-- 
2.53.0

