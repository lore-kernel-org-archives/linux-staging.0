Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6C6D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:54 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x4so24862023edd.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/kTlqScRexjxeUZVlgvZgKV7vl/BLWE5sWlAi/z9T+Q=;
        b=UnX1dURuJBfEb8qiyjhM/mtMEpvTY17r/4dIZB6g9PjoXxxZEEJ3E/3HriGhXCGVV/
         LPlnEZknw8PnJuKX6LGQCpvU0MhNQQJUd01Mku5TewRTtKvNRC6q25eRtbkdy9nGVvAu
         K6/gUIzYxnk2/Kmdj5z4FDAI/LKUDMzaIxm0tNzPJMYdMuBWA4gfXFoOmus2ufwG3YdN
         PIDp/2arTT6BEQBSf6VA5232xLCaLf1HCeWDskwuJzA2+ZqExCcluQeGhJ9Y6H4OzQFo
         tt5l8TDPQ257xn8sZBGeyqm2I+GPjZKKff0h4UMhb0fCirTEE/Idumnxrrnzm0JunCI8
         5sXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/kTlqScRexjxeUZVlgvZgKV7vl/BLWE5sWlAi/z9T+Q=;
        b=IHSQP00BAeSxd4FAwvTGxdZqevkShmeXNRa9HXnECPw2B7ISZ/eOa3JBV48SDMAr5q
         a5KZMBUvU1sI9vV+tnA2KWRl0HQlhUYOpLFjxXeG6xEBptmnNwOBlvPoSph1dMr0GHD6
         JR66qkbrRxOipGRO/W6gPS1WfS6geOewQQS3eSs77seJEreoCnsIIYiI4O5SrKsrCGlt
         eSH/1FlmcftRMeuy3p1TWEAt2wJvVP+4ybfiQugQdL3fbxSAcop/7C8siTUyF3sTo3ZB
         fQ8tgd2Gr+PKw0yF0BtCUTE+mK0E4gLZCp5km5ifIdhy1EsI7IYIx8BZ4+D39AsAuwiX
         FEbg==
X-Gm-Message-State: AOAM532ti6pdXrDS5zG2QzCu7xPfSNc7heEh+fwYUMPC2EGKs50Q4C1j
	2ykGo9BM8p2lf6MfDoU+y3cDeXI+jnkNRQ==
X-Google-Smtp-Source: ABdhPJw0i4sbCFot3EhnDxTRytIMAMRuQMtK/zB1BawCSZq+ImOkK0sGSNzD/U1GzoF3XXiOPUff9g==
X-Received: by 2002:a05:6402:b07:: with SMTP id bm7mr207395edb.82.1618423913409;
        Wed, 14 Apr 2021 11:11:53 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:52 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kees Cook <keescook@chromium.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 18/57] staging: octeon: ethernet-tx: Fix formatting issue in function header
Date: Wed, 14 Apr 2021 19:10:50 +0100
Message-Id: <20210414181129.1628598-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/octeon/ethernet-tx.c:507: warning: bad line:

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Kees Cook <keescook@chromium.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/octeon/ethernet-tx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 9c71ad5af7b98..1ad94c5060b52 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -504,7 +504,6 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
  * cvm_oct_xmit_pow - transmit a packet to the POW
  * @skb:    Packet to send
  * @dev:    Device info structure
-
  * Returns Always returns zero
  */
 int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
-- 
2.27.0

