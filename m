Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1130E10FB
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 07:20:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f0968734f6so7961575e9.0
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681629608; x=1684221608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3sQy4s8gKGVczlWnljrStDth9N5l0gCvMunNzrUK7V4=;
        b=dquZOYPM9/nNsKWfMEHGolT2T5M7XCO/lBux8GNZUVpURx63aXgcknmp0dYLkkRXlV
         BqOObD6pWZ16ZK89eDqEjCipG5TIhBzdU1Vk9/SnwJusVksnrwJ/DNoDW8WAyTQJpu92
         45UPoFAXANVPRScQigVBTdBdiyd4/TfcW/IAqHfFtQLADHFWDWHTmK05qKvv6Dd6kJZv
         5liMO3fd5o4FzQ4EGVQIJrOx273lOwVfEIyNJuC++NaE1WKRM+x+fcTsEeQTrjUPGaCs
         AEF4GuX0uUCrTe8vOHzqcvfwQFyfCXsQg4fA1pikYjzF98VWpB6r9BwBm8YyklZBt258
         mWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629608; x=1684221608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sQy4s8gKGVczlWnljrStDth9N5l0gCvMunNzrUK7V4=;
        b=koJzY6jlDoEvI+Dz2vICeIaiwSf8uKsfRKPw8B4bSjE7I9zgNy4moUpm5Qe1rmWVF/
         Z7DPj5z0QvyWjUQzMN+JAWpPcFbJ8Vg7TpTD+h32+AONLGB6+qBc5Gw5de7jD/K3uzSJ
         jRRhSNmw3hT2DIUwu3tLKKsN8frUucWC8fmVzCOGvLCDNmDgDS8rBTMtbCxs550cNrl+
         745qNdZ8NX3R6jEaE+8afRJhd5KpWyWvF3VJojPxL4/Vh/nUGMSdBp7AcuPnAIoGdWi2
         6A840/hD/GBwVvF0tsCzpNIi6GZ8hHP3Z22fmIKbSw9YNv5hdbf+sefo785honKumLSV
         2YRQ==
X-Gm-Message-State: AAQBX9enFy5tGUoeScNMgwgQd9qRdOVVK39E8rZL62G2zh/dAEOFK5/E
	WGgV7CIB677Hni1Swt3NGdQ=
X-Google-Smtp-Source: AKy350YZQstyORQTHMwBxbX2MVAYnNGd4gNX/Rg5+KRPqNYjBK3ui7IUxuh9uhUDhy6ZoohJCYpnsw==
X-Received: by 2002:a05:600c:450f:b0:3f1:714d:c40b with SMTP id t15-20020a05600c450f00b003f1714dc40bmr855206wmo.3.1681629608269;
        Sun, 16 Apr 2023 00:20:08 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id iz19-20020a05600c555300b003f1733feb3dsm167648wmb.0.2023.04.16.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 00:20:07 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:20:06 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] staging: rtl8192e: Remove set to true while true of
 bfirst_after_down
Message-ID: <053ab341e80909e81867e42ec4c077e76b762051.1681627603.git.philipp.g.hortmann@gmail.com>
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

Remove set to true while true of bfirst_after_down to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 7342ef591169..ed8b39d3c856 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1542,10 +1542,8 @@ static void _rtl92e_dm_check_rf_ctrl_gpio(void *data)
 	if ((priv->up_first_time == 1) || (priv->being_init_adapter))
 		return;
 
-	if (priv->bfirst_after_down) {
-		priv->bfirst_after_down = true;
+	if (priv->bfirst_after_down)
 		return;
-	}
 
 	tmp1byte = rtl92e_readb(dev, GPI);
 
-- 
2.40.0

