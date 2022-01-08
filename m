Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FBC2CA7
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 08:27:48 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v6so15594154wra.8
        for <linux-staging@lists.linux.dev>; Sat, 08 Jan 2022 00:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I7FR9DbSMxpW/4g1B75rGPwrRCKNQS0S40gVywwIMUw=;
        b=T+sGF/NfDYcaTTi3wgMAYqHpYN6+x4K4I0nVKJRl7yphjDfk1LCdLtX+Iu4of5J+zk
         MhyyH7jIex1ZhXHx7XyRlR0Z/puuKL1PxUMHWW3q2ywYxEyZSnWbL4v1e/IPSNGgWEtc
         zlM1vP3AnD3vxpO6vtQNZoO7QbFkrHDNnHzxuwUYH9iq7uetawii7GGKeBnQY4AuIjZf
         m2WGZjjZgomiYGkclYXB209Bq9aSMq78Or8HvTrvXXuG1S1fzkKZkwlaKWsBnplcAO1/
         GNy8L0IJC+6e5GVNZ7WBAHGghreRQFJPM2BVRamMbyNSrnCc8yew2Gz2GGlDW1YUTpV0
         XLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I7FR9DbSMxpW/4g1B75rGPwrRCKNQS0S40gVywwIMUw=;
        b=FlSe9njI69QqLbcpdT/gUYyHJdLT7ahW6V86CqQ3a28hOY63aS8VqkQj+5R+Uf63BL
         bD1L6a2g40NxyuGqsaGuzB+dxtj53FDo7DcNEXJHCwf1I4PBshm5X+CS++ujq5wVj25M
         +PNPE1/ooUbWTbwfna+B7v95qa2N7Hp+JP5jhCAOfR9uxG0cWjT6U0od3P0QWDkr5IoV
         ICX76vCq60TP0Qsg4jHbG0ROqEYJIF5v02Z9BeW65GqVwEmUL+//YLbzPyWQN2n2SSFn
         2RHtEZ9zP1/d3eFxlo8roMvzyA0VbQL0HBea//Z8yXUldf3Y3kd343k+zuCk9+xGvQR3
         JfgA==
X-Gm-Message-State: AOAM531vZ1KFS4Bvzy5m0CjR31xv3a76orOE1RZQQtLiNHEic3NbY56B
	mkJhov3mZClxYASoXbO+xGPxj2YB9Zo=
X-Google-Smtp-Source: ABdhPJykIxcCsSxPcm7p7uNAWAZNkv/dyVHiurYnHLsC2Q63x6Piv4J4GGGSUUTLlzNVPyNniTLgMQ==
X-Received: by 2002:a05:6000:16c9:: with SMTP id h9mr1704117wrf.508.1641630466600;
        Sat, 08 Jan 2022 00:27:46 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id az1sm964536wrb.104.2022.01.08.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 00:27:46 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: remove rtw_os_recv_resource_alloc()
Date: Sat,  8 Jan 2022 09:27:36 +0100
Message-Id: <20220108082736.16788-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108082736.16788-1-straube.linux@gmail.com>
References: <20220108082736.16788-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge rtw_os_recv_resource_alloc() into _rtw_init_recv_priv() and
remove rtw_os_recv_resource_alloc().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c      | 3 ++-
 drivers/staging/r8188eu/include/recv_osdep.h | 2 --
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 9 ---------
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 26893f36d1ff..5438a73ba06b 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -70,7 +70,8 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 
 		list_add_tail(&precvframe->list, &precvpriv->free_recv_queue.queue);
 
-		res = rtw_os_recv_resource_alloc(padapter, precvframe);
+		precvframe->pkt_newalloc = NULL;
+		precvframe->pkt = NULL;
 
 		precvframe->len = 0;
 
diff --git a/drivers/staging/r8188eu/include/recv_osdep.h b/drivers/staging/r8188eu/include/recv_osdep.h
index 71fe581fbc85..ca8a613508fd 100644
--- a/drivers/staging/r8188eu/include/recv_osdep.h
+++ b/drivers/staging/r8188eu/include/recv_osdep.h
@@ -19,8 +19,6 @@ void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup);
 int rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
-int rtw_os_recv_resource_alloc(struct adapter *adapt, struct recv_frame *recvfr);
-
 int rtw_os_recvbuf_resource_alloc(struct adapter *adapt, struct recv_buf *buf);
 int rtw_os_recvbuf_resource_free(struct adapter *adapt, struct recv_buf *buf);
 
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index da21490fe168..b205c50e9d75 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -12,15 +12,6 @@
 #include "../include/osdep_intf.h"
 #include "../include/usb_ops.h"
 
-/* alloc os related resource in struct recv_frame */
-int rtw_os_recv_resource_alloc(struct adapter *padapter,
-		struct recv_frame *precvframe)
-{
-	precvframe->pkt_newalloc = NULL;
-	precvframe->pkt = NULL;
-	return _SUCCESS;
-}
-
 /* alloc os related resource in struct recv_buf */
 int rtw_os_recvbuf_resource_alloc(struct adapter *padapter,
 		struct recv_buf *precvbuf)
-- 
2.34.1

