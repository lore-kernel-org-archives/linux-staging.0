Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D03FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:06:03 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t18so10521593wrb.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GmoAy3e5/CVdHHAV9AKEPsWaIgJY7kKflhBKLoESyAg=;
        b=TJOSMnNrp8BF4LpL8xf/xAkvZXRTjSuxZ3eGR2/dZlUbIgSXKEN7VD1Q4ECtD+Ad7X
         EGexA5NaMDeejmywrt7aUyDBOxHJsXBmxHfBIjve68kSWab9nhVWTqrbHOSZZBgXCEZo
         V+933m9N2pb5j2lYTk8Gg4pe9PrwXNiH0Rk7a6a6xn6TBtSScLRBo1FXyKstFjjgJrGg
         z/tg10idjeo8GzhMPe2xesCqcQpnMa9LflyRwfjXegw5yzHtUYAm1jTYdJsVzNvgmwIN
         R9dRAy2mRk7LgwxqoG1GGLAszZim4sn4Ivi1RG0jbo2I8sOsnz1HPnSStKFapSfTHrAU
         iuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GmoAy3e5/CVdHHAV9AKEPsWaIgJY7kKflhBKLoESyAg=;
        b=72vqe+qk1SS0Y13kgb5KHk8WtpDlnQfTUwqdjQDcJR9KTnjrcIksNirSrUoIktVVSt
         yGjJj+Se06X1AfZy1mhflybi1I/zFd4rqzgRpgd00S2X33v5h+LJmGzgi/Z+yS2XVbJF
         n1EVdZFp1a7rk2lk4EmcxoQykwWET1cdQ66yh99D/OIOEE40fLIDAu3Z6MCupULn+akP
         ryvRgz6lVOIZmtDxLSkHY5Kk6iXp6pEYPG5Yf1Je+2JnU+oRKNp3KPm8TRAwuBtl4g1w
         tXFxbc+T/1dv0X6T4H8PS4ybNLDySoDYWUn7aLiOe2FVg0WM36CfnU2TtTGZ9UpbV89Z
         X3dA==
X-Gm-Message-State: AOAM531Px7FYIAEag/c2z+3pLF+czHpZRGnO7MGakrz+uby46176ND8W
	042zz+B40kxbDOuePDu20F1DysVbWjag4Q==
X-Google-Smtp-Source: ABdhPJw+fPNp78azA1VfcX5Bh0lCf1M8c5PqBtk2+bdNDGOFgIJCTE9Y1iadzlI0E/uWlkwqAT4hNw==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr845306wmi.7.1632341161781;
        Wed, 22 Sep 2021 13:06:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:06:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 42/47] staging: r8188eu: remove rtw_dequeue_recvbuf()
Date: Wed, 22 Sep 2021 22:04:15 +0200
Message-Id: <20210922200420.9693-43-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_dequeue_recvbuf() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c    | 25 ----------------------
 drivers/staging/r8188eu/include/rtw_recv.h |  1 -
 2 files changed, 26 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 983505aac213..ad60967943c2 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -282,31 +282,6 @@ int rtw_enqueue_recvbuf(struct recv_buf *precvbuf, struct __queue *queue)
 	return _SUCCESS;
 }
 
-struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue)
-{
-	struct recv_buf *precvbuf;
-	struct list_head *plist, *phead;
-	unsigned long flags;
-
-	spin_lock_irqsave(&queue->lock, flags);
-
-	if (list_empty(&queue->queue)) {
-		precvbuf = NULL;
-	} else {
-		phead = get_list_head(queue);
-
-		plist = phead->next;
-
-		precvbuf = container_of(plist, struct recv_buf, list);
-
-		list_del_init(&precvbuf->list);
-	}
-
-	spin_unlock_irqrestore(&queue->lock, flags);
-
-	return precvbuf;
-}
-
 static int recvframe_chkmic(struct adapter *adapter,  struct recv_frame *precvframe)
 {
 	int	i, res = _SUCCESS;
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index d1d1ca0e56d6..67042c7a781c 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -286,7 +286,6 @@ void rtw_free_recvframe_queue(struct __queue *pframequeue,
 u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter);
 int rtw_enqueue_recvbuf_to_head(struct recv_buf *buf, struct __queue *queue);
 int rtw_enqueue_recvbuf(struct recv_buf *precvbuf, struct __queue *queue);
-struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue);
 
 void rtw_reordering_ctrl_timeout_handler(void *pcontext);
 
-- 
2.33.0

