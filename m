Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE76770E8
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261463; cv=none; b=miSj49gCGUXOVBEotmttbO1gH/mHxpcxHJJ92j/rwMNU+WDicpNQ+Ib8VRSSc7chJMMngL/qYDERBcRBJ1MDrKgw7Z1hE6dVIaTc80BxCnPy7MXhwRSdXIg4lLcPc/HaF9U4cGnEpzVdXespKVnj07RFUuGtqxcW3A8u50cPK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261463; c=relaxed/simple;
	bh=cbh5TxJ9lOr9epBP+PxY9ro4whHmhXzi0y+5nh95DMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qlPqRa5QnwfQPXxjq0tlAhbXoARTfi1fCOv4rtcZo7tPnsl/CgdnbT0VltCLFabCx7iGZbXypvWwcKeqln1H2vj0LqunVmKBoleJAzTngqKkQigI2+jw3I8JULw1mX+40bfyHQIyQmRcnqZufe9bVaL6f2iy+LOp6DTeEbxGFKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=bANDRqrY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="bANDRqrY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ee954e0aa6so65214235ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261461; x=1716866261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKXdhlAm8cv2q262aWrYc+MjVhozaby61eiStvWdJh4=;
        b=bANDRqrYinwBCvDyogskIDp7ial79rRQABqtUpJijlMA5uryvPnYuD9f+eq8v+oOgy
         F+at6D/0YgvV+SM3WcqCMD2cGjHHdf4wjl1GCEL9nkfLf9S4gl0j/c+bz5zJzxPKGWpC
         eVM3SSrwHJ5Cm/Krf0WMahpN2slVC2ZjnxPavFAhbA6zFSmiLl91ZCVei6bRtk5AOjWU
         W0Iz04Do9vDgR1Npc+y1Klne3t6lue2EjfafBfiZtMxDgBSvkkJfbI1iwvjxaTXSjGa3
         CGkE64iI1VqotritEvyC0r+f2v5VL00ZYNP/QTjwN2pGDVoECkj1XAXq/DMFV+Poyvxy
         Cz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261461; x=1716866261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKXdhlAm8cv2q262aWrYc+MjVhozaby61eiStvWdJh4=;
        b=wUjrzcujuwh5+58aTee0Sf1tzmNJOEUJM/MGIDQZIeR8zvRMo/hsj/8YiD5YcYke5G
         SSU8iKpSzENC014b6OD7RBH+C27JipJ7uMkCwZ7m/wT8cuf4I6zSQidp3FA50WX13E7Y
         cy3KF4glLImTkIUwFEgA3d09L2CSiehnQ4Q/Ry7RASi+2Ql15iMkRftSETr9wmwcVDRH
         RUA6RFhN86J3AHQhwGq3baztZeGSyUwGJaBNpmgOQV1eF8kMgiDYHIskwSnY6kgLq4Ir
         lHcQB5ASZeCM6dbeigdMDYMya0W5h/QDlUo/Nko3q0ma5VnyGdlwzT2WLUK7neTNLNMR
         /5mw==
X-Forwarded-Encrypted: i=1; AJvYcCXKheWlOpKtf2f+BEh2xRIQSHhlzYbbRQzic0E//GwM39Exqvv8TudWq38Isgo4UZY4w+CoIDFm6ZlMLI7pIKTZ36LALATn66PiYiIsBw==
X-Gm-Message-State: AOJu0Yyv95yOW4N80G6c9QXAwyjF9ShEzhPiw/44EZm124UVHlkp/vQm
	RSlK4T4CxgPjJftqeYkZvWFmLN4LZfY6xGhRubEavgYg4j10JPSRbSqCTCfgqiP3isyy/fAnDum
	B
X-Google-Smtp-Source: AGHT+IEv01dRQXsvlO+6puFkXHHTmVcZ5c8jKElNm2gicctO/+98PGsaZebxky0gX6+gzQ/k04BD4g==
X-Received: by 2002:a17:902:7849:b0:1f2:f784:97a3 with SMTP id d9443c01a7336-1f2f78499famr50867705ad.51.1716261461656;
        Mon, 20 May 2024 20:17:41 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:41 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 26/31] Staging: rtl8192e: Rename variable Frame_QoSTID
Date: Mon, 20 May 2024 20:17:13 -0700
Message-Id: <20240521031718.17852-27-tdavies@darkphysics.net>
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

Rename variable Frame_QoSTID to frame_qos_tid
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 4fec36cfa2fc..b88c7cd399fb 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -799,7 +799,7 @@ static inline const char *eap_get_type(int type)
 		 eap_types[type];
 }
 
-static inline u8 Frame_QoSTID(u8 *buf)
+static inline u8 frame_qos_tid(u8 *buf)
 {
 	struct ieee80211_hdr_3addr *hdr;
 	u16 fc;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 2d0a0efedc97..22c04f37bb40 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -888,7 +888,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 		struct rx_ts_record *ts = NULL;
 
 		if (rtllib_get_ts(ieee, (struct ts_common_info **)&ts, hdr->addr2,
-			(u8)Frame_QoSTID((u8 *)(skb->data)), RX_DIR, true)) {
+			(u8)frame_qos_tid((u8 *)(skb->data)), RX_DIR, true)) {
 			if ((fc & (1 << 11)) && (frag == ts->rx_last_frag_num) &&
 			    (WLAN_GET_SEQ_SEQ(sc) == ts->rx_last_seq_num))
 				return -1;
@@ -1321,7 +1321,7 @@ static int rtllib_rx_infra_adhoc(struct rtllib_device *ieee, struct sk_buff *skb
 	hdr = (struct ieee80211_hdr *)skb->data;
 	if (ieee->current_network.qos_data.active && IsQoSDataFrame(skb->data)
 		&& !is_multicast_ether_addr(hdr->addr1)) {
-		TID = Frame_QoSTID(skb->data);
+		TID = frame_qos_tid(skb->data);
 		SeqNum = WLAN_GET_SEQ_SEQ(sc);
 		rtllib_get_ts(ieee, (struct ts_common_info **)&ts, hdr->addr2, TID,
 		      RX_DIR, true);
-- 
2.30.2

