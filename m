Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7CE72
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 09:22:04 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id n5so21336213wro.12
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LwS19Pu60Eg7Pxhh9vDy7vF/Y3OqRXTrS0UIqhPMzPc=;
        b=Zp//iYk42t+0j6ZvH3QjFW7q/x7wJMASbWriallIcyczS5l10whvO4K35CRW71QbOw
         l2urogPIiKg7gHN96w1Bd4Kz8uQNtwbEgEJYpO1wd7C1aglpo5Rs02R2/tT+o72XxTEm
         WTbNiKCfECKj2IFQ6ON5YRK9QCCSuGbfxPScnjtMHReraJdUtirIk1Cy8cz3fY4nmj2A
         tTvM769uWgPPOBKFKkxVh9fEZ/XChC+XtIVVOeJqATIQfw4fkWIKLjkZ1lqZDhb5scFp
         YZktN/6hnDAmwXsgtjJYMv/9OGjY/HETERTj1dCflXFRSohImp3aPPjPRILr6P93tG3E
         kkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LwS19Pu60Eg7Pxhh9vDy7vF/Y3OqRXTrS0UIqhPMzPc=;
        b=QF0tc4XRNroaScgekAqTrbcWuuUojid8kIJimQYlsddjeeIBLqC+Z1Noc8U7XnCz9D
         ByTX2TjKwXV7/8pFFaKX4AtvPLbgfSljpNYbHRHBR150yvU1cAgI6Rf+CHW0jBTzuERk
         zpGD+rFQWhsDUjsgXeZzKB60EMW3/atZp8+lByCfSQlncXzGUHmyhJZJgtDtuejBHtjQ
         quq6m2A5pVPxCCQrwyPWHrgDn2uWo1ExHX7coThroa5Lx9/bq2RJdJvqJq7yupKwUVDP
         mAaKokT9Wl5Rx3cVWbbym5uo5gVC8zDt+QMDRG72Toq7wMwPJa6JxSn7Qyx6kSCJOdSG
         6RSA==
X-Gm-Message-State: AOAM531wgPk21TBV7eT/YUBd5buJiExxSISCy1LULczyAfLcSsX4axGl
	TRGfqTH9qenTGbrZAy/FGUQ=
X-Google-Smtp-Source: ABdhPJxDMf/tVh7EL/Bufz+sqPCMBpcxYreGZvJolmp4G5XANmYkEWA5c0So3EWMpQJ4qTMSDjp3KA==
X-Received: by 2002:adf:914e:: with SMTP id j72mr25294838wrj.218.1630315322885;
        Mon, 30 Aug 2021 02:22:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id j1sm18378248wrd.50.2021.08.30.02.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 02:22:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: remove set but unused variable
Date: Mon, 30 Aug 2021 11:21:51 +0200
Message-Id: <20210830092153.9283-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830092153.9283-1-straube.linux@gmail.com>
References: <20210830092153.9283-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable rfPath in Hal_SetAntennaPathPower() and
Hal_SetTxPower() is set but not used. Remove the variable
and related code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_mp.c | 29 +----------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_mp.c b/drivers/staging/r8188eu/hal/rtl8188e_mp.c
index 49c672383e43..ec1d7e90547e 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_mp.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_mp.c
@@ -221,24 +221,10 @@ void Hal_SetAntennaPathPower(struct adapter *pAdapter)
 {
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(pAdapter);
 	u8 TxPowerLevel[RF_PATH_MAX];
-	u8 rfPath;
 
 	TxPowerLevel[RF_PATH_A] = pAdapter->mppriv.txpoweridx;
 	TxPowerLevel[RF_PATH_B] = pAdapter->mppriv.txpoweridx_b;
 
-	switch (pAdapter->mppriv.antenna_tx) {
-	case ANTENNA_A:
-	default:
-		rfPath = RF_PATH_A;
-		break;
-	case ANTENNA_B:
-		rfPath = RF_PATH_B;
-		break;
-	case ANTENNA_C:
-		rfPath = RF_PATH_C;
-		break;
-	}
-
 	switch (pHalData->rf_chip) {
 	case RF_8225:
 	case RF_8256:
@@ -256,24 +242,11 @@ void Hal_SetTxPower(struct adapter *pAdapter)
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(pAdapter);
 	u8 TxPower = pAdapter->mppriv.txpoweridx;
 	u8 TxPowerLevel[RF_PATH_MAX];
-	u8 rf, rfPath;
+	u8 rf;
 
 	for (rf = 0; rf < RF_PATH_MAX; rf++)
 		TxPowerLevel[rf] = TxPower;
 
-	switch (pAdapter->mppriv.antenna_tx) {
-	case ANTENNA_A:
-	default:
-		rfPath = RF_PATH_A;
-		break;
-	case ANTENNA_B:
-		rfPath = RF_PATH_B;
-		break;
-	case ANTENNA_C:
-		rfPath = RF_PATH_C;
-		break;
-	}
-
 	switch (pHalData->rf_chip) {
 	/*  2008/09/12 MH Test only !! We enable the TX power tracking for MP!!!!! */
 	/*  We should call normal driver API later!! */
-- 
2.33.0

