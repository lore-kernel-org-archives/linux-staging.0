Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54046D17
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:43:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so5566968wme.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oRHsFyG+KbjfUh5r00Rp6bfSF1Hm1Ce+9V7/VyM+71M=;
        b=hWfd7dLAfbd07i+9G/dPymA8rZT3vgrih0XEPRU/DMrBnRcadRREI4+QIp3O3KWw1O
         J1uNg6EBFyTKXgeT4RBHcQc0GJVeKxwTb9/yOv2tYoVv9QNj/7V97MgQo+YHDZss2bZ5
         zftTMj9Axp5cxxw4IrWGsIt8HlI2dOwRZqrlMI6WRfXSGCeFjK4votiHctafElxgXR7p
         +vf6ZPkClvzOvyzbUiLpBxXaLZ5nXot9e36H9DtXfPl3nMWDjJKNjJNeNHmgpVuP7JOR
         oXhhVC3udc4wt/APwcy//hefGgzvRvOjStYlLrIaOHGh3Ur/o7rgJPQQhsyrGBNqCzfp
         mnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oRHsFyG+KbjfUh5r00Rp6bfSF1Hm1Ce+9V7/VyM+71M=;
        b=qQRB18b7Cgn5Eeo7IDV4kWSCJlqoEaLAfdEoQql+WqEfVpG8aODwLRIcOuBu1l8hp2
         ZT3Uv76DSq0xaDzWedcF5EhBC5x3pjDHuZ7Wj1FeTPTRjU6J6k/clenPlmpL5NcX5nBM
         jgwN+LhC8+1sBqD78E1dt5r5KY2f8eyw6K2l4BZTnTptNhxjWsgTurxx9LKGkEIdYDWE
         7DJknyPHstSK+3TrDvxbgBbBmBfQxSpe+6/lPu79SSwiihFqP3m2l0tNGwCqt6hpvchl
         x9dQgXvlyIU6pDYIEPQIIKzCho/kaMWPHw7CEO+gCg1U6TZDl0urvSQ/TZjIQg6xhZJW
         AcMg==
X-Gm-Message-State: AOAM530jHnMnTSz2JtWq0E/kQGzJZ8+GfTjYelTp8KeyEm28KmAwspLZ
	ESYTO6n+e9HQ3237qdu7IUGYlw==
X-Google-Smtp-Source: ABdhPJwWuB8IlWvlCy37ytssPdog8rputLzWW/eloI8MqBt3oHcAnhUgvvy7Pt/d7kJqoMarO7/3Og==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr10958063wmc.150.1629330179275;
        Wed, 18 Aug 2021 16:42:59 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1194926wrt.77.2021.08.18.16.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:42:58 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 6/6] staging: r8188eu: remove free_xmit_priv field from struct hal_ops
Date: Thu, 19 Aug 2021 00:42:53 +0100
Message-Id: <20210818234253.208271-7-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818234253.208271-1-phil@philpotter.co.uk>
References: <20210818234253.208271-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove free_xmit_priv function pointer field from struct hal_ops definition
in include/hal_intf.h, as it is now no longer used anywhere in the driver.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 8a2420095b84..fa252540e596 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -139,7 +139,6 @@ struct hal_ops {
 	u32	(*inirp_deinit)(struct adapter *padapter);
 
 	s32	(*init_xmit_priv)(struct adapter *padapter);
-	void	(*free_xmit_priv)(struct adapter *padapter);
 
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
-- 
2.31.1

