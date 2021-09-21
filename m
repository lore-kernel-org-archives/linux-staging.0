Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF85872
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 07:34:29 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id y1so5848277plk.10
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 00:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UY4VFQeyB2IpV07haYw/yiFQ+tUqvcpG/fKqf0ei+vk=;
        b=JzWSiBPd+x449jkuMR0fvq/jrxS4+NJC/6Yv85lVPg0vdiJTYqO3fEKd8e94PNXUvG
         xARvGniE0GiyOBJolQrFQ0aZHdWtmx0/hV/UHB2wiihZUmrRiHVEZNyQXlST8M3YJZN8
         RUm8auIzIfPBkDmBKaLpqTu6BkfgLulu2lwUgY0S+ABrCXqZh72vnAWtxFjWoWX8WJXI
         cpgye1nd0+qNn/BVx6UwbOLifDqGgAJqBeWB8ibOBFKMYrKeoxE2l7vlVmAyYEKqz3Pb
         A5vE4yyrhtxFZjGGikQX2SL8bVeOTO8qnqZRz2wCN65nfXjGtIhsqCYR4aaJQzlOLjqr
         aBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UY4VFQeyB2IpV07haYw/yiFQ+tUqvcpG/fKqf0ei+vk=;
        b=6MtGz2uH30i73p2lr3gFgLqJ8sLNUeEJtrVhz6vmlpauVad6O30CneTs+zgSAE88G7
         pTm5PkBcVBniphNk73qyStiGGTF//0zXMTdUrVRd/AzsUzRpNgjUe7Lo0LVh1LhSFPUc
         vrnPxZHJCWIOnDu98tzorsuMOLOy+mzs0rJ7J2GPij+0UmGTaDc1A/Ko8CN2RlhdYEUC
         FGlYjOE762bKc1Hee9iGhiD44Gh881sozqJr5ofd1Q1V0haeRX2l6SFcH2U2TYlTaU9H
         pRGVJvo5Vc7xI21wg8kLt76CvE6qS+8OiHQoKjbWfPyOwrUAqYFh5jj/w6YTnCCDLS22
         csKQ==
X-Gm-Message-State: AOAM530JyrQ2c/bNYy7VrdznPdWsfaNIvg7k/M6HYrAy5pAWELvonJim
	odQRIsPzSKIM1lGWywDXSpU2C7VB66A=
X-Google-Smtp-Source: ABdhPJxUdxWgwHsIoZOak4+VzsRQ25LfxNYvjXvHVojtOqFe1aBFQo4isip2KroCBut9//Z5W7oqFw==
X-Received: by 2002:a17:90a:c485:: with SMTP id j5mr3691311pjt.109.1632209669471;
        Tue, 21 Sep 2021 00:34:29 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id x8sm16565957pfq.131.2021.09.21.00.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 00:34:29 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benjamin Philip <benjamin.philip495@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] staging: rts5208: remove unnecessary parentheses in rtsx.c
Date: Tue, 21 Sep 2021 13:03:43 +0530
Message-Id: <c06496fefb33677765cae2b9af50cbc185cdcb99.1632209460.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632209460.git.benjamin.philip495@gmail.com>
References: <cover.1632209460.git.benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit removes unnecessary parentheses that have been flagged
by checkpatch.pl in rtsx.c

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/rts5208/rtsx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 898add4d1fc8..41d13becec5c 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -558,7 +558,7 @@ static irqreturn_t rtsx_interrupt(int irq, void *dev_id)
 				complete(dev->done);
 		} else if (status & DATA_DONE_INT) {
 			dev->trans_result = TRANS_NOT_READY;
-			if (dev->done && (dev->trans_state == STATE_TRANS_SG))
+			if (dev->done && dev->trans_state == STATE_TRANS_SG)
 				complete(dev->done);
 		}
 	}
-- 
2.31.1

