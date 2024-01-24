Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A6135A6D
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136300; cv=none; b=UfA7guEU0Lfdc98/fL020mbccfBl7Kl4u5j8Z+ey+S+yYsrKYiCgNQFAkQL+TeJgNzkqY+T24wi5C5iEkx8rTi/rFKLwNGMMEY2VTDv8kq21B2uSuubhguyZnWS+IU8kBZw5uSRdrPrRDjEtDgjAshNxgQBuJUnfhm9F91qLql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136300; c=relaxed/simple;
	bh=GfWAlbCJEkaXj7meVqIZfFReBbav+A1O3s6V10t3Z64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ub5jAhh4TlfcLv6YgnK46sFjZfODNVx5xigZbEBsJkOXDAmX3kSkEqVxew/odNZxk4vHyBzsid7LIJ40s8+zfwqs/A1THic7N6R1dAn51jf5hpwIlZIUk1ULqchGakuFyAUx6eAh5EW4f+q2ZhiYdX0MXEVYu+BBYcED5z/2/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Pkja3Xhc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Pkja3Xhc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d73066880eso38173685ad.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136298; x=1706741098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lend1c+2XgQTDI7pDwrpRTYkCgdYKaKbQn9DvF9y7QM=;
        b=Pkja3XhcQTkxlPzyUeAjwiKHGe71uGlw78x4xWNrUBpR1KZPLu2oHNpC8t9nDwXfQI
         klg4XgIj+JtC/B9weEW7elQcjfrUQgVBaEYycQlJf8F8rhreux0+ffL5fhljWpCkdSIa
         jBOUFLehAC2NiXCSL1WrnbBFSVoBBamqJhzw78Hjxa5dipNVHVNWWf1Nvjg4P+QtmHOx
         UHDkuNHSOnlpB+v+ibmmsUp4fdr5JzhrSzZbqLxkrQ5l1xTg0GG/2GPUGjqKlNkKvUNn
         IRZzvKVPJ+oApETerMAN58ghCtlHtS0/KGscw9l7iHAcYOUYyOFX6Z1z/xKJnH9Ix+Hp
         e+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136298; x=1706741098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lend1c+2XgQTDI7pDwrpRTYkCgdYKaKbQn9DvF9y7QM=;
        b=Ir9Q5YiNLkg3NiLmPBWBFz6g5rnwHcBAz3eblGZa+YgDwNJZFgVqJGo6VD20svKOuG
         iBBmNx7I5dYj9pkJq54AMSETv8PUvI/lEmePVZ4/yrhkPNMDWn9iz0dw8ARpqbdXlR3a
         Bmd+SWZ5bHk3TZqdWBRix5zAKJYhUd0p1V63gnzPDWRh/C0SgGtXLhEkKnZbv2o43r5e
         gb5rsoFbtW1zMfUQXHa6VAlvn+H3OhbJ0xYLd8bIFMH3livPvN9BFlr6hSGLmThnt0tc
         911l2c8kwsjmgnJ2tVmmXOP067yQiyZDroyhGpnU+R9uVSI2x6KdthbJzwv+BduHCG5g
         mMmg==
X-Gm-Message-State: AOJu0YyZ+527M4VU/4ezOENBVg0AB0mMZ7A3HwILJXT2pkhduUhqopnb
	FRhMECSk1FeT+/XvF4ggFv+WZAyX+vhK79JyrnKYD6urRmwH4AHwAkVYF7p9Twk=
X-Google-Smtp-Source: AGHT+IG76B4urlG+Fd+2o3qlJY1tSulF9yGBiT3cAVFw8XG5S943j6nNNRzfd5yO+TxI6lAPvhSyDg==
X-Received: by 2002:a17:903:1249:b0:1d7:b00:739c with SMTP id u9-20020a170903124900b001d70b00739cmr91191plh.102.1706136298006;
        Wed, 24 Jan 2024 14:44:58 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:44:57 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/18] Staging: rtl8192e: Rename function rtllib_rx_ADDBARsp()
Date: Wed, 24 Jan 2024 14:44:36 -0800
Message-Id: <20240124224452.968724-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_rx_ADDBARsp to rtllib_rx_add_ba_rsp to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index ee9ce392155c..da7319c124e7 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -300,7 +300,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	}
 }
 
-int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
+int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 {
 	struct ieee80211_hdr_3addr *rsp = NULL;
 	struct ba_record *pending_ba, *admitted_ba;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 13a901c0db1d..94f370b40378 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1772,7 +1772,7 @@ void ht_reset_iot_setting(struct rt_hi_throughput *ht_info);
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
 int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
-int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
+int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 			   u8 policy, u8 overwrite_pending);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 44b36cc867d9..cf855ba39c10 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1556,7 +1556,7 @@ static void rtllib_process_action(struct rtllib_device *ieee,
 			rtllib_rx_ADDBAReq(ieee, skb);
 			break;
 		case ACT_ADDBARSP:
-			rtllib_rx_ADDBARsp(ieee, skb);
+			rtllib_rx_add_ba_rsp(ieee, skb);
 			break;
 		case ACT_DELBA:
 			rtllib_rx_DELBA(ieee, skb);
-- 
2.39.2

