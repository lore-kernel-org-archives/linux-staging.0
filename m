Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B532FB2
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 11:10:54 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so10706963pjw.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 04:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9F4jfrLgK6xkABY5wRk3B6guk9L6WzewIDyIT8iVCaA=;
        b=O/fZDbwg6YCb+ch877n6TpUXVoYZXAHtY44usHekDpgOqmSVSy0arv0C7yZ3WbEYeH
         QdGgxRUjkjq4Jy+j8+u1mhjVZMWBAmBrDjqL+g4RP35UB/sY5O1wNBPSX/F0pRu+EOQr
         vXHxg+/6cI2Og1nUQWDqtYvVVY3dKyraT8aPLjnFewNEHelb51D0gFGGMx7YanvWtZx7
         Yf7sVVwA/earxAza+azraGDejdgY/lcoOpo+P4Q0Wjbx3/D/vb+dIQFi/FtGKMl/GABz
         II6sOdnRrJ90qzYSO4dvZi4gtTkZN5ebsbraTUholi4RGmowoJv55YMeEwsKO1jVK+3w
         8ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9F4jfrLgK6xkABY5wRk3B6guk9L6WzewIDyIT8iVCaA=;
        b=piIz2BpluqCsMR0hx4CHEomfZmBrBtO+f+24Wa809ms/lTULL0f3CshZsihaQJh2aR
         Ls6hPZII8zxpynoBbs9gctpF2FAVYSL1X8w91ZUMXXSi8yAvUAgwyWKGC3+rKNldDxnL
         6Llp6kLhit/IYNUidKPlDGD7pXe3fnYlvu5BL9lRPcmR+lraFJCCL2jzoYQV1gPATISS
         gNUqnG7PuTzxy/c8CkZJSYzBZN+OtIiCPzbbS2IVGqiQEncAM4bZr13uhUsQM/RVPCk+
         yUp2t1m404deVjaj4tNM2y+a7vOWZM/Co9BJjowE7g0GlPNBouelPrQRn+PWG8fjyBnA
         b+ig==
X-Gm-Message-State: AOAM532weZrh9MXTW7fs1hnyfaBbYaUjZ8CMIoIVusvxwVBMImkvMyaM
	pctNwdM2ET+mHM1AHy/78LQ=
X-Google-Smtp-Source: ABdhPJwSums78rXCFDJWuWb2jR2/oE9omHib7JXkEQi0wpObFUiA4lUFeywL5a0LkKWTx54O5mMEpg==
X-Received: by 2002:a17:903:3047:b0:12d:c724:8c22 with SMTP id u7-20020a170903304700b0012dc7248c22mr13205663pla.59.1630149053806;
        Sat, 28 Aug 2021 04:10:53 -0700 (PDT)
Received: from xps.yggdrasil ([49.206.124.188])
        by smtp.gmail.com with ESMTPSA id y64sm10205379pgy.32.2021.08.28.04.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 04:10:53 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] staging: r8188eu: restricted __be16 degrades to int
Date: Sat, 28 Aug 2021 16:40:44 +0530
Message-Id: <652e62b7f30d216bafc6ef390ed27c2c6864fe95.1630148641.git.aakashhemadri123@gmail.com>
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
> rtw_br_ext.c:73:23: warning: restricted __be16 degrades to integer

Here tag->tag_len is be16, use be16_to_cpu()

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 62a672243696..aa56cd1a8490 100644
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

