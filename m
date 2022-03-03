Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836FB7E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:34 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id 9so4320098ily.11
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UiyjtJR07LOlEGs+bkLg+Urxj01r8SJDeT7SuLNG2Jw=;
        b=lZ+ILP0kjya6rXT0RetoPfujtKWKv8JRUX+m3ngaXVnjGil1IFhdSlMoWzkQ7kPATW
         q9Cz27gaOXT0+w5DBmbTtz++nfHANCa9cqEOVlbUy3pAm3o+rgSIhx4GexfBD5iJKTbY
         Ex4HRVoZRz99HtKAo7Tx/QMeL98NQhs56vrHgMBq49lojbYchyTkI6IlY7Oj58IAyjk4
         +6povL9CH1ghK/saTC0/0qDcrdNoTrDwbKqEyTGusll4lBsBABYimInCvSdwp7VR5R3H
         BVVbaklFr6MItvpn2DqL4x5MWEJA/voSAut+SvsI/VJ6xrpEuEMrR9BB2EPr0qivoQiU
         WpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UiyjtJR07LOlEGs+bkLg+Urxj01r8SJDeT7SuLNG2Jw=;
        b=bANwSdFzq1BFiG9015iXmBY9zAYRgHnFPNZ1ZH0tC8V4j+5XKiJtbKWnrITjFTip5F
         YhEOczFL8npZ+fyzgm2YABEdAjiTNS4BWM0EMORm+rEq3na784cgZzXEt7X7KHOJgx6q
         ok+a2DscoMQu74BfoQu+rnk8Su0vDkYmK00RhceaKTbffsfUVJUT9LrHNeIzdLnENILy
         Dc/eosy0BhdBbhc1bXZhLy8ok30Lz6Xh9mlJI8itJRCzd+C9EBzOS5cXG66hFjXqTV2/
         dxOwOGwqAlzfp7TvI2Z/7c1wHUaOomySkUp8MhZdL7jmIL1g3ZtQEWN5M2da17PD9t+n
         p3tQ==
X-Gm-Message-State: AOAM532/jPrwatAfNfoKQEkEWcUJt0q+D4I20G5K2fU0Dol/foRytIXn
	xjpcAQ5mp8MU73bNol2KM5QLnH25C6w=
X-Google-Smtp-Source: ABdhPJz8wye/jAFCCzWwesofddC5vfjgivGK52ldjgtt+bkszMsBPiTRZ1veWyrGtDLWnrfhgtl5Hw==
X-Received: by 2002:a05:6e02:20e8:b0:2c1:e164:76e6 with SMTP id q8-20020a056e0220e800b002c1e16476e6mr32235277ilv.135.1646322813781;
        Thu, 03 Mar 2022 07:53:33 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:33 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	paskripkin@gmail.com,
	martin@kaiser.cx,
	abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] staging: r8188eu: remove unused field pdata
Date: Thu,  3 Mar 2022 21:21:09 +0530
Message-Id: <7fe9ed2c6eade65c118511228283ef9d92ea4b43.1646321515.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646321515.git.abdun.nihaal@gmail.com>
References: <cover.1646321515.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field pdata in struct recv_buf is set but not used.
Remove it.

Also remove rtl8188eu_init_recvbuf function as it does nothing now.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c    | 7 -------
 drivers/staging/r8188eu/hal/usb_ops_linux.c     | 4 ----
 drivers/staging/r8188eu/include/rtl8188e_recv.h | 1 -
 drivers/staging/r8188eu/include/rtw_recv.h      | 1 -
 drivers/staging/r8188eu/os_dep/recv_linux.c     | 1 -
 5 files changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 9f772fc7d6c1..2960e349638d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -12,13 +12,6 @@
 
 #include "../include/rtl8188e_hal.h"
 
-void rtl8188eu_init_recvbuf(struct recv_buf *precvbuf)
-{
-	if (precvbuf->pbuf) {
-		precvbuf->pdata = precvbuf->pbuf;
-	}
-}
-
 int	rtl8188eu_init_recv_priv(struct adapter *padapter)
 {
 	struct recv_priv	*precvpriv = &padapter->recvpriv;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index f16a6bb21ab4..063bec94fd7e 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -428,8 +428,6 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 			precvbuf->reuse = true;
 	}
 
-	rtl8188eu_init_recvbuf(precvbuf);
-
 	/* re-assign for linux based on skb */
 	if (!precvbuf->reuse || !precvbuf->pskb) {
 		precvbuf->pskb = netdev_alloc_skb(adapter->pnetdev, MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ);
@@ -440,10 +438,8 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 		alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
 		skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
 
-		precvbuf->pdata = precvbuf->pskb->data;
 		precvbuf->pbuf = precvbuf->pskb->data;
 	} else { /* reuse skb */
-		precvbuf->pdata = precvbuf->pskb->data;
 		precvbuf->pbuf = precvbuf->pskb->data;
 
 		precvbuf->reuse = false;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_recv.h b/drivers/staging/r8188eu/include/rtl8188e_recv.h
index 87dd4152082a..a2320af11216 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_recv.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_recv.h
@@ -37,7 +37,6 @@ enum rx_packet_type {
 	HIS_REPORT,/*  USB HISR RPT */
 };
 
-void rtl8188eu_init_recvbuf(struct recv_buf *buf);
 s32 rtl8188eu_init_recv_priv(struct adapter *padapter);
 void rtl8188eu_free_recv_priv(struct adapter * padapter);
 void rtl8188eu_recv_hdl(struct adapter * padapter, struct recv_buf *precvbuf);
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index f7bc1c9579fc..55b1bb7840c8 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -210,7 +210,6 @@ struct recv_buf {
 	struct adapter *adapter;
 	u8	*pbuf;
 	u8	*pallocated_buf;
-	u8	*pdata;
 	struct urb *purb;
 	dma_addr_t dma_transfer_addr;	/* (in) dma addr for transfer_buffer */
 	u32 alloc_sz;
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index c8a0ac80df69..a35c78f9ae44 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -26,7 +26,6 @@ int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
 	precvbuf->reuse = false;
 	precvbuf->pallocated_buf = NULL;
 	precvbuf->pbuf = NULL;
-	precvbuf->pdata = NULL;
 	return res;
 }
 
-- 
2.35.1

