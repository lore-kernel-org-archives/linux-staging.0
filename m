Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E648670
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:17:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo2583853wmq.4
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZS88VoX8ZZlakrWWcv16+p54kgnbozpp/01RtCA8wMQ=;
        b=mXWaqovoH5O0Km6aAxN+DKXsqPFlrVfntnVgbcg4Q+QgqY3mBOODvgg5/kjSkqkRWk
         6jkH0zIZydGW0508MpuNnD8ESJ+Ndh5AW4PNXyIvWvdHLATq4kqQ/4IJf4Wr96yUvIKf
         euBZBmDodOsP4lAP3qNrGgXUvezmNMqmQxbPXqJ8nBey8A5fupXZXAZZUbmf92B4tqjT
         5EdLQY9dt/Po9KGxirGN1WgCd7o41E4EXOL7c5A1FBQlJH41LIbJJNdFvnEbdQTD1mxZ
         kXOu9gR3l6OheS5Sy8EcJ+aiJ2FR8aC65QmV93Znygk+SR3qZvJWLcFBeQ9MyCoV3i8B
         LAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZS88VoX8ZZlakrWWcv16+p54kgnbozpp/01RtCA8wMQ=;
        b=g62tgtebbnU7nRTNb6WcJe4KijHhn4wkcoNPkD3qRvjNNovPi4Gyk6v7TpS3MC/kWO
         aYNjZEif3zVf0f5x/gtngbfn5/2PBvzkM7bGedmvW9WttjjX9Id4MhL9A3umqarKPD95
         DhmU/buf1yDccf71fHDH8Id19FS53kwV8j6A01IsR2ZF3w7KeCpSECl4CXK9NamaOwaA
         CmC45dNgLOJtUx+CeJlQpxXI2vERLr3jm7C1q88G/6aKPo50MshEJGbRhuz2Z0EiKSnN
         bRhlAUeYgj8prLPKaHmha+ALeddqYD8MrWMHyVT67IfBq7rGC5H0O5Whz0+cOm5ynDIJ
         wJhg==
X-Gm-Message-State: AOAM530N7De1cca2tMQMZc+sKYENChZSyqul80UzKj20pqwqsLvw5HR1
	lkg7UioJQLAMPZknT1F42ts=
X-Google-Smtp-Source: ABdhPJzdhXtvJUOkPaYr98SOo5KlxV5GGtkIzAzJD/YDwX5uI15EbrbzEhLRTM/lO8ip/v/fFessxg==
X-Received: by 2002:a1c:10f:: with SMTP id 15mr12224505wmb.14.1616750259485;
        Fri, 26 Mar 2021 02:17:39 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id c9sm10937121wml.42.2021.03.26.02.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:17:39 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix indentation broken by previous patch
Date: Fri, 26 Mar 2021 10:17:16 +0100
Message-Id: <20210326091716.6599-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YFxQSJXXQ4dFPGS4@mwanda>
References: <YFxQSJXXQ4dFPGS4@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix indentation broken by patch removing conditional
code blocks checked by unused
CONFIG_INTERRUPT_BASED_TXBCN family defines

https://lore.kernel.org/r/9157000821fd6febf25566b8c712fad1995c7c78.1615907632.git.fabioaiuto83@gmail.com

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3cd9c61eec99..dc56477eb084 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -907,9 +907,9 @@ void start_bss_network(struct adapter *padapter, u8 *pbuf)
 	if (pmlmeext->bstart_bss) {
 		update_beacon(padapter, WLAN_EID_TIM, NULL, true);
 
-	/* issue beacon frame */
-	if (send_beacon(padapter) == _FAIL)
-		DBG_871X("issue_beacon, fail!\n");
+		/* issue beacon frame */
+		if (send_beacon(padapter) == _FAIL)
+			DBG_871X("issue_beacon, fail!\n");
 
 	}
 
-- 
2.20.1

