Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10C31860
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 06:43:19 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i12so24089394wrb.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 22:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfEWeuAxvQfzW1nfRpEBj0UT4OdDwqRv3XSwMwCWnK8=;
        b=kckRcbhlBzaM8bzbKIrqbhPBxHzXaM4nCX19z6Fin21rHq1Mf/9tfqHEvFWYqxZnFx
         5istBw8HsJeU+q7Z2pfz0JmI8nRMz1yeqhHjJyzWcLKHW2m1aNZwDOUlvYlakkiraW4q
         Qnh3L8Im8uGpEd3prM46yBIjM5z2tn7APY1S/fFjIJsGQP0vlTVRBDJJh1ySmi2gYTiQ
         jYG8C7aTpYsvA4rkcDe3dIxfTJypb9siZMi6WHLhZRzSCCabl2n2JDffyIst85l7FggA
         mer0eG3x/UFBhlSYGBUdwuOfgznrPQ8X7eA99nRYdV7wr3HbNYsnJpiruihnnFARFpUu
         Qx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfEWeuAxvQfzW1nfRpEBj0UT4OdDwqRv3XSwMwCWnK8=;
        b=rHPOjUL6rPg9zvZGhXKNz8autoeZelLBBYNSF7fOl0NdiRJcbe/8lRBlwyPQtoxWzb
         ftQZEz8AJxFcm43+TFw6ucsHHCTzki1m9khNMbd4QyNhJyfNgOG/SNVCc0+qbYm1lg18
         OzCKtDI/Q2FrmkBca8nRtBPRfGko0H09DssgGRkGAHG4vQPrtvJGtEpeBOLNW153xKdC
         S5n/c3coC3ZuXxbFbK+c8fe+vSPYyNbl1HMB1pxCRpFs99uL0m6fprf6sCGY9VMQ+uGZ
         Viy1BSFPWYW/ELkm7zBCtzxi/dfRg1AKYId0KB5RGlnyx7N5dQT9l39lvUrF0uwGVuJE
         kqYw==
X-Gm-Message-State: ANoB5pl7KzqqBzQcd0uKmLMZG08OkHE0GPTJPIuxQ2fI25OP3Z/gkCrb
	7+b3bR5iD4op4lVvGkxEeSQ=
X-Google-Smtp-Source: AA0mqf7GBi1HAWtpNMQ9Qfe/x7OKT1cwB+9GB2UOQFOqO4khgdyxE+eLXbItE8l2kpDzKKkU8M1ZHg==
X-Received: by 2002:adf:facd:0:b0:231:482f:ed6b with SMTP id a13-20020adffacd000000b00231482fed6bmr16247168wrs.253.1669185797849;
        Tue, 22 Nov 2022 22:43:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b003b50428cf66sm1107254wmq.33.2022.11.22.22.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 22:43:17 -0800 (PST)
Date: Wed, 23 Nov 2022 09:43:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: Fix use after free in ieee80211_rx()
Message-ID: <Y33BArx3k/aw6yv/@kili>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We cannot dereference the "skb" pointer after calling
ieee80211_monitor_rx(), because it is a use after free.

Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index f142d0986990..5c73e3f8541a 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -951,9 +951,11 @@ int ieee80211_rx(struct ieee80211_device *ieee, struct sk_buff *skb,
 #endif
 
 	if (ieee->iw_mode == IW_MODE_MONITOR) {
+		unsigned int len = skb->len;
+
 		ieee80211_monitor_rx(ieee, skb, rx_stats);
 		stats->rx_packets++;
-		stats->rx_bytes += skb->len;
+		stats->rx_bytes += len;
 		return 1;
 	}
 
-- 
2.35.1

