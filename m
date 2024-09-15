Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE9821A1C
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382461; cv=none; b=RN5SZhImpvnK3LlCdmTbjtJLdt1myUDZWwbhfmG0VgrG7vB4HoUArYDRfiLqqvkWKBmilzzQClzlVBuYNgI0hZQdfZnEzxirzwyOIqFFaGqmAAjKlKPCq/G/tMRRw5sGThlT1A58pYAqgaTM+04F/G4yoqNdsMbKiF/uc7J/sQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382461; c=relaxed/simple;
	bh=pvldl6v2DFlIl2vFANnRg4XBzOOXrXQyVsi9Mo6ORJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHRS3ZLplq4FV7uB6cC3j8ymQ4TCjkWzJElOlhq9jT2EIkaZB2pvp4behzdPQOcCwTp2iU/SHCmH716LClSJ0HiF5GYjeTfwgbDhiqS/3HZmoH+LsfPL4iJbbjpHofCVI77JB6m3VI4FLkOLZNVs/cZ9ojsJ7gAr/ovd7XQl5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGSLp+6n; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGSLp+6n"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c4226a5af8so2545669a12.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382458; x=1726987258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC/kfw8fP/MikLolFMSvfN+YF3ONZgmkBG/9V4Tu3L4=;
        b=IGSLp+6ne4oot4O3OZyZBnR26jCX74npJHU0tCLMChe93zIMgos1Ark9lHas1F4VHy
         8JJYbqfmDX5Zq8p2wjb59RtsQRxsoKTx89AM1jpvoo4mAfpa31AnUtKp1W3NsNNW8dJc
         5YPOXROon8eCMFWYye2vt0KPwHogBYwEH84LRChJXS0t/PZbC6CqOA6OUK7PxaD1uge+
         DjWhNoAmMtkzv8WtYy++u3bp74cvXOlnd8mdVdHc3gHaDDArrxLRW19j5MQ8QuDHtADW
         JtHG0vNoAeJYLboae0BdOjWfXpuCUeSi7VL08iB0syQz5vlpKRLiIg0FXS+TNFWu+lQu
         ogAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382458; x=1726987258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC/kfw8fP/MikLolFMSvfN+YF3ONZgmkBG/9V4Tu3L4=;
        b=BbNFSOIugy8ssWaN3JP4F8GsmmawHcfFlQZyeCbd0vuJUQW3yTrJDVdAuQfbpHxDmz
         CAYpEUkZFo7mdtLzIz1rWCnuZhBBC6vtpl/+Vq/fwoi3MqOIKsHg1ozH/nEN2eAF5oI2
         R6PD1g9wHZRRX1g8CpI41bF8xMDPa5f5O4TYCysoUtHazp904l4nAixsr7u4Pm7PuHog
         EWRF6j51T1HokTwgCicw+Pw6Mg6KPssLzl9LuH7hFbUfmzRg+NggaDzieoanGwNPcR4n
         /RX+CuyAyYqfwPoYpLR1cR2/posRXddv7dZQwLR575Efu5GVSGHhWexQiZ0vaFnTXeTO
         5cmw==
X-Forwarded-Encrypted: i=1; AJvYcCWyp8kzE9yYEppqNbPNlpIvFdtzImbgo4FOPXBuF+Ad4f+coGd/CsAN7wzngTAZh1tm7jtWAWRmkIWk/eOg@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvle5JTELHIuwUGy0k+SE5GNBHc5Rq5RlWZ1L49eKiambyT73z
	nUtLBKYJ62uPe5q26T3TxByDFlQOwchI6Az0e1yNehnl76aiofW0
X-Google-Smtp-Source: AGHT+IGQquk2jTrGNJ5jXz0fryYGBvUsxfpAEhOJeups2teTSbS1S/xyCYdIHw9wkzaCLdiTIX7+lQ==
X-Received: by 2002:a17:907:e28f:b0:a8d:2ab2:c99e with SMTP id a640c23a62f3a-a9029730615mr1184068266b.55.1726382458576;
        Sat, 14 Sep 2024 23:40:58 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:40:58 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 02/17] staging: rtl8723bs: Remove unused function rtw_search_max_mac_id
Date: Sun, 15 Sep 2024 08:38:16 +0200
Message-ID: <34c5f2ef44641c5151dde12b161d3f0aa963de5c.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function rtw_search_max_mac_id.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 18 ------------------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h   |  1 -
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 2fb14f4ff1af..cd62ea47577c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1822,21 +1822,3 @@ void rtw_release_macid(struct adapter *padapter, struct sta_info *psta)
 	}
 	spin_unlock_bh(&pdvobj->lock);
 }
-
-/* For 8188E RA */
-u8 rtw_search_max_mac_id(struct adapter *padapter)
-{
-	u8 max_mac_id = 0;
-	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
-	int i;
-
-	spin_lock_bh(&pdvobj->lock);
-	for (i = (NUM_STA-1); i >= 0 ; i--) {
-		if (pdvobj->macid[i] == true)
-			break;
-	}
-	max_mac_id = i;
-	spin_unlock_bh(&pdvobj->lock);
-
-	return max_mac_id;
-}
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 8315399b64fd..82709ffc7bad 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -528,7 +528,6 @@ void rtw_camid_free(struct adapter *adapter, u8 cam_id);
 
 extern void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta);
 extern void rtw_release_macid(struct adapter *padapter, struct sta_info *psta);
-extern u8 rtw_search_max_mac_id(struct adapter *padapter);
 
 void report_join_res(struct adapter *padapter, int res);
 void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame);
-- 
2.43.0

