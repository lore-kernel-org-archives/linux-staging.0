Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0B27E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:15 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id d3so4330968ilr.10
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YIpI3npq5phDRjrFvP94Jr7V5vgXrH/mDklakdcvMfE=;
        b=lHOrIlfddL76oMIFw5LvA+rDj5YYjRVo/0Awqk7pDKX8pyADNJAFeXOUTQF4iFopfW
         IbxK/RYtiqPMi0uqN123tYJpuCvkgoBMRocs7uw42e0dHACwPByYiB/L0Ph6NXwg8OwE
         7p7OtpI8l7CKZZqe9CM0gmW7Tp9SdhVIljtFUfKTXyZK5eQC8bSPGNPcL3q4Up5mdGi4
         z/MrN58yc9xRFT26cwvalJbpiRESwdr0F7dGex1so1bAxdmX8NCCWztS/bAZM1mliEEX
         RYAxiWb4/uG3GCoJWwyS05H7AVseulrCK52JaJgqwzdq42kKGHN5r7etKrzQCey2Mh+B
         IGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YIpI3npq5phDRjrFvP94Jr7V5vgXrH/mDklakdcvMfE=;
        b=YrQokwqdgAkTxje2+sr7lA1fm3lfnWuWvdIxNwqOcj+k6WSm5u57g7T+VESIPxA+JK
         DfG5M5ZFl9oBXLZa5yvNLiZkL3BvmCeXtWNM5laLNWrw0MbZ8sWonD4Bb8qRdZfgsbBD
         A/Ii2lLnmFkPuEeL1FCUCeSFbd7gidMlQAbdyPq3+dXnByHrXzOLBre+I+B7jn9Uy/yU
         7nxmkK+FskAjI8lGNI7vYgJObjkSykUGmHoI1s7pLn/iZE3n5ySvRCQ9fSb4sCSaF7xf
         vmtMmiVcu3R8MEDJuLMpI8azksB2fO6OABowkR3P27w74gtBJP9spKx33R9cuLGEmm0o
         tTRQ==
X-Gm-Message-State: AOAM532nVAUh76Osa4jX9QXdyAdBzGZijfmteKS1cHDnMMkRj/pxfW2t
	zsDAB5deLft6EfaDWb/Igzg=
X-Google-Smtp-Source: ABdhPJyJunYkAQ7b+7txtuE78EgMbKxNjPCwQs7b+H7Z/5982NqwLQCkNExknLf7KPdO5u7XuGo0DA==
X-Received: by 2002:a05:6e02:1c83:b0:2c1:ed61:9241 with SMTP id w3-20020a056e021c8300b002c1ed619241mr30126412ill.202.1646322794911;
        Thu, 03 Mar 2022 07:53:14 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:14 -0800 (PST)
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
Subject: [PATCH 3/9] staging: r8188eu: remove unused fields in struct recv_buf
Date: Thu,  3 Mar 2022 21:21:05 +0530
Message-Id: <fe5565c02a01babf64469333dae73cbdd841d393.1646321515.git.abdun.nihaal@gmail.com>
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

The fields len, ref_cnt and transfer_len in struct recv_buf are set
but not used. Remove them.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c | 7 -------
 drivers/staging/r8188eu/hal/usb_ops_linux.c  | 1 -
 drivers/staging/r8188eu/include/rtw_recv.h   | 3 ---
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 2 --
 4 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 19d22db56e7d..76bf57c52a7e 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -14,12 +14,6 @@
 
 void rtl8188eu_init_recvbuf(struct recv_buf *precvbuf)
 {
-	precvbuf->transfer_len = 0;
-
-	precvbuf->len = 0;
-
-	precvbuf->ref_cnt = 0;
-
 	if (precvbuf->pbuf) {
 		precvbuf->pdata = precvbuf->pbuf;
 		precvbuf->phead = precvbuf->pbuf;
@@ -58,7 +52,6 @@ int	rtl8188eu_init_recv_priv(struct adapter *padapter)
 		res = rtw_os_recvbuf_resource_alloc(padapter, precvbuf);
 		if (res == _FAIL)
 			break;
-		precvbuf->ref_cnt = 0;
 		precvbuf->adapter = padapter;
 		precvbuf++;
 	}
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 6bd2164ce1fa..4953a431ffd7 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -364,7 +364,6 @@ static void usb_read_port_complete(struct urb *purb, struct pt_regs *regs)
 		} else {
 			rtw_reset_continual_urb_error(adapter_to_dvobj(adapt));
 
-			precvbuf->transfer_len = purb->actual_length;
 			skb_put(precvbuf->pskb, purb->actual_length);
 			skb_queue_tail(&precvpriv->rx_skb_queue, precvbuf->pskb);
 
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 7347ec162632..bafc10905bed 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -207,11 +207,9 @@ struct sta_recv_priv {
 };
 
 struct recv_buf {
-	u32	ref_cnt;
 	struct adapter *adapter;
 	u8	*pbuf;
 	u8	*pallocated_buf;
-	u32	len;
 	u8	*phead;
 	u8	*pdata;
 	u8	*ptail;
@@ -220,7 +218,6 @@ struct recv_buf {
 	dma_addr_t dma_transfer_addr;	/* (in) dma addr for transfer_buffer */
 	u32 alloc_sz;
 	u8  irp_pending;
-	int  transfer_len;
 	struct sk_buff *pskb;
 	u8	reuse;
 };
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index b205c50e9d75..d3b5fd83f926 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -30,8 +30,6 @@ int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
 	precvbuf->phead = NULL;
 	precvbuf->ptail = NULL;
 	precvbuf->pend = NULL;
-	precvbuf->transfer_len = 0;
-	precvbuf->len = 0;
 	return res;
 }
 
-- 
2.35.1

