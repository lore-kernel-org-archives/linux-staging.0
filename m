Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AFB7E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:25 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id i1so4350032ila.7
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fNgXJDzyLTX7z4K2H7RhMUewadRDf0i8VGlFa5Rjq3k=;
        b=LEZHzWuZAdsDi4M3CxiPIRlMB3YQ6zdNJvIHLiAeEcPHClUI5cYdiBEyjfy3Q1J+ta
         vvOwd270f2ISLT/KV4XdvFPVIFMv6fPEIZp6Rb1lo8CvSeXiQbB6tGSMXEpY9UgARaNJ
         SXMsr0z8Uh+8ww2ckEyuTb60w5rdv0fej8uT0ffAJgJ2dRGgBEv2t7S3QAcQQ+vBJDOU
         5gDKX1v2gn1pc17c6EH5zHu30ZqsO4ulSWy6R1YXaXreep9GxKWsyVXxDJu/FjgbS/a3
         co29LOBL6XPSRW7CJLhr3dEcaoXDMWQHy5/3xOoKf/XSfXj7oLJBTdwmJ1nAeQA0jD/k
         LAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fNgXJDzyLTX7z4K2H7RhMUewadRDf0i8VGlFa5Rjq3k=;
        b=6ITngGBJ7fy3VWcw2GbcvLblIXxLSgYj1zvNABBb9Po6RnVMy893JT1yEqd6sHkais
         YWL7FlWzuKAzfBfh1w3RUGXIrQw98P7Rvo4y3bICv3CH2VxrLEm3CjhfWWMSHJN2C0ME
         qKfGJc8m1o1hCcjtTKiPTC5SnDBP8ZldygnMFXTrTgjaovr0+ZUOhsEpHmrPa9S5ubkM
         9YK7FiloRWy0tW/IlQeIEdsFXaR7uatTOUSddLPFDoF4eFUoA3HxkoBTvr/8h1yz1cfV
         Wdy9S3x02RWpie/jsT/fv07Zu21k1ttWx7u1Pvtl/rnevh30PFAEeTedQ1oNRF7jIEOZ
         Zi4g==
X-Gm-Message-State: AOAM533fOg5/DPMczzDWaclHW2qSmLEmMvnZd4xKGN9mnzzy4IKGm2N0
	ao0auQArPK+78jyiMjpovW4=
X-Google-Smtp-Source: ABdhPJz8VxCU0wsFanT3oxeXX9nknEMA18wdol6UkgdYKbxyPCvU/iW6wViywfKBxk2zi4t7cxAwKg==
X-Received: by 2002:a92:d80c:0:b0:2c2:c40c:7bd4 with SMTP id y12-20020a92d80c000000b002c2c40c7bd4mr23780866ilm.310.1646322804419;
        Thu, 03 Mar 2022 07:53:24 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:23 -0800 (PST)
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
Subject: [PATCH 5/9] staging: r8188eu: remove unused field ptail
Date: Thu,  3 Mar 2022 21:21:07 +0530
Message-Id: <9574ad2dfba0cc444ce1dea1268661ed32b84799.1646321515.git.abdun.nihaal@gmail.com>
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

The field ptail in struct recv_buf is set but not used.
Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c | 1 -
 drivers/staging/r8188eu/hal/usb_ops_linux.c  | 2 --
 drivers/staging/r8188eu/include/rtw_recv.h   | 1 -
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 1 -
 4 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 7db5cfaa251f..7a787944064f 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -16,7 +16,6 @@ void rtl8188eu_init_recvbuf(struct recv_buf *precvbuf)
 {
 	if (precvbuf->pbuf) {
 		precvbuf->pdata = precvbuf->pbuf;
-		precvbuf->ptail = precvbuf->pbuf;
 		precvbuf->pend = precvbuf->pdata + MAX_RECVBUF_SZ;
 	}
 }
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 8f4c059e09c9..74a221db1c3d 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -441,12 +441,10 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 		skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
 
 		precvbuf->pdata = precvbuf->pskb->data;
-		precvbuf->ptail = skb_tail_pointer(precvbuf->pskb);
 		precvbuf->pend = skb_end_pointer(precvbuf->pskb);
 		precvbuf->pbuf = precvbuf->pskb->data;
 	} else { /* reuse skb */
 		precvbuf->pdata = precvbuf->pskb->data;
-		precvbuf->ptail = skb_tail_pointer(precvbuf->pskb);
 		precvbuf->pend = skb_end_pointer(precvbuf->pskb);
 		precvbuf->pbuf = precvbuf->pskb->data;
 
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index e4f844507d17..c97ec9d0feed 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -211,7 +211,6 @@ struct recv_buf {
 	u8	*pbuf;
 	u8	*pallocated_buf;
 	u8	*pdata;
-	u8	*ptail;
 	u8	*pend;
 	struct urb *purb;
 	dma_addr_t dma_transfer_addr;	/* (in) dma addr for transfer_buffer */
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index 8832199b10ee..fd29f06b375a 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -27,7 +27,6 @@ int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
 	precvbuf->pallocated_buf = NULL;
 	precvbuf->pbuf = NULL;
 	precvbuf->pdata = NULL;
-	precvbuf->ptail = NULL;
 	precvbuf->pend = NULL;
 	return res;
 }
-- 
2.35.1

