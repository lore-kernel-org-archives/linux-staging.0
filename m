Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE25F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 16:50:32 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 12so5979803wmf.5
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b7BFqSIqisVb+P8mMvuvvRlADBX0+TPMxqh1kGTuZXM=;
        b=iG9q5XUtIHMDcHH7CsOFSN7JYSmNEWyPNz/jOrLZpz7bboDc3H4PFOnmRhLNwCF53T
         TnEgmVkO5WlVzHgp7bY7ldZ7NsqLgqJggU1Hqza/ikbtDr/RlYRWGOJKt1idCMoffBNw
         7QhMsh2uTurgReczK/rgRWsaznuzKHxk8+2K3lYi6LeXgMkbO5lVD7Qlkel9icCIb4c8
         93Dgzj+Dm9Somh3q9ZbdNqv/U6VqMm8Twanw2hmxiCcFosaPtaY0XZD7VKwpQwFBDwPB
         6FQCGN0aNddOVY/+D6L3x1iFWW1XiGLPA91tLmYpnfW1xqZrRnTpNDsCDsZa3+YWYr+G
         vVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b7BFqSIqisVb+P8mMvuvvRlADBX0+TPMxqh1kGTuZXM=;
        b=l7oUgpPrFkxSaLHNy/dOEOjp33C6g0fsVUNKLopUmK9ZA0qKSbmSMdmzEOYCY53LXz
         Odls3V+y3GUvWuWpchxZam9pRMq/VA/Xg+AmYFH0Hsq9CODDDvNycbcZJUi62WSrGgzl
         BqpjrsF92K9lA53kjpMHxO+rvHOKPrbHQydF0z86lG1eNCe2gyo+JB7vhnq4k2vWvc9M
         qqyFP4zIq/9Q1TO2TV2TMDzOcwXoCdfCPsEx4ClJ33qzc1tJHXSu5X4o7Nvtci+HDZvA
         CgghsQ3AkxZvbZakWIOL7zGSmd4L8Exz8AqBBGgcmRGUSdezTNtnvnmaQLTG7qj0eT3t
         OQsw==
X-Gm-Message-State: AOAM5332hgRU9prWYTrpQzhtgQVlVHkwlXaCoqYG+Z4MQvN3y3REchRN
	I9vKB+V6OrgL1KW2lufsa/0=
X-Google-Smtp-Source: ABdhPJwMwa2NsjlE95FpdPqliEGDD8OGda7R1VX9xHRjszt7i9zH02Y9H6yI8+uCcLbQG1vtRinZZw==
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr65886wmd.42.1617641431169;
        Mon, 05 Apr 2021 09:50:31 -0700 (PDT)
Received: from agape ([5.171.72.58])
        by smtp.gmail.com with ESMTPSA id l21sm46969wmg.41.2021.04.05.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 09:50:30 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 10/10] staging: rtl8723bs: remove commented code block
Date: Mon,  5 Apr 2021 18:49:57 +0200
Message-Id: <b930cfc476c97f2ae5c5b90c1314a6270d56a539.1617640221.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617640221.git.fabioaiuto83@gmail.com>
References: <cover.1617640221.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented 5G code block in hal/hal_com_phycfg.c
which contained removed RT_TRACE log

as reported in the driver's TODO file:

    - find and remove remaining code valid only for 5 GHz.
      Most of the obvious ones have been removed,
      but things like channel > 14 still exist.

so just removed obsolete commented code.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index f52cc4e7a6e6..a7ecdf501a14 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -1780,25 +1780,6 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 		DBG_871X("No power limit table of the specified band\n");
 	}
 
-	/*  combine 5G VHT & HT rate */
-	/*  5G 20M and 40M HT and VHT can cross reference */
-	/*
-	if (band_type == BAND_ON_5G && pwr_lmt == MAX_POWER_INDEX) {
-		if (idx_bandwidth == 0 || idx_bandwidth == 1) {
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

