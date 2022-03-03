Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069FE7E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:20 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id k7so4341547ilo.8
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vf/zxel/BWna/MpB7sYFcTgoalUmee2CFvGo8YMJfO8=;
        b=kWh3uMrpnv0yxI1iBAdTREUOyZjVOBc1yMd0ke+YQtdMQcn2kY/zk77Za2KKZuWO+u
         0J2gKTcyO+LksVkMWdSRxYQgxQvrEPXv+QYB1+ZaPRDfeNgvTFkyDu18CsSrF2T/uw0M
         RdrxWXeby9w+cGNVhgaNBwgB6qZQ8tjxZG5LARHRInZmLFm2IEF4kNjYLBZ67o+QZdBm
         LbkseTi3se3+zN9W23Y0Nj4RQxRePOFJvhpA27oz36ypbIEonuTqm7skK93XTVCUH5BC
         wakYsSYQ1cdn0y7iTILlrJJ2h3ZcH7MAC0ae3lefIL9+8r4GyoJGnQ5+O2kUpAmSEZDU
         8C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vf/zxel/BWna/MpB7sYFcTgoalUmee2CFvGo8YMJfO8=;
        b=Ykummhnvp5C1VrOkFIXXDiBlieauing6toMAkZ+X/gzPUVIM/L7MFJWs0+5CNypEvP
         28FFAMjwUmGtrq1Kjim0D8j3DOuwCBWQ61FJaLsdJZksci3bQH2uxajdH6PhWAGfcJHr
         mxNhbRpGI3hl+RgkZvwu88lexvPV6sOC0ArMLFA+lpsaQbvRLA9hrpbzlOhxZTWC8CEF
         CrZCh8AqnPXQ4wyvZKco97wd+y4QuIIDjLSmUOz0oGc7viHETv9L3oj6ieRlDrRxbxXM
         glc3sZnh7gi9R86PvzKcn93fbXIDMbvIFOrCdNPPviM76okT7biGwussfwXRze7A3Mz3
         efhA==
X-Gm-Message-State: AOAM532RoP81lNrayJoLhx2oLS+Msskvq/80N1uzsvh+j+3JID46dgKH
	94ZkSe1yFykBQybvJQV4yIg=
X-Google-Smtp-Source: ABdhPJxwnbjNVGWhvzDpblaScb+DN/V8x8EmZ1T76z6cZpT/ndU7CTqDErq5QbWz+u5GoG+YciQMwQ==
X-Received: by 2002:a92:d592:0:b0:2c2:7454:dd94 with SMTP id a18-20020a92d592000000b002c27454dd94mr33305825iln.150.1646322800235;
        Thu, 03 Mar 2022 07:53:20 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:18 -0800 (PST)
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
Subject: [PATCH 4/9] staging: r8188eu: remove unused field phead
Date: Thu,  3 Mar 2022 21:21:06 +0530
Message-Id: <7ff76536af7478a00b300af9a6cb666e53d22aac.1646321515.git.abdun.nihaal@gmail.com>
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

The field phead in struct recv_buf is set but not used.
Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c | 1 -
 drivers/staging/r8188eu/hal/usb_ops_linux.c  | 2 --
 drivers/staging/r8188eu/include/rtw_recv.h   | 1 -
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 1 -
 4 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 76bf57c52a7e..7db5cfaa251f 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -16,7 +16,6 @@ void rtl8188eu_init_recvbuf(struct recv_buf *precvbuf)
 {
 	if (precvbuf->pbuf) {
 		precvbuf->pdata = precvbuf->pbuf;
-		precvbuf->phead = precvbuf->pbuf;
 		precvbuf->ptail = precvbuf->pbuf;
 		precvbuf->pend = precvbuf->pdata + MAX_RECVBUF_SZ;
 	}
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 4953a431ffd7..8f4c059e09c9 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -440,13 +440,11 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 		alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
 		skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
 
-		precvbuf->phead = precvbuf->pskb->head;
 		precvbuf->pdata = precvbuf->pskb->data;
 		precvbuf->ptail = skb_tail_pointer(precvbuf->pskb);
 		precvbuf->pend = skb_end_pointer(precvbuf->pskb);
 		precvbuf->pbuf = precvbuf->pskb->data;
 	} else { /* reuse skb */
-		precvbuf->phead = precvbuf->pskb->head;
 		precvbuf->pdata = precvbuf->pskb->data;
 		precvbuf->ptail = skb_tail_pointer(precvbuf->pskb);
 		precvbuf->pend = skb_end_pointer(precvbuf->pskb);
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index bafc10905bed..e4f844507d17 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -210,7 +210,6 @@ struct recv_buf {
 	struct adapter *adapter;
 	u8	*pbuf;
 	u8	*pallocated_buf;
-	u8	*phead;
 	u8	*pdata;
 	u8	*ptail;
 	u8	*pend;
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index d3b5fd83f926..8832199b10ee 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -27,7 +27,6 @@ int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
 	precvbuf->pallocated_buf = NULL;
 	precvbuf->pbuf = NULL;
 	precvbuf->pdata = NULL;
-	precvbuf->phead = NULL;
 	precvbuf->ptail = NULL;
 	precvbuf->pend = NULL;
 	return res;
-- 
2.35.1

