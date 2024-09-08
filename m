Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A1187325
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823610; cv=none; b=SfC/Y9JqSufs+qW5OGJfs5pZeI2U9zh1z1dJNUDWF3uvsmJ8O+L9KA58WOhviOWMSpdm90tBAlsGiRMUXM5ADIqV+nrVqyjvD61lRKzORE5lYEQFvWrfWVpqfn7ggGdDgfA5MZ6bUW5U4d8DF25snEl60RNjIpVVj7Lencrb//E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823610; c=relaxed/simple;
	bh=Zqbwng7d7h0S8knzbUlqjwzbO3ykL8Eo3fydFeADDEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UfdPfo7yFZzXaHDGlwshybCHpCQpCQHbRkYKWSXHkeStxtKn2ZK3O8yTpzD9TT6IBC+SBkKuE23/m8HsjV/0dtLNY8vfvtdb9d0s2lFJi4reof4TUQMRnwf2oiadH8d47frJxQKrbu+9yevk0pPOHHnGtG4NAHscRX645yQxXYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=M57TWBVx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="M57TWBVx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-205909afad3so36245195ad.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823607; x=1726428407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDbUHTQNvzkg+oP3apbjo+jZaKg79sPfnGmQtUM6Ar8=;
        b=M57TWBVx7Ld771TibDSlKhnULlUpq+Sh/S1cVRQmN1K5Hsp652rAbmFQT2RpGdpY+V
         X/+aqMbrNHLDu2dFAf5hwyyQWUTveVh7NFMjnxlSSAvE3Ab1QuFwOdm1u+oZJNJfMfvc
         WrBJNO5SXz4RySPUTv/56n4mVzofpB/iIYgd9hiOfXBi5RynD0Uw5PPTpqCF7JXuK+lm
         GwWB97s4EkTE+IY1RQ0Hrg8lgHrGwXcecJQgpMrbMOhLSHgjkrMmgfrsWSosyKjLHMuY
         2PXoL1d3OMXLylBnx8A7HzSo0gT96MDjjgdoIZH3j9oUb1YkTElkl3+Eac20we2YqHuF
         0QtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823607; x=1726428407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDbUHTQNvzkg+oP3apbjo+jZaKg79sPfnGmQtUM6Ar8=;
        b=iiAg9lDknMCnd+5EcIYwSOQ7i1sXbnANcNk/ytKwM9PrO0MJ7jjAxi/1Jh1QXBxEt1
         foP/DDi/Pc+7Gre43htQRZthv3F7xJxzBL+QFVLSl6ktpmdUMLNamjndBfpLo2/XppQ3
         QE6e4k9CZfrBIqxIA7qKjtxSW8U9TGK5jrEzjTM6Z6YjuiKuuhdELro/MQ23wKZoQUCW
         5mCawXmEzDfJn4t1Ie7Qdxim3+vg0VSbLhI11m1YqDR1sntN2YPKQ8ShuIFHPKGGaktK
         gXB5y2cXlslfTcjURp6sWX50JUN/2PoJYwdEvt9m8+afO8+XoH/h8qi+KwFpD0Qot1Ts
         TPhQ==
X-Gm-Message-State: AOJu0YxOkYl4BEhdFL09144ViNj88jseTBvI4geism2BMI2IkdmFwlYg
	Car/YOVY3cYTkoZdgSoX9iwf8h5AQw24uRR+Lw5C8ruqCRaHAPehFYNIsCcAJbZh58KdLLoetgl
	nLuc=
X-Google-Smtp-Source: AGHT+IGByVUqHkABLGee6fEJ4eJSe1A9yIRg1vpq8Lj59i+jhoVTBdkFOKVH0lIAJOQDwqW91cIitw==
X-Received: by 2002:a17:903:943:b0:206:cc29:e4f7 with SMTP id d9443c01a7336-2070a5789d4mr76933035ad.34.1725823607589;
        Sun, 08 Sep 2024 12:26:47 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:47 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/16] Staging: rtl8192e: Rename variable bAddNewTs
Date: Sun,  8 Sep 2024 12:26:31 -0700
Message-Id: <20240908192633.94144-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bAddNewTs to add_new_ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 18b717a7409c..89092cd434de 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -225,7 +225,7 @@ static void MakeTSEntry(struct ts_common_info *ts_common_info, u8 *addr,
 }
 
 bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
-	   u8 *addr, u8 TID, enum tr_select tx_rx_select, bool bAddNewTs)
+	   u8 *addr, u8 TID, enum tr_select tx_rx_select, bool add_new_ts)
 {
 	u8	UP = 0;
 	struct qos_tsinfo tspec;
@@ -269,7 +269,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	if (*ppTS)
 		return true;
 
-	if (!bAddNewTs) {
+	if (!add_new_ts) {
 		netdev_dbg(ieee->dev, "add new TS failed(tid:%d)\n", UP);
 		return false;
 	}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 540ab4e34e70..d8155ea3a002 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1757,7 +1757,7 @@ void rtllib_tx_ba_inact_timeout(struct timer_list *t);
 void rtllib_rx_ba_inact_timeout(struct timer_list *t);
 void rtllib_reset_ba_entry(struct ba_record *ba);
 bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 *addr,
-	   u8 TID, enum tr_select tx_rx_select, bool bAddNewTs);
+	   u8 TID, enum tr_select tx_rx_select, bool add_new_ts);
 void rtllib_ts_init(struct rtllib_device *ieee);
 void rtllib_ts_start_add_ba_process(struct rtllib_device *ieee,
 			 struct tx_ts_record *pTxTS);
-- 
2.30.2

