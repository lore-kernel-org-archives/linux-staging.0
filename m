Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8623909B5
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154444; cv=none; b=gA/Rp6d6Tw1mmGuB5XRYb73xqIgH4fmgSSr6x+ht6AD6ItyLzofoqWBo8c7z91/EfzcMML0N+1u1cmkfSwk2lyNcK7I38QHTBMP+QgF3IOtwPE+2IqysNk1YxrHbCOHtE+pgCRKDkbwpTxz9Hy9rqp3Lj6vXSDVzuFxaJews9HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154444; c=relaxed/simple;
	bh=9NB9HpCZfmReuMYP/Y0q5CEUae/aAMgFOQAOeaSoRQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XusHf+fH+Lqn4Hqx0oG2JHmJfksA31Surs2w9g/lotXNC8jQD2BrjAP3oOXcnSgxoVgjkahg+I0fqPtV4A5Hg/ow/7lDOtqmSCtSzcGAf3SsM5HlsqOoHv7yPVz4J+wfkcWZbFIWKRomA1A3//hhSdkbE1n1971gwVm6/dYo4O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a041eae5so38755445e9.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 01:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154442; x=1776759242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M57UvzsyA8JO5Dg8/Uas36rcEuuBBfC/SWXx5zYE4s8=;
        b=TRHZLTe0zXLwvzkF4p4/tyuIXUroOKXKM7l94ieprO0fOBDKF2DDEeLdyjn2a4IkFg
         PgUPVpZceOBHOt31qXWde/WzKLEwbPIYfdCgp/E6sQiE6Z3vi4BHvw0WEjX9LmZMC0Ys
         gcFq+R7knnNWKbvi3K83MZriOaBkWCP+awIs3ihW0InCjidkZ5RrvBa980RbsIPUAEIm
         qMFcI5YvH2/EFl183FAT55Cw6ty3kW4ZkjjV1WPYffXV14JgUWIrk43eiDl7qY4hDy+5
         NTF4fIUimNwXFYhcCUv/yWJ5h+NMSSuscGJ4C739FjUG/+uHyybJ8QtJvMOqG81PXlP4
         Coig==
X-Forwarded-Encrypted: i=1; AFNElJ/Y/forixSQvrbBTFITD8ytO/St/gUxmftRX/fvQyeCLIXAzCfS+0w+WlUWgg+ElNO6SnMDQW8REGZgqRAY@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0rYBD+8c4+FWO1RqX4fSL7/CTkAy06kW7upHdq1qYHfL56i6F
	pqwBl1hqZJ8fjY4aQ5PL4xGbRifsLtBGFQHf6VHJwa+nKsheM6o75sjg
X-Gm-Gg: AeBDievE4h6qYmmekAxbutj8sOjB3mEst+5qSKhtqXDU5wOpHPUybbTt6T0ZtscW6HG
	CId+kjEB8BvgUtAmj36ucLRQafPxYPp7QD3kYiSR2X7lGlj687fl/+93lXyGNtxJqH//49BrI9T
	GK34t7iyxhS2dBHO8+YA6ozxX8w0VdJMgN43IKBSFLITvnFwAWqR5rNR9YJV2+VbjIt4/EcCeI2
	kOddhGL3RtuY3F1t2SzJbpbdxo5dugcLnKJLs5Hh8OqoTBOJ8M9KAmzRuk3c38iWdnseS551K5y
	eXJXHn+k4rtKX2c0HCRAboQZM4f2CTdsTj9jPHoFUkgnrem8xteXJJ6xDOiOlUH98dNnzldP7EI
	EMC03W90aozeypzOJpCAjnFIGXB6TyvW6t1/PjSi+XUu8i4BGvizI7XLyr8WAt7HLjNmHxkaOlu
	eOheCrkHSzSWMZneCUls2QV+6pMd+inKv/i/dfopEVHMWVl+hbRddl+Xjmf7gGIKCx6XK/EGGe6
	U/wpAkcYCzudF6m+KEY+9FWdY26fIf69ubNPBlnXfc57TpX6h63Jdbs/ZTFxi9rv1VE7eY=
