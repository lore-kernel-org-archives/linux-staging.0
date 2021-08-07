Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA470
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 10:12:16 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id g21so16868376edb.4
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OLYwYL4yHWs8tFQCIhgrNqkSA1gUZ66wmo+Okb77ZSI=;
        b=DyXSAUnc2ZqKtyK0DQZTeyblvC2Op95/Biv5loDA/DochU4PHbDoRT26IOREhyieK+
         jfhJOE1pJvWYwWHWSTf57pcKGLi1g6wBu+NEGPN6pmFZclo2C0WuvQ9NsWtyUo3zmrnO
         S1qw0Ksqgg5jrJ4sW7bcQ6EWOXXNAyyCnmFvfmkLIaVQP03dwW6uX0kcDsv3V2TNnM2S
         FwPsHZbq6gp3ZLsArb4nwkwMH+v/GudoSf/gnnoVwspkCGqmtl71eqdV0OXqu5Ym4rHG
         0etjmL0XvLEogRfnBwBQ76YHc45fSBAp6zf7oc2bFO2AFjZfWrZs5Du/z1grI/qmlJ1o
         O1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OLYwYL4yHWs8tFQCIhgrNqkSA1gUZ66wmo+Okb77ZSI=;
        b=hE7RKECIgDaeHQ1cDGqCbj3dexlw/ACAdmHGaJSrUTIgtw4bn3JLCKk6O5HF8fwYYi
         pmRokkoWgDcgAvg5OIw1JbHqWinbVy7+l10kOZRY3Ea1jQr25jppiao/mUmXdmCMkD+5
         I2UkDYqZWKB0wI/xMy0IuL4E17HdPRwbiXn7tre5TwMZVXIHBZ5slvNZc1KQ4ZYrIIu7
         zdd1di1Jd5ir/I9PFgGxzvG3GXT7bHKc3OBpCpWFrSb2J5XBGFHT4w0ifPbvzOzvXz7Y
         Y+nPdKhH/3A+ziB1Z7IG3UG4gznxxEPlq/u/PjqETeKDD42B/kIJzAUFYRSKhWJpBKK9
         OiFg==
X-Gm-Message-State: AOAM533sEemFpxg80LbN0+dhop9UmvmrB2Brj6Bi6fKskPkbPF2hSUH6
	f8GwwgatyOI2imMP5Cp14IA=
X-Google-Smtp-Source: ABdhPJxDN762LWw9JnF6jPPehnt/g6U2oMOX7sSxEaXE1B74TxFh20O9fg+npXARXmXuQL3/U4mQ0A==
X-Received: by 2002:a05:6402:228f:: with SMTP id cw15mr18999321edb.150.1628331134605;
        Sat, 07 Aug 2021 03:12:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::a83e])
        by smtp.gmail.com with ESMTPSA id u4sm3662514eje.81.2021.08.07.03.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 03:12:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/17] staging: r8188eu: remove unnecessary parentheses in core/rtw_xmit.c
Date: Sat,  7 Aug 2021 12:11:12 +0200
Message-Id: <20210807101119.16085-11-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807101119.16085-1-straube.linux@gmail.com>
References: <20210807101119.16085-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses in core/rtw_xmit.c reported by
checkpatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 54 ++++++++++++-------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 018ee20553dd..1b05f1643ebf 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -86,7 +86,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 
 	for (i = 0; i < NR_XMITFRAME; i++) {
-		INIT_LIST_HEAD(&(pxframe->list));
+		INIT_LIST_HEAD(&pxframe->list);
 
 		pxframe->padapter = padapter;
 		pxframe->frame_tag = NULL_FRAMETAG;
@@ -96,7 +96,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxframe->buf_addr = NULL;
 		pxframe->pxmitbuf = NULL;
 
-		list_add_tail(&(pxframe->list), &(pxmitpriv->free_xmit_queue.queue));
+		list_add_tail(&pxframe->list, &pxmitpriv->free_xmit_queue.queue);
 
 		pxframe++;
 	}
@@ -141,7 +141,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 		pxmitbuf->flags = XMIT_VO_QUEUE;
 
-		list_add_tail(&pxmitbuf->list, &(pxmitpriv->free_xmitbuf_queue.queue));
+		list_add_tail(&pxmitbuf->list, &pxmitpriv->free_xmitbuf_queue.queue);
 		pxmitbuf++;
 	}
 
@@ -174,7 +174,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			goto exit;
 		}
 
-		list_add_tail(&pxmitbuf->list, &(pxmitpriv->free_xmit_extbuf_queue.queue));
+		list_add_tail(&pxmitbuf->list, &pxmitpriv->free_xmit_extbuf_queue.queue);
 		pxmitbuf++;
 	}
 
@@ -188,7 +188,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	pxmitpriv->txirp_cnt = 1;
 
-	sema_init(&(pxmitpriv->tx_retevt), 0);
+	sema_init(&pxmitpriv->tx_retevt, 0);
 
 	/* per AC pending irp */
 	pxmitpriv->beq_cnt = 0;
@@ -260,8 +260,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	u32	sz;
 	struct pkt_attrib	*pattrib = &pxmitframe->attrib;
 	struct sta_info	*psta = pattrib->psta;
-	struct mlme_ext_priv	*pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info	*pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (pattrib->nr_frags != 1)
 		sz = padapter->xmitpriv.frag_len;
@@ -672,10 +672,10 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 					payload = payload+length+pattrib->icv_len;
 				}
 			}
-			rtw_secgetmic(&micdata, &(mic[0]));
+			rtw_secgetmic(&micdata, &mic[0]);
 			/* add mic code  and add the mic code length in last_txcmdsz */
 
