Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195F51FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:52:55 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-94ea38c90ccso79501066b.1
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617174; x=1691221974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s2H6tflOurC5lB+k8RugmRyTItQh4+yHSnzSMw6/Y4c=;
        b=lhjvhARPFi4OFqqhJd6llr2p5r8VZOARMkKfsdPLXLh4lJKDTmtBXs6rMHuNX/x5UD
         nNVQJM/RW5Cu+QkrGGpMyJJQd5xy7jX5IL2lqZJnfL/SLMHwaC0U3hNW4Kxqw7QMYPa/
         sE6N3fuWcZdp1PdjZrnsPD0M0Eirq56o1IesuM4YpIZka3WYbRfdYRitHRFx+Sc+AwSR
         7d65neDmpOd032wJxQkSh+i6n3lQZlsDL4J3yrNEOE/ls7zusFPs9IYRORr/uqNOOQ8h
         k5Jdx0ogMwDN5spHGCcams+FKNVP5ZhE2Can+IaLAGgp7/NnWCntmiXAIaeNCcG8gZer
         gLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617174; x=1691221974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2H6tflOurC5lB+k8RugmRyTItQh4+yHSnzSMw6/Y4c=;
        b=DjoIvzhEcI97Xd3yDDXNc1Z4XNytl+oPYPQ9RIjM3wKCru2ZegQiLU/8dP6I6jFx9e
         4JGwB7oMb8ZVUb17goUE6XUDOGdswakcoqJTkvgu4Dp6LN7yuuQgaQ1IPEshh9Biyize
         Z1705pClaNPHu6O124iYAiJ5935IIuSZnwiSjbccHMyxUnVWQrxwH5XfLFzgZsZHTGdd
         2cQ3UIeN0IfC3OYFjNKUcL19GpNBdnZTK2lJVunE33+HWSNTkjXnfKpzwWHDfUZ/mfMn
         JGwntkvwUHN5dUgP6tZ7I4aSRzqg8R6mJtx0jDvk36KzYhRxz2vK9AWo6RUwWElYsUZN
         nl6A==
X-Gm-Message-State: ABy/qLa+btMQCYFfED09x0pXyAYoPdSf4Hrt5zfr2ISlhMij6Dk+fnAa
	I/ww9h+l0t/ht5nx8HqdVdo=
X-Google-Smtp-Source: APBJJlHbHxqDmJ7Qjpy9DTyOWDjeo+wlp2ZfaBDb2aUIKGsfdiCX8tJD2hpsFxHiOPlcMDZ1gIM0GQ==
X-Received: by 2002:a17:906:64c9:b0:994:33b2:c32d with SMTP id p9-20020a17090664c900b0099433b2c32dmr1196575ejn.5.1690617174016;
        Sat, 29 Jul 2023 00:52:54 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b00985bdb7dd5fsm2966141ejj.201.2023.07.29.00.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:52:53 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:52:51 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Remove empty function
 rtllib_rx_Master()
Message-ID: <9604360121c5547cfaa282f73af5b948cdfbd769.1690615475.git.philipp.g.hortmann@gmail.com>
References: <cover.1690615475.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690615475.git.philipp.g.hortmann@gmail.com>

Function rtllib_rx_Master() returns always 0. Variable ret is already
initialized with 0. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 195ce0fecd29..b9d220b015f6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1445,12 +1445,6 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	return 0;
 }
 
-static int rtllib_rx_Master(struct rtllib_device *ieee, struct sk_buff *skb,
-		 struct rtllib_rx_stats *rx_stats)
-{
-	return 0;
-}
-
 static int rtllib_rx_Monitor(struct rtllib_device *ieee, struct sk_buff *skb,
 		 struct rtllib_rx_stats *rx_stats)
 {
@@ -1510,7 +1504,6 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 		break;
 	case IW_MODE_MASTER:
 	case IW_MODE_REPEAT:
-		ret = rtllib_rx_Master(ieee, skb, rx_stats);
 		break;
 	case IW_MODE_MONITOR:
 		ret = rtllib_rx_Monitor(ieee, skb, rx_stats);
-- 
2.41.0

