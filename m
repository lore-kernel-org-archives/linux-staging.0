Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EE710958
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345273; cv=none; b=UBnK8V/nYHWe7Z1xv6FoDQXd6iGq0V7KG3OpWTZJHJndqnGaxBe241Yx1UikFN9jo6OGp5t1a4rk6IMhFFmTv7QmUbWm0reRPTHPppzpzyMI+2FLYw3hIOokhuYKRaThWn7GC9UJRQBQ69iwzDADpv0PN2a7otwm/DTUe0SIidg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345273; c=relaxed/simple;
	bh=3ZTw8BeceEMrLI2eXWrhHPIMhWTE257zxH1ARkgOI/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CQh6o1lQ6KrdeIhm8fqHB1Gpxyd0WLOSnAnIF2iM4C5mHPzndTpw8M8KcBZiJ4r3Pbx8an2zli4FI7q5eHD73T/+G0D1Brcj/QdX1k/CItzGpm2Nhp45HIYPURhl9rKNkEcGLIfKdBkpuVYe3STWamIIUS3T6G7ANIBlfKzecQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=JEp8J8On; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="JEp8J8On"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2a2da57ab3aso3341541a91.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345270; x=1714950070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6pdYepRZz8G1EwreRVScRjhNUy4bVKjwuiU8xh1WxQ=;
        b=JEp8J8OnoZXwtNPn0vwbof+0JOTWd9xHx5GfJ7F3dsd9wYvoeURtq66k0SGic/aUPd
         vm9LBU3DMK6PbmwZGX6ovMIdAGgzjc/G+0RIc32J3h87hKxS03Su3TwiMl8fozvu9OAw
         DR5Kxd1VepKx43Mc7nc2mKd6KJKVO9/MnVKmH5fK/M91eh3uXHmkAeqRCeoCt8cAspyy
         4VYFCO6NyFEGL98mC4YktKHwZYyaPdxBA2vL8eIlr5haKCWEpMZ+YbXZBxjf9S0BXY6/
         Lel/OaYMMSBspug2qZ49LQs6LwManwk6wZjbs5DszBgErw93/+1WFIDSdsVDaj5xnU90
         P1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345270; x=1714950070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6pdYepRZz8G1EwreRVScRjhNUy4bVKjwuiU8xh1WxQ=;
        b=UpRLNYkVBRZ5Q6m2buMlMqNbYnzsqE+gkYFd8t8MTIrl/p3zVm4DjZ9lGQVBxP/mpb
         PBz0M9/wKz+rcCKXxxEvZn5f7z1Dp/O5EUqM2PrjyDu004R9A+FK855PyZDSZBqXB2Qd
         NrhIihCDpW+eYq0b+/eceK/TexxhTYPH6nI0cYiVLtoar9Jje0J9abgq1lKizKRHxrgk
         C2P3VKOzxmfBrv3PcfSKgR1ts1Lsp7TwQVlMZFEzuk/Rp/7sUj5cMIeQ3BdHFFlr99TL
         ngNWmifwopbLtm8xXmNNdcKhgAdrirh7OAEvJcUA1NuvuvLGFjX349rkvxv30RhTeUr4
         1pcg==
X-Gm-Message-State: AOJu0YxEgFjwBHjIKecVFWe62ViIU7j9rUvbSYRVMT8bm7lP4JSC19Ox
	U55TYq6freahOwApkgMh+67J10PPh1iqy1c86SOI4GHzl5Dn2SjjAz66QUwJ5KQ=
X-Google-Smtp-Source: AGHT+IF21UBD9P5VB314FqSjAvmC1hZ2R5W0zntXq9dHkyC0QLzOSszvvqhMX0h7QWUpecwyBoH6Pg==
X-Received: by 2002:a17:90b:2303:b0:2ac:8366:8ab4 with SMTP id mt3-20020a17090b230300b002ac83668ab4mr8214191pjb.38.1714345270321;
        Sun, 28 Apr 2024 16:01:10 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:09 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/18] Staging: rtl8192e: Rename variable CurSTAExtChnlOffset
