Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002C34FF75
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 17:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323861; cv=none; b=RygPszgdnFPDfQCDf4idzQDl61AGe64VzHeWN5zRIgq0bLa942yKKwEEsDfA5uxIB89Gsqy886MbYkfHuUxEEERO+5BsSAK/kHDLNVxQo4gHv6QHzsOmf7UfCdNIcw+UPjE9M8CAFArR0HySV9GiJCswL0EJCJeByXiQ1YEebB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323861; c=relaxed/simple;
	bh=1diHR0MIXLevnJFNBvkynn/ZsTxbCUN2oTSNQPr13x0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EH58KSUoCbHqUoEvqzvclo99uO//5V1v1SRPLnpkUsETjOiqeMl3g9+myisZMyDarPeOGDJqrEKm++1aAtmawAWJJ1YqdEmtOqBkXikLXhHRd3wdxTWROYOLJawyORUYGIkMaClD6niuWAvq/UqFZHfg4baOLjmRG7hpJB1esJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PInNVJka; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PInNVJka"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b7a38f07eso11896601a12.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 09:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768323859; x=1768928659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2eGyTGaMQCOWoNvA2BQt+Wkp/xOoM0G8KlnVwryUFEk=;
        b=PInNVJkaCFeAtZHYBzgFuEdY6rmU/ikmoXEHcafKPLUGO7/bRsz6bxcUr/LPTVisOd
         sHwnFeuJPLK65tpxLi2bCCmvxiHSGyvfh69OuqtVdKg89LG+6URoORpZBpQnKazY4rsk
         khUgONQLCncHJSudNSVhyjLVLkP4XP39UBP1W3zgCFvPPIYzw6ViXv+KN2b2LiaXxLNY
         uSwIDFRGNkzE6xFaLwrmv75EvPNv8pT7sH5xYkrEMkZ3fevO49px/+5cKJys5J7zAepU
         4W+1+FWzV7rPe+U/f5xFOFdlgjM3VQojCQXiz/8WCCzSfiwDvJ4ng+uU0mh6g8yVfNPp
         KXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323859; x=1768928659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eGyTGaMQCOWoNvA2BQt+Wkp/xOoM0G8KlnVwryUFEk=;
        b=QHps+71taA/DoIYvV47XtPcGhkzMtl3v1xbems54K0EfrEb70kTefE2CyWVuYZl4jH
         LMNR5eEJulOVUw/fwCt8+26HT6uW3ZQBEe+o/Tvl35NqPh7kjvjnjKcC9oHt5N4QmoQj
         +mt/a+PxD440qe68Tz9yK8Koqlf1TgEgQ1yyoh9FItw0VzBG0LgBkUGmKW7MKBYvcXb+
         hXHrjUu60RO7jtAaVX14FwAus9wpbHGsotCRHTCokBNzbuE1X5Qj5wTN5xh4XL6dCy+r
         R2YKQDgUWFDe64G6+7FmcG2MH3VqUCTmYsA1VgNZkxk6eGj0OyD9YYhQYUUoVoMZeZyp
         V3gA==
X-Gm-Message-State: AOJu0YweI/bnlAAEzZGciPqDCFtU6ePdcqn5/wMfUvrpLU9Vbugz9dxA
	Wc0uGnk5l2Klh9+8WR0IF9NP12RB0He/5zfmnn6SeDXXnKfMQ4rwSDxsn7KDaw==
X-Gm-Gg: AY/fxX5n+O5T5CT29na8gKq3HMRl3ouxOnU7ujLIUKNMfSALJTAyBchz0abMZTASPo7
	fwVxcLWothlpAPeCle0x/K6V2p20IIgS0ZT2apwrgAckw+zoycrfpkNcFWqm9LUsoigy84SEi4+
	8ZoGu+IAMAXhpTzUL82hrwZQyB7ztD9dp3lfTqtEqZm8cr5dRCPCDnsMUNk7ROjpFdzy+D0JeKW
	WBRhVUscwPEMBSz22IDsIHFUwal6jZ22idfOj6+ClrcnkzJfAjbGmIfzZGy2JfyptKGKDF4QsZH
	S9TG7gt9qAQeX5Y6PNMcKEJj9HP/iqUliFP8AkflhPxQWcZ3tzAqWjb0KwAXn9BipLjuq8Rc5T1
	EIav5PA0GYSSLmONOyqRj9S+UTOzF1pKODZTqQ8QMWLhZHM25OVTARXXgGAvudZ/uCI0RAOHYuU
	qGcsS545U43Wr9BA8fsP2Vw6OSB7DARW9I9DVMyMekDy8yyj0UT7kB11T2RDRBEX16GmBgLGS/w
	BazmaaCY2IonrVgMPT5Dye/fCcHH5j8BS8=
