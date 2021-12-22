Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2682CA1
	for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 18:51:20 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t26so6755135wrb.4
        for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 10:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKcnEMkqqYrJ4G8c6xXlyRwXLHizR57LqmgmfEBiWn4=;
        b=k6oOfZSPnGFzfWMVysNLKKhNCaepCeg6SYLfP7yYthP1MEQ4PPzP5+VFKJTONVTxdV
         ZveP015dVUXS35NnobIrW/Ayf4LusoDSM5/kHDFCjOEHfbNsak2Wislzx8fK35rVt/jr
         F9TNHaWE1xHXVb6jG4MSuahAQtht8PLV+3HEuT2daDq2ovxtwvt9DtnH1CZcttdLbAPZ
         VYpLaQ9ued48ZWi11OsLZUxQn9Ygr2QHY4ClHdAUsr0YdlMcoqXVGNG7ZrbW7OMJSJiJ
         uvHzQpIZq0Wn2CihioqdoACC4CluV9EXBpStI6kJP4aSQSU85fR3kcWHIA2jCo08Xjhs
         ALFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKcnEMkqqYrJ4G8c6xXlyRwXLHizR57LqmgmfEBiWn4=;
        b=J18xcJRkNsr7e2yiUusjgkOst+PMItkTB/Urh00pQIJXma3FeCUuitJihsKWfAogv0
         ljkNDFEsnhySCH4s2RArbxVhEbrRMEAxz63RrYgSWPMFyLYpbp6Vpr4SPdXW1pFC2kuP
         vyKa9OmIC6SFqzwuUMrcwhmp/k8zVvRUhF0DjAF/fSmMohm7CBa2FzMGLmzwlYhlMraC
         YVqVBLniX8qgEusmj87/bZWxjOgiHolOVFeRcdAXbK7ogYH3I9dFaJ5yOiQPT416Tpfy
         dZfF8/9t94mN8Uo2pyAYKOW+RJcYQ/9w7vaYDS1S2uvz110sKtEA65VsON2Xf3eFWFX+
         LU6w==
X-Gm-Message-State: AOAM530s9LX+BmN5vBotsWDKKywrB3vGRllrPp7a8Kxir+zwxiG4X0lh
	0v1IoNzlooHg4PaiDKhdhzMuKcdBCuVElmXE
X-Google-Smtp-Source: ABdhPJw/KW+5RWe5X8x6UIUZW4+ZKngO4AJ6Rf0YQCCA+Riy9qGF55lmgcQLDLoJ4v7MIQU8idJxCw==
X-Received: by 2002:a05:6000:1241:: with SMTP id j1mr3135709wrx.601.1640199078795;
        Wed, 22 Dec 2021 10:51:18 -0800 (PST)
Received: from localhost.localdomain (78-128-31-15.blagoevgrad.ddns.bulsat.com. [78.128.31.15])
        by smtp.gmail.com with ESMTPSA id d2sm2456202wmb.31.2021.12.22.10.51.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Dec 2021 10:51:18 -0800 (PST)
From: Ismayil Mirzali <ismayilmirzeli@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	linux@roeck-us.net,
	paskripkin@gmail.com
Subject: [PATCH v3 1/2] staging: rtl8723bs: address style guide warnings
Date: Wed, 22 Dec 2021 20:51:14 +0200
Message-Id: <3bddd2a8c02540c56a48d6844b3fcd897441803b.1640197297.git.ismayilmirzeli@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1640197297.git.ismayilmirzeli@gmail.com>
References: <cover.1640197297.git.ismayilmirzeli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed mistakes regarding wrongly formatted if statements,
added missing lines after declarations and removed unnecessary
whitespace.

Signed-off-by: Ismayil Mirzali <ismayilmirzeli@gmail.com>
---
Changes in v3:
  - Improved commit message

 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7fe3df863fe1..d235d1f5f80e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -147,9 +147,8 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _SUCCESS;
 
 	ret = rtw_register_tx_alive(padapter);
-	if (ret != _SUCCESS) {
+	if (ret != _SUCCESS)
 		return _SUCCESS;
-	}
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
@@ -247,6 +246,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 						if (pxmitbuf->len > 0 &&
 						    pxmitbuf->priv_data) {
 							struct xmit_frame *pframe;
+
 							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 							pframe->agg_num = k;
 							pxmitbuf->agg_num = k;
@@ -333,6 +333,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 		if (pxmitbuf) {
 			if (pxmitbuf->len > 0) {
 				struct xmit_frame *pframe;
+
 				pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 				pframe->agg_num = k;
 				pxmitbuf->agg_num = k;
@@ -385,9 +386,8 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	spin_lock_bh(&pxmitpriv->lock);
 	ret = rtw_txframes_pending(padapter);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (ret == 0) {
+	if (ret == 0)
 		return _SUCCESS;
-	}
 
 	/*  dequeue frame and write to hardware */
 
@@ -405,9 +405,8 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	spin_lock_bh(&pxmitpriv->lock);
 	ret = rtw_txframes_pending(padapter);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (ret == 1) {
+	if (ret == 1)
 		goto next;
-	}
 
 	return _SUCCESS;
 }
@@ -428,10 +427,9 @@ int rtl8723bs_xmit_thread(void *context)
 
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

