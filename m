Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD0F71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:15 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id e14so1815788ejz.11
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UwUrxvylt3yZIVSmbQay33Opg09VnbrEvLSM4U98oN8=;
        b=f93FHJiX8L0rS1HYbiHDXeFn1Z1Trmn85IE8Yo/oo492xrMADwzmZOGdvW+gF+KJ/h
         /WoOQKYNt53PfkwZJUyPYo3OAIZ/8hjpmddquymmMI8JVXNenigzuM6TehHASH8nIuvp
         RHqAtEC1OG2jZWwTrBTHBvKHy98di7pf6iaPfzB3YhnpWKtqv59HHGvDUkXIEwd8e+al
         3NtlQC33PgrLzmwQ6jH88V9S7ZdoQrrX7Fbsi6pFA9Dp6Qp8MOlpLpcL3gWQU7jVea9z
         rpcAYC1dnao1MhwxsnyIgbjHvyoUAiAMSGEj3XOzftDu/ix7ZvwNbkeJsaNlix0AeHpa
         xm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UwUrxvylt3yZIVSmbQay33Opg09VnbrEvLSM4U98oN8=;
        b=JbaRrU1HRHm3l9VAyz5BwfhuoECZDFFdWckDmhDVe+2XwjRhGUW6VRtMqEOje0zGH6
         G+e3AH4P+rnNkTcHVuynJu/SPYpL4ph5RiuVBrqpIgjZMiHsKxZ7DCNZjtjV0VnT7E76
         YsaGTUOMIfXcHj2EcE0Sf+Ez+HnKHWuDnYogk8FeDHEP6ItVKwqDeOMlrkHxRf/3MxQT
         8Fiu2a06Don/uxuswkd4/Erm4aY9ABZekQbbsZ0CFE8NxpZ2aTxJFAh7Lc8TXkEOwp7p
         BYCPCFSQVTz7JBA0njryxG7baeb0SaGF6vmQoo2WImh9Mys8k2B/pIi2B4yL1FfO0VZD
         TTHg==
X-Gm-Message-State: AOAM532dCVF++5bYc+oyQ/hHPpJGs9tewMPoaALsMyq97TUd7HDTRBv4
	n2tdheFYCwyFoA1J97QMb2s=
X-Google-Smtp-Source: ABdhPJxp1uexH9mkMIVaEa2jZdRk8Y4gFx3V+w4NVhEPTONKa17iUw7dAxN7NZeHZNXUMahYgIFzzQ==
X-Received: by 2002:a17:906:4407:: with SMTP id x7mr7973599ejo.546.1617268934525;
        Thu, 01 Apr 2021 02:22:14 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id s18sm3291145edc.21.2021.04.01.02.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:14 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 31/49] staging: rtl8723bs: remove commented code block in hal/hal_com_phycfg.c
Date: Thu,  1 Apr 2021 11:21:01 +0200
Message-Id: <5af521bcb3e036a390ef2c434d9c0262770525d9.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
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

