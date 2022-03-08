Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56E7A
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 08:19:57 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id t14so15808490pgr.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Mar 2022 00:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=5urQPEXfDPWD6h0/ZSxr0FLAC0ujAefCEZFrLV2CQ3o=;
        b=q6ERUKGrM6tlptrFBXxei8rLRL8mHQ8SN569g8ZFkVtDAXx1eUvUE7ohFHOdES2Vw9
         fHPjPc0jLTaTOPMAmWOt6Tduw6qIEOb4Gn0yNXp52+9tXtDFOHUFmQidhrcycOjon0SI
         dudpHR4JeWBtjNs+MQkbOW0UacgObEKi3fOmyekVRCCDNcKzpJBDfBkvW4kqk8GqdEQn
         f9s+W0CdkJ8wV5l/ycUmeXVMkbkle32TuHNyF81sePlW60xoH5oRnALSoG8XtdDJuu0B
         45AdysKUZkjlE7UoXQjGfqxydc0U8liOxnp7khFd+F9pBFUwp412snMyERXpgmvx3ovM
         Sdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=5urQPEXfDPWD6h0/ZSxr0FLAC0ujAefCEZFrLV2CQ3o=;
        b=elORJIZoihTsZStFT6zz8UwFImzFUi+1CfcVC5fuTtDhXY5S77rRn8PUE1vW5Sc6f4
         bdNy0yd8/U9Ui8wL3pgOkqba8RLalY1EJQwctngEPIbdEkX8tq/ROdJy6JwsJ5UmQMuv
         RAq1AM78vS41c62vW3MyfzJC7u9bBkK6qTqLwXwsqthtxt72BFeZvomvyD/AQP3demQH
         ESW3CMTt4xc9mdCNTrNteCFAzMdR3py0hKC6uLWFk7P0HD9nji6Vdb9Fnu4adAPH+z8i
         SJoSYUEKQRfH9tTWsAZzPC5YRVArGp7KCKZ0OCYXBNjSrUQMm2koaNZSTvbbTH35h3Ai
         izhg==
X-Gm-Message-State: AOAM530nxZ8HD9It4ZpEFlV6t0tx8vnMXVbg83bQLeF+q6uzdqI1XLVw
	HtG3/stodwb7amXK9jSnT0A=
X-Google-Smtp-Source: ABdhPJwtsAG7xFHWyve3uOD/BbIQ2BXXngGRwLF4ygqQNKgyM6BcNMLhA93jZL5yKgphnkUH2eAkZA==
X-Received: by 2002:a05:6a00:1910:b0:4f3:aa39:1e17 with SMTP id y16-20020a056a00191000b004f3aa391e17mr17154103pfi.54.1646727596515;
        Tue, 08 Mar 2022 00:19:56 -0800 (PST)
Received: from mail.google.com ([122.58.164.114])
        by smtp.gmail.com with ESMTPSA id c34-20020a630d22000000b0034cb89e4695sm14372921pgl.28.2022.03.08.00.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:19:56 -0800 (PST)
Date: Tue, 8 Mar 2022 21:19:50 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: formatting improvement for multi-line
 bitwise statement
Message-ID: <YicRpmT2xMupVp4h@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Move bitwise & operator to the end of previous line for better
readability

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
Meta-comments:

This suggestion was made by Dan Carpenter in a previous patch that ended
up being merged:
https://lore.kernel.org/lkml/20220228063238.GA2794@kadam/
---
 drivers/staging/pi433/pi433_if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 3f3e863e6cc8..9a55fb29bd54 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -442,8 +442,8 @@ static int pi433_receive(void *data)
 		/* wait for RSSI level to become high */
 		dev_dbg(dev->dev, "rx: going to wait for high RSSI level\n");
 		retval = wait_event_interruptible(dev->rx_wait_queue,
-						  rf69_read_reg(spi, REG_IRQFLAGS1)
-						  & MASK_IRQFLAGS1_RSSI);
+						  rf69_read_reg(spi, REG_IRQFLAGS1) &
+						  MASK_IRQFLAGS1_RSSI);
 		if (retval) /* wait was interrupted */
 			goto abort;
 		dev->interrupt_rx_allowed = false;
-- 
2.34.1