-			memcpy(payload, &(mic[0]), 8);
+			memcpy(payload, &mic[0], 8);
 			pattrib->last_txcmdsz += 8;
 
 			payload = payload-pattrib->last_txcmdsz+8;
@@ -852,20 +852,20 @@ s32 rtw_txframes_sta_ac_pending(struct adapter *padapter, struct pkt_attrib *pat
 	switch (priority) {
 	case 1:
 	case 2:
-		ptxservq = &(psta->sta_xmitpriv.bk_q);
+		ptxservq = &psta->sta_xmitpriv.bk_q;
 		break;
 	case 4:
 	case 5:
-		ptxservq = &(psta->sta_xmitpriv.vi_q);
+		ptxservq = &psta->sta_xmitpriv.vi_q;
 		break;
 	case 6:
 	case 7:
-		ptxservq = &(psta->sta_xmitpriv.vo_q);
+		ptxservq = &psta->sta_xmitpriv.vo_q;
 		break;
 	case 0:
 	case 3:
 	default:
-		ptxservq = &(psta->sta_xmitpriv.be_q);
+		ptxservq = &psta->sta_xmitpriv.be_q;
 		break;
 	}
 
@@ -1156,7 +1156,7 @@ struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv)
 
 		pxmitbuf = container_of(plist, struct xmit_buf, list);
 
-		list_del_init(&(pxmitbuf->list));
+		list_del_init(&pxmitbuf->list);
 	}
 
 	if (pxmitbuf) {
@@ -1188,7 +1188,7 @@ s32 rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
 
 	list_del_init(&pxmitbuf->list);
 
-	list_add_tail(&(pxmitbuf->list), get_list_head(pfree_queue));
+	list_add_tail(&pxmitbuf->list, get_list_head(pfree_queue));
 	pxmitpriv->free_xmit_extbuf_cnt++;
 
 	spin_unlock_irqrestore(&pfree_queue->lock, flags);
@@ -1216,7 +1216,7 @@ struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv)
 
 		pxmitbuf = container_of(plist, struct xmit_buf, list);
 
-		list_del_init(&(pxmitbuf->list));
+		list_del_init(&pxmitbuf->list);
 	}
 
 	if (pxmitbuf) {
@@ -1252,7 +1252,7 @@ s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
 
 		list_del_init(&pxmitbuf->list);
 
-		list_add_tail(&(pxmitbuf->list), get_list_head(pfree_xmitbuf_queue));
+		list_add_tail(&pxmitbuf->list, get_list_head(pfree_xmitbuf_queue));
 
 		pxmitpriv->free_xmitbuf_cnt++;
 		spin_unlock_irqrestore(&pfree_xmitbuf_queue->lock, flags);
@@ -1296,7 +1296,7 @@ struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv)/* _queue *pf
 
 		pxframe = container_of(plist, struct xmit_frame, list);
 
-		list_del_init(&(pxframe->list));
+		list_del_init(&pxframe->list);
 	}
 
 	if (pxframe) { /* default value setting */
@@ -1465,23 +1465,23 @@ struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *
 	switch (up) {
 	case 1:
 	case 2:
-		ptxservq = &(psta->sta_xmitpriv.bk_q);
+		ptxservq = &psta->sta_xmitpriv.bk_q;
 		*(ac) = 3;
 		break;
 	case 4:
 	case 5:
-		ptxservq = &(psta->sta_xmitpriv.vi_q);
+		ptxservq = &psta->sta_xmitpriv.vi_q;
 		*(ac) = 1;
 		break;
 	case 6:
 	case 7:
-		ptxservq = &(psta->sta_xmitpriv.vo_q);
+		ptxservq = &psta->sta_xmitpriv.vo_q;
 		*(ac) = 0;
 		break;
 	case 0:
 	case 3:
 	default:
-		ptxservq = &(psta->sta_xmitpriv.be_q);
+		ptxservq = &psta->sta_xmitpriv.be_q;
 		*(ac) = 2;
 	break;
 	}
@@ -1951,21 +1951,21 @@ void stop_sta_xmit(struct adapter *padapter, struct sta_info *psta)
 	pstapriv->sta_dz_bitmap |= BIT(psta->aid);
 
 	dequeue_xmitframes_to_sleeping_queue(padapter, psta, &pstaxmitpriv->vo_q.sta_pending);
-	list_del_init(&(pstaxmitpriv->vo_q.tx_pending));
+	list_del_init(&pstaxmitpriv->vo_q.tx_pending);
 
 	dequeue_xmitframes_to_sleeping_queue(padapter, psta, &pstaxmitpriv->vi_q.sta_pending);
-	list_del_init(&(pstaxmitpriv->vi_q.tx_pending));
+	list_del_init(&pstaxmitpriv->vi_q.tx_pending);
 
 	dequeue_xmitframes_to_sleeping_queue(padapter, psta, &pstaxmitpriv->be_q.sta_pending);
-	list_del_init(&(pstaxmitpriv->be_q.tx_pending));
+	list_del_init(&pstaxmitpriv->be_q.tx_pending);
 
 	dequeue_xmitframes_to_sleeping_queue(padapter, psta, &pstaxmitpriv->bk_q.sta_pending);
-	list_del_init(&(pstaxmitpriv->bk_q.tx_pending));
+	list_del_init(&pstaxmitpriv->bk_q.tx_pending);
 
 	/* for BC/MC Frames */
 	pstaxmitpriv = &psta_bmc->sta_xmitpriv;
 	dequeue_xmitframes_to_sleeping_queue(padapter, psta_bmc, &pstaxmitpriv->be_q.sta_pending);
-	list_del_init(&(pstaxmitpriv->be_q.tx_pending));
+	list_del_init(&pstaxmitpriv->be_q.tx_pending);
 
 	spin_unlock_bh(&pxmitpriv->lock);
 }
-- 
2.32.0

