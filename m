Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A6C6FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:09:18 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id h16so18194887wrz.12
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u9KDPpjVKPB5sOQxBI2Abbi3wGikXqFCKNDvpCWP0FU=;
        b=CJFpdB0XCRJu3gIwSZp3Ta9DCtU3V8aBi+GOaExYHwIoDybhpUjd07TFRsBrbfFSls
         cuCjw6ZWTrV27iC4ZrADnl9lkOmpsM5WeWRWbJDunQFFKeMmGxb2nkVk9mWlL0bljWWx
         FpbtRX1WwJIGOhV35G9JYf9PIMnsMdcBDF3K7q/389ocJiNVWVZ4Ixvvpnu6BaHe2L1A
         vEnD52xDd90V6q9OjGadaV6ub8pJEP19PZtySlMi/E+by37M2f1cWqVAadtHbx1MQSYA
         0xk/7P6Gbk1XKQHldjM3GbJlJsB9qSaNthc0OPRs9A+z7DcQnA735sZ9uPliKohtWITZ
         8K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9KDPpjVKPB5sOQxBI2Abbi3wGikXqFCKNDvpCWP0FU=;
        b=rc5tjioKV7bhnn3X6eSBMmY/63jAGcmNLL8u3hhucYRxgyHWJxg0kdbXHyQsjcvCgc
         DAHzupb7hYbJBa13VQK0hwE20QQVPuYV0Ah87798ntnbOpIDR92G3G1FZdC9QWCJgJzP
         C7P97Uem+ovp0Qco5zKN2nET9rzNvomPQzsPNmo/i8397RDZBQBxfU8+UNCfrfu9OypK
         C1YxcYosoRauRGxSnwBRIjIoACc9YHedmRyqeqcWTheFTnQ8CqhdbfBrbFOAwT/Kn4Hw
         xSnZ5LWsYQ6PQJ4bFVULia9HPZ07A4yF7k03RqyQlJKQ/gymuyeuR/xbPNDBBt6JfQGw
         YuTQ==
X-Gm-Message-State: AFqh2kpe1PKxoDQwtChstTsOb/kIC1u7sIL7DURWWtIDGuGxO5XssHr4
	PG8fWPexy0hxgCc+iVzgf6I=
X-Google-Smtp-Source: AMrXdXtH7lBqibmwThD1nA1HAiRVvadzNEpssJMoEV8806t/XJLHi+OsNhMCij1fobz8/UIp6cNVYw==
X-Received: by 2002:adf:fd0f:0:b0:2be:4639:ee27 with SMTP id e15-20020adffd0f000000b002be4639ee27mr3835467wrr.1.1674677356684;
        Wed, 25 Jan 2023 12:09:16 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id r13-20020adfdc8d000000b002bfb5bda59asm3288112wrj.25.2023.01.25.12.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:09:16 -0800 (PST)
Date: Wed, 25 Jan 2023 21:09:14 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/11] staging: rtl8192e: Remove unused variables txov..,
 txbeokint and txbkokint
Message-ID: <023f612dc35eca3a74c31344f7dbb168180bf437.1674675808.git.philipp.g.hortmann@gmail.com>
References: <cover.1674675808.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674675808.git.philipp.g.hortmann@gmail.com>

txoverflow, txbeokint and txbkokint are initialized and increased but
never read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 5 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ff9dc06642f6..768324cbe253 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2181,17 +2181,12 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 	if (inta & IMR_RXFOVW)
 		tasklet_schedule(&priv->irq_rx_tasklet);
 
-	if (inta & IMR_TXFOVW)
-		priv->stats.txoverflow++;
-
 	if (inta & IMR_BKDOK) {
-		priv->stats.txbkokint++;
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
 		_rtl92e_tx_isr(dev, BK_QUEUE);
 	}
 
 	if (inta & IMR_BEDOK) {
-		priv->stats.txbeokint++;
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
 		_rtl92e_tx_isr(dev, BE_QUEUE);
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 2d1561a202d0..96d340f686e9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,9 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long txoverflow;
-	unsigned long txbeokint;
-	unsigned long txbkokint;
 	unsigned long txviokint;
 	unsigned long txvookint;
 	unsigned long txbeaconokint;
-- 
2.39.1

