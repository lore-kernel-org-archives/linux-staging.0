Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FCD1842
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 03:15:35 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso1279774pjh.4
        for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 20:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5bbDJzaPEeyqFN7WwD+EORQ7ilgccQy1ek7UFlep3No=;
        b=X5sqadBIfeoEVVqfCQqIihmyJ/vNxor6/7OLtJXs2ojCze2fPOZSGzn9+U46DpQVNz
         zavmEZn/EKQIYUU8Jh7go63SfAzPN3ST9Ug8kFR9QUb7a9FMQyBAdOSL2k0Fs6Dxq/d/
         SMsKZwCZLZblNzbXasWWin1+T/2DuVY7oXOPYhfBaY666vERTeiXdAwakZDqTCXe+Zpb
         SE6hSJzM1gwCNC833ipQNwtkM0w9waPIXQpmkK9ysfpl0Cct0/0nRrP559XKURs/MhRg
         4rZPkz259IpOxNMZBMC6ZGry5lc+jXn1xKtux2pLUJLf6MaBCFGCZxlkclU73D0LKgnT
         d7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5bbDJzaPEeyqFN7WwD+EORQ7ilgccQy1ek7UFlep3No=;
        b=uuBaj3KwQcP54lSgHin9yImVaRJGLCOTYT/d7BvTkMXjpd2g2RxShdPTN8Y+7tzXFv
         zYcou/us+njxJlP1hb6L364Raq1GmWuTpIVVKeESxo1iwMazgXaXdYDNJyRb5L35XWHy
         mVP13tRgR7JrgtjxhIDr+jXTw/UkJ7b98EWmrkxEThyWPXp9veA4ZpWq/KoO6LtcMFYp
         n4d7vynuyK3RKUGu2oc5D3Q0mzLo1o1oXkLXCOf2MAwjgk+E207tGZtpfrc2yLMZef1b
         ezTG2PTgariBgzK3JMdqYciauzDHnW5NljoPin+9g06g1jnPJGZFXt0F6vnUAxLQmcra
         w/DQ==
X-Gm-Message-State: AJIora+TJKqK0q9apCkbP5iR2rBImQoPOBbr01NCknIxNKW0EYrh518Y
	tBJT/TVc5nZB+mrlf26FyOU=
X-Google-Smtp-Source: AGRyM1t0HBVkrwZfOWux9s4jXHJ/Rbgt0brzGNBEeAIi0/0tjlE84bnQrXSt6fJQdOz/dL6F1PnofQ==
X-Received: by 2002:a17:902:db10:b0:168:f71a:2fcb with SMTP id m16-20020a170902db1000b00168f71a2fcbmr36910923plx.165.1655954134610;
        Wed, 22 Jun 2022 20:15:34 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id v16-20020aa78090000000b0051bd9981ccbsm14234328pff.39.2022.06.22.20.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 20:15:34 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH] staging: r8188eu: combine nested if statements into one
Date: Wed, 22 Jun 2022 20:15:15 -0700
Message-Id: <20220623031515.402691-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine two nested if statements into a single one

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 599d3e55be76..c7564af39023 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -166,10 +166,8 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
 
 	list_add_tail(&precvframe->list, get_list_head(pfree_recv_queue));
 
-	if (padapter) {
-		if (pfree_recv_queue == &precvpriv->free_recv_queue)
-				precvpriv->free_recvframe_cnt++;
-	}
+	if (padapter && pfree_recv_queue == &precvpriv->free_recv_queue)
+		precvpriv->free_recvframe_cnt++;
 
 	spin_unlock_bh(&pfree_recv_queue->lock);
 
-- 
2.36.1

