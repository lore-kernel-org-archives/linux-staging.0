Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A9670
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 22:43:38 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id v10so293603pgs.12
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 15:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=6uGqFwYNsuJezqdNtnoCaZngsfZNhT7oD8syM6fdc0M=;
        b=JRRQiRS4O+tVLW16RXB507/VUpJJqzf4AUm0fjg7ZotsNHyNZPl2D4rrkcCz3OQ7Op
         UWmNEFeztLqUutnGhRU2W7SHAd9twUMiBL4pSJ3Ym26Adew8Gqf7QTDwvGWQKT1hYkK9
         nZamQtODqFL4svPzYEUm7C9BZblIXLYUDzGUpxZJ3uJHi2c3QxK5foCOBzBOset55Oc3
         ckOWwcF5Jn+2EHr/p9R5doqr5z2cMTBXv6YvFvfj91V3gpU8FUigyVB/L9pHZraSN3nD
         hmwP9TAIcWbGOgQmB+RA117ozESeKUs9DbXTzS/X58+bvv0eckrPDKQBmxCnb3lwPxxQ
         af1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=6uGqFwYNsuJezqdNtnoCaZngsfZNhT7oD8syM6fdc0M=;
        b=gL9RgBy+xYUByJfMuJDCmLmHQqflo/0HFnCqotX3saIAXUzRV7+aTpOC3RrAx795Cb
         APQaic6sczpkY8++NSCHNLv435Dt5Xu/TNsK7yo8UgRW0TQxdU3rs5A3o1TYE/cUdaC5
         l2IeY96ivP0jObRvyrvl8VYvOMDU5WYkjMaMv142PuRova8dS9IAhHD+oI297dpjns+M
         VnjBNc3KymlboGgfTnVyZ0Kur/A13sRQRlss8VaSKQNmQKaPvrmy9igPKq8yK4yO2kbB
         1ZdUp/t4IjyTvVcG0VGZUukdyKiHStiD2CxtIyunuBqUF2asBTKXfjIB9fmniT2dZxCa
         kMSw==
X-Gm-Message-State: AOAM530jw8ahh3SncrulosO5d38sJSF11+wVcN8tzbAnJhdT1KieMA7a
	MixPpyEgWK6FICbMuVmPD6oPqUlP5v5PGA==
X-Google-Smtp-Source: ABdhPJzQta4mcu6HE7SV8FE+HoUnHRVo2tfnZfntw5iyA4BmKj4hsjg/0mog07hpnAugX9xKvAQ9nA==
X-Received: by 2002:aa7:8f04:0:b029:1f7:d71b:6a51 with SMTP id x4-20020aa78f040000b02901f7d71b6a51mr5007010pfr.4.1617230617958;
        Wed, 31 Mar 2021 15:43:37 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id h19sm3338830pfc.172.2021.03.31.15.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:43:37 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: core: add * to block comments
Date: Wed, 31 Mar 2021 15:42:30 -0700
Message-Id: <bd143fff718849274b065a1c71f1aa7f6fc6f40f.1617229359.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617229359.git.deborahbrouwer3563@gmail.com>
References: <cover.1617229359.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617229359.git.deborahbrouwer3563@gmail.com>
References: <cover.1617229359.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Add * at the beginning of each line in block comments to conform to the
Linux kernel coding style. Issue detected using checkpatch.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 58 +++++++++++------------
 1 file changed, 27 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 3878caf0b56c..cb8d19e4dd3c 100644
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
 
@@ -1069,17 +1069,14 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
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
@@ -1693,23 +1690,22 @@ static void rtw_init_xmitframe(struct xmit_frame *pxframe)
 }
 
 /*
-Calling context:
-1. OS_TXENTRY
-2. RXENTRY (rx_thread or RX_ISR/RX_CallBack)
-
-If we turn on USE_RXTHREAD, then, no need for critical section.
-Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
-
-Must be very, very cautious...
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

