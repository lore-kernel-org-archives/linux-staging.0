Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F3534DB44
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604243; cv=none; b=sG6QQABnkx1ebjDXEXli2GxcbXs/Y1TY0dokDr1xCaPSDjopeXAX78Son+r0zXW6885C8TeCX6SeUBoKECNwRb1r7GSaLwHq7NDfWOl1x+wJK/5ljBZHRS0dzSi/xNUp+R3Bz9KTZyCtj8A6PCFlBd9irxUFwgyxRB2pbhrszMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604243; c=relaxed/simple;
	bh=F7Aa4nvaJfGAyLEhG75BhryxkwxUBxI/xnEm8mDpSnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsZW1IDB9IkvF1fjRnkugJb4MlVfX8uVpqKHsg72cOdIq20ZmvH3RZVJ0HMpQMMA6uNMzewW7D/x5RWMmLhININUq/ePqZBAHXkhXhiBZc0OUFy7V9U5e1Swwc3CXHkjSxCj8yC/ia0tmkM22RXykIa5LiJqvP6fG8LlUf6S+vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=FQhnViMW; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="FQhnViMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604240; bh=F7Aa4nvaJfGAyLEhG75BhryxkwxUBxI/xnEm8mDpSnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FQhnViMWhwDT3DtUb41AymJzUKX/FbOzZp4lXfmTTyJz5mPoKVtgGua0FJHHR8pso
	 yUYIqqstrFFjPodSSt+Ab5M2LfP/sNvd2BQbDRpg5YdrPisRkL1G1ZFLPmHhIaV0Qc
	 Hqoq/DC0t2zYJc9e5IUZ0978VxB297YM+vMP8/KqyrR4eVxSXLf/JTkDkaiK6h96yf
	 1msKIlO2a3i1ktaRlNfXkF9Yq0UAcV3H+ZMf8iqABR2ySz6Yg4p6Zzk83APmV3b4gl
	 4fGRMOyec/NBbij11PytiExDUCnJPex1kV2pxlvtPbRegsRABLi9y6X+xa4hkjg90C
	 mrsfma4rTX5AA==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id B95C3406A4;
	Fri, 20 Feb 2026 16:17:20 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] staging: rtl8273bs: Reduce useless function wrapping in regulator code
Date: Fri, 20 Feb 2026 18:15:20 +0200
Message-ID: <20260220161611.2398915-10-plaes@plaes.org>
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

