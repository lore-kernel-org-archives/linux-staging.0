Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD803FCF
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:06:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t8so10457824wrq.4
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9m/+2Un0OBvIknGm4SYolaypNfoGqK/u6kNR2lrNStM=;
        b=PVkkwGySqduFv4hpYoTnrEmd1VJN3t46FsXcdtIUWB2PgZ0La2yZJU1SNepXRS+OG/
         mNLZa3DrT+WpGz8iITakYg0Q7cgsSLmZCCcUbo37G3yUHsiFwes8rHMz7+RqhuDlTbyC
         8DU7PLxlg3vjHxSl91HjALa2tXINCzrHGJjLg2t9KBM0LX2XgPXmWGTHen2hii/zqjcP
         3F1BvDztrnCK3uXHMez4S+swPw0H3g24XagHvqtBa4AI4ESypfcXmnvoZys9Lor4rEFA
         +Pgua+OOLMPaYdClI2kwuKasho+TdQxOrlJoPZXJepPasKn/4nDyClkBjCoaagMSj48A
         CTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9m/+2Un0OBvIknGm4SYolaypNfoGqK/u6kNR2lrNStM=;
        b=0YJngw6gF0xwPBkUE2tnLHc3thyt5e3IOMN4NLUKjdAw/JAqoWDVglDhcoW29cayCV
         h0Q299FzekXzvPUD1qH9dvob7F3wt522hFHguVO/GBmwkYH3WAuLZ3KGTzdC5P506XDv
         svL73CiREpG4PFxd274H6Ft7+IVjVnJ2MAHsoJs4AdOpR9wVUPKHNLY660GglLR+jSLf
         KGo4N/CZoCP7CgBnHVJFwhS5IqpNIdnYuMtV+XgxtgEHULaaRR0dWsZok6zNSHgLqS1y
         9+48lqdLGl6udKRBJ6DpjqAAFRWgo8Bnp0aadP3LHoZra1/bx04gtGJjsd8VpAA9Tj1s
         iKBw==
X-Gm-Message-State: AOAM533eKS0Jjf8+lYM6oQzVn9z6bGM0K0sEIfoDdL/kvX1kd8nOxDHa
	M3g5R0CIZRrQqZTrN/I2cWY=
X-Google-Smtp-Source: ABdhPJwps2hEh7ZbEJcwOdalt5L3+RMWUDc1Fpsw3pcaCcEsVx0QHrRwrAP2ibAmLSKvL/f3ys+8eg==
X-Received: by 2002:a05:600c:3506:: with SMTP id h6mr882602wmq.62.1632341164289;
        Wed, 22 Sep 2021 13:06:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:06:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 45/47] staging: r8188eu: remove rtw_init_recvframe()
Date: Wed, 22 Sep 2021 22:04:18 +0200
Message-Id: <20210922200420.9693-46-straube.linux@gmail.com>
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

Function rtw_init_recvframe() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c    | 8 --------
 drivers/staging/r8188eu/include/rtw_recv.h | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 3f0c4d9d239d..5ac63bd6dd8e 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -147,14 +147,6 @@ struct recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
 	return precvframe;
 }
 
-void rtw_init_recvframe(struct recv_frame *precvframe, struct recv_priv *precvpriv)
-{
-	/* Perry: This can be removed */
-	INIT_LIST_HEAD(&precvframe->list);
-
-	precvframe->len = 0;
-}
-
 int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv_queue)
 {
 	struct adapter *padapter;
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index d35a9276350f..0b1fc752b0c1 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -274,8 +274,6 @@ struct recv_frame {
 
 struct recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);
 struct recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);
-void rtw_init_recvframe(struct recv_frame *precvframe,
-			struct recv_priv *precvpriv);
 int  rtw_free_recvframe(struct recv_frame *precvframe,
 			struct __queue *pfree_recv_queue);
 #define rtw_dequeue_recvframe(queue) rtw_alloc_recvframe(queue)
-- 
2.33.0

