Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D172
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 17:41:49 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id g17so13695224ejp.8
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u9+q96TK9VMf/Mx9e4OxGt+pQceSuNr0TnGIlmL4TBw=;
        b=SLXnMCA6lSvQ/t3X22xC8QjMk3XgUQWveaJOgAHqeosdtLKAT3sEAh+qTDI4eCw0UP
         EFXK8S0qwufXkGzUOFxzEfrtvrO0Y7C3qWuGIHamFVGHw6PlWtZpKjdcE4y7K+oPC4C3
         7pfvay3HYuNPlTcpq3+2LiJoRbyHKOAvzGI587fTFJT7hq/ctBNrUFMX5qhBmToMlg3R
         hbRUKENMA6wp2SWlPc7ja/OoXKI0LQbctAwyp8DFzPYECNJfhFwWsgy/ytDOS6GtFmBb
         7WxkHhcP1zP6EDArdo/v9DBWUNd2HPWCVrfTQ0Q/MV8IBwKnIzCvdBRjbKFhmCIkEri0
         XYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u9+q96TK9VMf/Mx9e4OxGt+pQceSuNr0TnGIlmL4TBw=;
        b=iZo9dNCTWDuWJK0Dw/yyT3Y4GDFZ10TVqSJHZtFhKPoGZ8lVHsPTn2mFYJq3n+qlXp
         +43fSmgF3C1Wsjo5KxK9R/CcjIvvki5KFVFPKeuz3SUupggRSk+HmKUKvSA5t1U3pT7K
         XntDTtHDjnJ0YH3ZdVREa1iy2xSyo7tPQWfZooWrzqhMseaIPpc37xK4QvBTcrdZQXad
         K3CI6LypRX+c+csGW5BuHzVS6aTsw3OhlcyXEW3odLG6qrXq91aewuvk9bZaGVHdZCgu
         yOiOk+BndTESJ75+E8kYcK6YGwcq4PxCJcbOf+GGug0wFvCXRMpls+Z5xKa8cBXGDGkc
         asTQ==
X-Gm-Message-State: AOAM533Twa6v00k4rV6rfXVzuCmmFyEwL4nb1fgVWWjzGmSkNpGuFPWW
	OjwHg7Tk+zzxX1Yo3qTJrLU=
X-Google-Smtp-Source: ABdhPJyz7A2KWzHZwRd8VqW33YQDNERox46F1va+xJ366Hnux8Krn57JQmxEuwEr2r0FPhJjdb5TSg==
X-Received: by 2002:a17:906:c0c8:: with SMTP id bn8mr23728409ejb.445.1618162907860;
        Sun, 11 Apr 2021 10:41:47 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id cy5sm5166359edb.46.2021.04.11.10.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 10:41:47 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] staging: rtl8192u: Remove variable set but not used
Date: Sun, 11 Apr 2021 19:41:43 +0200
Message-Id: <20210411174143.31618-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove variable "int ret" which is instantiated but not used.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index f48186a89fa1..30055de66239 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -902,7 +902,6 @@ static void rtl8192_hard_data_xmit(struct sk_buff *skb, struct net_device *dev,
 				   int rate)
 {
 	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
-	int ret;
 	unsigned long flags;
 	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb + MAX_DEV_ADDR_SIZE);
 	u8 queue_index = tcb_desc->queue_index;
-- 
2.31.1

