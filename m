Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A172
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:34:16 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id t22so4302928ply.1
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 21:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tpbh3OLJP7GzXz834H5t3FrywBGf6oRqD5Ae5cfpG3s=;
        b=I0QQ/fbJ7F8M6Mkn+NLUKLPFkaxNvIhFjfvZWWoSNptyA3PORW1ZisjL6b51O9HYJQ
         1/tMdZD3x5rNaf4t5uGDL+Dk4b+tnA9fvdTjJPepk9zmY/yWn7LSFjWeEyg2pz021xoB
         EkRK2Xt0nfJd5JZmbiuiRf0I2VGG6w+t8Lga4aqE6wD0sGFk0NkIfSK2bDceCwKUmlDF
         65scfnUNTk+iYK6ZFIejgtGlwPt3gw4n+kplIXjpZMjSK8IF9BSJMSz4SnDvCnaZ5/zK
         jWoInYNKY7pTqQvibGoVIxoGm+fUZKSUpcD+BGB7JxSZ0sR07duy0Bi7pIxKXBafnwB4
         kGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tpbh3OLJP7GzXz834H5t3FrywBGf6oRqD5Ae5cfpG3s=;
        b=PnylkvK9bBz6RoxIs0qqDDJyCCJKAX/5dW3ro0/1RMtCeb1izF72LYV8N2DcluiBNn
         Yoi/gD+LWnLkmJMRJfFlFQ8VRaPF9dMz08Og8mdqQ3ynd6oU1HCBlE9P8O495If5Ho57
         o4S+wgonM/aEh0V9XFgnVwHA4VEuMwpTJi/yPqT8bGwacMezx3+F0X2nqS3/izWmiRuJ
         FcyUiJlnUhOuD5qB22QllIE6+Bv/joDC10JO9jJrbhWLoE0nrwSD7hiwjL4KPsTVbrBZ
         /Wv71O9gL21nd+gm8AW8vrjhmWjQ2cum/1vucWjHep6nuWAAE0IptzNYzfWJYam2d8Ze
         wibw==
X-Gm-Message-State: AOAM531Yw1xufCRTIuM37i4TXGC/atJ/Pvg+Q5b0UytG7hdeOR41/+Ta
	+mJUnUYgzLwqiScHk8pIBtA=
X-Google-Smtp-Source: ABdhPJxiElbSxzkNdQ1VnYLd1eXlGP6Zeo2viBDcigA4Cn6pmuTMv/kAWU69Xd1seKKCOoYPDW1+zg==
X-Received: by 2002:a17:90a:5898:: with SMTP id j24mr21766301pji.103.1618115656222;
        Sat, 10 Apr 2021 21:34:16 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id a65sm6297511pfb.116.2021.04.10.21.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 21:34:15 -0700 (PDT)
Date: Sun, 11 Apr 2021 10:04:07 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 1/3] staging: rtl8192e: remove unnecessary parentheses
Message-ID: <e6302e0a8dd47c903dc82fd28e73f5ccf786a0b6.1618110617.git.mitaliborkar810@gmail.com>
References: <cover.1618110617.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618110617.git.mitaliborkar810@gmail.com>

Removed unnecessary parentheses around '!xyz' as '!' has higher
precedance than '||'

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- removed unnecessary parentheses around boolean
expression

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b1fa8e9a4f28..431202927036 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -276,7 +276,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	struct rt_hi_throughput *pHT = ieee->pHTInfo;
 	struct ht_capab_ele *pCapELE = NULL;
 
-	if ((!posHTCap) || (!pHT)) {
+	if (!posHTCap || !pHT) {
 		netdev_warn(ieee->dev,
 			    "%s(): posHTCap and pHTInfo are null\n", __func__);
 		return;
-- 
2.30.2

