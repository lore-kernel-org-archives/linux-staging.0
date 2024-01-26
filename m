Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7614F8B0
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308304; cv=none; b=cEiUYnW+RnM6ikaOWSKPozrCUAcZmyzLqOFkpyXn2L/zRLlnUCzEY/NXbPsm9UuFNwgVwfqTib/RoVUZD/pRSMmV2vu07rpgLOfipFd0aGikGeeEtiu/OCJQh9Ofs4K9IMZ5xVtBr50/jUZnw1Zr5S3xh06f7URGZHF4zPxOr84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308304; c=relaxed/simple;
	bh=sls9lOLiewyZnZBlFZG2x7cmxajKi6xq3fen54zVl6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s8WaAgkTgzkGDiD9YRMEAibyrt0gFrBj79SmByIEtCyRkidxwSHiKjWX4mGwBuBhMSK1dEXftZpXIrEb8EngtSs6/9a+j2/xtjI867MJlUfJKDa9sJ/3KH7ZEUCJ7oRME1LwcYtstwySsB/+yEkYmcw1MIZAh2o+vQh1ccGORN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=JENlc0q+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="JENlc0q+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d7881b1843so8461135ad.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308302; x=1706913102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIloziZvKZDMPx2ffynApFl8FumiobB41xehjM9PZEw=;
        b=JENlc0q+810ILIXtcdiiHqpg8PSJc8ufLFbUMugcE1EJz7ECdQkrhjBwuk/KZaoap1
         Px36/Yyu4RvPtL76hIgNguOnm727SqpaRjc+1hFUfS3Ci2Q0LDzNNnNy4aPpeK4iABNt
         kPOgwzhiMg9EFkSr9a8ZwIHtmwSPegIc++qdoIwfcd5cbRQbO0g3RytFMFCMHROffZp5
         rT/B8p60pqqjguEKrfHM9G/Y8XK43nE7eT4yQGydgAxlgrSsCpOQFQG/C8dcBvco9Xp9
         in10TkP37VZoE9jaBTYWbTnKlGmK55lu3kNDcx69fFQ5QyelCuQcSizSUzGowRW/0l/O
         xeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308302; x=1706913102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIloziZvKZDMPx2ffynApFl8FumiobB41xehjM9PZEw=;
        b=ZpTQLBC2i1cB3IcNlQWCrp1izWot/f8u4nEKBH6Wvs+Vjassgb9jwggopt4NONebFp
         XEYYRtBQ9+tmlHOess5ESe2mMhbpcxTexW/IaAgPBQhN5Y79ZP79BGNdvlHPHabU+nW/
         oGSOt5NVk5ml0McRZT3gPRaoz7k+jc0weAK5j3YbaiVr8ssIA+u0meInkH5KPcrKckW1
         Mp8GvIXxF//fiMJyfjpKYaQxouIGX7cDF1WiJKzg+dMx71CYYqvnOtu2mjdR+eIKoPS9
         RywCPpk3n6W22N53Mz99MhpoLiSQb6PE9cfngLJXt30HJhX7O0HjvzPBp6fhZXP30aCc
         hTXw==
X-Gm-Message-State: AOJu0YwCkOChnfrJEwB5Pb9n6rRpI2w9Pxo25Kln7BKZ3WqM0T+3D+9d
	5wpKrv03e8IIZEQiDs6fwQklea1E1/Kex6y8gkhal/vL+Ug29uPOdyduA1c3obg=
X-Google-Smtp-Source: AGHT+IH8czhpUrofjKlE0UIUZgKxhByK82tZ6+dPWJfryzEusRxvJpruXSxlyoeQLlBTSW+RwZyoHQ==
X-Received: by 2002:a17:902:b949:b0:1d7:4377:e5ff with SMTP id h9-20020a170902b94900b001d74377e5ffmr507234pls.122.1706308302392;
        Fri, 26 Jan 2024 14:31:42 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:41 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 06/18] Staging: rtl8192e: Rename function MgntQuery_TxRateExcludeCCKRates()
Date: Fri, 26 Jan 2024 14:30:54 -0800
Message-Id: <20240126223106.986093-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function MgntQuery_TxRateExcludeCCKRates to
mgnt_query_tx_rate_exclude_cck_rates to fix checkpatch warning Avoid 
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Update commit message.
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cd45a9c46a94..c380d1c3e9b6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1821,6 +1821,6 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 void rtllib_indicate_packets(struct rtllib_device *ieee,
 			     struct rtllib_rxb **prxbIndicateArray, u8  index);
 #define RT_ASOC_RETRY_LIMIT	5
-u8 MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee);
+u8 mgnt_query_tx_rate_exclude_cck_rates(struct rtllib_device *ieee);
 
 #endif /* RTLLIB_H */
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b5fe471f765b..c231e7acd606 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -138,7 +138,7 @@ static void init_mgmt_queue(struct rtllib_device *ieee)
 	ieee->mgmt_queue_head = 0;
 }
 
-u8 MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee)
+u8 mgnt_query_tx_rate_exclude_cck_rates(struct rtllib_device *ieee)
 {
 	u16	i;
 	u8	query_rate = 0;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index e61eb6e87ab4..54100dd81505 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -832,7 +832,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			if (ieee->ht_info->iot_action &
 			    HT_IOT_ACT_WA_IOT_Broadcom) {
 				tcb_desc->data_rate =
-					 MgntQuery_TxRateExcludeCCKRates(ieee);
+					 mgnt_query_tx_rate_exclude_cck_rates(ieee);
 				tcb_desc->tx_dis_rate_fallback = false;
 			} else {
 				tcb_desc->data_rate = ieee->basic_rate;
@@ -856,7 +856,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 				if (ieee->ht_info->iot_action &
 				    HT_IOT_ACT_WA_IOT_Broadcom) {
 					tcb_desc->data_rate =
-					   MgntQuery_TxRateExcludeCCKRates(ieee);
+					   mgnt_query_tx_rate_exclude_cck_rates(ieee);
 					tcb_desc->tx_dis_rate_fallback = false;
 				} else {
 					tcb_desc->data_rate = MGN_1M;
-- 
2.39.2

