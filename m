Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0D13AE2
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919790; cv=none; b=Muy7YopuVnGSuk5wIdOn0yWvDn2qNS36D2+rGeqDStPmXLcfUceR8Mpx8IgVGgnJNb4DFMkAAaPnXBp1fi0eO9t+eEkqUrt4LHWyoKTReeQhm5CGTcPgiQbfYw3qtpOeGyE+Y1j+tOCiioyVyQ6iN+IhiveL0D83FkJiKZzFy8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919790; c=relaxed/simple;
	bh=sG2E7Tx1tg/+CAx5H6kqvYJ3Q5NCVVFSyDgm79XwFV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iGBoMpDlQhTkcWJWThs0BJYPuk+j3U9xJdcMIxhYFEOmntnMTUjHPQUD3ePDspFna+BIXLgBEG73J/9+yA5kKpEDWibn/QzVNBPSQZek3DfZPDhZn4yUsuKimp9y/mGO/nLVGOjiNxUcND3ee+mmSiLivUCbLipl/IqNQulzApw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=N0s7JWgP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="N0s7JWgP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so10200115ad.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919788; x=1709524588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IK4nK1+Wgv2R0A48KVW0YYzRGfghNu68PTm5896qEzA=;
        b=N0s7JWgPv1IquCt2pGlIv5uFaSV8dIrQcOjP9kXyE8COrf5uYPvjQfWLXBDeQ6AdQq
         CHepSM5rG+mrABhs/ICLzwgZFPsXjlX1rOvcM1G8No3jn3sYXjlJVUByCPyTviP0bbgd
         M1L80OCsuXfkDjvbpRpD7U6mwdwNxKVwevHU8y2/vJIeM4/XjlI1KHlyTgjFpxZbKb9g
         20pd9FKUsTCeksEx6zKe8+IW+czG78EP2tRhaT38SootOodSFwS5yb91SBvjmH9b+j5Q
         mQk8k2zs0NDKN9JLRIlTZBzs2LdfyJLxVHxUG3qvO5fksG9mtVQmof9cti9QgXiMxeQd
         DhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919788; x=1709524588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IK4nK1+Wgv2R0A48KVW0YYzRGfghNu68PTm5896qEzA=;
        b=DLuCA1HmwSCygi2ME8fEEFoP9/zyG7KCMClPaiGHvbIu6N1zBeg+ztNM6HiAh3DXK5
         mIy4/qD6ovQN0otrfgK2YC6vSHxUSAlUWtTpJpZkdT77+DbV6yDYWkm20NzPJHD0DyjD
         bRDFXbwQYoBvW9Ym012H03qluOEEu9QquEexKa6ICoPZ/0YBE7ucbfq7Yq5o/viTpogE
         ehUjNRJF+K5oZJO+f/t27XHGvhBdkKyIekLSLgb2ExrFB3CR1VIaQebQ0s9kEdnfTDgg
         dGM8oXMha35UYOLp5+0Y8fv+FA9h8Ylm4U0i9nAk4m3FT0S7sMXFuY+hPUbXh+WwcQ4e
         5RGw==
X-Gm-Message-State: AOJu0YzeUa/4+A7rlglaHHh17Av1L8P9L8NWAp+Cb3OKvmbeBgcy58Ij
	XQXQWU7swHWQ3TvrvTeOM74gM6wogr7GM2hb5fpS2YDnOkQjZH5j0mXn+kkzLGxbDIlvRILZWfK
	3
X-Google-Smtp-Source: AGHT+IGsPFCBVAuUvnJNjV4MnKOkICMtszR65BQ3kAjOqFuJHdFkBQRVHA111zC2v4NxO9gH1cya9Q==
X-Received: by 2002:a17:902:a383:b0:1dc:20f2:77bb with SMTP id x3-20020a170902a38300b001dc20f277bbmr5526743pla.29.1708919788427;
        Sun, 25 Feb 2024 19:56:28 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:27 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/20] Staging: rtl8192e: Rename function rtllib_rx_ADDBAReq()
Date: Sun, 25 Feb 2024 19:56:05 -0800
Message-Id: <20240226035624.370443-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_rx_ADDBAReq to rtllib_rx_add_ba_req to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index da7319c124e7..bd1d86e0323d 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -211,7 +211,7 @@ static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
 		netdev_dbg(ieee->dev, "Failed to generate DELBA packet.\n");
 }
 
-int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
+int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 {
 	struct ieee80211_hdr_3addr *req = NULL;
 	u16 rc = 0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 348644998744..95a8e9416f61 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1771,7 +1771,7 @@ u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame);
 void ht_reset_iot_setting(struct rt_hi_throughput *ht_info);
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
-int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
+int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 2545ac8963c4..f12ee685e989 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1551,7 +1551,7 @@ static void rtllib_process_action(struct rtllib_device *ieee,
 	case ACT_CAT_BA:
 		switch (*act) {
 		case ACT_ADDBAREQ:
-			rtllib_rx_ADDBAReq(ieee, skb);
+			rtllib_rx_add_ba_req(ieee, skb);
 			break;
 		case ACT_ADDBARSP:
 			rtllib_rx_add_ba_rsp(ieee, skb);
-- 
2.39.2

