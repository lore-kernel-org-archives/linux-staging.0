Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC4F6D00
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 12:26:25 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c14so15685699wrx.3
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W+6eFe0//mxcph1fEdMR/oudTRijIDHPmUlkJgKgFDM=;
        b=HUUVtVuwkJcTAy5nTIXfnqZtDzNOAKYCAnczlPd2SWHkg1+YeVwOdR2nmTzi4Yhn3U
         TpiZRyL5dNt+2lO+9baiZ44eh5ubyhT+UmB3xa20hQqCgbz3REj0nNKN5bsrhyF8eO0c
         FxrWBzKBjuRRUHW6Eoa3TXE3O7JWzlrji9baS+HTIRapYClZCuu144UmjNm/yXj31BZx
         veXvbVBLsmu2yMATKjV0xVCXZ16YKkvf+yiZzmD+IZWml2bEETcE849M3KtdeFS7Ehf3
         t57kqrjpy+eRAvAZMCYkNaTwasxm7321YxRErW8vBH4UfpQpKm4j0w3YgTp9mSfzfZeH
         S+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W+6eFe0//mxcph1fEdMR/oudTRijIDHPmUlkJgKgFDM=;
        b=CNVkZVzNjQHvMSU4knYm590eQTgfp6Zp/SxAZcA/1ZjQx7kI10Jmr+inDc1W7BguE8
         FWOWpgrSKDN7Tj/CZVYC5I2nEaoL0IvL4wTYHqoxmEIh3Yt/kl1d8jbTi8+5n+2Ihhy9
         FXGZy/4x3Y8MakPdw/cE9sNPM7/ITAKaSyhsrAF2dzcx7AgDN6kggeoXkvnMr/UW1L32
         lyIdReBrHXJU1PEWNAMZ9cdfwRVuzljwxegSnRIZrvlrgU8gy0vpvAA5LIyI/nrYoIyw
         NhJQZFu4lhvIbZNa4SbZwb1SiKFRcYBmvB8IPpQJgl2oITJBqZlCCdUJlUW9+8e98npN
         BUzg==
X-Gm-Message-State: AOAM5328eGB8rpjvXIjs+49n3NLBFl3u2gUQ5PsNCXiEedUoq7J+UgAc
	P6e6JYc1QSUq7Ur8R88ij6NYXvlik11BPQ==
X-Google-Smtp-Source: ABdhPJyMvFpEqzIK5NWmes//QY2PtnhBv3UkZRvDeSoY2Q5Ur40HJhMejlzCAGRe3e1/P/qSCNLmcQ==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr4122373wrr.218.1621513584091;
        Thu, 20 May 2021 05:26:24 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id r5sm3001817wrw.96.2021.05.20.05.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:26:23 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Cesati <marcocesati@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Stanley@BB.SD3,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/2] staging: rtl8723bs: hal: rtl8723b_hal_init: Remove unused variable and dead code
Date: Thu, 20 May 2021 13:26:20 +0100
Message-Id: <20210520122620.3470450-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520122620.3470450-1-lee.jones@linaro.org>
References: <20210520122620.3470450-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c: In function ‘CCX_FwC2HTxRpt_8723b’:
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3355:5: warning: variable ‘seq_no’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Marco Cesati <marcocesati@gmail.com>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Stanley@BB.SD3
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 33942ab587720..0270724ccef03 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3204,14 +3204,9 @@ void CCX_FwC2HTxRpt_8723b(struct adapter *padapter, u8 *pdata, u8 len)
 
 	if (GET_8723B_C2H_TX_RPT_RETRY_OVER(pdata) | GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(pdata)) {
 		rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_CCX_PKT_FAIL);
-	}
-/*
-	else if (seq_no != padapter->xmitpriv.seq_no) {
-		rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_CCX_PKT_FAIL);
-	}
-*/
-	else
+	} else {
 		rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_SUCCESS);
+	}
 }
 
 s32 c2h_id_filter_ccx_8723b(u8 *buf)
-- 
2.31.1