X-Received: by 2002:a05:600c:6994:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-488d67bbcbamr228618795e9.3.1776154441498;
        Tue, 14 Apr 2026 01:14:01 -0700 (PDT)
Received: from localhost.localdomain (host-79-18-131-221.retail.telecomitalia.it. [79.18.131.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e826sm69040145e9.6.2026.04.14.01.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:14:01 -0700 (PDT)
From: deep@crimson.net.eu.org
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH v3] staging: rtl8723bs: remove unused struct rtw_regulatory
Date: Tue, 14 Apr 2026 10:13:25 +0200
Message-ID: <20260414081325.142313-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

The struct rtw_regulatory is never used in the rtl8723bs driver.
Functions taking it as a parameter are always passed NULL and
perform no logic with it. Remove the dead code and the struct.

Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
v3: Rewrote the whitespace as it was, my bad for changing it
to begin with.

v2: Completely refactored the logic to remove the functions
and the struct entirely as suggested by Dan Carpenter. I am
still learning the ropes with Git, so I messed up on how to
perform a proper cleanup!
---
 drivers/staging/rtl8723bs/include/wifi.h     | 11 -----------
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 18 ++++++------------
 2 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..592fa66341b4 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -450,15 +450,4 @@ struct regd_pair_mapping {
 	u16 reg_2ghz_ctl;
 };
 
-struct rtw_regulatory {
-	char alpha2[2];
-	u16 country_code;
-	u16 max_power_level;
-	u32 tp_scale;
-	u16 current_rd;
-	u16 current_rd_ext;
-	int16_t power_limit;
-	struct regd_pair_mapping *regpair;
-};
-
 #endif /*  _WIFI_H_ */
diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index f9c4d487badf..c48a1e3ba4ac 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -83,23 +83,19 @@ static void _rtw_reg_apply_flags(struct wiphy *wiphy)
 }
 
 static int _rtw_reg_notifier_apply(struct wiphy *wiphy,
-				   struct regulatory_request *request,
-				   struct rtw_regulatory *reg)
+				   struct regulatory_request *request)
 {
 	/* Hard code flags */
 	_rtw_reg_apply_flags(wiphy);
 	return 0;
 }
 
-static const struct ieee80211_regdomain *_rtw_regdomain_select(struct
-							       rtw_regulatory
-							       *reg)
+static const struct ieee80211_regdomain *_rtw_regdomain_select(void)
 {
 	return &rtw_regdom_rd;
 }
 
-static void _rtw_regd_init_wiphy(struct rtw_regulatory *reg,
-				 struct wiphy *wiphy,
+static void _rtw_regd_init_wiphy(struct wiphy *wiphy,
 				 void (*reg_notifier)(struct wiphy *wiphy,
 						      struct
 						      regulatory_request *
@@ -113,7 +109,7 @@ static void _rtw_regd_init_wiphy(struct rtw_regulatory *reg,
 	wiphy->regulatory_flags &= ~REGULATORY_STRICT_REG;
 	wiphy->regulatory_flags &= ~REGULATORY_DISABLE_BEACON_HINTS;
 
-	regd = _rtw_regdomain_select(reg);
+	regd = _rtw_regdomain_select();
 	wiphy_apply_custom_regulatory(wiphy, regd);
 
 	/* Hard code flags */
@@ -124,12 +120,10 @@ void rtw_regd_init(struct wiphy *wiphy,
 		   void (*reg_notifier)(struct wiphy *wiphy,
 					struct regulatory_request *request))
 {
-	_rtw_regd_init_wiphy(NULL, wiphy, reg_notifier);
+	_rtw_regd_init_wiphy(wiphy, reg_notifier);
 }
 
 void rtw_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 {
-	struct rtw_regulatory *reg = NULL;
-
-	_rtw_reg_notifier_apply(wiphy, request, reg);
+	_rtw_reg_notifier_apply(wiphy, request);
 }
-- 
2.43.0

