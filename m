Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3AB3FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:04:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so9305005wma.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ykIIFku5+vbZUnxk+devw/re+bV9Aj//c6+PrJONt+A=;
        b=Z/NGLQ2oWkXNZoH76qNWul/Mo6GyiKy8ejuzIZ2GYmntKa17Ocax3DO4ErAqKBYJKC
         EKS0VaAKGheYAGEMl7PyeVGUxcA36nUegUeR4ra0NjdtqOTk2PAbVqYPBK5x/lDj9KKZ
         bFAOU9dXTZVdZDaqYHInjjhCHM5qZmiZkdhgYsRMWVe6c8afFQ7Z/WQPkognaJ8aDioc
         vRcfa5SMrquiO2ZpWcrujad3oQ1OZ5dQAgBiFiRMSnBtU5ns4Y3qLnnX1UX5L2kCpewP
         Hn3Gr6jl/VhD/HmgiuxJdktXnYXfu4Pb4Dv9F4aOd86iSJm4reyPa9jCGkBDkB3aO0iN
         xpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ykIIFku5+vbZUnxk+devw/re+bV9Aj//c6+PrJONt+A=;
        b=EYJvq0jBtsBZ2aXKSx+rA7dM4wSVDVg8kGMSqWwf/88utzE0mohqluAHgTSW9Qfx3o
         dRsMCiGutOvoSGqEP0+xeWzO1nsaJNJrwvBA9czpXkr82JVDOan3Lowx7dgMns/3WGwt
         B6UhWG2CVQso0rEEOG8Y+Vc4DbI+4QDMh2ABJybngMft8dpZ7IXp/cz1U7Sh3sryQ++6
         a/bq12EyYd7lQFK2s4P+x4E1/LYG7GSNt9DHiSR+E7CYmb9MV7IhJrWN2aOhCin4Extg
         Iu0yal1b3n94lP/aF4I4g3QZao1xPGJvTG4KC4Us9Y20XlNjgSc/dvfw8iv5WezCG5x4
         ov5Q==
X-Gm-Message-State: AOAM531/xk9A93ETLkpuADLFn5zEUBL50dEijcx1weuPP1o2GRFCakhu
	R1Ox3IHLkB2CBd3g7JruGQI=
X-Google-Smtp-Source: ABdhPJzohl+VQIKPDmj4ZJWIlp0ggt3cC+259AklQElDA9qhec51mzLPifFU/A3HcRw7jvFtRMRJaw==
X-Received: by 2002:a05:600c:4309:: with SMTP id p9mr21913229wme.174.1630325079211;
        Mon, 30 Aug 2021 05:04:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f18sm13184195wmc.6.2021.08.30.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:04:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/8] staging: r8188eu: use ether_addr_copy() in rtw_macaddr_cfg()
Date: Mon, 30 Aug 2021 14:04:18 +0200
Message-Id: <20210830120420.5287-7-straube.linux@gmail.com>
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

Use ether_addr_copy() in rtw_macaddr_cfg() to copy the mac address.
The buffers are properly aligned.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 370a710ab7cb..c37358be631f 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1026,10 +1026,10 @@ void rtw_macaddr_cfg(u8 *mac_addr)
 
 	if (rtw_initmac && mac_pton(rtw_initmac, mac)) {
 		/* Users specify the mac address */
-		memcpy(mac_addr, mac, ETH_ALEN);
+		ether_addr_copy(mac_addr, mac);
 	} else {
 		/* Use the mac address stored in the Efuse */
-		memcpy(mac, mac_addr, ETH_ALEN);
+		ether_addr_copy(mac, mac_addr);
 	}
 
 	if (is_broadcast_ether_addr(mac) || is_zero_ether_addr(mac)) {
-- 
2.33.0

