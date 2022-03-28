Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114D3435F
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 11:39:57 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id w25so16533524edi.11
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 04:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CTe1aR5OcBBOwDIeny+aB4PntXqLk/4mfX1YAG71O3U=;
        b=atr0aIYdDMVOJshhfblOWqacBiAVKEwVfbDjG8shUTmy6sNPlKeKTAHTM92cqmtOXu
         1ksX2Guin9hE/vP8jqZzrrtzynRbo5u0dctijjDLgbV0ubhKlazibkVBt/G3ZRqnAQUs
         2LRfXMc8TiZFZF4KpF6cwUlsupv/TqNwTmPO4zdvqiWTEWYSVZC4IFrRDlt6nyOlK1QC
         3u0WcTx/HMvlUNv13fXfxheOk4m80p/v0gis8yIRVA9DM0ga9SeqF2nfxhJ5ZMNseAbt
         7OJzR/xiY/6iS7LKhDvRvmrfCPcLR7NGbTU94qLMIHxJiwXfLnjmMeV1BXj07rAO2wUq
         PteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CTe1aR5OcBBOwDIeny+aB4PntXqLk/4mfX1YAG71O3U=;
        b=eiMnEnkm8gFslRNyo4y3n7Ljz1GueQHrSIfxCqvzrmo+32pZSXJOSliJBwTPng+8LV
         o225QXkOT+SCb3JXs8NxaCfHkOZ3hYBics0ViuvN8s4ETqHmW5u05+E4WMUFav5rGTQy
         wM3pkLbBYSz54Jo53A/ZttUCnlY4uCTpnnnbDeyObrLZsUur1qyhZamNf5QpV6e1iJ8Q
         Q18/no7EK1gifCDU4gQL5bdovXzOOZEz2Gqe/q7gdyO+YSDgc6TLn+XpnxVz+NyB6ZuO
         Mx8xqwjbFsKPPEYSNMzJtAdK6HPPc8XC5H0xaxi/L4D2VL+sXrX609htpSRn1OeEnrqs
         PcMg==
X-Gm-Message-State: AOAM532+Mv2ROqHTN5YXk1FEqOJtTZX8m5QTG9sBkXvUGArq513jcq23
	bq8QXfOoHgJYI/A2Tmo/f6s=
X-Google-Smtp-Source: ABdhPJxgp8CfIhItzgswwUIi/UV+3j3Lk01yEt2iQobYQcLbGkOO1Vbk2xgcZbc1+zg2PGKNcO7J/w==
X-Received: by 2002:aa7:c58e:0:b0:418:f6f7:ccd4 with SMTP id g14-20020aa7c58e000000b00418f6f7ccd4mr15584346edq.132.1648467596398;
        Mon, 28 Mar 2022 04:39:56 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id hq39-20020a1709073f2700b006dfc58efab9sm5938556ejc.73.2022.03.28.04.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 04:39:55 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/9] staging: r8188eu: remove unnecessary if statement
Date: Mon, 28 Mar 2022 13:39:37 +0200
Message-Id: <20220328113940.6396-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328113940.6396-1-straube.linux@gmail.com>
References: <20220328113940.6396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable threshold in rtw_joinbss_reset() is set to 0 and
immediately set to another value if it is 0. Remove this unnecessary
if and assign the final value in the first place.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 14aff6a2040a..83841cf85a0d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1816,10 +1816,8 @@ void rtw_joinbss_reset(struct adapter *padapter)
 		if (padapter->registrypriv.wifi_spec == 1)
 			threshold = 1;
 		else
-			threshold = 0;
-
-		if (threshold == 0)
 			threshold = USB_RXAGG_PAGE_COUNT;
+
 		rtw_write8(padapter, REG_RXDMA_AGG_PG_TH, threshold);
 	} else {
 		threshold = 1;
-- 
2.35.1

