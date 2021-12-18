Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0832C9C
	for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 20:37:00 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id j6so1081341edw.12
        for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 12:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FIGfA4bMGtcua1tFMikw37GaJE3EJCxq+zCMzmtv8Jw=;
        b=M77VY0VCOYGoEytWte1MieOssO+vx6gAEsAB1X01/rlM6uuxPCZVfO80fSatOSrJps
         NUpsXxBiePUzTwlb0lieVDy7B37N88P3YOi6p7aC+w34O7sGlUxHZrmgd/buCHiwtEMz
         D5XZSRQjwkBmbTcm6DE4OmDgJRT62F6kfWWJSxdkA8xwDb83au9JjcPmKFKqVRg8pbVZ
         lm/9XhWFhnF6ljgYAaTdSKMpXuR38xeMQ+BaFdfj/Dv1KEOunTOT0ygUJW0qm4Zo0l4b
         xV5GGg6zsTM9Svl1wGnF81U6cQXf5LQqht+Crs9xSZG3oXJ+EYNNJ/+juCma6xQCsfAY
         mrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FIGfA4bMGtcua1tFMikw37GaJE3EJCxq+zCMzmtv8Jw=;
        b=AJ6BYKSCTGL0KF9I3kfcJrnw19xdxomYNl0LgLxOpJLNRc/p/5H3YCGhmeABZbylj6
         cN2u9UnR1UOw8U9afQUUBUXU3Z7myVjeUp/AA5ztpk1PcwMZIixiYSAnDgCbngUbRiP8
         qlcl3WXzpOXhDHxhxuUv1ert3w26oGd6BnqCYJPjvn0Sem3cc2mI20fNWQ/6accP1fOQ
         o1iFD7K0zbGvG1OfUB1f2aHegB7UVOEtmtMGRSUD17EesSb5xfZUiZVZQWN3YvIMiG95
         WgDa3PxCJOTZ2N8OBhkpyW6f3MHvY/e+ERsoO1H06Uqf06N28ajp4iEfm1l2MVDjUeOD
         s1Xw==
X-Gm-Message-State: AOAM532b0dXxrC6dypGsqYBTKNbGotchnz99U2/OL4wqGzU5g32TBnXm
	h09sVCYqe6geYeguHGEaEKKY++agwQNPqd2IsWA=
X-Google-Smtp-Source: ABdhPJylDNwPSl4PheFqzZA8fPd1BzoLs1/XEtVU10hmAURbttvSsxDceTh9aYU4FTfcUvf9zdKiIQ==
X-Received: by 2002:a17:906:b24a:: with SMTP id ce10mr7155180ejb.20.1639859819095;
        Sat, 18 Dec 2021 12:36:59 -0800 (PST)
Received: from Snowflake.localdomain ([83.143.250.232])
        by smtp.gmail.com with ESMTPSA id 12sm4054616ejh.173.2021.12.18.12.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 12:36:58 -0800 (PST)
From: Ismayil Mirzali <ismayilmirzeli@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	simon.fodin@gmail.com
Subject: [PATCH] staging: rtl8723bs: Fix styling issues
Date: Sat, 18 Dec 2021 22:36:47 +0200
Message-Id: <20211218203647.24486-1-ismayilmirzeli@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed extra whitespaces and brackets for oneline if statements

Signed-off-by: Ismayil Mirzali <ismayilmirzeli@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7fe3df863fe1..7807b2a6cdc5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -32,7 +32,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 	pHalData->SdioTxOQTFreeSpace -= agg_num;
 
 	/* if (n > 1) */
-	/* 	++priv->pshare->nr_out_of_txoqt_space; */
+	/*	++priv->pshare->nr_out_of_txoqt_space; */
 
 	return true;
 }
@@ -147,13 +147,12 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _SUCCESS;
 
 	ret = rtw_register_tx_alive(padapter);
-	if (ret != _SUCCESS) {
+	if (ret != _SUCCESS)
 		return _SUCCESS;
-	}
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
-/* 	dump secondary adapter xmitbuf */
+		/*	dump secondary adapter xmitbuf */
 	} while (!queue_empty);
 
 	rtw_unregister_tx_alive(padapter);
@@ -311,7 +310,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 					pxmitframe->pg_num = (txlen + 127) / 128;
 					pxmitbuf->pg_num += (txlen + 127) / 128;
 				    /* if (k != 1) */
-					/* 	((struct xmit_frame*)pxmitbuf->priv_data)->pg_num += pxmitframe->pg_num; */
+					/*	((struct xmit_frame*)pxmitbuf->priv_data)->pg_num += pxmitframe->pg_num; */
 					pxmitbuf->ptail += _RND(txlen, 8); /*  round to 8 bytes alignment */
 					pxmitbuf->len = _RND(pxmitbuf->len, 8) + txlen;
 				}
@@ -385,9 +384,8 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	spin_lock_bh(&pxmitpriv->lock);
 	ret = rtw_txframes_pending(padapter);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (ret == 0) {
+	if (ret == 0)
 		return _SUCCESS;
-	}
 
 	/*  dequeue frame and write to hardware */
 
@@ -405,9 +403,8 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	spin_lock_bh(&pxmitpriv->lock);
 	ret = rtw_txframes_pending(padapter);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (ret == 1) {
+	if (ret == 1)
 		goto next;
-	}
 
 	return _SUCCESS;
 }
@@ -428,10 +425,9 @@ int rtl8723bs_xmit_thread(void *context)
 
 	do {
 		ret = rtl8723bs_xmit_handler(padapter);
-		if (signal_pending(current)) {
+		if (signal_pending(current))
 			flush_signals(current);
-		}
-	} while (_SUCCESS == ret);
+	} while (ret == _SUCCESS);
 
 	complete(&pxmitpriv->SdioXmitTerminate);
 
-- 
2.25.1

