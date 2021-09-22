Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3593FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:06:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q11so10347656wrr.9
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cCFk647b3swc/Nj2dT6rgUNhTuRmjvD9OAWxWGNOt9Y=;
        b=RwrOja/nhadm0rym81isZhB/kSbtRwgCDEG0SbHjaug/dlO9er7X2f8hvdAWFXrywO
         DfM81cYFV+NQ0LB56I+w5vaqFY2fKFVx2TeCOHO5nh8ARtnV25L1Ehr6z//RYQ1tU1D0
         qkr/yR437j8B0R2bZEKYDKEP41pad5Pb0e+qMb+puePQ74pItvC1WzUHBQt1nUbREoeL
         v26tFbtm3+8csC8yY+cPX3y6iSdhPeJi2tCh8TMVZM530JTRaSBPCtt8FYPMGkYybsxg
         yKNBJjCwKRhLKupW+NU97iEIjjcqrxAvJIpJN6ZqsRnj4UVbh5gxwzKTyBQi767PkQxh
         sZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cCFk647b3swc/Nj2dT6rgUNhTuRmjvD9OAWxWGNOt9Y=;
        b=D4PVNJ81j5pIypJ3lCuyDzjsRjrSd9IbbEa4koKpBCdyFrBmSFPqxyA2DVashOXy7w
         KmjVi72FsRyUVY41vkVLfqnMIUhXDLLS6tiPY0FEg7CF3gs6RBNne5Zq3kC88yl/Vgla
         K3lcfjcZNDlA6ar5DyCG68AFpivL2k1aiSt7QMuJoS1MoRW6f5R4V9Z1go/h+7FAOrev
         9SD5awdcEU7RV4r+L+3Nm/VmwGbEF2YEKMYfpvmIaRrf2RQv9nQELH+s5oUUq0iVltVw
         HGYq9q8wy7gXMQ7DDvNZSJJm/+rAgvZN00NYKLHmDUNj666BeSRe7SmEoSI/R5QLWisa
         EBYQ==
X-Gm-Message-State: AOAM530OTObeCdw6/QO2fOt0UDQuEAeUcwpsmMBHRz5ejl+8kgLAbnHr
	8nAU8zkBt+Rir3ExkayI1t0=
X-Google-Smtp-Source: ABdhPJzPq8zvpJvZx6yHB043c8nN2ri0M5bbGoHbuwrii09Fgosy5YHGL2I9FppwNVm4UU7YGAopag==
X-Received: by 2002:a1c:a505:: with SMTP id o5mr900504wme.32.1632341163414;
        Wed, 22 Sep 2021 13:06:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:06:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 44/47] staging: r8188eu: remove rtw_enqueue_recvbuf_to_head()
Date: Wed, 22 Sep 2021 22:04:17 +0200
Message-Id: <20210922200420.9693-45-straube.linux@gmail.com>
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

Function rtw_enqueue_recvbuf_to_head() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c    | 12 ------------
 drivers/staging/r8188eu/include/rtw_recv.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 1e05437a1a8d..3f0c4d9d239d 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -257,18 +257,6 @@ u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter)
 	return cnt;
 }
 
-int rtw_enqueue_recvbuf_to_head(struct recv_buf *precvbuf, struct __queue *queue)
-{
-	spin_lock_bh(&queue->lock);
-
-	list_del_init(&precvbuf->list);
-	list_add(&precvbuf->list, get_list_head(queue));
-
-	spin_unlock_bh(&queue->lock);
-
-	return _SUCCESS;
-}
-
 static int recvframe_chkmic(struct adapter *adapter,  struct recv_frame *precvframe)
 {
 	int	i, res = _SUCCESS;
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 065942e816c6..d35a9276350f 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -284,7 +284,6 @@ int rtw_enqueue_recvframe(struct recv_frame *precvframe, struct __queue *queue);
 void rtw_free_recvframe_queue(struct __queue *pframequeue,
 			      struct __queue *pfree_recv_queue);
 u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter);
-int rtw_enqueue_recvbuf_to_head(struct recv_buf *buf, struct __queue *queue);
 
 void rtw_reordering_ctrl_timeout_handler(void *pcontext);
 
-- 
2.33.0

