Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1810FF
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 04:53:14 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id w6so7859855pfw.5
        for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 21:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eJjZkSNiCRUyDH8c9+KjX8Rp6orUrFEEu//TCWlvtVw=;
        b=EfAakUfvTvHPwmYtL/U0emYHaoaYi4U1zj6JFpfvCt1DK0rBhB8+VIii/TYJVSTHIt
         wS+iqsC1S5kfCgx7Y/729oPRp3bi4sMSm5WYhlEQCJJaSal9dHiXHt0SigdNvrP3q9pO
         sNLyG7gPp2hWNy96rUoz62ajN+whP3P/B9lh9LCKk9KRpy1t8Ube6mkwKraJGn8kF0HB
         we8YOhzQTsWahhkCp/+zAtUPaSONRT6OmXo03YktF5kCSrsCXd9sFeXXNAFDqFFlYw9v
         KMXE2RlF0x1tYr/Z46ltmBRTkkPPlk4yvLT+nBTmTPw2ESoV/uUNDVZ9qX8TI6pozllq
         dMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eJjZkSNiCRUyDH8c9+KjX8Rp6orUrFEEu//TCWlvtVw=;
        b=EnD2KocpL4PKlXYOghKb+okQ99xAKHKVT4r7r9cZbsZPpmn48K/rrupIknt0agebrM
         gwH4gwaSInIdHM8VmoxFWsLeT0yGLGij6c/ZaJYOEXFsOsIgE0YZoMXNKlg7G5da+ry5
         OdzEZIi43Ijo3ZQ533CSu5li9ixRnV3fbxvnReNRFuigbUkwv3Xu4c7ZVzQP1t7uy+Qe
         z4ttdBmwZvI8dP9ipMlfxPnNiP+kvyu6gWnIxrCESsl5gEaWHDRUE+dlU3exwERoD9M4
         eDTbLoeYF2QMvi7lYC6WiT6dbDcGvR4Ma8Y/ZPuB9uTdLIrNnUtNw77zHsJo/k9plEqm
         6sfQ==
X-Gm-Message-State: AJIora9fquxDJTZYMrkjijeTyo8Y92t0zFZXjEnhmJ1rVdV8ACythZQC
	lzhtkuPEhQnfkOQ46R8jSM7iN7QQ3NZDxA==
X-Google-Smtp-Source: AGRyM1u79SZByc9RiPlW8G1ORiWRgJ5CCetm87jXTERa2WEMJzRDpxgIR+IXo8NQ8FQ1/VMa9mYF7A==
X-Received: by 2002:a05:6a00:cce:b0:525:3bd3:b62c with SMTP id b14-20020a056a000cce00b005253bd3b62cmr5127731pfv.67.1655873593775;
        Tue, 21 Jun 2022 21:53:13 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id p14-20020a170902e74e00b00163bfaf0b17sm11660222plf.233.2022.06.21.21.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 21:53:13 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: Fixed comment style
Date: Tue, 21 Jun 2022 21:52:33 -0700
Message-Id: <fe45dd24a6ffcb4902a5efacaae63028f7c7a68f.1655872968.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655872968.git.marcus.yu.56@gmail.com>
References: <cover.1655872968.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed block comments style as per checkpatch.pl and kernel coding style
guide.

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index d42ff210ee81..14dd2344fa4b 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -204,12 +204,12 @@ int rtw_enqueue_recvframe(struct recv_frame *precvframe, struct __queue *queue)
 }
 
 /*
-caller : defrag ; recvframe_chk_defrag in recv_thread  (passive)
-pframequeue: defrag_queue : will be accessed in recv_thread  (passive)
-
-using spinlock to protect
-
-*/
+ * caller : defrag ; recvframe_chk_defrag in recv_thread  (passive)
+ * pframequeue: defrag_queue : will be accessed in recv_thread  (passive)
+ *
+ * using spinlock to protect
+ *
+ */
 
 void rtw_free_recvframe_queue(struct __queue *pframequeue,  struct __queue *pfree_recv_queue)
 {
@@ -1745,9 +1745,11 @@ static int recv_func(struct adapter *padapter, struct recv_frame *rframe)
 		     !psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
 			if (recvpriv->free_recvframe_cnt < NR_RECVFRAME / 4) {
-				/* to prevent from recvframe starvation,
+				/*
+				 * to prevent from recvframe starvation,
 				 * get recvframe from uc_swdec_pending_queue to
-				 * free_recvframe_cnt  */
+				 * free_recvframe_cnt
+				 */
 				rframe = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue);
 				if (rframe)
 					goto do_posthandle;
-- 
2.36.1

