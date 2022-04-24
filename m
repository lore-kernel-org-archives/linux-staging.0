Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5216A7A
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 16:31:47 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id n18so21923761plg.5
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 09:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uy/XTK3cCUSKBVerxj0yPudKYc/tlTQNYmvWtLlsHwk=;
        b=FN38e1a+uNwImTZJFr6s0ukNm7MTnw0jfRRkKU5389Iq3g//kH22kt9l+uTzD1TJ4Q
         JbpNiurLx4MqiuQnGbanx2zkVqdVbzDzeoDDWTLOTAvswMQNNhPd7wI9U7Q48//ay2IU
         hFQSutPaAHXMy3MGZbf42wiQ4XvevJj4pgvuSRxLbTnHeWdraNDobq78L0OsTGBxopoN
         jSZQFwFUrDpT2nSyeKh06iq7GEy5z8CJAZCHbpx6UEJHUjjxQndPVXiiozlLozPI4MS4
         84GjijpD9A5n38Ilq/mv3GwfFll2P7H1kETDPasH3+UC7U4ZnY0qHfAKllg3NIb3/RbH
         sJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uy/XTK3cCUSKBVerxj0yPudKYc/tlTQNYmvWtLlsHwk=;
        b=4hJYjZ3C9DDGu2z/RbRh3qn/41gPr4AJXV9N4Td6BAZK8TF5Wqhq3Mx5ssiZ/Ic7lU
         CA8clkzDbcdtgEjZnuxyHw9B9ypDJlXvvovg30P5eaoW3QkJnRagzMEnlVZn6RnMnMcW
         4VD5DpJ56YeQfZvjIknmhoUYe27fUjEohaLs6qaxXnu4oRwBmE8iFDk2P8OZyj/Ukpfc
         Gl/OHJtT0O/n2ZeGh+wpofmvl/lAPyHZlr4/9+bPMB9hX7CCm0qIee03W8ph5i0nc01/
         ZP1ZEdJ0DPcKNUs4wGzZafXdp15V5L+NGMvFQPaReOtXbs3z0aaUZvv18OLpt8LsRhL3
         444Q==
X-Gm-Message-State: AOAM530RlRCjggzlVgVS458QVYEp4SnL3q1XwbFItdhwvtAkQAVUC2EP
	IK527H2bYOf5NE8nOEi3CL1Sqfq8MwVrvA==
X-Google-Smtp-Source: ABdhPJxjLZtLdKdipoJGzc5MlN8NUr2IKmZNCK+PBk41Cb+FWPII6DE3H7c1kvaViXRhexs/VJajiQ==
X-Received: by 2002:a17:90a:fd85:b0:1d9:6281:d158 with SMTP id cx5-20020a17090afd8500b001d96281d158mr2832154pjb.187.1650817906822;
        Sun, 24 Apr 2022 09:31:46 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:b82e:45af:4bb0:4014])
        by smtp.gmail.com with ESMTPSA id i5-20020a635845000000b003aaba2d78c2sm7113472pgm.71.2022.04.24.09.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 09:31:46 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: fix null check in rtw_free_recvframe
Date: Sun, 24 Apr 2022 22:01:30 +0530
Message-Id: <20220424163132.37007-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220424163132.37007-1-makvihas@gmail.com>
References: <20220424163132.37007-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a NULL check on padapter in rtw_recv.c:170 which makes no sense as
rtw_recv.c:152 dereferences it unconditionally and it would have already
crashed at this point.
Fix this by moving the dereference line inside the check.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index c1005ddaa..4cf9b4b8f 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -154,7 +154,6 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
 	if (!precvframe)
 		return _FAIL;
 	padapter = precvframe->adapter;
-	precvpriv = &padapter->recvpriv;
 	if (precvframe->pkt) {
 		dev_kfree_skb_any(precvframe->pkt);/* free skb by driver */
 		precvframe->pkt = NULL;
@@ -169,6 +168,7 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
 	list_add_tail(&precvframe->list, get_list_head(pfree_recv_queue));
 
 	if (padapter) {
+		precvpriv = &padapter->recvpriv;
 		if (pfree_recv_queue == &precvpriv->free_recv_queue)
 				precvpriv->free_recvframe_cnt++;
 	}
-- 
2.30.2

