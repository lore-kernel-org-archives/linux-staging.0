Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243703FCF
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:06:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i23so10504737wrb.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zz583mKg39OMIjdW9MlMH1eFwgfjWbPSSiAOX79z9to=;
        b=hqQzyCX7ixuRy74O2dhW8c5h1jhCEmapquy5SMTOJXtOXfSEtZdZizNp2DoVbnmZFx
         JiD0drwF02TBqjU7Gk0ShVMAdpqbjZs6ckUsTjzW1whjW0ofmO2Lz1jL1g17zD9LAaIZ
         cfB6SPLAvrw9tt7qvediuyBHAPDdRr+NDKde17krXiPKdiQto83eiR931xMRkVQEDTU4
         mLBCLo0+4GX2mrNlF6m9ADx6XtISXLFCwFsYDPbCvE3eJaVjV9lPdXc8ZRgjmkiVShGB
         XrQVOXm482c9foJuJpOv9/g7fjpiTbIHLdMymZDTn0HdotcnNS1Fge7JPeGCQ5JHxxZ5
         hy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zz583mKg39OMIjdW9MlMH1eFwgfjWbPSSiAOX79z9to=;
        b=tmcUkx0L3WRP4pqPCf2KApB2wiNpBTjtXRxMHdYu9yIYooZcYioQajcY3mm69RRCqr
         acY9Kf0gBJGOY+VOeax4A7rYDEdjCFKWBjUGRmfovH3KUY3b7HpW7OVhM5yT3913KKKO
         TbHrbjnLshQzOLXVjezZUEUiU6yCo0nuzbE/zhgTXf6z7U2EErx3yPTtBGXKIYwVupGi
         +1mfDDL8TnSj9Q5He09ehk+W0A96BhwSnDNk4LbKKle/b7OrKtIa3YZUHo1F4VISeB5n
         /EEICEjtPl7z0sT7dWl9V2SEzoXbamTR2igMFLXhIr2fypwgAbjL2btA6uDeug1hVu64
         h+9Q==
X-Gm-Message-State: AOAM533q6yXi/gbbhhe8e1W3ET7fLzNsQd622bkj+sMGU1oYTX69C9ii
	pisf6QL/I6zA7ysEhzMWtOo=
X-Google-Smtp-Source: ABdhPJxSjNwDMhpmNxUWYUqqwWF9aDaeyueBsImgtxltXrqRx9E3ndg9dv8OkcqZ9iJRPMTWYEIAhg==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr12448722wmj.84.1632341162665;
        Wed, 22 Sep 2021 13:06:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:06:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 43/47] staging: r8188eu: remove rtw_enqueue_recvbuf()
Date: Wed, 22 Sep 2021 22:04:16 +0200
Message-Id: <20210922200420.9693-44-straube.linux@gmail.com>
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

Function rtw_enqueue_recvbuf() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c    | 13 -------------
 drivers/staging/r8188eu/include/rtw_recv.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index ad60967943c2..1e05437a1a8d 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -269,19 +269,6 @@ int rtw_enqueue_recvbuf_to_head(struct recv_buf *precvbuf, struct __queue *queue
 	return _SUCCESS;
 }
 
-int rtw_enqueue_recvbuf(struct recv_buf *precvbuf, struct __queue *queue)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&queue->lock, flags);
-
-	list_del_init(&precvbuf->list);
-
-	list_add_tail(&precvbuf->list, get_list_head(queue));
-	spin_unlock_irqrestore(&queue->lock, flags);
-	return _SUCCESS;
-}
-
 static int recvframe_chkmic(struct adapter *adapter,  struct recv_frame *precvframe)
 {
 	int	i, res = _SUCCESS;
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 67042c7a781c..065942e816c6 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -285,7 +285,6 @@ void rtw_free_recvframe_queue(struct __queue *pframequeue,
 			      struct __queue *pfree_recv_queue);
 u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter);
 int rtw_enqueue_recvbuf_to_head(struct recv_buf *buf, struct __queue *queue);
-int rtw_enqueue_recvbuf(struct recv_buf *precvbuf, struct __queue *queue);
 
 void rtw_reordering_ctrl_timeout_handler(void *pcontext);
 
-- 
2.33.0

