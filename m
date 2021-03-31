Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A0D6F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 05:38:45 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso637025pjh.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Mar 2021 22:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=so4kPdZGFoamwj7jn02pOeYfcmVYyIUHQWGAZcaFn10=;
        b=rKPGhEE+Rpb55Y+wH2VI9M+g+CbYN7b60pMNpeMFERkGCaNWcFA5ovMGou3OJDRxa6
         LgqxsTyj2qv/dunPClh5nXWoCkehko3yq0F/aSwMlkv2no5Muyj37a2/f7l6h9b3UlH+
         ZQa94I4F5M+b3bULumUVrq3F8Usp/ksSXSgefIusgh8uUC7FlofQjEaqw0Avus7+oEIn
         BYWaRbuqGzHlUqN+jlTcn0MP7V7FWVhcEhIePkBizpNj+3ib0yCielUX7wRmOosW+JRC
         G86LJytujySISpCUvjWMFR6MMknX6roLyYqN2FgBsTejTlP1RhMSPsqDNyIa55naUyZH
         bGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=so4kPdZGFoamwj7jn02pOeYfcmVYyIUHQWGAZcaFn10=;
        b=V/WDpzhLWikZbeTzo2Eex9wyJVqJrTd/wOkJX34VnzIiHP2c67uhOJxIeEcXWWt/1Y
         XzrxE/d8MRoW56EM7FgrIZ4wBO2FcPoRVZM8HZLMLi0xymQvNjLF/iFoyQMG1z2SbSdh
         ZoSo3SPtCfmJfqd90BZGtIKXh2wjzQ9AfElITD1OUwaum6peZLPzAA/Lg8aTIWNvcLI7
         oBrwVppP1WeU+klcY/xDjtDWjXumrdBD5gv2BtHKnwEQECkCxDEFJRWe6q6PWLfwdCIJ
         fb8dTAP5fqGSPMEdEehuztmZpYE8WUqjnE1RZhswcZXBydwOgO8qIkfQRLPmFlFJ10Tk
         Ckxw==
X-Gm-Message-State: AOAM533+TAhs2Lh/CsTvmXCTacH1PXbIDj7wwJQZ9mwczrQ0Xv9cn9Cm
	xcrINbFQnmEWaNU1HcUpge4=
X-Google-Smtp-Source: ABdhPJzILXsBBcm9/2UVHKX/l2IG/3Q47xJzcSv/8uLdFteP0ORGJisw+JPl2XRzyz17nShPOWgamA==
X-Received: by 2002:a17:902:7585:b029:e6:cc10:61fe with SMTP id j5-20020a1709027585b02900e6cc1061femr1608189pll.23.1617169124752;
        Tue, 30 Mar 2021 22:38:44 -0700 (PDT)
Received: from djbComp (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id k27sm714813pfg.95.2021.03.30.22.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 22:38:44 -0700 (PDT)
Date: Tue, 30 Mar 2021 22:38:43 -0700
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org, ross.schm.dev@gmail.com,
	marcocesati@gmail.com, fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com, phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: rtl8723bs: fix block comments
Message-ID: <20210331053841.GA6091@djbComp>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

Remove empty comment and fix checkpatch warnings:
WARNING: Block comments use * on subsequent lines
WARNING: Possible repeated word: 'very'

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 61 +++++++++++------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 2daf5c461a4d..7b4c0f22cd90 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -46,8 +46,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	init_completion(&pxmitpriv->terminate_xmitthread_comp);
 
 	/*
-	Please insert all the queue initializaiton using _rtw_init_queue below
-	*/
+	 * Please insert all the queue initializaiton using _rtw_init_queue below
+	 */
 
 	pxmitpriv->adapter = padapter;
 
@@ -60,10 +60,10 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	_rtw_init_queue(&pxmitpriv->free_xmit_queue);
 
 	/*
-	Please allocate memory with the sz = (struct xmit_frame) * NR_XMITFRAME,
-	and initialize free_xmit_frame below.
-	Please also apply  free_txobj to link_up all the xmit_frames...
-	*/
+	 * Please allocate memory with the sz = (struct xmit_frame) * NR_XMITFRAME,
+	 * and initialize free_xmit_frame below.
+	 * Please also apply  free_txobj to link_up all the xmit_frames...
+	 */
 
 	pxmitpriv->pallocated_frame_buf = vzalloc(NR_XMITFRAME * sizeof(struct xmit_frame) + 4);
 
@@ -876,8 +876,6 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 					*(payload+curfragnum), *(payload+curfragnum+1), *(payload+curfragnum+2), *(payload+curfragnum+3),
 					*(payload+curfragnum+4), *(payload+curfragnum+5), *(payload+curfragnum+6), *(payload+curfragnum+7)));
 			}
-/*
-*/
 	}
 	return _SUCCESS;
 }
@@ -1069,17 +1067,15 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
 }
 
 /*
-
-This sub-routine will perform all the following:
-
-1. remove 802.3 header.
-2. create wlan_header, based on the info in pxmitframe
-3. append sta's iv/ext-iv
-4. append LLC
-5. move frag chunk from pframe to pxmitframe->mem
-6. apply sw-encrypt, if necessary.
-
-*/
+ * This sub-routine will perform all the following:
+ *
+ * 1. remove 802.3 header.
+ * 2. create wlan_header, based on the info in pxmitframe
+ * 3. append sta's iv/ext-iv
+ * 4. append LLC
+ * 5. move frag chunk from pframe to pxmitframe->mem
+ * 6. apply sw-encrypt, if necessary.
+ */
 s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
@@ -1693,23 +1689,22 @@ static void rtw_init_xmitframe(struct xmit_frame *pxframe)
 }
 
 /*
-Calling context:
-1. OS_TXENTRY
-2. RXENTRY (rx_thread or RX_ISR/RX_CallBack)
-
-If we turn on USE_RXTHREAD, then, no need for critical section.
-Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
-
-Must be very very cautious...
-
-*/
+ * Calling context:
+ * 1. OS_TXENTRY
+ * 2. RXENTRY (rx_thread or RX_ISR/RX_CallBack)
+ *
+ * If we turn on USE_RXTHREAD, then, no need for critical section.
+ * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
+ *
+ * Must be very, very cautious...
+ */
 struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv)/* _queue *pfree_xmit_queue) */
 {
 	/*
-		Please remember to use all the osdep_service api,
-		and lock/unlock or _enter/_exit critical to protect
-		pfree_xmit_queue
-	*/
+	 *	Please remember to use all the osdep_service api,
+	 *	and lock/unlock or _enter/_exit critical to protect
+	 *	pfree_xmit_queue
+	 */
 
 	struct xmit_frame *pxframe = NULL;
 	struct list_head *plist, *phead;
-- 
2.17.1

