Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EE328F3;
	Mon,  4 Apr 2022 21:19:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id l9-20020a05600c4f0900b0038ccd1b8642so612987wmq.0;
        Mon, 04 Apr 2022 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bFlDiB7Yl+vEk/1oUNkeFuM8bNkIWz6zYHUTpxecM0=;
        b=jqBvCJw3e9Zy0AXxEU4UbP/3TXTppzsBxqSvjlzePS9sPBZfoVNut7dgKFSTHqfKAo
         ohLFl4S6XUZjvlqZYTb4SuIL4PrLMQhKKh9pgp6Rt1ClFd8J/gbnag3J5IY6BXcqs0DT
         59BfddhoMjej4Mow31ayuT7L42clo/9iQGAFlqWuT6XJqN1KXbJ9aU1OFXFW/Hvd+2sl
         Y9IDp11lyhXRm2dF2KwoHN424Miga/YyYvkr7nvBGE+RlrQXtJlWvU1UVbeVkMitgh4g
         afl8mBeYDl8Glx7DxJt6jyx/zT796Yyfc50tTbkfclY2/btnH2OsCRd0R4LBK1aPbLv0
         l7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bFlDiB7Yl+vEk/1oUNkeFuM8bNkIWz6zYHUTpxecM0=;
        b=iQbhZvgXYL7L4tt2AHXpkz8cFAZkld5fqS6wyBLCqB51jW9MpgjsVsjERqnSekz6OB
         lbpjIqqKGbWTQw5txdZsu8r7VmqEhUQr423rqxngHCMb+bOgIdVztlko88cfBww/VWko
         zvoHRMagidfC8GgVXXfdgc1xKPGPrd7r/SADwUvwIJEqGFZ2JWKouYpP7z28DmNPYDv4
         GGkftim52ItWUbk3gvcFFw5KpOWh7JsEee+CQR0/00mR902MxU2Kv7K4/0GxjKG0hJFa
         rghdTgF0V0j8URzMo/EKIWC8oE+GllWokCS35ZJX7I4y4EhjNtN6riMWZymm1fZT2RAq
         qywg==
X-Gm-Message-State: AOAM5306HdNjlAANHBNoudQKS/c48BjOOeU0XjkckwyfZAiQSJlQCYYT
	eHX4SALS7gpVuWJqlx3yx3E=
X-Google-Smtp-Source: ABdhPJxJKPlittVZwsDwfkFErdZ0YsY8p76eVcZFYWXY1FmFqERPcdwilZFXMypEdeumrxgbdlJgpg==
X-Received: by 2002:a1c:f719:0:b0:381:ba:5247 with SMTP id v25-20020a1cf719000000b0038100ba5247mr23415wmh.183.1649107185757;
        Mon, 04 Apr 2022 14:19:45 -0700 (PDT)
Received: from alaa-emad ([41.42.174.117])
        by smtp.gmail.com with ESMTPSA id e13-20020a05600c4e4d00b0038e44e316c1sm132294wmq.6.2022.04.04.14.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 14:19:44 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH] staging: rtl8712: remove Unnecessary parentheses
Date: Mon,  4 Apr 2022 23:19:42 +0200
Message-Id: <20220404211942.11446-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

CHECK: Unnecessary parentheses

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_recv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
index 0ffb30f1af7e..7f1fdd058551 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -56,7 +56,7 @@ void r8712_init_recv_priv(struct recv_priv *precvpriv,
 		precvbuf->ref_cnt = 0;
 		precvbuf->adapter = padapter;
 		list_add_tail(&precvbuf->list,
-			      &(precvpriv->free_recv_buf_queue.queue));
+			      &precvpriv->free_recv_buf_queue.queue);
 		precvbuf++;
 	}
 	precvpriv->free_recv_buf_queue_cnt = NR_RECVBUFF;
@@ -123,8 +123,8 @@ void r8712_free_recvframe(union recv_frame *precvframe,
 		precvframe->u.hdr.pkt = NULL;
 	}
 	spin_lock_irqsave(&pfree_recv_queue->lock, irqL);
-	list_del_init(&(precvframe->u.hdr.list));
-	list_add_tail(&(precvframe->u.hdr.list), &pfree_recv_queue->queue);
+	list_del_init(&precvframe->u.hdr.list);
+	list_add_tail(&precvframe->u.hdr.list, &pfree_recv_queue->queue);
 	if (padapter) {
 		if (pfree_recv_queue == &precvpriv->free_recv_queue)
 			precvpriv->free_recvframe_cnt++;
@@ -319,7 +319,7 @@ static void amsdu_to_msdu(struct _adapter *padapter, union recv_frame *prframe)
 	struct rx_pkt_attrib *pattrib;
 	_pkt *sub_skb, *subframes[MAX_SUBFRAME_COUNT];
 	struct recv_priv *precvpriv = &padapter->recvpriv;
-	struct  __queue *pfree_recv_queue = &(precvpriv->free_recv_queue);
+	struct  __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
 
 	nr_subframes = 0;
 	pattrib = &prframe->u.hdr.attrib;
@@ -485,8 +485,8 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl,
 		else
 			break;
 	}
-	list_del_init(&(prframe->u.hdr.list));
-	list_add_tail(&(prframe->u.hdr.list), plist);
+	list_del_init(&prframe->u.hdr.list);
+	list_add_tail(&prframe->u.hdr.list, plist);
 	return true;
 }
 
@@ -520,7 +520,7 @@ int r8712_recv_indicatepkts_in_order(struct _adapter *padapter,
 		pattrib = &prframe->u.hdr.attrib;
 		if (!SN_LESS(preorder_ctrl->indicate_seq, pattrib->seq_num)) {
 			plist = plist->next;
-			list_del_init(&(prframe->u.hdr.list));
+			list_del_init(&prframe->u.hdr.list);
 			if (SN_EQUAL(preorder_ctrl->indicate_seq,
 				     pattrib->seq_num))
 				preorder_ctrl->indicate_seq =
@@ -980,7 +980,7 @@ static void recvbuf2recvframe(struct _adapter *padapter, struct sk_buff *pskb)
 	union recv_frame *precvframe = NULL;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 
-	pfree_recv_queue = &(precvpriv->free_recv_queue);
+	pfree_recv_queue = &precvpriv->free_recv_queue;
 	pbuf = pskb->data;
 	prxstat = (struct recv_stat *)pbuf;
 	pkt_cnt = (le32_to_cpu(prxstat->rxdw2) >> 16) & 0xff;
-- 
2.35.1