X-Google-Smtp-Source: AGHT+IGmXMYZW0Wwfaw91lEclZievzaJzJrhr5Do9F8pTUAaQsvTLnrVGV0s60kix0eFFB2nHm6nUQ==
X-Received: by 2002:a05:6402:1ec5:b0:64e:f50d:ec9a with SMTP id 4fb4d7f45d1cf-65097e743e5mr19779625a12.30.1768323858482;
        Tue, 13 Jan 2026 09:04:18 -0800 (PST)
Received: from localhost (37-48-40-40.nat.epc.tmcz.cz. [37.48.40.40])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d51c5sm20766350a12.14.2026.01.13.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:04:17 -0800 (PST)
From: Matous Jarolim <matous.jarolim.lkml@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Matous Jarolim <matous.jarolim.lkml@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Rename supportRate and SupportRateNum to snake_case
Date: Tue, 13 Jan 2026 18:03:46 +0100
Message-Id: <20260113170346.557634-1-matous.jarolim.lkml@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

renamed variables supportRate and supportRateNum to support_rate and
support_rate_num to adhere to the linux kernel coding style which mandates
snake_case for variable names.

This fixes the following checkpatch.pl warning:
    CHECK: Avoid CamelCase: <supportRate>
    CHECK: Avoid CamelCase: <supportRateNum>

Signed-off-by: Matous Jarolim <matous.jarolim.lkml@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index e1f76612c96c..3ff5daf1e5aa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -368,7 +368,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 void update_bmc_sta(struct adapter *padapter)
 {
 	unsigned char network_type;
-	int supportRateNum = 0;
+	int support_rate_num = 0;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -392,9 +392,9 @@ void update_bmc_sta(struct adapter *padapter)
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 		/* prepare for add_RATid */
-		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
+		support_rate_num = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
-						      supportRateNum,
+						      support_rate_num,
 						      pcur_network->configuration.ds_config
 		);
 		if (is_supported_tx_cck(network_type)) {
@@ -807,8 +807,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
 	int group_cipher, pairwise_cipher;
-	u8 channel, network_type, supportRate[NDIS_802_11_LENGTH_RATES_EX];
-	int supportRateNum = 0;
+	u8 channel, network_type, support_rate[NDIS_802_11_LENGTH_RATES_EX];
+	int support_rate_num = 0;
 	u8 OUI1[] = {0x00, 0x50, 0xf2, 0x01};
 	u8 WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
@@ -870,15 +870,15 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	pbss_network->configuration.ds_config = channel;
 
-	memset(supportRate, 0, NDIS_802_11_LENGTH_RATES_EX);
+	memset(support_rate, 0, NDIS_802_11_LENGTH_RATES_EX);
 	/*  get supported rates */
 	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_,
 		       WLAN_EID_SUPP_RATES,
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p) {
-		memcpy(supportRate, p + 2, ie_len);
-		supportRateNum = ie_len;
+		memcpy(support_rate, p + 2, ie_len);
+		support_rate_num = ie_len;
 	}
 
 	/* get ext_supported rates */
@@ -887,11 +887,11 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
 	if (p) {
-		memcpy(supportRate + supportRateNum, p + 2, ie_len);
-		supportRateNum += ie_len;
+		memcpy(support_rate + support_rate_num, p + 2, ie_len);
+		support_rate_num += ie_len;
 	}
 
-	network_type = rtw_check_network_type(supportRate, supportRateNum, channel);
+	network_type = rtw_check_network_type(support_rate, support_rate_num, channel);
 
 	rtw_set_supported_rate(pbss_network->supported_rates, network_type);
 
-- 
2.34.1

