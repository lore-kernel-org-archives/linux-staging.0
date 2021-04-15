Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31026D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 10:07:44 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r7so10717494wrm.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ggLldia6CekOvY/WIKEl4n4MVtuqBFto21z/p6tICc0=;
        b=Xy6W3Sc8SKGwsEPHocd8YFc66ryEpSeUQYGBv0gCYzk2Y1iuW2rDBZBVXObh5j/gWJ
         jcGEs+I08d/jxqFIcBd0pzjYwPtya83cuafr5jOLQddDPPk2cloiuW7jK8xo1bIds/aC
         s9c15+a8/RLwgYD+D3I9VQeYZCVlat94TtFnWEJdpwYJvk9BXEictvx1BmjT0qjwZJW/
         Y0Isau3VXG3ehvOmK6XKfYlB5FZ6RYW8f3B8DgFvmrMdnwByBZjdT8NDQhmw+C5sd6HE
         LXmFW8vzXQecaSp91Xrng9sZEcyQOiTPUq1bD1ySEzPu3zcvbcz01HQcHgduNOKm7Asy
         77fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ggLldia6CekOvY/WIKEl4n4MVtuqBFto21z/p6tICc0=;
        b=jbHuIRj7dEzAObedgtadCZTgfxL2dy5wAviLyD/uzlIxyMEwKvUMiet9T/E067T4Rn
         oS4pFgykfQ+UNCQdEU6lFDVFpVyxEvKF/rX+nLSxyq9SiSXdgLU0r0P/8Tsfsbo5Sdh2
         q5t+7C2YKpuRnZPM8aC5GOTuMFZuzwQeO6/YZPqonDqk5PiIUr51tFMAIqvFqsUR4avF
         oAp0ygWwEzHsj0Bi1NCkbXjaeNCWjvVDCAwM8UP9/TOZ2yYycrWyEfftzT1Baooj/6vh
         RbbXrytpE85Ln3VRRyKEzxPd5/DyA9voEd3paeaD5PDAw1q+r9nUkr4JJ+3/ZLdi6pd5
         mL5g==
X-Gm-Message-State: AOAM531q846xvMSHzzcNJo3s007EtNFpUHQODrg4xSz0Yvr6/vPWGRMA
	eOP3t3IZTgMQIrmM33ioezg+wYGJR7g=
X-Google-Smtp-Source: ABdhPJyniNcfSUS9tZjV3hpRH2Tnaw5KFZior4AifmoJmunogoiTE7Vjo+cpsZPGbMlOh6grLFNYWw==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr2495139wrm.427.1618481263456;
        Thu, 15 Apr 2021 03:07:43 -0700 (PDT)
Received: from agape ([5.171.72.223])
        by smtp.gmail.com with ESMTPSA id f6sm2151415wrt.19.2021.04.15.03.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 03:07:43 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] staging: rtl8723bs: remove empty #ifdef block
Date: Thu, 15 Apr 2021 12:07:24 +0200
Message-Id: <c2600c9a71d4e222963cbc600b2e703fe2b1289f.1618480688.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618480688.git.fabioaiuto83@gmail.com>
References: <cover.1618480688.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove #ifdef block left empty after DBG_871X_LEVEL
deletion.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c767651e2134..d2bf444117b8 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -487,10 +487,6 @@ static int __init rtw_drv_entry(void)
 {
 	int ret;
 
-#ifdef BTCOEXVERSION
-#endif /*  BTCOEXVERSION */
-
-
 	ret = sdio_register_driver(&rtl8723bs_sdio_driver);
 	if (ret != 0)
 		rtw_ndev_notifier_unregister();
-- 
2.20.1

