Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838DA6F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:55 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id b7so29097707ejv.1
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UwUrxvylt3yZIVSmbQay33Opg09VnbrEvLSM4U98oN8=;
        b=oGdh1hqDoJ0ZqEbpJv3GhhODipHewFj0wuYX/Pjuzq5aX5Q7zivjem57+8ZCXXe7tf
         znKeXjAGx/KdMW2obP70TkdQQRETAS1tfurb4j/hvbh7hzXrilPH5xscsYV+O+lqsmeI
         ZTlJOaDnpTtqgte/PcBqDhhjQtpo/7ZnBU6s8i/aW+O4xm5dhLEQILHNfPTsxEj0qnZ0
         7RnJE/fCs6HJ4yoM4BA76XFwSVlYkUqLBR9EURPkC4hnSFR8X5xZzcrG3VMPejhMAmqs
         wJLuT5orODNokIgMmN2BMsMTO1TdoDoPXAN3uNeNo86QEtKK1GVHvkzJDSpVOv6zEncH
         fMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UwUrxvylt3yZIVSmbQay33Opg09VnbrEvLSM4U98oN8=;
        b=Px6JW7cZ+pfffXAqv6PZwjwsEuFiUXBTNbWznRJ6TMYUdRGo/PDGIUB/tFEROoVlYl
         W/Dtla1i9kX/oaxN4KCW4irqqPgzIRcMCyNYPhOr102yLg/j7evtF6/hbCfW/UCjOrrh
         2AHf0+wwJOWoDAf97mCYL9CtwCoktQ8yqQS5rzU0DQVYYIGFB4EpDUkjjG5cr3E/0NRT
         ZaamYuVSp1IqQ8RmCti0W6C14WP7dObREMHhNXvzKygidLGv1/4lynFVtMdT5cCEN65A
         H0LwxfvuaLqlFN1TBGG+RqXqqGShcLWcYjSj6VBEvTJeIMezLABn8rX6sBGIOXTRu1ys
         qhXg==
X-Gm-Message-State: AOAM533m263xZZ6DaYq6g+6rmILyFfaAPrpB20ZlejUVkveP7ZGIPNyS
	J8oPgAkSqgecLT7WTn2TlKM=
X-Google-Smtp-Source: ABdhPJxjPxlrjZD34DiT7/cRtCwf+cDYiExocYwQw89ffRGXzLBcRNSRdQP7aVblqufpT/OEeGvLbQ==
X-Received: by 2002:a17:906:170d:: with SMTP id c13mr2449440eje.491.1617183654147;
        Wed, 31 Mar 2021 02:40:54 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id t12sm1165502edy.56.2021.03.31.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 22/40] staging: rtl8723bs: remove commented code block in hal/hal_com_phycfg.c
Date: Wed, 31 Mar 2021 11:39:50 +0200
Message-Id: <e8aade1657d685c68c8ef07fa6aca628b1cec8e1.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented 5G code block in hal/hal_com_phycfg.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 9b16265b543d..a7ecdf501a14 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -1780,26 +1780,6 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 		DBG_871X("No power limit table of the specified band\n");
 	}
 
-	/*  combine 5G VHT & HT rate */
-	/*  5G 20M and 40M HT and VHT can cross reference */
-	/*
-	if (band_type == BAND_ON_5G && pwr_lmt == MAX_POWER_INDEX) {
-		if (idx_bandwidth == 0 || idx_bandwidth == 1) {
-			RT_TRACE(COMP_INIT, DBG_LOUD, ("No power limit table of the specified band %d, bandwidth %d, ratesection %d, rf path %d\n",
-				 idx_band, idx_bandwidth,
-				 idx_rate_sctn, rf_path));
-			if (idx_rate_sctn == 2)
-				pwr_lmt = hal_data->TxPwrLimit_5G[idx_regulation][idx_bandwidth][4][idx_channel][rf_path];
-			else if (idx_rate_sctn == 4)
-				pwr_lmt = hal_data->TxPwrLimit_5G[idx_regulation][idx_bandwidth][2][idx_channel][rf_path];
-			else if (idx_rate_sctn == 3)
-				pwr_lmt = hal_data->TxPwrLimit_5G[idx_regulation][idx_bandwidth][5][idx_channel][rf_path];
-			else if (idx_rate_sctn == 5)
-				pwr_lmt = hal_data->TxPwrLimit_5G[idx_regulation][idx_bandwidth][3][idx_channel][rf_path];
-		}
-	}
-	*/
-
 	/* DBG_871X("TxPwrLmt[Regulation %d][Band %d][BW %d][RFPath %d][Rate 0x%x][Chnl %d] = %d\n", */
 	/*		idx_regulation, hal_data->CurrentBandType, bandwidth, rf_path, data_rate, channel, pwr_lmt); */
 	return pwr_lmt;
-- 
2.20.1

