Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05474BF8
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261461; cv=none; b=mdpKdm/Nl+8RzhIyNZbSUz24cBp9bqeQSLZ4fbedB79ntfsQ2EQRAAFAfj0/7PVMKd+umJCzs44JjPsd4Tuv7IcG+QDJVLFrW8Z6pOkFNQDlQRlfsCO5uWCrOZj6hgQj7sEv71g53DaIfO/hXWKn/H+c26NeahOfp2j+9uv9xMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261461; c=relaxed/simple;
	bh=vJHmGCnlTHJFDnVcYQjewmNGAN8HLDG68bKJqwbNMA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ejdt+nHKEgvcUr6s6aYUZflVLVLhK4kV53lw2+uqQtwFTmhSBNILEDaDxUfiC92eZPN86Bm2Sg2W0yjH6niJDnhLLAVbIS3qNEOKBSFPaC/LIIQvBAFJ2LGI1P4YEIIIpyjiBv92l4ZTd9qWs7sBmdBcGa1EKRDaj7CeFJej40g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=SedFTHe/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="SedFTHe/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ed012c1afbso27114175ad.1
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261458; x=1716866258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpJfdLLLMHxwJAQ9HWJFKbBxT/10Yc80Go3jO/vuxHs=;
        b=SedFTHe/EXkCl5UHrW5c+nsFG8WcC54yuczbI7RDm6kW1osyJnP2ZwDs1Aa+pvjDIg
         UfZGcgAvukz6kqyIOeQkP7OX3qbpTTdUsKcOSTGf9M5KC9cUiiBP7K0D9+62tbh4NHgf
         Hjaht7MJqa3oXI/tfs9OaHvv6UVTRvtkIn1rPNsqXTta1rmH8DLaNouA2XeJzRjRn+m+
         S3wuUpLgxsLN+BdVA0PgY1ja7ha0TRKZH1bEFK7Qg3fmuWQkPZNf1M5aWtUkXmG+1LA1
         bukEpaeVjabQbjKSC31WubniUYpR5NB6viGJP06Nl18U+SgxNXssyXCkCLmg39Pu1cru
         RqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261458; x=1716866258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpJfdLLLMHxwJAQ9HWJFKbBxT/10Yc80Go3jO/vuxHs=;
        b=EHGIw8PkM/vA4fC3Fe354MsCnKtwZlpzJkZBpcYO0bpQfK6/QhZRiw1WhM958ACVNa
         86EUXWAQsiBptRJnI5ksAdpMqKuFOxN7YVTEJbYoZT5E4MOSE6eEPVIuJS6BkxgpG22C
         tFS5EGeSinK/RaKAooayf+BDADCUZq/YR7gQZZd9+zOB9BeN22ej2Wol1h587DUm2QGf
         gPpWS7RUqnw8p741qCqtPdyKFv1oGD5w641c/X4r9CfSi7tvX1kQ7U2kRukCWiRlJ7t4
         WIHA83fC0vo1h5ybCbq5Mh5iuUI5xtrkzOT/nEzIRNL6WYXdT5VgbTAotlXmhmryV5aA
         AdTw==
X-Forwarded-Encrypted: i=1; AJvYcCX+2WCGluBAmzjMEVRW34AzRPrrhHN3e+Ne8QmJDkI91I7Z+PSVM0j8c95lVsevtW/rfnGf069r0tOZPZGjDdf0R3ZkqArymfs+T2PgQw==
X-Gm-Message-State: AOJu0Yw98myguWzQknbginR/ft8JhbOjr9rf0fMJ6EsVCHLFYInePOJb
	E1Rv5Ywn6O9nkV+c4MLWEtFN0bcDSErbjMsqfL9YFkzbjazcX+WS/LXLn3VutuLz0VXTZ50gHYE
	s
X-Google-Smtp-Source: AGHT+IFOsf2NDCipI6AzAYxPue93TEwoIH3sdDO+DdvaRSsMgk1Gn6DPut2+hCrJ8DfbQHkOPXP2vg==
X-Received: by 2002:a17:902:c944:b0:1f2:f8f8:680c with SMTP id d9443c01a7336-1f2f8f86a26mr72740905ad.11.1716261458649;
        Mon, 20 May 2024 20:17:38 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:38 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 22/31] Staging: rtl8192e: Rename variable IsDataFrame
Date: Mon, 20 May 2024 20:17:09 -0700
Message-Id: <20240521031718.17852-23-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
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
v2: No change.
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
index 50687f3dce47..9741d351363e 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -878,7 +878,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 
 	if (!ieee->ht_info->cur_rx_reorder_enable ||
 		!ieee->current_network.qos_data.active ||
-		!IsDataFrame(skb->data) ||
+		!is_data_frame(skb->data) ||
 		is_legacy_data_frame(skb->data)) {
 		if (!ieee80211_is_beacon(hdr->frame_control)) {
 			if (is_duplicate_packet(ieee, hdr))
-- 
2.30.2

