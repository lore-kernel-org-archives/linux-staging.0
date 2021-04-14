Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C246D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id ba6so24832862edb.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d9HiwiG5kORRP979bbG30Pb7khVbAENnO6ggL6MZz60=;
        b=QrOt/uHCJ3e6Qz3w0WSXTt33lNtjA8DWeeV5itxerWAK3oJxl9hJnUILW+FfGuqMJI
         1UcS1TjKe0RXBImdPqU/8Y6cQhH0YF75ax1doFRFO7BNP+h7KZOIfMNA2guLtMJTk8MK
         m1T/Hwhb/kyiQRb7G9CR7jBTLItIQdh/oKcwK4vQQ10ov9xKArJURiDa0CQ05kY03Ac1
         byj19KPeRvSkAvHxOjJg7O65sRlj/NuARm1le2IFwguNgE06ETGhML6rVy1ez9CIprzk
         KONKLxhyy0wr7fpG5ADB0auUJZbqC7Q1PPXy7L6GtpQpS5IB2TsN6Pj/I7yNEgArbu78
         NAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d9HiwiG5kORRP979bbG30Pb7khVbAENnO6ggL6MZz60=;
        b=jdABUIeedFA0a302olBJCeshP5BQ9QKgK+G0OtsNTAG/gKT05u5NeS6Ku2noRPK7iV
         HL8ieNaGPobUTTe6NIg3WdNca8bX5VD/dpMxguYsLUSBlkBBAavWrwybSpn6SDO1r1bR
         RuuFOzVynHdkA6OhGXbXUrxQ31ASKsRnlf/GwdCztiesSwFSsggytmHKCBzKceN1KdbG
         R95BsEIaSPvWTlFmnO3RAVzNtULJkFydOrvmMpF/FigabihN64tAJzp+odv2O0XOTevd
         5syooCyY8071YtTEnbn+8dsFs69hnX9mI9TgmfmtMec+8GW3CCcS+OfpFBv9g0TmpgxA
         0Umw==
X-Gm-Message-State: AOAM530frccWqVaIHDlx45PZQpNToOpngXjm03ZgyOufzYTTe2Cetd8I
	O9+xZmtHh81OZaQvtqxV6NeH0Q==
X-Google-Smtp-Source: ABdhPJxsWN+SnAz2cYauW5tYfq2NgNpb6CwNSOshksFaL7jjG8cCmFimJJIrsxOS+FHy4hfPGClHuQ==
X-Received: by 2002:a05:6402:b07:: with SMTP id bm7mr209420edb.82.1618423939188;
        Wed, 14 Apr 2021 11:12:19 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Cesati <marcocesati@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Stanley@BB.SD3,
	linux-staging@lists.linux.dev
Subject: [PATCH 43/57] staging: rtl8723bs: hal: rtl8723b_hal_init: Remove unused variable and dead code
Date: Wed, 14 Apr 2021 19:11:15 +0100
Message-Id: <20210414181129.1628598-44-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d6ea8850556f..4773f0dcd9819 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3199,23 +3199,14 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 
 void CCX_FwC2HTxRpt_8723b(struct adapter *padapter, u8 *pdata, u8 len)
 {
-	u8 seq_no;
-
 #define	GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 6, 1)
 #define	GET_8723B_C2H_TX_RPT_RETRY_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 7, 1)
 
-	seq_no = *(pdata+6);
-
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
2.27.0

