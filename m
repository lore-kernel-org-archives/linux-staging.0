Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417210FB
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 07:19:56 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f04eb5d1a7so8623945e9.1
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681629594; x=1684221594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwqobIGOuNNlDjWDqP0aoWUSzuDynHZFKSCMK2X1W5s=;
        b=MS/9uKs70i2Y0OM91fP96hPnooh51wKOYR5q7O5FvAeHvt655iTNAegCBM1Ui5KHEV
         +z94oAHtcUPe8k0yJ/pTt5aaHdfPIc4bjaVuVLUhAB/WiOK/VsLBZHdrH99eqL4XRDE5
         GVCrcc7QXkWpXNB3Io3SBgSxWQK907xsxRYcxt0XdfQSQZv5ZdBKoRd15y3/wuMnc4/G
         znizZcWO8/kEzdAt4qgSy/YB43NEqoJOZc5cYS3XhO8/Iz/dpD3/M15iyKBpB7YyalFD
         O+caYr2XaXzdpHMOHWfVvw/Z58cqsAqcYtzMEJIt8XAp9F+LY5trPSVCpLA6OYLmLRxi
         inVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629594; x=1684221594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwqobIGOuNNlDjWDqP0aoWUSzuDynHZFKSCMK2X1W5s=;
        b=MiMBv4tLuobxEzLakf9kIIuIxipp0I4uWsCliVUeBVzDcKIefyps0IWyumiGuObiZo
         ah+Gr/UB/n9Z83QGMy6Tt4UEQhL2tGXulhOGAWzx2LpeoxkhAU3hMv6fgrclwpx29wuN
         hXJfjCaCI1X6EuMU3YNnUdH3f5u8nPkZhm78mMXQhHWxGf3hBmN3dBxVMUtvXI1s+8Y+
         GafBDArjQs3WJ3lp9hPZANrjIPe2QIPA51zE3STGY1vr7CeFFfE35PT5p4BrGiNgNIFP
         In+Ny4UmMLj/TeJP3YjdS5Ho2v6Tzf8kJgB4LMIUYEM1cB9Q1j4Ic+AhiK8zZxIC6Ozw
         v7tQ==
X-Gm-Message-State: AAQBX9eeSetYOx5ucXB8rSH4mPOoRKcm2H3XRAnGzOgZwyPthVkd/+dk
	wFixpVZkY4MtI9n7IL1EIc8=
X-Google-Smtp-Source: AKy350Z/+ex1LitSfEe3lLjtUEoaf67Zo88uq8SYG3OMeuLLafoRZBqhesiGEu3AZyjPPElo2Y3O6A==
X-Received: by 2002:adf:fc8b:0:b0:2e4:ccb1:dba5 with SMTP id g11-20020adffc8b000000b002e4ccb1dba5mr4415020wrr.4.1681629594654;
        Sun, 16 Apr 2023 00:19:54 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id y18-20020adff6d2000000b002daf0b52598sm7427281wrp.18.2023.04.16.00.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 00:19:54 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:19:52 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] staging: rtl8192e: Remove unused macro RT_SET_PS_LEVEL
Message-ID: <0d397210830f77ad3231c3b4a0465ae89aacb962.1681627603.git.philipp.g.hortmann@gmail.com>
References: <cover.1681627603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681627603.git.philipp.g.hortmann@gmail.com>

Remove unused macro RT_SET_PS_LEVEL to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 1a0e7ae70ca6..6e665e866f1f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -100,7 +100,6 @@ static inline void *netdev_priv_rsl(struct net_device *dev)
 	((psc->CurPsLevel & _PS_FLAG) ? true : false)
 #define	RT_CLEAR_PS_LEVEL(psc, _PS_FLAG)	\
 	(psc->CurPsLevel &= (~(_PS_FLAG)))
-#define	RT_SET_PS_LEVEL(psc, _PS_FLAG)	(psc->CurPsLevel |= _PS_FLAG)
 
 /* defined for skb cb field */
 /* At most 28 byte */
-- 
2.40.0

