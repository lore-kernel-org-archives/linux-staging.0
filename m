Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9472
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 11:35:34 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id m190so13128655pga.2
        for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 04:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Wz6rpD52zl7+K2dd5/t2p4HjFSdc/LeLXvqpvIZcQ0o=;
        b=FO5UemEJ8pI/qUHyw04cZVpQtVp809X+rOJesPIR7nHgpdBF9j2ShCgsIUXmJ0gywm
         ungucMQfC+hET1jcdLWDlGJxl/r8lDv1hVbyZYwxJJIB/Iokul2g2wJDKmV7nBberdVd
         wWarHx7vSqBwdzYR/ADYyBwPBm2ByzPN8jzGbD7jmOlAGGdz7oEv1BGCuJQ+C/5aJADE
         oOSvgvo1OCHgQ1XBVypUubHQlw31Q444kIwMYwrSf0Oadfkure3aAkmdEbgX+VWWikjv
         dRljc78O2W65JCUa/TTRu7q+2mGKzi6SMbef6Ws69n3h7xpm8aPsYz/vCLIg4/zzCVfN
         lMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wz6rpD52zl7+K2dd5/t2p4HjFSdc/LeLXvqpvIZcQ0o=;
        b=V12aulb3pTtOToMidt0wRV1IvtxD+T55QdficXUL3tpRfQNzUWQN2LYllujhlTMxIe
         MOWBb0gLD+nSMwybmXFG09a+N79L/+y04l/3r+rqFkXxGVuWz7gCcEcgDxFXRLePNwM2
         l1QMmZxphQ15FCwQuzOZPtig/gBsNVpixbvW0enHNJIM+Ua3/ropO7NbEsdzl59nUN7f
         gWRVQ3w1BbArZpOG2PpfvTZlzgJajgECb5EXu4kDCAj6nbD6vqg+aBG2Wa4AYJKt7Isr
         ERwc08gSP/Z2bFm6qTpyRVT3WcUvjlr/r7aVcXpA5PeMCLEKbWR3qeiXTTKLNDpjUvTR
         teHQ==
X-Gm-Message-State: AOAM533LZAmrupGIfstqcNoTa+BjfiItC1pysl+Ip9l2+J6+Gw9WbjlP
	H4cFgRNYu7SvrXuXMlVG30BL5Ot9u0AkzA==
X-Google-Smtp-Source: ABdhPJzOjpk+TLqHWwStu3zSfOXZM5YnCKB6nOfvr+ZOZw6gKWH4Lat2NceBqTMKIPVj7oeo0w4bjg==
X-Received: by 2002:a62:1a4b:0:b029:24e:ba53:aaa4 with SMTP id a72-20020a621a4b0000b029024eba53aaa4mr25149188pfa.63.1620646533827;
        Mon, 10 May 2021 04:35:33 -0700 (PDT)
Received: from ojas ([122.177.206.92])
        by smtp.gmail.com with ESMTPSA id x26sm11069542pfm.134.2021.05.10.04.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 04:35:33 -0700 (PDT)
Date: Mon, 10 May 2021 17:05:24 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, ojaswin98@gmail.com,
	gregkh@linuxfoundation.org, atulgopinathan@gmail.com,
	yashsri421@gmail.com
Subject: [PATCH 3/3] staging: rtl8192e: Fix whitespace around conditional
 statement
Message-ID: <b25f07b14c7e1f0d70d54b8723f786e33ffeb77a.1620642396.git.ojaswin98@gmail.com>
References: <cover.1620642396.git.ojaswin98@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1620642396.git.ojaswin98@gmail.com>

This patch fixes the following checkpatch.pl warnings:

- WARNING: suspect code indent for conditional statements (8, 17)
  FILE: ./rtl8192e/rtl8192e/rtl_dm.c:1735:

- WARNING: Statements should start on a tabstop
  FILE: ./rtl8192e/rtl8192e/rtl_dm.c:1736:

Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index e340be3ebb97..3d5f9dc5882b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1733,7 +1733,7 @@ static void _rtl92e_dm_check_edca_turbo(struct net_device *dev)
 			priv->bcurrent_turbo_EDCA = true;
 		}
 	} else {
-		 if (priv->bcurrent_turbo_EDCA) {
+		if (priv->bcurrent_turbo_EDCA) {
 			u8 tmp = AC0_BE;
 
 			priv->rtllib->SetHwRegHandler(dev, HW_VAR_AC_PARAM,
-- 
2.25.1

