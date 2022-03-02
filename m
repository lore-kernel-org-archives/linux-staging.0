Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBFA6137
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:22 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id w37so2631890pga.7
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V0ZCMWePvJWkfOaUYdtCCn0PNNFVE21F+X8kdTmqORE=;
        b=pzsp+pBzqQL+0QvCtG8ypnkN/n0BNwjPIriFBCtZAHJmLPfg3upixN4PFYXQeaWaxV
         G4UuVsJa0ppmHRlYLUmBEqOShDo3FiHLjF9yMMibMzphTcC+iPcGXZD77EimH7+zJeH8
         HiK/WBC/DtZJ1zan6ABbn8rI105DIrFET98//kYnYtgh6a77/ZZTcpELL3q1/era3Hcr
         MgeFM5E4aVHE8ApW3Z0lCZiRXiDM21B/PhiT9W1fGfL1xBn69PGTX+vqOMeA3lM/CM/j
         x9Sa9UonZIqrdLnkZeCbza2jNexkmP/tEkAdrUEg0GTr0TL066EctYwZuHPrL41wFS3K
         mOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V0ZCMWePvJWkfOaUYdtCCn0PNNFVE21F+X8kdTmqORE=;
        b=xeVrhRoavD7hnxj8PvGdRs5p3nG6IwzACfRGUwYClOmZQsEVapV1hezejQD7oZy56S
         3BCjAUB2Dpxvo/2vl1GoxfLjDCQB8+Tqwjgt21huSAxzORlSIYnWFdb0gl25PZeJmmkb
         FMr6miFDwCOG0deA+pMg7byBgzkI9bA87NFgOzG/caNbXU0W4pNO3DtrEVbPaovr3gsP
         dLEbDXdaRTKy5hSMJXk0Mdt9Nj9n6gQlkNI8tnuzJirkwh0y5iCidZ/b1EPP2vVcEH/d
         h+X4hKKgJoJuz5C/WjuvGmSJ2djCnO0y8josmNv8gh0ycrofzhUcfSQHONACvYuZ6sDj
         REvg==
X-Gm-Message-State: AOAM5326N/FPLLkXQJmwOaSlELXb5VGScpfdrXnfpes/9ftI0u1YAevj
	mX9iP0kcNhQH8+zyqnzKtNA=
X-Google-Smtp-Source: ABdhPJweatSHsVHPJW9ClTDZdjweAKbKiBQafT6qQMNuAHR5zJPzuPIpy/HlwmfrAK0E3TlvXWyl7Q==
X-Received: by 2002:a05:6a00:2348:b0:4f3:bfcd:8365 with SMTP id j8-20020a056a00234800b004f3bfcd8365mr34678709pfj.38.1646254101986;
        Wed, 02 Mar 2022 12:48:21 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:21 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 06/16] staging: r8188eu: mark enqueue_reorder_recvframe as bool
Date: Thu,  3 Mar 2022 02:17:27 +0530
Message-Id: <20220302204737.49056-7-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark enqueue_reorder_recvframe as bool as it returns true/false.
Also, make it static as it's only used in rtw_recv.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 402b58a02..81ff22d0e 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1496,8 +1496,7 @@ static bool check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_
 	return true;
 }
 
-int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, struct recv_frame *prframe);
-int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, struct recv_frame *prframe)
+static bool enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, struct recv_frame *prframe)
 {
 	struct rx_pkt_attrib *pattrib = &prframe->attrib;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
-- 
2.30.2

