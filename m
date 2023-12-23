Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB912E5E
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="MbccVddY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d940d14d69so1676903b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296798; x=1703901598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQASuLJkfj6JGfN3KLOQcSo/x55SwyZt5DE4a4HIGbE=;
        b=MbccVddYF6k8t/u//pMhPs7GsO3Wzk6jQwJXmmI7s7g1RopltMALJ9XKXdYBefcCcX
         rjk8GFR/HprWT05I2nzzzGoqynbOE9Xg4wjsCrT48T4yr/Or1ssPGjhfHAS7aMJi2wJ0
         cyIDDlOfQSrEYHi6fWszLkaVf676kSyzQTY9d8i/EwzzJn1VHESB0TQmAIRhh585eC+W
         hsZHrnQ7jQ7Yyrqrus5Kr9X/tDNKFE+5095gUET966my5PCf+f/QeHmQuiQvbqnJvPVJ
         8DQVqe34RlG6fPrGApiY/9yUACE48bY5Ds5bAHoPRJ9MyB1Qlmpj92QtjkxeBe8QYu3y
         ywIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296798; x=1703901598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQASuLJkfj6JGfN3KLOQcSo/x55SwyZt5DE4a4HIGbE=;
        b=wRCkvZlE4If1WRvd3chMN4b/XtM9ZSEZDknZ9K8gDeY9uSAFcFVqX2q5LuWGyelvi2
         jN16LexOwrlG1aFzAxfG+TDy80eUWJvbU8dn9Q//Uw2n+5lKWuj2SHaVGRjBQbWaS8iu
         CbObU4IV3NooiWJ3cs3uxiSilrGa0N6CYnj/vCheaeQR2B75xhlhAXgtoSIVOTJlB1BY
         uPeUabGzfg3hxJQAUqjWXCNAddBWbfUZxjK4Jy22ATY2aT4BqcRX2JmT8QhWTy3GcrQ4
         iP/cEcrm211Mdl2aJxjeft0xnvFQ4XMta+6kUXoH04gRh/1lgQf+6CcQuK8SF77BFL9E
         G7og==
X-Gm-Message-State: AOJu0YxdkvCM8lvP9bfLE3jVXBVYhpiMX2XEiO7J2jjWnEhjy/BFWU8x
	WXmkQ6tkbJ+iPl+gpye9dO7gk73egejVMw==
X-Google-Smtp-Source: AGHT+IHVWLXExY/Z3oeZ+BjLqZMoRwHKa81HTztxySpXzFlRjWFeSo/VKxW4bboQ5cPLo1vjmAHzmQ==
X-Received: by 2002:a17:902:6b89:b0:1d0:6ffd:ceca with SMTP id p9-20020a1709026b8900b001d06ffdcecamr1413128plk.131.1703296798534;
        Fri, 22 Dec 2023 17:59:58 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:58 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/20] Staging: rtl8192e: Rename function rtllib_TURBO_Info()
Date: Fri, 22 Dec 2023 17:59:37 -0800
Message-Id: <20231223015942.418263-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_TURBO_Info to rtllib_turbo_info to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 7cd7ffcda58e..0819efe36171 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -98,7 +98,7 @@ static void rtllib_wmm_info(struct rtllib_device *ieee, u8 **tag_p)
 	*tag_p = tag;
 }
 
-static void rtllib_TURBO_Info(struct rtllib_device *ieee, u8 **tag_p)
+static void rtllib_turbo_info(struct rtllib_device *ieee, u8 **tag_p)
 {
 	u8 *tag = *tag_p;
 
@@ -896,7 +896,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	if (turbo_info_len) {
 		tag = skb_put(skb, turbo_info_len);
-		rtllib_TURBO_Info(ieee, &tag);
+		rtllib_turbo_info(ieee, &tag);
 	}
 
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht) {
-- 
2.39.2

