Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E53FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 16:18:45 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so3037522pjx.5
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 09:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zce+9GoPNcPtTE5VIu9hPdavcSu/ZdMiHk8wj8U5mA0=;
        b=XBS4YXiXGazjmOvBCTVJ8gM/PtNueExXI6FBqFAqhMG89Ir8VnL/XcZ515wsorFtX+
         V0EgPZrIt5MpEhk4aO7BZHvPETPKe0pKganeZN8RTi48b+xC0VFeVBdoVJfjTnrA9sjO
         M0TI1KpNJ09CJyOQ5llhhSbPPB4Ja4SrwxmegK+9qlADdxfgsGa2/58ASpt3UwKchMe3
         eRky5Lnf0Xq/GJlVsnYGnyHB25PSeRsmFavhclV9/f4aoGCcr8WFp9S0Qui0Z7hb5L7n
         Fyk5fGR78wdJ0UNVT+PC2igK3QAzqYmyEJYUbiFKRgRgoocVagWdDji+hghkrzmQm3Os
         7G6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zce+9GoPNcPtTE5VIu9hPdavcSu/ZdMiHk8wj8U5mA0=;
        b=GkTehWdiaJGwijr2tSCJ1dhyGb69CamtWj77vNBtojwBIPqBgw0NBF7bICNQYy88oa
         XT5C9Ug9rnex7+YuxAfb7s8UzAM40WhWHGMe/DAr2esz9YmgIFwH4eJgjwXxCQGYl2Ji
         WehRPHTM71d4zKO/85jnOvX3Eya6FyJIz0YxcH/CXcx++m5ANMJLwvxM7g9vE14NpDZM
         mnzF/ShQdN4erNfC5LQbIZ46KcxJh3OUmevvD/2cfLR2omxZYblsgepYGve/hPfgGS3H
         n2X+/rsq9iu4tRkiEIFg26Bi62n0rEkKVLA9O9QE/AWGLKYkhHFJVXyLCk32Uo2vlbTe
         s5ig==
X-Gm-Message-State: AOAM531xqezU3rLTwkvlrORK4GGZRcuuAtdNrxcjbqLM8nzy25kYRJ/8
	BpPipE9LBscs8uhawEUBQXw=
X-Google-Smtp-Source: ABdhPJxyimGdSVVr90/SzrbfeqN00sl2YTY7nO366IuwK9IYni62ddyW5RlB2yRk024D2obCG5D1Ng==
X-Received: by 2002:a17:90a:e010:: with SMTP id u16mr10630328pjy.111.1629562724715;
        Sat, 21 Aug 2021 09:18:44 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id y27sm4227011pfa.29.2021.08.21.09.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 09:18:44 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] staging: r8188eu: incorrect type in csum_ipv6_magic
Date: Sat, 21 Aug 2021 21:48:30 +0530
Message-Id: <392082864befe91bb03d16ff7ca5e57ba2a8e549.1629562355.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629562355.git.aakashhemadri123@gmail.com>
References: <cover.1629562355.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:771:84:    got restricted __be16 [usertype] payload_len
> rtw_br_ext.c:773:110: warning: incorrect type in argument 2
    (different base types)
> rtw_br_ext.c:773:110:    expected int len
> rtw_br_ext.c:773:110:    got restricted __be16 [usertype] payload_len

csum_ipv6_magic and csum_partial expect int len not __be16, use
be16_to_cpu()

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index f65d94bfa286..26606093a3c3 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -615,9 +615,9 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 						struct icmp6hdr  *hdr = (struct icmp6hdr *)(skb->data + ETH_HLEN + sizeof(*iph));
 						hdr->icmp6_cksum = 0;
 						hdr->icmp6_cksum = csum_ipv6_magic(&iph->saddr, &iph->daddr,
-										iph->payload_len,
+										be16_to_cpu(iph->payload_len),
 										IPPROTO_ICMPV6,
-										csum_partial((__u8 *)hdr, iph->payload_len, 0));
+										csum_partial((__u8 *)hdr, be16_to_cpu(iph->payload_len), 0));
 					}
 				}
 			}
-- 
2.32.0

