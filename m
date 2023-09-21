Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345301FC5
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:30 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6910ea9cddbso228293b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266489; x=1695871289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KASEbjcOhE/m7ePWr35T+nD0DZh8w9pj8YmAibT9zBE=;
        b=Lv110IyuVnkbRk0CKjj55tieJDgiNS8hIC0sVumrocPFs9nYfvxllG5c7ZcstZzsD1
         HXWO0cHVyHOmNlualdQZvXpoom0JNo2MqKwrrpALLHU7+2mUVRxdAatTO4rJ4Djhz3nf
         IOnjncVLpyhJWn5lR81c6jp2khuKXtUiSBYM9iXVRZzkCDW8vF1BZY0c3Amo3OzwVKvy
         6vfCUg5PMrQqXjIIMVlppF+AARz2zC/37KDAVVp7TFYV0XIarkAKqfWMhoy6F+Se75lF
         OsR7nTjTvG0moXSn5oS8WzJHMMHhj1V5ubNZfeTZjv9iENh96MkV33oT39k0Gk09uz3w
         BdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266489; x=1695871289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KASEbjcOhE/m7ePWr35T+nD0DZh8w9pj8YmAibT9zBE=;
        b=n3Suz48JOk1mgIVmgds3kYOea0icDOu2TiheKJfJ7Pz4SVa32gw80iBnWiMqYvcWmU
         QvMKk39H/ZJ/oir8aAfIhdZxIy8LB3YOVxYgz/kzwzvZCvN57ZV63sRohcrEBT+s7rRf
         3Nj/2ry3bj6cd2VMJxyqvEDt9XnGhJ4Rnsu/p4wsKNwLbQ+pbc/G0K+o0xbcrtKGn/bp
         dkOy93K0HJOIQqHx1/PoIVxGXkqzmFlyDZh60V+3E14804TkUfkMWL4ICIxhd41lFl63
         GOG3BkIP/QR6JmYmxfFr23UhA/sDl+FkbPlfqr3PhijgihtF0e75zDwIsYT67bQITvzF
         Eo1w==
X-Gm-Message-State: AOJu0Yz0iLv+w+IjiPnwF6WuAA9iRnV2Cfp0m0sMcMNIhfGiAU9IP8kS
	huOv3GuAyLQotzyVcp9nxwS5Ew==
X-Google-Smtp-Source: AGHT+IHTOpTLQVGFk+v9hBQxxH5KVJxj63qlsHnHihr5lTRkcxoDV4HQKHpRmL60fXq0cCvvi7j8GA==
X-Received: by 2002:a05:6a00:248f:b0:68a:53e6:1fed with SMTP id c15-20020a056a00248f00b0068a53e61fedmr4872695pfv.23.1695266489689;
        Wed, 20 Sep 2023 20:21:29 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:29 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/11] Staging: rtl8192e: Rename variable Dst
Date: Wed, 20 Sep 2023 20:25:08 -0700
Message-ID: <20230921032515.96152-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921032515.96152-1-tdavies@darkphysics.net>
References: <20230921032515.96152-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Dst to dst to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 5642e7788e42..621dbca7716a 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -63,7 +63,7 @@ void rtllib_reset_ba_entry(struct ba_record *pBA)
 	pBA->ba_start_seq_ctrl.short_data = 0;
 }
 
-static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *Dst,
+static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 				    struct ba_record *pBA,
 				    u16 StatusCode, u8 type)
 {
@@ -73,7 +73,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *Dst,
 	u16 len = ieee->tx_headroom + 9;
 
 	netdev_dbg(ieee->dev, "%s(): frame(%d) sentd to: %pM, ieee->dev:%p\n",
-		   __func__, type, Dst, ieee->dev);
+		   __func__, type, dst, ieee->dev);
 
 	if (!pBA) {
 		netdev_warn(ieee->dev, "pBA is NULL\n");
@@ -89,7 +89,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *Dst,
 
 	BAReq = skb_put(skb, sizeof(struct ieee80211_hdr_3addr));
 
-	ether_addr_copy(BAReq->addr1, Dst);
+	ether_addr_copy(BAReq->addr1, dst);
 	ether_addr_copy(BAReq->addr2, ieee->dev->dev_addr);
 
 	ether_addr_copy(BAReq->addr3, ieee->current_network.bssid);
-- 
2.39.2

