Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E467C2582
	for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 08:35:10 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id ay14so17272900edb.11
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 00:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678437309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msAKBo8aTzc9Ggd6g1HwoQudAOedzcnckHsa9qcUuhU=;
        b=PzmwXRfMGrJIqx4xxVlb9XULjKpymRYv/u7KKo5I3aB4ihccXSnVkurxp8VjDYqVnC
         JfKZgG+LjfQY86kxUQyadFXLr3qUrkX9/DwITbpftNDZyfrGt5UKQ4cSP5CVdAvP8/8U
         cyRB2N8XU6M3CBY/HLOxaeSA/bSDQ1ix+BHV1SXvvSGAs0K0X6/3cP8HTwwnv6dqr28n
         fcygIkgSKCU9Xthq6eON9P3rgwVWtddSpzJ7/gVd7RMPESnjaEUEJB7zbJFwPff7MuzC
         G9ky1RkvmKhgyrJM63ww/3nMqJJ2j5jIyKe9+UNCjqg/oGeKteOrSFWvD0l1YE5czzDd
         t1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msAKBo8aTzc9Ggd6g1HwoQudAOedzcnckHsa9qcUuhU=;
        b=k4Tw9FXV7dGFR+3DATwTwo6wBT56loaRQohPOJrPJDZEEFp+uIu8qKsXNGGaZCMJ+C
         Mb8HHtVLQXpD+1h+jrAbK/t4DD1EHN1iV4bffM1O6hQIqMTIBNPkKr7OrsIUGXFRgs33
         YeGgZv7EL2GC+0AJFuZshb2RYMynQgnwC+heSrZd/GXAZ/6wo9u8RnOoyDad+rVInmpe
         lhUBe8CeKOcfp2O2GCpyf42QtZkFOIq0kh7EYKiDJgdMAaYDuX8ChqE2IEzjVmN/hGHR
         r28dZomBGP1fH96Bc6aCwGK9EhNAS0snO/3XuYaNsCfW1wKZNbPRpuADtV1pkWETN/dv
         rTVA==
X-Gm-Message-State: AO0yUKV0/geRMmXgD0QrPn+YLoSP2DyVFYulSY3PlRORk7T41J5zOioV
	gIOAJ2XQta8iqdnNakn/e2g=
X-Google-Smtp-Source: AK7set8PRabUyEPOVX0EH2+KGtKBA2MWD26erh7YDXt7xGRcF62/POeOCoHiLP/ZLnf4MU+I4ApfcQ==
X-Received: by 2002:a17:907:8746:b0:8b1:7fe9:162e with SMTP id qo6-20020a170907874600b008b17fe9162emr27434749ejc.47.1678437309325;
        Fri, 10 Mar 2023 00:35:09 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbd3.dynamic.kabel-deutschland.de. [95.90.187.211])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090619ca00b008ce5b426d77sm697888ejd.13.2023.03.10.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 00:35:09 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: rtw_get_raw_rssi_info() is not used
Date: Fri, 10 Mar 2023 09:34:49 +0100
Message-Id: <20230310083449.23775-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310083449.23775-1-straube.linux@gmail.com>
References: <20230310083449.23775-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_get_raw_rssi_info() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 32 ---------------------
 drivers/staging/rtl8723bs/include/hal_com.h |  1 -
 2 files changed, 33 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 792636fe3270..852232102433 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -898,38 +898,6 @@ void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 }
 
 #ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
-void rtw_get_raw_rssi_info(void *sel, struct adapter *padapter)
-{
-	u8 isCCKrate, rf_path;
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct rx_raw_rssi *psample_pkt_rssi = &padapter->recvpriv.raw_rssi_info;
-
-	netdev_dbg(padapter->pnetdev,
-		   "RxRate = %s, PWDBALL = %d(%%), rx_pwr_all = %d(dBm)\n",
-		   HDATA_RATE(psample_pkt_rssi->data_rate),
-		   psample_pkt_rssi->pwdball, psample_pkt_rssi->pwr_all);
-
-	isCCKrate = psample_pkt_rssi->data_rate <= DESC_RATE11M;
-
-	if (isCCKrate)
-		psample_pkt_rssi->mimo_signal_strength[0] = psample_pkt_rssi->pwdball;
-
-	for (rf_path = 0; rf_path < pHalData->NumTotalRFPath; rf_path++) {
-		netdev_dbg(padapter->pnetdev,
-			   "RF_PATH_%d =>signal_strength:%d(%%), signal_quality:%d(%%)\n",
-			   rf_path,
-			   psample_pkt_rssi->mimo_signal_strength[rf_path],
-			   psample_pkt_rssi->mimo_signal_quality[rf_path]);
-
-		if (!isCCKrate) {
-			netdev_dbg(padapter->pnetdev,
-				   "\trx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",
-				   psample_pkt_rssi->ofdm_pwr[rf_path],
-				   psample_pkt_rssi->ofdm_snr[rf_path]);
-		}
-	}
-}
-
 void rtw_dump_raw_rssi_info(struct adapter *padapter)
 {
 	u8 isCCKrate, rf_path;
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index c1aa7f0a35f9..17d5cfb66a36 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -150,7 +150,6 @@ bool eqNByte(u8 *str1, u8 *str2, u32 num);
 bool GetU1ByteIntegerFromStringInDecimal(char *str, u8 *in);
 
 #ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
-void rtw_get_raw_rssi_info(void *sel, struct adapter *padapter);
 void rtw_store_phy_info(struct adapter *padapter, union recv_frame *prframe);
 void rtw_dump_raw_rssi_info(struct adapter *padapter);
 #endif
-- 
2.39.2

