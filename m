Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B7308F26
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771701047; cv=none; b=HXehaMycULl7H8jQdrdQ2pTRbplRJJQxOY6Ujks3TF1WKggufetvtuxW3a14FPYZpsKtXYRXxq5Vhb+t5npL37dkGFn54vAqh1+A6P0Mb4CwW/1UaUFft0VZhgMdSCayXKPDx8GVDNKaFISomjb5YZXTeqnS4piB8cMaLg9Ytx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771701047; c=relaxed/simple;
	bh=TTNrBDecyN7RGvcGSw5dDmPKPfVUcUS0WDDh6QU5eGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbbYa0ECyzBQkQJONVGRnCriV35x0NQWhS84ffVQtnC8EBW3JqJxWW83722x4i4hmsImGzCnpLPvB8VtGi0p3jnB3Brou/G/iseddIVHxrtBSn8aF44mPOu+T0R0dpCuRLt8JX46oa3sUSpQBl1ssZzQ0qTVFXNrqCH7edgGum4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=M+U4bnLn; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="M+U4bnLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771701043; bh=TTNrBDecyN7RGvcGSw5dDmPKPfVUcUS0WDDh6QU5eGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M+U4bnLnuRPZwHkM7IJQMMq62IP9brJY88iypGiyklqalHUOlon6vGVLB3o+2Y59f
	 1lvKRTnKBTPOE+cgzA2VGvJHMghAUBKU3FtAuc2ejQ5Tck09HtdV3F4QkHb8hIHRCK
	 aoZ1bPaFf2XH43aDuClz0+GCebmp0qdHg7hQy6phYnL0/Ul9zt2uU0OEu7AcIwPTdr
	 jKp4JQgVWVa/wuKWbHmyEFYEDoukEwIVil+SVZ2oPk3S5CIMJ+4WE29WJ8jzpn1SDz
	 24BeIQMBy3jIM1pA/za/V6+slTBIzEPtJwTXe4euazfkYE0N5gVzLBwgZO9oIVByo0
	 HoyuC9s2SznZg==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id A9F47400D2;
	Sat, 21 Feb 2026 19:10:43 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	Philip Thayer <thayerscirez@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Milos Puric <milospuric856@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] staging: rtl8273bs: Simplify regulatory initialization functions
Date: Sat, 21 Feb 2026 21:01:39 +0200
Message-ID: <20260221190628.50273-10-plaes@plaes.org>
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

Simplify code, by cutting out wrapper function in regulatory
initialization code.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 27 +++-----------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index f9c4d487badf..878a2ee08d25 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -91,40 +91,21 @@ static int _rtw_reg_notifier_apply(struct wiphy *wiphy,
 	return 0;
 }
 
-static const struct ieee80211_regdomain *_rtw_regdomain_select(struct
-							       rtw_regulatory
-							       *reg)
-{
-	return &rtw_regdom_rd;
-}
-
-static void _rtw_regd_init_wiphy(struct rtw_regulatory *reg,
-				 struct wiphy *wiphy,
-				 void (*reg_notifier)(struct wiphy *wiphy,
-						      struct
-						      regulatory_request *
-						      request))
+void rtw_regd_init(struct wiphy *wiphy,
+		   void (*reg_notifier)(struct wiphy *wiphy,
+					struct regulatory_request *request))
 {
-	const struct ieee80211_regdomain *regd;
-
 	wiphy->reg_notifier = reg_notifier;
 
 	wiphy->regulatory_flags |= REGULATORY_CUSTOM_REG;
 	wiphy->regulatory_flags &= ~REGULATORY_STRICT_REG;
 	wiphy->regulatory_flags &= ~REGULATORY_DISABLE_BEACON_HINTS;
 
-	regd = _rtw_regdomain_select(reg);
-	wiphy_apply_custom_regulatory(wiphy, regd);
+	wiphy_apply_custom_regulatory(wiphy, &rtw_regdom_rd);
 
 	/* Hard code flags */
 	_rtw_reg_apply_flags(wiphy);
-}
 
-void rtw_regd_init(struct wiphy *wiphy,
-		   void (*reg_notifier)(struct wiphy *wiphy,
-					struct regulatory_request *request))
-{
-	_rtw_regd_init_wiphy(NULL, wiphy, reg_notifier);
 }
 
 void rtw_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
-- 
2.53.0