Date: Sun, 28 Apr 2024 16:00:49 -0700
Message-Id: <20240428230106.6548-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CurSTAExtChnlOffset to cur_sta_ext_chnl_offset
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h        |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index a4580445305d..eeb5a5eb94be 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -109,7 +109,7 @@ struct rt_hi_throughput {
 	u8 forced_ampdu_factor;
 	u8 forced_mpdu_density;
 	u8 current_op_mode;
-	enum ht_extchnl_offset CurSTAExtChnlOffset;
+	enum ht_extchnl_offset cur_sta_ext_chnl_offset;
 	u8 cur_tx_bw40mhz;
 	u8 sw_bw_in_progress;
 	u8 current_rt2rt_aggregation;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 618523bacc8e..e82e8c50c090 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -638,10 +638,10 @@ static void ht_set_connect_bw_mode_callback(struct rtllib_device *ieee)
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
 	if (ht_info->cur_bw_40mhz) {
-		if (ht_info->CurSTAExtChnlOffset == HT_EXTCHNL_OFFSET_UPPER)
+		if (ht_info->cur_sta_ext_chnl_offset == HT_EXTCHNL_OFFSET_UPPER)
 			ieee->set_chan(ieee->dev,
 				       ieee->current_network.channel + 2);
-		else if (ht_info->CurSTAExtChnlOffset ==
+		else if (ht_info->cur_sta_ext_chnl_offset ==
 			 HT_EXTCHNL_OFFSET_LOWER)
 			ieee->set_chan(ieee->dev,
 				       ieee->current_network.channel - 2);
@@ -650,7 +650,7 @@ static void ht_set_connect_bw_mode_callback(struct rtllib_device *ieee)
 				       ieee->current_network.channel);
 
 		ieee->set_bw_mode_handler(ieee->dev, HT_CHANNEL_WIDTH_20_40,
-				       ht_info->CurSTAExtChnlOffset);
+				       ht_info->cur_sta_ext_chnl_offset);
 	} else {
 		ieee->set_chan(ieee->dev, ieee->current_network.channel);
 		ieee->set_bw_mode_handler(ieee->dev, HT_CHANNEL_WIDTH_20,
@@ -680,14 +680,14 @@ void ht_set_connect_bw_mode(struct rtllib_device *ieee,
 		if (Offset == HT_EXTCHNL_OFFSET_UPPER ||
 		    Offset == HT_EXTCHNL_OFFSET_LOWER) {
 			ht_info->cur_bw_40mhz = true;
-			ht_info->CurSTAExtChnlOffset = Offset;
+			ht_info->cur_sta_ext_chnl_offset = Offset;
 		} else {
 			ht_info->cur_bw_40mhz = false;
-			ht_info->CurSTAExtChnlOffset = HT_EXTCHNL_OFFSET_NO_EXT;
+			ht_info->cur_sta_ext_chnl_offset = HT_EXTCHNL_OFFSET_NO_EXT;
 		}
 	} else {
 		ht_info->cur_bw_40mhz = false;
-		ht_info->CurSTAExtChnlOffset = HT_EXTCHNL_OFFSET_NO_EXT;
+		ht_info->cur_sta_ext_chnl_offset = HT_EXTCHNL_OFFSET_NO_EXT;
 	}
 
 	netdev_dbg(ieee->dev, "%s():ht_info->bCurBW40MHz:%x\n", __func__,
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index d6bc74ba9092..11542aea4a20 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -319,7 +319,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht &&
 	    ieee->ht_info->cur_bw_40mhz) {
 		b40M = 1;
-		chan_offset = ieee->ht_info->CurSTAExtChnlOffset;
+		chan_offset = ieee->ht_info->cur_sta_ext_chnl_offset;
 		bandwidth = (enum ht_channel_width)ieee->ht_info->cur_bw_40mhz;
 		ieee->set_bw_mode_handler(ieee->dev, HT_CHANNEL_WIDTH_20,
 				       HT_EXTCHNL_OFFSET_NO_EXT);
-- 
2.30.2

