Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C7F3FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 16:18:41 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id x16so11433249pfh.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 09:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QUnHtBDWwuZ6b4H5N4cag1F+1r7RGxZOLo0C7Dxdnss=;
        b=m4hf8PxIPaYiYfwAXIfKngFRpG/ZIZgSCzh/UCqUl/tsN4kTc2xlZ7WkEhX9lWMaJY
         /KA1+z8H+jkebU6vccS56LE0LKn8cwBmWummFuR5TQc26G3KCFZV6h8PznlPwDyQHc55
         jbuKiYQdZOCC3+EP8uxA4GdaXUH6W28KxnLX0Ocpg6w3C5ErSMPuHbzkN0cOfs3jc9Eb
         QVYdwlaTWlGCGnsIpfrFqh2wx6wNC2nyU9ZLuTMq4TSj8GZWTXUvz92I7suDA+slUha2
         FJPy4rXSBM+zMNHS8nIqLCAXeEy7xMv3ceOK7d83co0GFs/j/UiG0dCFluErUAMGs2tI
         C2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QUnHtBDWwuZ6b4H5N4cag1F+1r7RGxZOLo0C7Dxdnss=;
        b=qLtIhmEUVDT0nbs601yLH8VwD3xZd3WktkI7hHZtyiVBplb2YOzC8lzxrincn2N3Hf
         mZfkyPYZsPtbygefhrNCDFgHtkglmaIeb8KgnU+Nee6oknHfXCgihTx/ISClxZiuR6hQ
         dDmfe7jUb75Pnam7O58qE9uyMQIdGiMwWVTRaqi+JztGuVWi+erbdElsEDfJMi5MwkcY
         9oFl9eqlDKkFmrIqBmXI/az04gtq+ciXLNE/9akGFJ+G5YJMGAJzI/Fhtly3AGv+VUsq
         NsgBJPDsV5aoAbpf3xxFmXjs8AWhj9Q4Mv2UbWBjigDfR+GYXG8uBTFkUlS4dz3Du3Mb
         Bq2g==
X-Gm-Message-State: AOAM530PgPrFKb493WSstKifnwiza4rhtZWPcwA7yPtQIaZk1Rb1T4jc
	2PZtVEXYiNhsWGZjQKDVu2s=
X-Google-Smtp-Source: ABdhPJzK0U3AekmxkSH1AfuH/lKiE+8/IXCcCxAod00PuzhXx9jF1aFsW+5FdfB2EZ6jqc3S4H3s4w==
X-Received: by 2002:a62:8491:0:b029:3dd:a29a:a1e4 with SMTP id k139-20020a6284910000b02903dda29aa1e4mr25268000pfd.13.1629562720637;
        Sat, 21 Aug 2021 09:18:40 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id y27sm4227011pfa.29.2021.08.21.09.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 09:18:40 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] staging: r8188eu: restricted __be16 degrades to int
Date: Sat, 21 Aug 2021 21:48:28 +0530
Message-Id: <7572c80d90b499df7e9feb4781c07967fa31bf88.1629562355.git.aakashhemadri123@gmail.com>
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
> rtw_br_ext.c:73:23: warning: restricted __be16 degrades to integer

Here tag->tag_len is be16, use be16_to_cpu()

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index ee52f28a1e56..f6d1f6029ec3 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -70,7 +70,7 @@ static int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
 	struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
 	int data_len;
 
-	data_len = tag->tag_len + TAG_HDR_LEN;
+	data_len = be16_to_cpu(tag->tag_len) + TAG_HDR_LEN;
 	if (skb_tailroom(skb) < data_len) {
 		_DEBUG_ERR("skb_tailroom() failed in add SID tag!\n");
 		return -1;
-- 
2.32.0

