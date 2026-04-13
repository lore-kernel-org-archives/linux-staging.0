Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24253C4575
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093895; cv=none; b=Cj7K+ISUM/oMddv8ydgpsW7V17plUUd9S9K3KBAbBOO/0qXxQcHh/0FJw2jDpRLX0gqTMkfe0YSY5xwHnS7GjQy7fZv/LKJR7ZqMgXohPmitTXarNDs50Ug/TbBiYz64DcqZB+ocagyVSa3DcUbo9/ogAm1V4k8Gp1CZBklaw2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093895; c=relaxed/simple;
	bh=ETWLp7L3ve/is1thJxJF4FTDMtcazIWqLKCelUl6cFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUMYQGeYm9S+hKuM8VWzcuaIT7JCNXGJwlAFWbTfhVb139xkYab7iy9rYBb4m5eEXbmgFVGj1i8edEQNIwQYzYDWoe5cGn9430l4M4lXqlwUJZYZ8sB35b6hQJ6lnDano4YagGkS5Y/+AanzW+lzCDNGCDTI5JJw1T5bJogcisQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so28452775e9.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093892; x=1776698692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS0CNrgXznE8yeQhJ5VRSFVvAbvG4lHRZsbtBKiwCZ4=;
        b=Wn6pflC08nXbUEuLWq1njJT/qI9NIn/o+Ksc3G1t0TqMvkLL70wNKr2BBge4UDHWHA
         cABRIUQdFQO99Zsaw+YMQ1mcevtAJ9lS4FEdjxd2hzbMK0i4tHf41qPr1XglVvU8TITP
         Vozf9ukp1g77JEV4Yi2aLx6DXeKzGBDcPzn+3/mut9qQVXzhXqKzfhycXSfWgwT7ZBbJ
         RQ0Kfw4jRJmRhhp7qp4Dngr2MM8UtnKpg22j7CC5O8FM3ntY8JoalHGvo68FAeCfmJfI
         rRS+cp2C4fspx6nqMivhteuWpf5q96H4g6e83eIHZouylp85fCViihZJWbXo+mP1QVzV
         5nLg==
X-Forwarded-Encrypted: i=1; AFNElJ8JACY3Zc+LcPunNpEtQ8f9OmWLC67SoSA5xuysEdrEz0+BPcjAZkvYGJ2/jE++6IfxQvrGHgii3ao1KHhY@lists.linux.dev
X-Gm-Message-State: AOJu0YxhBzZaM4qY+9m2hpja51Hq+SRqeFcplSJ+xDVvJqmA0FKVQObW
	64XULzmcyh/6WJY67n320mU2bNFHVbLd3HHhZ7RRweEgfw0amXOlUwpEe7jUwQ==
X-Gm-Gg: AeBDiesU0OkRb+uz+CoATwIlhATkz/slM3+irWnofRp3Zqzf4b8SiK309xSMAUZl10e
	r68p7NaGOV8/G/mQxAr7LH9bJjcvc7roCkT7qiYZ23HV5Z0JNeXSkLqTB+YZJ0JCKekl3Uot6kK
	aIfDukOmjlaF0ZWfmlkGzQP0+439EukTe2j5IaWYLk0QWi2tkZ8WDHDxHdL+HDdCd9gNCGkiyCT
	lXCJQwIUK/9/095vbWFACgJuMv1Dz4hFG/veWn6ffAesojQiMUWMPOSbWYyLUf8eymo8lTsXQXi
	OIDS7bek37CNeNreaGg7SVDS8UGpeVI/J2CnmTcC2p22mIV98RieBMf+ClmfRC9MKvSjkvLgAYJ
	Kk8PfTpf3c18iKMqf0cKGJ3gmTNeywccHL70FCLUrV/4WSpEPe8MWdfF2QXKzYzneQ2t06ZZ90l
	HQPeukYiTnK6gEe7Uef2jLJvFsbwwzaUS0J4BddkOZwG9PKb5RR2ma2tl05yixt3NYvdMa01Qoz
	wKveeZ2
X-Received: by 2002:a05:600c:5249:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-488d680079bmr182307405e9.13.1776093892170;
        Mon, 13 Apr 2026 08:24:52 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac1:3920:50::27:ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5cf2e70sm166833675e9.0.2026.04.13.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:24:51 -0700 (PDT)
From: deep@crimson.net.eu.org
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [patch v2] staging: rtl8723bs: remove unused struct rtw_regulatory
Date: Mon, 13 Apr 2026 17:24:45 +0200
Message-ID: <20260413152445.1333237-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

The struct rtw_regulatory is never actually used in the rtl8723bs
driver. The functions that take it as a parameter are always passed
NULL, and the functions themselves either ignore the parameter or
perform no logic with it.

Following Dan Carpenter's suggestion, removed the unused struct
definition, removed the unused parameters from the internal functions,
and clean up the dead code.

Suggested by: Dan Carpenter dan.carpenter@linaro.org
Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index c48a1e3ba4ac..3a43d0c8b142 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -97,9 +97,7 @@ static const struct ieee80211_regdomain *_rtw_regdomain_select(void)
 
 static void _rtw_regd_init_wiphy(struct wiphy *wiphy,
 				 void (*reg_notifier)(struct wiphy *wiphy,
-						      struct
-						      regulatory_request *
-						      request))
+						      struct regulatory_request *request))
 {
 	const struct ieee80211_regdomain *regd;
 
-- 
2.43.0

