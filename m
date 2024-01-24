Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D3B137C37
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136303; cv=none; b=Op2CcWUZ7QoPH60G6AfwxZdZnFKuQVwR4OGIPSWX8aHBa9xPyoxVXwI0VdALWL29a4H1j4/4mlmtMei7Pjum8YMUThP3xWB+nJ63nfl1UfGu3RKz5Qu1w6QHLDAxhQvfmUB3MHUvJg9YZDDLemQdq1r/wYJqzaBT1SL3uZ/zAjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136303; c=relaxed/simple;
	bh=2ByaHwpgudjiAXPX+6Yc8UDFaTx9EAAEkFyb4h3LcEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFYNEBzDK5fhFmJuFvun2QifxoTzgjU5DPJB1eVZNm/w4LFT/AUzGhvCpBQCDOfYpdDUXQA6JPzRFMKrJGHlZvgpl7mXXO0nvrSGyEB6b5j4ow0Qmd6ku04ekmpLcNPHQ8yPq5eRxX6vhREgKkpB189bv1nXpp2Odk4w6WZLU+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=PfyOIEaF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="PfyOIEaF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d780a392fdso12098135ad.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136301; x=1706741101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dsPoDzQ879VDK5GQHb4bUC+HjAwV4k9BbLjoq0ooCs=;
        b=PfyOIEaFBrWCvKxdXrQ0JXQRSz+iRDzIAafOk3pOOoM0JI/6IhEoIK4yBbW9mT86Ay
         AmXWl9pKcWV9T2T0/+qCnxmVLky/2vUjNBwwvRtu/iiDRHjjiiu+Rk24cV3LrpnlvAlW
         5JtbiKIOU83iLW8jn9bL+ojkPJBnZVkXY+XKD/VSdhkb6V4ahXUXLhXUbj24UHy85TOA
         IQMXKlpvLoHA5mEShVUz1XIY4SYNkZpTCKt4LXegdmy6R2b5J+dvR3XtMQe51MuK5EZg
         qu/OWN+Ms20VwHGAbzikpomUfsu9FU6AGUGug9Gv54EPIWqp6UjRA4Rt/PiWJqz5+6ss
         y7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136301; x=1706741101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dsPoDzQ879VDK5GQHb4bUC+HjAwV4k9BbLjoq0ooCs=;
        b=REyF+GGigeHjzNla8ZBCnIwukp4ZWFan+qPinxoFaaZK0U0t55G7Ibvm+ZHkxZsho7
         eR/qh6/HrquPXfpcVKp29JgU11g7defYIzf2VxwARognnfyb5Vwt6mQopNIhPJi1I97o
         8urtyK2me5ZFPVl3BoTwftsKap8rIp9q136iAp8FX+TPp/fUEqb9lvYjpoMItDPf+xau
         aCudq4SltmQdodgnDA9UNj+TM2BaZCd6pQPvh2T/qhu2SyT49/gKHa7i8M7PNrUioPkG
         xRgvY9qgNo8+PNBnvUx+LU6fR3xUHtgyPeGtvvoJuPr3tEWe8YLJdkgWDpOBU3RjNMdi
         +qLA==
X-Gm-Message-State: AOJu0YxC5C9WCXmqAvrYcYwvn4AMh2Bw2T2veEYFb20fdd0CyaVe3O8W
	WQ5ebLub90rEk5EFF8OEVYQ82V+jZ0e06xNhP7FutC6qnTYPpnD7gY6KGE8y/xQ=
X-Google-Smtp-Source: AGHT+IH82Y6XT6OydssqJ6CvJlNmdf2CpiUyxYx4QXe7vFdBj21hfHrgW1BhcZaXYfvj4QtQSjblPw==
X-Received: by 2002:a17:902:9a4a:b0:1d6:f185:f13b with SMTP id x10-20020a1709029a4a00b001d6f185f13bmr94373plv.17.1706136301432;
        Wed, 24 Jan 2024 14:45:01 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:01 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/18] Staging: rtl8192e: Rename function MgntQuery_TxRateExcludeCCKRates()
Date: Wed, 24 Jan 2024 14:44:40 -0800
Message-Id: <20240124224452.968724-7-tdavies@darkphysics.net>
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

Rename function MgntQuery_TxRateExcludeCCKRates to
mgnt_query_tx_rate_exclude_cck_rates to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
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

