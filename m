Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF7572
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:00:52 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u3so38464166ejz.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 10:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QrJVb4x0MevIwrPVSWjR2+axB3N0g9Y5As2MZj3In2U=;
        b=bLjKa366IbRr69mpk1Y9xDwMD39ih0ee1UL1bI8hPit/dzHjAnf0KdaawQ//sGaiQP
         FVKqWnRVJfkPFms88dH22csvFRBXRZkVnNFhCrNPzpP19NyeqRuMcUT5wye1V/ujMaPs
         XXSYJoksHO35BGd2WqCm6c3u1XTpQUn0p+Lk3Grxy2ZoZaE/WaKflMWrvcYN/JY3MktS
         VfBTrSHLdQXrgICkWd5am4IltxzzuolU5pdGxMOHQ9u5vk78+fFebRTAHSmf6rEqr1b0
         KoZkBxWNjAp0WCOXHWmaRKMzEBiVKwEKVZIDHiwc9ZztrAWQ9hRI9wqxdAbIstM2FRLg
         b8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QrJVb4x0MevIwrPVSWjR2+axB3N0g9Y5As2MZj3In2U=;
        b=J5H9TPDDDxsa27Cd0aVlz7hif8TRcYWETpiqUbkfVIEdTxN2byzMK0NgiGaXgB72k8
         IQbz9sI+J0Ahi7nCtk8lH2M7uekoimPiR87eJhmfgvGhp6x6mNL/WDNFtXFMj8xLP6TI
         KIVMEFzmW+eME2VPsYjTf5QJPpkK+6u+2p5JWbJpT/Uvu3Kk7lM9pVsASbB/wLpeDeBr
         GYzMoaea6SJHOoTxyB+GbjASUCK6CrUk5tQdMagrFOaEFbOE9lXrWzCHpIl9HGNUaOIY
         Ny8UpJ7E7GLEXwf7gD3D+9PuHmPhI41j4jaQjc1Nl3kgTPFmmyr8sKRRValPwEEbF5kC
         MyOQ==
X-Gm-Message-State: AOAM533YQPsNhB1nZmC2cvgns7WxjMJ9FJSYspyyZUUYs45U43KuBx4H
	cgyl6r2cqkCVF5GHhuRdS4M=
X-Google-Smtp-Source: ABdhPJwby945NkC/QZ8MsHEugzjR+qawJPWoIB4GObBEOUMiKQhWfc4NX7fie4BuCVmduCiQijdeGw==
X-Received: by 2002:a17:906:93ef:: with SMTP id yl15mr16441921ejb.229.1629738050629;
        Mon, 23 Aug 2021 10:00:50 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id b18sm1633188ejl.90.2021.08.23.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:00:50 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] staging: r8188eu: incorrect type in csum_ipv6_magic
Date: Mon, 23 Aug 2021 22:30:28 +0530
Message-Id: <392082864befe91bb03d16ff7ca5e57ba2a8e549.1629563318.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629563318.git.aakashhemadri123@gmail.com>
References: <cover.1629563318.git.aakashhemadri123@gmail.com>
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

No changes

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

