Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B856270
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:36:41 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id w23so790714ejb.9
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 11:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rr8E+Q3FCa1M4riAo8GDxxlFhS6eYncmiHkHOyhsOSo=;
        b=kLGrW5+ir2nwKkLfv6Z2DtUSw1y+2DzF6B4wMkyx23E5Q51FF6kL+BVvI8akoH1sJv
         G0fhRDpWg4XMTd5blaLUu9JfkPO58nGgQcYbWHmG68wB760uBnHhqlkVNjZ+M3uswEON
         v248q91G9T5Y391+IYxmxQ+VLmBBZt4wgpETtcpPsFzGw9CBW2p4q3tyjgnOWaXrdOSQ
         2Hw7bC/EDuds6VWWjTvfLGi/dRLOegHM5ruEu08h85ArBO61QzrGpLZ6Jkldsr91xg30
         XCB+EegHMYzcpBoNIBIPKIyZJoQED2ID6aesBLaCSpEqfqZtf8fZdkcO+PFDtS4jke+x
         7Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rr8E+Q3FCa1M4riAo8GDxxlFhS6eYncmiHkHOyhsOSo=;
        b=UoNgr3tu2yZA3U03iS7g8c5p71J+WOa7zMi3dj9fKvkUn/Hu3PLjTBxC4pLqmUBJfu
         5hoZ+Fgq31LKg6tO37DfGuV+zhh48WlxemTe/bZ2BtXqNoKKwxX4XZO7CQ+Pz0zXHVH3
         vCwHuoolx7wXSzdzXPDysLmvorejxeQZvoHdWrfF0QlUdP7fKdxln7TrFiiioTnZzcZ9
         5l67qOgBXti3zQTuL3Q10EqpOrH1o34Y1hHd0ZodiZLK/HFQK6J57vJLbZOqj7Ih0hkj
         2D9jRO5xwQoAyRBf8Wtxbi1xFYIMDwQhuVeY3i89Xbjb8pGMVGjmAZZ0sqWc+bFV0Ktz
         z9gg==
X-Gm-Message-State: AOAM5313KvsG9F2iIIjjhPuRx7WYX3CQC2YPpDHydZ3DaFnVHeYqadNc
	QTHmiDfxtT7OCrCg+ZUZte0=
X-Google-Smtp-Source: ABdhPJwp8lghXMEP+BI4cLYJGW6+UxBrqhI+++8j2fTBEyO9bYI4hauPYsKvj7NGqH42mUwwxwPcVQ==
X-Received: by 2002:a17:906:f8d7:: with SMTP id lh23mr24650525ejb.457.1618166200337;
        Sun, 11 Apr 2021 11:36:40 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id g26sm4292277ejz.70.2021.04.11.11.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 11:36:39 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2] staging: rtl8192u: Remove variable set but not used
Date: Sun, 11 Apr 2021 20:36:34 +0200
Message-Id: <20210411183634.18385-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove variable "int ret", declared but not used.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: Change the text of the subject and log.

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
