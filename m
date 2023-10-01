Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784808F5A
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:44:24 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-53636bc91a8so787731a12.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167863; x=1696772663; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LEP+m1gZqUF2dlXF0HPKoDRFFOr5o0irSFxrQKPSymU=;
        b=ZYbltIVaF/lm8JNpfnpMMUCp/vo4tFknPOTMFc+BTYF+sTwZZZbacwDoSiuDCES/sg
         Po0hZpCuB/vU3RMW6clQe0KwENS2Y7J8mq6p3KPL/m6ohEQsOi7kMyVIhBhnCVQTGYyR
         N2jwEYoK+4lBY4/wrwQtnlxiIKcV4tMRdXc3YVO9IS30laljKV5XjAQNaC8Bh+CD6JdV
         eFeZQLbigfaVzTtMEKNG4wvE1GDuIO9ZjOiHl7CZCS+PYEkbE7DmwdPZ/4CmtzZoWl6e
         TLmKFokE4NwnItXi5E1LnyfqgfwM050dAedxmO7AK4MtnLRSTl2sBEyOpbQlzSI2ON3o
         GGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167863; x=1696772663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEP+m1gZqUF2dlXF0HPKoDRFFOr5o0irSFxrQKPSymU=;
        b=coD3sUvfrbQUwK4D6h4Kh5YQUYdqBXMDwMONAID2GEQ+XQdqwFulU0bxokxyFFa3DJ
         kCzf0/rrL3K53pbb+VXKYy/fhsQJPrOwnpcybtV3JaTVmylKLr6oYcMrrpbScONoAaq2
         7n8htgVXfXfnCaBWvmKuhgNjVt0tWTcpdQIbg5XvS/HaQX4sFZiM7Rq3RoB71uEiN4m7
         JUkU10Vd+t55m0qF80FsVtL9Dd5g2qmo4USPqBXjDJIsjqnbAQDZN7v5b5BqwgRTlUCP
         IcmF3fkmoyHjHpk7U/TuCdLa+PP61iDN/8HGkdZ1cOQL4n/VU6lPf8YGIgocqFogjRYn
         0Ktw==
X-Gm-Message-State: AOJu0YyzrGVluI0H0n3f4HFafq06elcwCZycYDm4gf17l2P3kV3omhpF
	IWv6G+O84PwVFxNZwvn+7I9t9TCfFtc=
X-Google-Smtp-Source: AGHT+IGMX9+Dus1EyYTTX1u5SQI+uSD22+wFbNFkFibaq9PlI6vVQ04/mlXa9JGWX/dXmflOSC/hWQ==
X-Received: by 2002:a05:6402:26c5:b0:523:2e64:122b with SMTP id x5-20020a05640226c500b005232e64122bmr7806299edd.3.1696167862351;
        Sun, 01 Oct 2023 06:44:22 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id x18-20020aa7d6d2000000b0052febc781bfsm14037773edr.36.2023.10.01.06.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:44:22 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:44:20 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] staging: rtl8192e: Remove RESET_TYPE_NORMAL
Message-ID: <e951e39f0d75fb6baf8beb37e8c5fed05365078d.1696165351.git.philipp.g.hortmann@gmail.com>
References: <cover.1696165351.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696165351.git.philipp.g.hortmann@gmail.com>

ResetType == RESET_TYPE_NORMAL is always false. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 5 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index f67923ccf790..11d20fc11a7d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1237,11 +1237,6 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	}
 	spin_unlock_irqrestore(&priv->tx_lock, flags);
 
-	if (ResetType == RESET_TYPE_NORMAL) {
-		priv->rst_progress = RESET_TYPE_NORMAL;
-		return;
-	}
-
 	if ((priv->force_reset || ResetType == RESET_TYPE_SILENT))
 		_rtl92e_if_silent_reset(dev);
 	priv->force_reset = false;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index fa82a0667813..d6e924fc8011 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -132,7 +132,6 @@ enum rt_customer_id {
 
 enum reset_type {
 	RESET_TYPE_NORESET = 0x00,
-	RESET_TYPE_NORMAL = 0x01,
 	RESET_TYPE_SILENT = 0x02
 };
 
-- 
2.42.0

