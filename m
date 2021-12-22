Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ABA2CA8
	for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 18:51:21 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id a83-20020a1c9856000000b00344731e044bso2021744wme.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 10:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WgCka50MiqhFvHN7wgFbd3SwPSc2IfRDJ1vY8n9ELtE=;
        b=Ul2til7gLTubUYC1a547nWaZVn/4VN44fsMnWCl4uL53kwMdQNvKxkaPiFHK65OWN7
         gCwP8FuDzVlwXDLNcANn0Lc9UNlXRYDSJfDealbaFAIIIa5bzUEgkwkOveL9SRvI6uut
         KqbJfkWcgvniEIuQ+ZutVzj/wfbKptDCYxH1fNabdD82OYLTdFIfOs+F2yxcWgUIvqXK
         A7kPrivVkAN8vi4PlgQxi0RbH7AruNHt2LV1VlkN7Hl11mwRxGrC98N2xjB6ro3hlQMb
         NjMEYgT00wI9SkFSmQ1UbhRt8BZrGaNgOnIUTYXBvZglRoL0+Q3hbVFv4Of2ZVwNzgSw
         rE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WgCka50MiqhFvHN7wgFbd3SwPSc2IfRDJ1vY8n9ELtE=;
        b=dagcTPvh1r42slLCbwGTCsqrEtvP1rqcJ58JKX/QT8dIpQSH5Ey6+OM+PjE7hLltCe
         00WUv4wW2wv/KJ55m3Th/UT1QXhn35rlq7+kQ5rVms2qXswEodKD98HBxWSmU/IJ1ZMV
         t/SMK4H0n6Wo7B8GkZEvZkgGWGCmh491TVRFMw5R7a6mAKtG2XbK+Vrel7oZ3tk+QpS+
         eAa8S0m/NOjZSJcRQizw3iQwzj7eVa6Fubg0JFriGu1/+LZCBfekucGygYMt36r7p1M7
         EMo2nABPAnj5V6ODg7nNUDyEnvOb7fVU9bmgEPDcY03NMTiLqBoWZ37eRBygNdG7X6KE
         B8XA==
X-Gm-Message-State: AOAM533IJSsPA8eXetzAUzxhBihMVJuPs8gZ4vHD2m3ev7hgE3tz2zAu
	KU65hL/DOlDzAoaogBFSB+8PwI1mufY/at04
X-Google-Smtp-Source: ABdhPJyA4CH0UhOFKJXgF6AbOcOrQ1+ZZ3L1TJHs9lW6milQOPzd+4kbanZH86Jzt7gQJEmrlV51qg==
X-Received: by 2002:a05:600c:2f10:: with SMTP id r16mr1801889wmn.141.1640199079633;
        Wed, 22 Dec 2021 10:51:19 -0800 (PST)
Received: from localhost.localdomain (78-128-31-15.blagoevgrad.ddns.bulsat.com. [78.128.31.15])
        by smtp.gmail.com with ESMTPSA id d2sm2456202wmb.31.2021.12.22.10.51.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Dec 2021 10:51:19 -0800 (PST)
From: Ismayil Mirzali <ismayilmirzeli@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	linux@roeck-us.net,
	paskripkin@gmail.com
Subject: [PATCH v3 2/2] staging: rtl8723bs: removed unused if blocks
Date: Wed, 22 Dec 2021 20:51:15 +0200
Message-Id: <b4652b7490f3574445d567ef662270605533bfa4.1640197297.git.ismayilmirzeli@gmail.com>
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

Deleted the commented if blocks that weren't being used as suggested by
the maintainers.

Signed-off-by: Ismayil Mirzali <ismayilmirzeli@gmail.com>
---
Changes in v3:
  - None, this patch was created to separate out the unrelated changes
    of the first patch

 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index d235d1f5f80e..8270c022e2cc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -31,9 +31,6 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 
 	pHalData->SdioTxOQTFreeSpace -= agg_num;
 
-	/* if (n > 1) */
-	/* 	++priv->pshare->nr_out_of_txoqt_space; */
-
 	return true;
 }
 
@@ -310,8 +307,6 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 					txlen = txdesc_size + pxmitframe->attrib.last_txcmdsz;
 					pxmitframe->pg_num = (txlen + 127) / 128;
 					pxmitbuf->pg_num += (txlen + 127) / 128;
-				    /* if (k != 1) */
-					/* 	((struct xmit_frame*)pxmitbuf->priv_data)->pg_num += pxmitframe->pg_num; */
 					pxmitbuf->ptail += _RND(txlen, 8); /*  round to 8 bytes alignment */
 					pxmitbuf->len = _RND(pxmitbuf->len, 8) + txlen;
 				}
-- 
2.25.1

