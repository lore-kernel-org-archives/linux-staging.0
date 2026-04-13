Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994273B8935
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095082; cv=none; b=moAMwzrIE5fisu2f0Ow5AFzD+HvwscTM3tVbiDZICchXYJuIkgKBvRq0zrFqe8Hwf4JT2ujXiyRu8FIV/yeNnymP/0faghxEsmJRVZCVQ6/SwCFuDvBE/XXMMyvtxsG+8FNzC4oDwwoqe7OBKknXUVy4ULoTIQVmadB2NG+kMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095082; c=relaxed/simple;
	bh=7SmlITb/H3wwWjp8+HuEYtoxfyxpgp7tpwx4GDER0Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eUj0ZtCKjFMf2E3sGxjZFlcethZK+uO7EWhsV37TLR6VzFHWfGYHgcCn0+rLmjs5lgaYu4j8LdVl7Sxx3UMjPHnKN5hoHfbtulFhmhP62qMCS2UdR1CRLVqJ2+/ogt40zb3oucEZY7tMXm9fMWrDqB5fQawH2W+lvFIQVOOzLAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so32451815e9.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776095078; x=1776699878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WN1aFDm/BojS9shT6hlQwnmrEc86mL1/vKIl6OoJGHA=;
        b=OTgI0GraNCuxJD0oR/ucKJxKmQOsjWIcyHLzh+ZZqxIPp+7Fw/Nfj7JwLtUMVpBHnf
         uwq5HxIsVVCi/KPnzDOiPkwkq/EnVs7P+y0VL00ct55JObNueKnG8lS/71io/L7Q4t9q
         d9mGIujhIO2TEOgR8UdjK9mmL22pDRkFxCGtnbeS6REB8FLgFFbs0CoE4iknumS57zcd
         BZfenKeSCDGoiE/creEU+ivX9752Mx85gPG4nYdBfZOLD07HHgP4ocdP+4i2n7yhGQpa
         XQe8LGuuMc/bMnDX/vi3JP1SKDQq+K/KLBEQLfk7iWAbKI/W8ACmokU0S7l6b/ajOiYm
         LLhw==
X-Forwarded-Encrypted: i=1; AFNElJ8uxPTDdOmHhYwiUu/YJow/z64E+7X/n474mSTCKh2VMur2DubuSAtWf9ba2vyIOzqfFJVdwvRGJpU+RCZC@lists.linux.dev
X-Gm-Message-State: AOJu0YwCjxbaBurZaczz8OdFCXB73p5khZqgBFaXKa1cd3QAaUj2f3dr
	O2BPtPhyW/N2jRVP3dkQ2NMbFumx+jDZffZb/fR3mDKs3dfcA5410w2n
X-Gm-Gg: AeBDiev8tW6b2eAiqur1CKFczw5MPTmyO4Gy971qEr64PZ/hRnZJGspvVANf3EeKWNJ
	grZhof8GwIwA9UbkcYUGHD58wPXO06qDCX40CE9bRa7tFZWWnmpltaLg9sD2gtNcFCnJio5ENtj
	JOrmTLRPtV7lsGSFhiejkLAv+Crw5yxop/mds4pLj64Rmsuozx3LxKuIWrKHkzWt5T2t9jgXH2F
	7ZyHIHdzxzT6BsSJ19ugEE4vg3VoQzmXWTGlYL1LuKS3lYOxKhzyl0g/KXhQZOMZIDKyepGw6Cz
	PKqIoIFuD/OLejFau+fXGUiNIGx0xwdwSMo2e0dPVaEfVaH7bs0IYc+vCF5nqpiSmF8toRrU2nw
	2FSppTs4bzuimtQ8XCgsv81qB6Mgr4ooOxoyeRQqkUnfPJzhLogFRlGEzh0kui93GPrMBYEKYVW
	eZJ0GVHxygwZmwS3PRnlByzgZ7t6myuycWclEJwG8VHzrbMUCmwt96YlWNReCnOW/64HFaJgB/3
	9iKURHN
X-Received: by 2002:a05:600c:630d:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-488d687cfd0mr186378475e9.27.1776095077505;
        Mon, 13 Apr 2026 08:44:37 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac1:3920:50::27:ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5380feesm377928475e9.9.2026.04.13.08.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:44:37 -0700 (PDT)
From: deep@crimson.net.eu.org
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH v2] staging: rtl8723bs: remove unused struct rtw_regulatory
Date: Mon, 13 Apr 2026 17:44:32 +0200
Message-ID: <20260413154433.1366476-1-deep@crimson.net.eu.org>
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

Suggested by: Dan Carpenter dan.carpenter@linaro.org
Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

---

v2: Completely refactored the logic to remove the functions and the
struct entirely as suggested by Dan Carpenter. I'm still learning
the ropes with Git, so I messed up on how to
perform a proper cleanup!
---
 drivers/staging/rtl8723bs/include/wifi.h     | 11 ----------
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 22 +++++++-------------
 2 files changed, 7 insertions(+), 26 deletions(-)

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
index f9c4d487badf..3a43d0c8b142 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -83,27 +83,21 @@ static void _rtw_reg_apply_flags(struct wiphy *wiphy)
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
-						      struct
-						      regulatory_request *
-						      request))
+						      struct regulatory_request *request))
 {
 	const struct ieee80211_regdomain *regd;
 
@@ -113,7 +107,7 @@ static void _rtw_regd_init_wiphy(struct rtw_regulatory *reg,
 	wiphy->regulatory_flags &= ~REGULATORY_STRICT_REG;
 	wiphy->regulatory_flags &= ~REGULATORY_DISABLE_BEACON_HINTS;
 
-	regd = _rtw_regdomain_select(reg);
+	regd = _rtw_regdomain_select();
 	wiphy_apply_custom_regulatory(wiphy, regd);
 
 	/* Hard code flags */
@@ -124,12 +118,10 @@ void rtw_regd_init(struct wiphy *wiphy,
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

