Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4115AAD9
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551128; cv=none; b=QUJsWKCxgh+jweY5wndeYOcqBitmj+QDeDJzFVTFh6sBwhSf0WtOEI5jp3gnkrAc4P9PApxxaOa6KEOPWRzd/HfPyxkiUpQ7j/ZzgXWxgl0haK0K8DkRMed4imQxJCiUK5udMtvyswB003+RH+jaIym2oFB0K2TFesvUaLDgR6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551128; c=relaxed/simple;
	bh=q+xOEKWsHd2GnzwxhTD1fpiaTHmugckiXD5ETn3XgWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I7Y3G4mQERQra2kNWyn8lTJIFaU33NST9etZHG01o2fd+Av1e91JpVw3RAbX0k8GjwMiZi8Ps+a8wFC++8hqxCzDU9mgazP6GDl6t0DEQ/XzpXnErZkMmuF/JowvWvZ7CNQ2Wp6rzHq/MW2pfnp08X8AAbWIEK9MuIO7p/0Xlys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=JHUwVrtp; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="JHUwVrtp"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so3348420a12.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551126; x=1727155926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRrw5+oANKkULNvvGuleCSc1g2ZOyWkjgPNrOQZeAG4=;
        b=JHUwVrtpi+dkpQZpEjDs//v/o9ejMSr7dEO8OoeIQZcH3IQtTdirwIatwDjx7llAsl
         NYU/LtlsiguqM0usiPkTyW/ptF71AkPa4Y1cBRi3v7oF8e+u035IB6oY+VPz3gX2Y4Eu
         Su3c7tIm65YVBDXl0W5uBbVmHoeQbSa8y/CsNFOuYjqp37B3Qm/e4fG8vWzuC4C5maPS
         aDkq4oENrk7wBLHjZ71Y6tcS/FVGGtHEE2OrFXj8qJzIdvtMxSs/zr95PzQmX1XI8VwU
         4Ko8L9wP5qJpI/fHM8l/ZpcNBmwlViQeD5OWkL/RWmHnlai3qWfHtRBCdzOBBDTHfSrn
         ztJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551126; x=1727155926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRrw5+oANKkULNvvGuleCSc1g2ZOyWkjgPNrOQZeAG4=;
        b=mfnI/KaTb/P8QvBgz+TgOsVMNBz7aKEZhH0dJlxU9mS0v03J8XbQe+ulUQ19cmY4p4
         15BapYE/0lX9cwd1LHMVYy1Yif3yPtlpkQxS7RHF4L5m+i8lb3IpL9ym/MRZ67XIrsPY
         U+YfEPmkAW7DTG2SZtqWt+r9qu9gi0J/UE/hZOkEe5jh2vKhoVECYJ+z4aaiwtEffkRA
         V/d1/HJXoZ/1ubJ/027WhB4QwRNpbc6mlFPATDMqBzUxUXuwBZmbxxtdusmMHOhp0tlQ
         6dnJJfO1GXxNg8rDWw/v2++ba2dtxPIfdJh5/ueeSkBfbllUuCYJp6xD0ZjqrauVZoz/
         9HTg==
X-Gm-Message-State: AOJu0YzMeHjyuzlJNL2nIzLyITSrCNlAtShnk1c2TtvVZuCSAojleHx5
	C+V3rCbBTsWM4KTTrbHar2c/QVxMCLjy4T1eCw48zawPo3G0X9KoMUPiT5jWnPo=
X-Google-Smtp-Source: AGHT+IHyDu7EuUO7j+l9ZJc3NSt+VsHIp0EO//b6IiME0O7rD9sow6TqP9CxLW5YxEC1y5REHUmcxw==
X-Received: by 2002:a05:6a20:8428:b0:1cf:ff65:3680 with SMTP id adf61e73a8af0-1cfff653b08mr27355421637.6.1726551125720;
        Mon, 16 Sep 2024 22:32:05 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:05 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/18] Staging: rtl8192e: Rename variable Tx_TS_Admit_List
Date: Mon, 16 Sep 2024 22:31:48 -0700
Message-Id: <20240917053152.575553-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Tx_TS_Admit_List to tx_ts_admit_list
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 10 +++++-----
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index efadb2b778b1..e87d2926f47c 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -124,7 +124,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 	struct rx_reorder_entry *pRxReorderEntry = ieee->RxReorderEntry;
 	u8				count = 0;
 
-	INIT_LIST_HEAD(&ieee->Tx_TS_Admit_List);
+	INIT_LIST_HEAD(&ieee->tx_ts_admit_list);
 	INIT_LIST_HEAD(&ieee->Tx_TS_Pending_List);
 	INIT_LIST_HEAD(&ieee->Tx_TS_Unused_List);
 
@@ -189,7 +189,7 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 	}
 
 	if (tx_rx_select == TX_DIR)
-		psearch_list = &ieee->Tx_TS_Admit_List;
+		psearch_list = &ieee->tx_ts_admit_list;
 	else
 		psearch_list = &ieee->Rx_TS_Admit_List;
 
@@ -279,7 +279,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 				(&ieee->Rx_TS_Unused_List);
 
 	pAddmitList = (tx_rx_select == TX_DIR) ?
-				(&ieee->Tx_TS_Admit_List) :
+				(&ieee->tx_ts_admit_list) :
 				(&ieee->Rx_TS_Admit_List);
 
 	Dir = ((tx_rx_select == TX_DIR) ? DIR_UP : DIR_DOWN);
@@ -374,7 +374,7 @@ void remove_peer_ts(struct rtllib_device *ieee, u8 *addr)
 		}
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Admit_List, list) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->tx_ts_admit_list, list) {
 		if (memcmp(ts->addr, addr, 6) == 0) {
 			netdev_info(ieee->dev,
 				    "====>remove Tx_TS_admin_list\n");
@@ -412,7 +412,7 @@ void remove_all_ts(struct rtllib_device *ieee)
 		list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Admit_List, list) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->tx_ts_admit_list, list) {
 		RemoveTsEntry(ieee, ts, TX_DIR);
 		list_del_init(&ts->list);
 		list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 315a75739e44..3544054b78fc 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1194,7 +1194,7 @@ struct rtllib_device {
 	u8	tx_enable_fw_calc_dur;
 	atomic_t	atm_swbw;
 
-	struct list_head		Tx_TS_Admit_List;
+	struct list_head		tx_ts_admit_list;
 	struct list_head		Tx_TS_Pending_List;
 	struct list_head		Tx_TS_Unused_List;
 	struct tx_ts_record tx_ts_records[TOTAL_TS_NUM];
-- 
2.30.2

