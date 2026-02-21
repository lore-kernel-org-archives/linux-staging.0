Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06052EB860
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771700959; cv=none; b=mDYgZr6YZ7tRZ7LX0YcgYSGdXyADBPIOJ1TULDnnBUy1oh5XaN/9iVUHB18Sg0Fsl7po7wjiS4LrElRxiqbQPgY5GITPxd1H8p1qVurzlx3baTEEkOQTZjpmJabrf5Lb98ethjjBcgGZykCZOeVKm/moEXfJ42i5gLakdiLMIvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771700959; c=relaxed/simple;
	bh=gV1A73BX2x9F7rmRIf6mIVSh6xQFoDvn74quOfSVF0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDwWaIEZOmRwShzgS1ZGN3pP1iRjVPNThrOdAWKtqnyoL61pFr5EekzzF5/F9KewQM9SGgvO6mkBFcWInZJgzxWg8/Wqwy/ggAl8kfehL5pI17wZ7etaUdZHZiWNSBFgRtGAK0iA7CMrIDyyJlX+cIibFWOxQo7MGrMJ2egXEdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=N470Z0wk; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="N470Z0wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771700956; bh=gV1A73BX2x9F7rmRIf6mIVSh6xQFoDvn74quOfSVF0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N470Z0wk6wPoLBO7W0jbsXhYsGfQ+TNHjv0A4h7qZhN0yTC+jeQZe72KkjpjrMlJx
	 xWubnldBIzz3UyYDelZux0kwZPInAf2jTWDVEMXAv/L3vayuGrqzLcx+tGEjC91Yz8
	 xj6XDsOgG0DYK3Q5EVoCq4vUFOKBzhqPzH7ZOW1RweCmcDVnaj2R5WwIl8uRSaYRdi
	 UCnOUIs0uuVmNItGdMuRGIc04mCrpMtMIIozljJA2MjkCe8HgdrCri9wprVyepUM9m
	 IIOz27iOZ4/d5IP3I1BHDlrJB7y/4itCgQveFLpKa45991yYsNDc16utwpjUEx06Zk
	 yKVMOqCpqCsEQ==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id 3D37C40221;
	Sat, 21 Feb 2026 19:09:16 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Bryant Boatright <bryant.boatright@proton.me>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	Milos Puric <milospuric856@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] staging: rtl8723bs: Drop unused _kfree(...) declaration.
Date: Sat, 21 Feb 2026 21:01:35 +0200
Message-ID: <20260221190628.50273-6-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221190628.50273-1-plaes@plaes.org>
References: <20260221190628.50273-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unused `_kfree()` definition from header file.

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

