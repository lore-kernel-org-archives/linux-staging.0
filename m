Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F536184F
	for <linux-staging@lists.linux.dev>; Thu, 23 Feb 2023 04:57:01 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c12so9689454wrw.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 20:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukhmyHKGnrxXnkVCZPZhv3pBLo/DfLVYIGLjFNsNDmg=;
        b=OjPGGKxQUy8KYljud2Y6ojgbfWPHdZHQ60+sYQCXhur6sV8NpIZIQ1Qa1AyOuZ5fp8
         z38ITogrLYXgb3b6OZKgVdw8ipfAezRRcB+kFYkmAqUAQap2T7TKZzXU3YQOUnBGpSzS
         qVJA4Fl1v2LTEMpZUcRzgWbUAgDiedHUtN6mG4UQsNRO8FHC+dRV0cDjvvmzA+xowUEZ
         fsCffqNKZh6uVU0ZLxdtpETF/Uzut5Z4jYKSgKmgLc3VpRsYtcfN9IZ78PnK45mJRjya
         DxjaX7ZuK1m9aKHOJkEFjSoGgMZvbw/W1W+Di49KE92IiR5BRqdCYdPHUpqgplpSqKy9
         TeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukhmyHKGnrxXnkVCZPZhv3pBLo/DfLVYIGLjFNsNDmg=;
        b=rsNPD+o8P2XOADtelRhi3GLKbHkJrU8hhKCHVSBs3Zt37wmii1OOaxTMTjQPDZHIYr
         +5baEgJthC8cnW7ab7tpDepw2Eoo7qkuG4l1J2MDGsMKH+qIBRZKbsSrQzs0aUirnUck
         XSZPYGWM8I9NrJwZkGzVx+91e9JOxlnlyYX0x++4e3YKr1WJXIr2lWmxB5nRXD/Uuse/
         YKQ9/kSPnechEEQKIlRQEOm3h6FaEyQ+kLG0EfBSACGcu3/g5GZMU2SRI06YEHq0fZnl
         rDbVtnQ23qUCvID0P24IhuGCGb7iyMsg4PitO989/DscIJW3OucQr5P8x+rur00KH/MP
         qIZQ==
X-Gm-Message-State: AO0yUKVYtiRPyXxBgvStbGicsha0jOxwkBKqcIiZpc8brUJMm/3uwVlZ
	nRwvIhG4VdZO6qfW/B0Lje4=
X-Google-Smtp-Source: AK7set/M80izrBUq5cg9ZpRdc/cWM+/5KdYYutlEmxHagH2lMCI0USCwea2L2yigsI4zQFuiQWyumQ==
X-Received: by 2002:adf:e242:0:b0:2bf:c0e4:1bc5 with SMTP id bl2-20020adfe242000000b002bfc0e41bc5mr9842510wrb.56.1677128219275;
        Wed, 22 Feb 2023 20:56:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c314d00b003e2059c7978sm9933347wmo.36.2023.02.22.20.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:56:58 -0800 (PST)
Date: Wed, 22 Feb 2023 16:59:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Deepak R Varma <drv@mailo.com>,
	Charlie Sands <sandsch@northvilleschools.net>,
	Mahak Gupta <mahak_g@cs.iitr.ac.in>,
	Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: r8188eu: fix a potential integer underflow bug
Message-ID: <Y/YfzZeFCAPiZ6RV@kili>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Here the code is testing to see if skb->len meets a minimum size
requirement.  However if skb->len is very small then the ETH_HLEN
subtraction will result in a negative which is then type promoted
to an unsigned int and the condition will be true.

Generally, when you have an untrusted variable like skb->len, you
should move all the math to the other side of the comparison.

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.  This is basic algebra of moving parts of the
equation from one side to the other and I am surprisingly bad at
something that I was supposed to have learned in 9th grade.

 drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index a7c67014dde0..f49e32c33372 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -538,7 +538,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 		/*------------------------------------------------*/
 		struct ipv6hdr *iph = (struct ipv6hdr *)(skb->data + ETH_HLEN);
 
-		if (sizeof(*iph) >= (skb->len - ETH_HLEN))
+		if (skb->len <= sizeof(*iph) + ETH_HLEN)
 			return -1;
 
 		switch (method) {
-- 
2.39.1

