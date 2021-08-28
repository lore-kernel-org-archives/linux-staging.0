Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8992FB2
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 11:10:56 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so6868008pjt.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YpYD5S+oJ76Daxyrbs6z/uA8QuUaxZ/HO+lVXMytHr4=;
        b=UDReh9hRJh9D9a/clnpUro71c0Su+CO2S3YaVgxKBgWBC9VjX7ENLFrlXjSQGz6CvG
         20+OvpRpiUr4FNXkNGFn0opJIXvF2EzlHiC8221xh7CAsjlyiBqLUoze4l+3hwYMzYgp
         n3qomIbX3bufmZOOzfJuJ06W506c6hE9zVZ67gpe6+vveg2RGisty7zkII5ImFVC96bi
         0KOLR+3vR9Hn67aqELHf2alKtjwPcNZg0MzznD+6Rm4GFDZsmeMZDgWA5epSnyEOq3bc
         GgfHYDVSQuaj/GsOdpW69Qx1v68P2b+rnHaymg5wxwFiinzmjnSz/JM/hq/VnpPw9StC
         jNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YpYD5S+oJ76Daxyrbs6z/uA8QuUaxZ/HO+lVXMytHr4=;
        b=cuni8vK521Hes1mJFgHSvRKO4GarfIyKHvQ8MYUsZalq//An6RgAW0Uf0QhNgq97ia
         XIkSxHSGOWXh74GIEkOXwTPZLN9aDPed3meMspXhn0DCTBQwJm+cbv/yfOnRP636F42G
         Acl8C4ky5phAQr0JQb/z0JqnYCQ4yLAJx2vXj6utyixHkBlkq32T4A5gAhjqL78SbTtu
         OfBO8/AqIYRER8EM6VhWqCGoKhE/64Cw9co4EhAk3HqdabOYJI6R8OYAIokZ/2S+laEz
         tg9jaUYyNtcBCwSZsL+IbEvvTi87IcOOeUSmaMl48lEmZXI89yunlhaRf15UiEhkq91t
         K4zg==
X-Gm-Message-State: AOAM532Cv4ZgMiEHEQ6k9yp2pdrUUinMJ3x2LtwVqmbHUv1ZR9QD4JyM
	uqTXHjuInFO6MiMPLAqlW0I=
X-Google-Smtp-Source: ABdhPJx45s3f+B72bbecp1Ik+pLsniM09kkGyhjz9iA2n/k5VvbxPSuTNTYVfdOaiQLMmLj7syW0gQ==
X-Received: by 2002:a17:902:e891:b029:12d:6824:9d28 with SMTP id w17-20020a170902e891b029012d68249d28mr12951548plg.23.1630149055771;
        Sat, 28 Aug 2021 04:10:55 -0700 (PDT)
Received: from xps.yggdrasil ([49.206.124.188])
        by smtp.gmail.com with ESMTPSA id y64sm10205379pgy.32.2021.08.28.04.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 04:10:55 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] staging: r8188eu: incorrect type in csum_ipv6_magic
Date: Sat, 28 Aug 2021 16:40:45 +0530
Message-Id: <0b7d6e92c79a6daf55a0c3a4961df6f33a9bcf37.1630148641.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1630148641.git.aakashhemadri123@gmail.com>
References: <cover.1630148641.git.aakashhemadri123@gmail.com>
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
index aa56cd1a8490..38f1bd591da9 100644
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

