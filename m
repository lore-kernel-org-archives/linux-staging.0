Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48D3566C
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ak0ebSqq"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5bd306f86a8so2586949a12.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063378; x=1701668178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mhtCZ2FPHkfJMzES7tFYFByhVEv5qF9kyJcqPMGxvU=;
        b=Ak0ebSqqnEDGHov+DwqBApts70wnabYPBTfXnFFormVYg26tm+AHo7n55m59ybizzD
         ZYWOObNpd+F8BUR4QYzWVfJOvd/AgpjkOkv/IF+b4xvdFssmcfx8HlnDkl2IEv1L5ebz
         nVIeRMazCuH8COc0uufZziaG2wKMz4srhWR8IdhBQGV9tijSiOjFJz+KCALjlMVEdmz+
         u2Qsp9tBV/Mx+oOw2s/uaf7LwyG6SpPc4uv+NL8nNL9VqhF7NDzRxe2VQlhyI4Mcodbu
         H/MCcEbXMeY3dDpkucBT9/1KX4gwt/Pu68UcTbEfOgBMHJeYGwh4x3sHJBvh6/QArUc3
         sWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063378; x=1701668178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mhtCZ2FPHkfJMzES7tFYFByhVEv5qF9kyJcqPMGxvU=;
        b=uiThFk+HT36dVpUXfom3FjpNTJb3/m8BmWrBNSZMlVQHesmRNIJdJx7K3Ecpqf9s3x
         3uOK58SIDZZ9nRWcGAhfYsUbzry4xnbapIP+Jsxbt8kzHA6Eg+Ce07/FU+q5iTski7tz
         KBU5Kq5XAU9AaTBKkOjLb9ZAEoqna/rjRfrHJUNOox5SBWphYmFwSyMBvL+U/7h3PHCw
         uuHUjLPJDYexx+2W6XCziOxADbfHChtkldrdXUA2ZgPBpW78MEzs4/I4GYQDMsV4mAMF
         YdSWlDIa+fG6lF/aBdkzdvw3JegDDKUvbeLMKBjrdhxFp8jP1lZLVy1yROskHtoVmOBT
         piPQ==
X-Gm-Message-State: AOJu0YwnjQPiwSWH7GV1cylQV5T47X99WuNEa0fRKxlib9v3G6Whu82D
	cgHiP0fv3BBQyShye/qgMKKnlMMLSE4G8y7jo2A=
X-Google-Smtp-Source: AGHT+IEud1ssm4kngq3IOpf/LNa3Jt2Gd16D1urJFcRr2xOSzZtw9tCi93NJGF3GOu4LV8QrVN9dWQ==
X-Received: by 2002:a17:902:dac4:b0:1cf:d7e2:5e73 with SMTP id q4-20020a170902dac400b001cfd7e25e73mr470783plx.49.1701063378238;
        Sun, 26 Nov 2023 21:36:18 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:17 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/15] Staging: rtl8192e: Rename variable BAReq
Date: Sun, 26 Nov 2023 21:42:52 -0800
Message-ID: <20231127054305.148276-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127054305.148276-1-tdavies@darkphysics.net>
References: <20231127054305.148276-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable BAReq to ba_req to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 497791a980ba..f6ba922dc82e 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -68,7 +68,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 				    u16 status_code, u8 type)
 {
 	struct sk_buff *skb = NULL;
-	struct ieee80211_hdr_3addr *BAReq = NULL;
+	struct ieee80211_hdr_3addr *ba_req = NULL;
 	u8 *tag = NULL;
 	u16 len = ieee->tx_headroom + 9;
 
@@ -87,13 +87,13 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 
 	skb_reserve(skb, ieee->tx_headroom);
 
-	BAReq = skb_put(skb, sizeof(struct ieee80211_hdr_3addr));
+	ba_req = skb_put(skb, sizeof(struct ieee80211_hdr_3addr));
 
-	ether_addr_copy(BAReq->addr1, dst);
-	ether_addr_copy(BAReq->addr2, ieee->dev->dev_addr);
+	ether_addr_copy(ba_req->addr1, dst);
+	ether_addr_copy(ba_req->addr2, ieee->dev->dev_addr);
 
-	ether_addr_copy(BAReq->addr3, ieee->current_network.bssid);
-	BAReq->frame_control = cpu_to_le16(IEEE80211_STYPE_ACTION);
+	ether_addr_copy(ba_req->addr3, ieee->current_network.bssid);
+	ba_req->frame_control = cpu_to_le16(IEEE80211_STYPE_ACTION);
 
 	tag = skb_put(skb, 9);
 	*tag++ = ACT_CAT_BA;
-- 
2.39.2

