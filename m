Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4116D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:05 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id r12so32833709ejr.5
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QClLq5p5qq24gkpiTHpqq1S37C0V+3FApQxcXpPj+ps=;
        b=YHm8NSCB4spX3uKxhAQGBxKvblT64WOz5g2oupOSTk4ipw1BryabxY3wD1gw0ZVB8h
         Nhl16YZw97FRS7JzsiKz6xvxjaHFTxNlZBdMWgz+F9YVfDBlfSIoCKxfG6dUIkH3p7d+
         LJnn0BLDtrpNlomImo07mRSJsj++CxxVSmsPKcTDi5p7rHQObxzOqa2dImXBudJ+euXj
         T0J5dXEsZrQaUXHoxBtrge4C+F9GRsyf+7DOD2jtrfp0bqyR0y9aPK/g/PoRNsRmSpuv
         pVrTzU4DQi0Zz1CYEyNtq793Or8wB+dpXsgQg89Ma50vfBcrTs5HGK2MoouZREaeaKhE
         w/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QClLq5p5qq24gkpiTHpqq1S37C0V+3FApQxcXpPj+ps=;
        b=T38X0ovyBgyjrsiAaKF1LIDqaorVAPRGc6wfEVzRen0qNATi6kTBnTFpTlygyHGqsX
         IyHfiSXbbRgwIKSbxzsCB5fdtoIIO+DI4VKqxbzPLCoTfiHzIDzGq23v6jNH77jFS8T0
         vMyEjsOVsozkMhmhUH9a7+9KEpnAjcCz3OOrLI7kpwM2vEf5Zt6ii/5DbwvI8yBYK74Q
         4hVoMM4Qqlp6Vlp8/wNyQFOixsj7n563RsFeMrgV/j4kzhMtpDaN19ZArQnDzuZWVINC
         GqvtJ1FgZm7HlEHcEGrO/7wuBGvhjUbwMBRyikM2lklJCogj4meiLpH4tG22KkZ8Iaxe
         cReQ==
X-Gm-Message-State: AOAM532HCcpL0cs2hxcw43cLlZ4XvkF+4E3lujIWHoxVXyRvRrAUiPf4
	jUWPD8dpfxE3ZSLhD+tsU6taRQ==
X-Google-Smtp-Source: ABdhPJz5PuVx2EkXSsww1ESMS66Jmw3yHMJcP6Fc485KLDS8IYkCORgy85yhVbF+YPctMFz0GcKMKw==
X-Received: by 2002:a17:907:20e9:: with SMTP id rh9mr119347ejb.523.1618423924005;
        Wed, 14 Apr 2021 11:12:04 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:03 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Romain Perier <romain.perier@gmail.com>,
	Allen Pais <apais@linux.microsoft.com>,
	Andrea Merello <andrea.merello@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 28/57] staging: rtl8192u: ieee80211_softmac: Move a large data struct onto the heap
Date: Wed, 14 Apr 2021 19:11:00 +0100
Message-Id: <20210414181129.1628598-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c: In function ‘ieee80211_rx_frame_softmac’:
 drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c:2009:1: warning: the frame size of 1152 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Romain Perier <romain.perier@gmail.com>
Cc: Allen Pais <apais@linux.microsoft.com>
Cc: Andrea Merello <andrea.merello@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index 690b664df8fae..73f63d4510e77 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -1911,8 +1911,11 @@ ieee80211_rx_frame_softmac(struct ieee80211_device *ieee, struct sk_buff *skb,
 		if ((ieee->softmac_features & IEEE_SOFTMAC_ASSOCIATE) &&
 		    ieee->state == IEEE80211_ASSOCIATING_AUTHENTICATED &&
 		    ieee->iw_mode == IW_MODE_INFRA) {
-			struct ieee80211_network network_resp;
-			struct ieee80211_network *network = &network_resp;
+			struct ieee80211_network *network;
+
+			network = kzalloc(sizeof(*network), GFP_KERNEL);
+			if (!network)
+				return -ENOMEM;
 
 			errcode = assoc_parse(ieee, skb, &aid);
 			if (!errcode) {
@@ -1923,7 +1926,6 @@ ieee80211_rx_frame_softmac(struct ieee80211_device *ieee, struct sk_buff *skb,
 				/* Let the register setting defaultly with Legacy station */
 				if (ieee->qos_support) {
 					assoc_resp = (struct ieee80211_assoc_response_frame *)skb->data;
-					memset(network, 0, sizeof(*network));
 					if (ieee80211_parse_info_param(ieee, assoc_resp->info_element,\
 								       rx_stats->len - sizeof(*assoc_resp), \
 								       network, rx_stats)) {
@@ -1949,6 +1951,7 @@ ieee80211_rx_frame_softmac(struct ieee80211_device *ieee, struct sk_buff *skb,
 				else
 					ieee80211_associate_abort(ieee);
 			}
+			kfree(network);
 		}
 		break;
 
-- 
2.27.0

