Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFD27E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:39 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id u2so4244322ioc.11
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dwLxIaXOaK21ohAinUqvqYAddO4Vte0e4AM7N4ZJWiY=;
        b=T1r6nxQ1vdmFI6/LYEjWcY7i/AS6a6+7EPTzYx6ssumRZvE96gCpmJPqFvNGhiX7Ql
         G4pzgBoHzgBKX7EJa4MDOeGxkx+JGAP8xKO4qfJb3JoK0Ie79hde9JBcufER2SkHNCAh
         f2mRiOpGsVERSxSSBVmyI4nDLX5L8a3nKhjfPTIszu8iYUJdtK99IdDeBONWPa6Y1zPp
         vh5mCCZ6yoBi8embwJlU1cbvx2WZuTp97y+b1GJHwq4rE5SXcKkIMhGUCw7c8pftGzQy
         H7Oh0SpIc1XejEBW0sqWfJbA+3X75Yt4FY8awV+RQc+u3GoxkGu+rZ0zNV2EtzWOcm7B
         HuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dwLxIaXOaK21ohAinUqvqYAddO4Vte0e4AM7N4ZJWiY=;
        b=mseg6OE3VwcAwcFn5bzD3r2Z7JxmWxScolvTAxVx2mKczRtIokpcEDlMQaJh4ttq77
         0iLkpUynzYmp7DVLW/P9ArV4b++Q3V+la557DcsMNdQ1nVqmR0K9rxGYjjzZx+XTvaC2
         6AZm7JWn3vAodnH1vmAUQ11qxlbWlw+N4oLTsGmQvEVSeTVKkC67V3Kydbdk6SgeL9XF
         xHtrrN7uuk/zV1b+v07ideoRuUmxuFAAkQk3aMCCI7eVEzESWU8xJHyUbWJby6rKiRYT
         +LOLxTPOZuOvow3dR2fG72SFsl5X5Lj1weiyL4wjoMuZQfWmN62jzkq+esN5d0mwejXS
         MUpw==
X-Gm-Message-State: AOAM531ks5h5nSpJjALRtDNAGuuapsgIxWNsi7vyHkTRMVyO4axClHhA
	f8Ll43uQ7MVaXCTVD46aeW0=
X-Google-Smtp-Source: ABdhPJyBhdxWQUFPxW714ZQZIEW6NkypKRkY/ttmZ/bbrIwRQxsedtRkYe8m94mqkzI8jRv3D2IrTQ==
X-Received: by 2002:a05:6638:502:b0:30e:4b0c:55cf with SMTP id i2-20020a056638050200b0030e4b0c55cfmr29462445jar.11.1646322818145;
        Thu, 03 Mar 2022 07:53:38 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:37 -0800 (PST)
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
Subject: [PATCH 8/9] staging: r8188eu: remove unneeded field pbuf
Date: Thu,  3 Mar 2022 21:21:10 +0530
Message-Id: <080a9269b9381089e4dc9117f35d0a2d1d0c0259.1646321515.git.abdun.nihaal@gmail.com>
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

The field pbuf in struct recv_buf can be removed as it can be replaced
with pskb->data. Remove pbuf field.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 6 +-----
 drivers/staging/r8188eu/include/rtw_recv.h  | 1 -
 drivers/staging/r8188eu/os_dep/recv_linux.c | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 063bec94fd7e..673c30ed3cce 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -437,11 +437,7 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 		tmpaddr = (size_t)precvbuf->pskb->data;
 		alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
 		skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
-
-		precvbuf->pbuf = precvbuf->pskb->data;
 	} else { /* reuse skb */
-		precvbuf->pbuf = precvbuf->pskb->data;
-
 		precvbuf->reuse = false;
 	}
 
@@ -453,7 +449,7 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 	pipe = usb_rcvbulkpipe(pusbd, pdvobj->RtInPipe);
 
 	usb_fill_bulk_urb(purb, pusbd, pipe,
-			  precvbuf->pbuf,
+			  precvbuf->pskb->data,
 			  MAX_RECVBUF_SZ,
 			  usb_read_port_complete,
 			  precvbuf);/* context is precvbuf */
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 55b1bb7840c8..e62cda94bc90 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -208,7 +208,6 @@ struct sta_recv_priv {
 
 struct recv_buf {
 	struct adapter *adapter;
-	u8	*pbuf;
 	u8	*pallocated_buf;
 	struct urb *purb;
 	dma_addr_t dma_transfer_addr;	/* (in) dma addr for transfer_buffer */
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index a35c78f9ae44..898ae944bd7d 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -25,7 +25,6 @@ int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
 	precvbuf->pskb = NULL;
 	precvbuf->reuse = false;
 	precvbuf->pallocated_buf = NULL;
-	precvbuf->pbuf = NULL;
 	return res;
 }
 
-- 
2.35.1

