Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A760B9C
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748773; cv=none; b=cSqK4xY2fZCo8AsaxAyVQl1TawtvpXZVbwUDXTx3RftgUJEHu9HfGBU8zWfA9pPgQmCsJZX02KBNAL54s/+0gFiQRIqJhdDEMrZi+xe9K43jM/Jnxk8TTRuuPg3oA+s2JNrago9yOJA4yJp11/ypf7Tl1NfgIY9x3WBI3xgmj+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748773; c=relaxed/simple;
	bh=jeHwGwRspY2gSDSiW7bcMqqSAMEpU1ir/AH2Va5Ia+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SBVkSHQXRw7e12CcgzrO8tbwGl2JqpFq1dm0ZOFNdva6PG1LG49Sg0ofg/IY9cbWRlzxwqQBUVrdIxTvQiERfP79wuyhK3uO4mOmMxOXQNYZdaGUPbCiTT30O9nAY3CO49Sg4rzfkkZ9aFCCuBpYmYqPRpByRNkfsyYzPqoCJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=d0lLGM1D; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="d0lLGM1D"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c99fcedac1so1803108b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748770; x=1716353570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwhb6dTZ3C1pduwi/qMgE4+GQbsrnIG7yr+Npoq7eqo=;
        b=d0lLGM1Ddx2We/IIb4UXkYlP/C4O0hXxP8J8OtN2BKRX1WTtcWo9yQRN/oVVkoKtLC
         5o7UOW/cwFF0uJPZ/R/dKySA2jQu1O6gVwM7TfyW9CGEmRTdskqkakyyFl3hjveyy4mt
         JAcXW9a3tEHcjjF7duD3bnBySyVgeHaPBObMZT4racCnyTMs6LoGiSEEgbgnV4dJa6a4
         AybM3p8YySTMM1CjmezK8bMOZSn0JIMtTMtKWHS9NaaMGtQIscCAxQtMi/7Pvut4EgbH
         eTkYpW8oGGBQjP6bRrZaPdQpFyRbLWf0rH9ENAz/tAerfGVKg5woUFwRNUs/1axPmnX8
         aP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748770; x=1716353570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwhb6dTZ3C1pduwi/qMgE4+GQbsrnIG7yr+Npoq7eqo=;
        b=Crx8pA1OTJ+G1KcveWiQwM+0MJBouDpGkwFfJKMRN+rLY4886gEk1mjy0Ia9NJEjFj
         BW9xdmQ88YCyvwEOHr/oqy9bseaDiXxTb/Xu4sYH8aFCt5vmbwESnjzJApkT7Omj5iCw
         QshwF2ehSs+u9/vQSHhOoloNWghKQngvGId/gcRRAmIdoGKSpjXMN95RWMkuNxbTAE7b
         wB0vD9RECmagSB46o3yB4NIWry8+12giIsb6UuVDmQIQQn8g9wG++ZimZuj3SL9XxfF2
         A/FK43OvtsqCaQdIrjdnyyiGjhebAvCVR+k3/C+YuPDeMOzrygTVKpUUCukKWT01kF12
         S4YQ==
X-Gm-Message-State: AOJu0YyoXotufQ/LZ3FHsyhj5xBgOTR0hyozIuijjHfDAw+HIABrygbD
	FH2MSh0+6M5fbfej3+1gpYSHH6K6uezVhOt7Gf1B2CNcZan0pN0WAFi1tbhgWhTiFdsmv0ci2Tl
	N
X-Google-Smtp-Source: AGHT+IHt/YCmhxt/SaZFO/lhq5QXz83QsvoW3dfwRopaTVrCGTZvsqqqQtzcgIZIZCV6bMZ9j2/vCw==
X-Received: by 2002:a05:6808:1a17:b0:3c9:9fda:37f1 with SMTP id 5614622812f47-3c99fda38cbmr14168972b6e.29.1715748769895;
        Tue, 14 May 2024 21:52:49 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:49 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 22/31] Staging: rtl8192e: Rename variable IsDataFrame
Date: Tue, 14 May 2024 21:52:19 -0700
Message-Id: <20240515045228.35928-23-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable IsDataFrame to is_data_frame
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 4 ++--
 drivers/staging/rtl8192e/rtllib_rx.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index f69f4ca39fd5..0914ba37f42f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -338,8 +338,8 @@ enum rt_op_mode {
 #define RTLLIB_QCTL_TID	      0x000F
 
 #define	FC_QOS_BIT					BIT(7)
-#define IsDataFrame(pdu)	(((pdu[0] & 0x0C) == 0x08) ? true : false)
-#define	is_legacy_data_frame(pdu)	(IsDataFrame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
+#define is_data_frame(pdu)	(((pdu[0] & 0x0C) == 0x08) ? true : false)
+#define	is_legacy_data_frame(pdu)	(is_data_frame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
 #define IsQoSDataFrame(pframe)			\
 	((*(u16 *)pframe&(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA)) ==	\
 	(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA))
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index f276e52aab08..d4714e193df4 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -881,7 +881,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 
 	if (!ieee->ht_info->cur_rx_reorder_enable ||
 		!ieee->current_network.qos_data.active ||
-		!IsDataFrame(skb->data) ||
+		!is_data_frame(skb->data) ||
 		is_legacy_data_frame(skb->data)) {
 		if (!ieee80211_is_beacon(hdr->frame_control)) {
 			if (is_duplicate_packet(ieee, hdr))
-- 
2.30.2

