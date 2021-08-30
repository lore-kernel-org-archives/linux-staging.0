Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FA53FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:04:42 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d26so22172261wrc.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/i9rKJcPxsCwJ6kNIOQV+qImhOF+UG8aTJL9Wyv+hOs=;
        b=Z8ZxKE3vgmgSAWDZVVC5/8vEObPeybEpmS3Eo8ppspSkw43KLlKKIWu7K+LRZCBwuo
         sjvFtX1t/zGGSDhg/QwXSq5c3dnpdumuhVpCwORY35BMozhSbs6xkT1lCfdJBc3uuolP
         DETv4ZNLqq7B6lzK4QanIGuZXzAbmV8Hks5XzU6f64YPf4MwZLpa2EZq/4AtSGm1a+nR
         0mXe6r0wmKpC2iN+pknrThIomc08Y4V+tmfURb4RiQoxrkudY0o7Zh5Hv9o5IqrRPBaW
         Iz38LyfipFRhh4+O8sTBBY8yxdBlByyfNKp75ZNMVTCpWapl3dQWnCdjLGxT5WpHvgSN
         0Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/i9rKJcPxsCwJ6kNIOQV+qImhOF+UG8aTJL9Wyv+hOs=;
        b=csw2UUi+OHX8B2GISExFHQLoGtDd/L3l0ruSVPYgXTc6E/mCS9RvwHmZQyY9lGKHKp
         rXnffqQ8ImmUpYF2ys1b9sbs4OhS1TsLu6/s1qHe58WuYrAO1EYaD8gfcQ8ajcvOdThN
         yJKSGyQlvPTAe3DWgLQ4etmhvvvdvDPcIZiCEvbEPhTYOQTDvZMIKalQOGRqexoNnzOG
         4DKg3BfU6fSBpdP7CbGdULay2GIzft6Dql6jiM1VI5xoWz1vxhYnrJQ4qj3Xec+9AvI8
         qVXWjQ2NcPADIXXnUFM86OEdWSmIuR4lW3aTQQXQ9e/9eWyoRDjVTxZaornX6YeT5NjI
         nt6g==
X-Gm-Message-State: AOAM531iz5OzwoTBXEAlzgnqTeCdhbpYXAh8T/DJNWVeCmP/NmUJ6y9z
	oBEcPTdXfnSMcXPKS06YEDs=
X-Google-Smtp-Source: ABdhPJz6FHW97fyClmIKQgF+1gRc+BTTknCGsc9HlU+jmUMqfWtMtLdLwEwcYl3kAmIkx05VMZ7lHw==
X-Received: by 2002:adf:f541:: with SMTP id j1mr24554982wrp.180.1630325080928;
        Mon, 30 Aug 2021 05:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f18sm13184195wmc.6.2021.08.30.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:04:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 8/8] staging: r8188eu: remove unnecessary parentheses
Date: Mon, 30 Aug 2021 14:04:20 +0200
Message-Id: <20210830120420.5287-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830120420.5287-1-straube.linux@gmail.com>
References: <20210830120420.5287-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around a variable to improve
readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index f76c762ccd4b..952ad3eec5bc 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1038,7 +1038,7 @@ void rtw_macaddr_cfg(u8 *mac_addr)
 		DBG_88E("MAC Address from efuse error, assign random one !!!\n");
 	}
 
-	DBG_88E("rtw_macaddr_cfg MAC Address  = %pM\n", (mac_addr));
+	DBG_88E("rtw_macaddr_cfg MAC Address  = %pM\n", mac_addr);
 }
 
 void dump_ies(u8 *buf, u32 buf_len)
-- 
2.33.0

