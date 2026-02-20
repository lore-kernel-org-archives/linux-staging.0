Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76092F25F4
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604663; cv=none; b=clgG3h+gkDBR37R5sYzldqJRSz3x55p1j3cKN8kzyDqud8/Rr2GpTNwoleHcbxb3DbU3MVxqCqmbvdcOrD1c7T6duGIznTOrAsF83hid2XMTsEmGtLgmMXZs8kVl9Edhhl7NgTHyUxH3wjC7RWE4MIfH4L0ggMgnhT6sUVvmHfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604663; c=relaxed/simple;
	bh=ZjsPN7YqdYyiuNgkDW2NHPDk00boE8fbEslPi2Y/CyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FA3ST7yDY7FQ8p058oF1TrwIrzFoE6+uHsMtF4IEUkbCYnTld5J0kh3fD3yWJQbr2gIayZiP8ZZaDOrJFYu31G0GsJNcocs8DQyQVTqLUoZuezTr3rbjZZXbk3pucOm/qF78LTE515c2n2/pXibQDv02zn0beaZJ9Vo/DJBtNo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=NqyrQIl1; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="NqyrQIl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604207; bh=ZjsPN7YqdYyiuNgkDW2NHPDk00boE8fbEslPi2Y/CyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NqyrQIl1sX6djcpKBrMYAY/9WvP9nv7nQBSfGF/eTT2AdFLFt11TvYRiDiQPFH0wz
	 A+jjer/iYsSF8ZVUG4QRlsNK2bAUTVbt8fukMb2TpyXnADybBKYP63Gz0ewsJjtyTH
	 1hYdgXFAA9gIVBrdlf6yWy23BgB+B5l8yts+bP0pWBJSkPISTctUIK4e/9Vk2cBTxs
	 pBybwAoHK6XZSDQCu3+pQcHnFzEob5U/GNMzCA3kSpUpSovQNHsYole9EnFOrzJEAv
	 QiQDFerjUEGPUPVYdDmAR4Rep+Z6zMxRq9H2vqDu9+ckBEQYXZUiXyb39H7TX7Y7b6
	 2kCEumpsxrGrw==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id AA4E040382;
	Fri, 20 Feb 2026 16:16:47 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Minu Jin <s9430939@naver.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] staging: rtl8723bs: Remove unused BIT32..BIT36 definitions
Date: Fri, 20 Feb 2026 18:15:13 +0200
Message-ID: <20260220161611.2398915-3-plaes@plaes.org>
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
 drivers/staging/rtl8723bs/include/osdep_service.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 404f81756b27..f7b647db1a75 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -46,11 +46,6 @@
 #define BIT29	0x20000000
 #define BIT30	0x40000000
 #define BIT31	0x80000000
-#define BIT32	0x0100000000
-#define BIT33	0x0200000000
-#define BIT34	0x0400000000
-#define BIT35	0x0800000000
-#define BIT36	0x1000000000
 
 extern int RTW_STATUS_CODE(int error_code);
 
-- 
2.53.0

