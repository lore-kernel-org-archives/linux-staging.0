Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220BF6D24
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 08:18:14 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id c17so5168750pgc.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 01:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2iHDz4WdAlIttHKXC2r6vcKog0rKGgMBuUThR+IjQHE=;
        b=Nzul7zIzR7+9HRNxi7dXZNGF2Klx1fcWrF/Hclj9WLqvYJQZyzCpd5DYzTriH6LPcR
         2dlq+y1S+iKTsAv064PLdWLToCOIeHkAt4iXWOcsGmPn8jfL7tKtfFT+uzbeJeeZ/Wwp
         ch2vhlPWhKh9v7hDYGkxsQRvBJH8AC9FWZGS9cciW5VlbPy4x4HkFHw90F3bKP/zxbE+
         mIeQgQOWcy4CoDMUtJTNn67Snw7Zw5j4T5Ez9UnHsb2mNnylyWZlq4d/9RvYNNRmgswU
         C4u9SQzO6X03wRBjdV6ajwHNHjToYXpuNyrdGOaldel9wB6rzCqvVnOdPvKRj+yaLkSW
         M8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2iHDz4WdAlIttHKXC2r6vcKog0rKGgMBuUThR+IjQHE=;
        b=qS5jd/zd6VfMjThCjS2Uv4+TET71GRHAIaDASSF3mifWPMNHwx5WVSYJzgsCRrmW4R
         uZr8N3OTqEHwLUZMq7H8PfA5oGeXoi44auMP1PARsIdr4VrpbYsK4AHKY6hVcck53vRH
         jTPjdvKHvEdfyh8Fd62tAloYjqYm7VSPDxMUrxbenCQ6Isjpqqff+W5C0qQ7qV3WjhM2
         3SKa5CkKQ7rsMV/oBVk8g/cuYXKwjXoAO845YLMHSq5UuDtuKQQQC9ko+rwaknqQ6+jy
         iGIUAuIWZEHyJc/I4UgH/7d3I5gi+7Bupt/Qb/gsjo3A0D/4pPIe320w+becynp6fFEz
         lzPA==
X-Gm-Message-State: AOAM531mhIcW14yTRITeYAUhSauWvHGh6soLsAJFFqJXN6hRXmqDE7uJ
	J/Slte/POzpw42HtFsnA23k=
X-Google-Smtp-Source: ABdhPJwOEw06IKS5hagcj1D5n74ODui50xvlQYZ4th/bvxjMFMbwHA3b6JbN6rx0rDUEmeH5P2Tagg==
X-Received: by 2002:a05:6a00:a8a:b029:356:be61:7f18 with SMTP id b10-20020a056a000a8ab0290356be617f18mr13531044pfl.29.1629361093756;
        Thu, 19 Aug 2021 01:18:13 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id gb17sm1531129pjb.26.2021.08.19.01.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 01:18:13 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] staging: r8188eu: incorrect type in csum_ipv6_magic
Date: Thu, 19 Aug 2021 13:47:55 +0530
Message-Id: <8bc15e51751c26fd19428f3b4976b7495feecd34.1629360917.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629360917.git.aakashhemadri123@gmail.com>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
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

csum_ipv6_magic and csum_partial expect int len not __be16, use ntohs()

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 6a0462ce6230..d4acf02ca64f 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -615,9 +615,9 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 						struct icmp6hdr  *hdr = (struct icmp6hdr *)(skb->data + ETH_HLEN + sizeof(*iph));
 						hdr->icmp6_cksum = 0;
 						hdr->icmp6_cksum = csum_ipv6_magic(&iph->saddr, &iph->daddr,
-										iph->payload_len,
+										ntohs(iph->payload_len),
 										IPPROTO_ICMPV6,
-										csum_partial((__u8 *)hdr, iph->payload_len, 0));
+										csum_partial((__u8 *)hdr, ntohs(iph->payload_len), 0));
 					}
 				}
 			}
-- 
2.32.0

