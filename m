Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750036D00
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:21:16 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id g5so6345694ejx.0
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=75uzijMaXeM4/Fh+95uVhQDxEt+qvy+jANgJCzP36jQ=;
        b=ksHXqnnv8/h/I2BisfVI0eVxaRryQkJRHKRYd6dhEpq5U5U+mL03tLYSGIaVwHnlkr
         EOh5l0nY2T/KyJXJGdPE41RmkMf/16Ty2Ij3/D6Ro/L8LbEPG/auPFJU7cNRGej2uu+H
         vriPKe4wQFq2UCNws1w4z8R3XFNFUBVDqfeCdS6tKjJFVkRK9RUMBnJG8vXAMtMqnYaM
         CaHwrDHYjh8i7XbPK++N639AwCJa0wHbvWoOVjJ4mLBqyotOvxF8wpUyAoM4pyfNPnEx
         Ra4/wdIfXxDHiIp5TSZdEVVe7No5hvJy76eqoXRHRiRoOZW3Inl5JBFvlZhIcvqBd3UI
         fOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=75uzijMaXeM4/Fh+95uVhQDxEt+qvy+jANgJCzP36jQ=;
        b=JiXM7iD2YAxkgtrIEbauL49PugY1i1Wm9cB3OMwustDSbKh//1zUR+HFwkFQsoLAml
         OWmFIcLBNdbwxXsHBLZTW6FjK0jYmSbfbZlzBbm9+clRiV5qhCBW4PyMMTdzDUWrr1G7
         bvVQI6B9Tc2dJjw85/kHr3fPl1Q4J5JbSDAKX6JPzDXIRAGhyPp/ajVuE+WTnb9xX22V
         gZIFX608B8CzKYRG/dDaLuW7OLYYrydIaNaLXRRPQ/hgmdL23kM+713LQEAa7qZspcus
         sCh1DDDR9+Szjie73RynqwCavehA+566JaFGem/AZ1auVa0BzcMsieSDQFSxdRoD0/XV
         0TVg==
X-Gm-Message-State: AOAM5332bGVsADfhP89Nmn1WIyyU34FLZ9qf5oytzIFOOE4kShy/f/Cr
	Gqnxs/6rnqthtYNcryMoDGo=
X-Google-Smtp-Source: ABdhPJw1Z+2EI7/w/oe2Njaf6Oaf1PDv6h984uE9U03dK5B51ZrfjPz9sNSVBiStHY12OtDZhbm1NQ==
X-Received: by 2002:a17:906:c9d8:: with SMTP id hk24mr20444378ejb.480.1618064475094;
        Sat, 10 Apr 2021 07:21:15 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id z22sm2052818ejr.60.2021.04.10.07.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:21:14 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/25] staging: rtl8723bs: remove empty else block in os_dep/ioctl_cfg80211.c
Date: Sat, 10 Apr 2021 16:20:35 +0200
Message-Id: <1bee993834410c2c11a6799e1868589efc1334f6.1618064275.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty else-block

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 39d0a0d24d2b..9c98820952e4 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1226,7 +1226,6 @@ void rtw_cfg80211_indicate_scan_done(struct adapter *adapter, bool aborted)
 			cfg80211_scan_done(pwdev_priv->scan_request, &info);
 
 		pwdev_priv->scan_request = NULL;
-	} else {
 	}
 	spin_unlock_bh(&pwdev_priv->scan_req_lock);
 }
-- 
2.20.1

