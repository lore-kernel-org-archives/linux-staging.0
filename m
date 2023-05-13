Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE686FA3
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:09:00 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5068638856dso2565001a12.1
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001339; x=1686593339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DcwlzjzKqkae2M3+WAsm07p04ignv4QKU8BX1mAajHU=;
        b=hgyUA8ODnif+kjj87+sm3sOz5g5PDVSp3MsBjq4/IbnDSykJGxf1CqK8Qz9W/MeIgb
         lVpA0Yk8kmzceEyW2bPsexqGuE53b9tfTd5O4njFbhn7ELXlbQMVnd19pH603ejPMCmK
         fnWmR9y3vga3KlRdqY89TrcAplzSJHflzTd2D9QppT6x3DEfKgXFJDvVKZMM0OKkrRmO
         pgvvxFnimulorLQHNdvsvp4IP8olb+moehwqDqjG2aIxAOyiQbJynKg5W+FGCHNKLZf/
         XQCGsTeYH/Hwv2q3u6yzsAEV1T97gbV4bcY5dHF3oUZuQtsKOVXJZlThOFfJbfkAaQAw
         UlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001339; x=1686593339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcwlzjzKqkae2M3+WAsm07p04ignv4QKU8BX1mAajHU=;
        b=KDJG1mIWJ6cKzhI1LYJM77Zz1hidO/TdThkn8Xvef/qq+5VIT3c1A//e/ak053mM/8
         3cbdkRAj/y/lP3/jhNT2ghZM4Yk8VQSJvabQXg8gzLxjGqQgC8cxn29cB5gkHfcXre71
         7/aLCQqNrQxpXqjPc4Oo9qUy4P1hYO8NbhLuIT0f7s6YLPfq3jFGFohsQGxVWPTGtby/
         mkalKEGszuA7WrBs+EUH8+FMIgUn4C8HrYxPrBCPNRy07oT/GvVfH2SGKR7hlN02zMFB
         VVpzdNA3+V+RrpnNCy8ark7n2L/Zj0YI9jKxWEGbwpMC72N/k4aoLkFNHNW+CjlQhIT7
         azMg==
X-Gm-Message-State: AC+VfDztBqO0gOqn9nH13LLwYsEPdhD65EIAwdAArLtrKyyJzL4FCVcO
	8hPvPr3IEoBsGHSaLjrAC4ZEU96VHDM=
X-Google-Smtp-Source: ACHHUZ4r2RFmZkxtfknvOyKXIHfIO7asWw+HWG/qoaFSt4TAG+YZEBJRk36LbrCdJ/zks7FSju4npg==
X-Received: by 2002:a17:906:7794:b0:965:9c7d:df96 with SMTP id s20-20020a170906779400b009659c7ddf96mr22113326ejm.1.1684001338815;
        Sat, 13 May 2023 11:08:58 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id ka11-20020a170907990b00b0096602a5ab25sm7041150ejc.92.2023.05.13.11.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:08:58 -0700 (PDT)
Date: Sat, 13 May 2023 20:08:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] staging: rtl8192e: Remove functions rtllib_start_hw_scan
 and stop
Message-ID: <868524470321b8936f63d3ea06ba86c34fc89bb7.1683960684.git.philipp.g.hortmann@gmail.com>
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683960684.git.philipp.g.hortmann@gmail.com>

Remove functions rtllib_start_hw_scan and rtllib_stop_hw_scan as they are
not defined.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         |  3 ---
 drivers/staging/rtl8192e/rtllib_softmac.c | 21 +++------------------
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 9b49a15de889..aac71fda4541 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1688,9 +1688,6 @@ struct rtllib_device {
 	 */
 	void (*set_chan)(struct net_device *dev, short ch);
 
-	void (*rtllib_start_hw_scan)(struct net_device *dev);
-	void (*rtllib_stop_hw_scan)(struct net_device *dev);
-
 	/* indicate the driver that the link state is changed
 	 * for example it may indicate the card is associated now.
 	 * Driver might be interested in this to apply RX filter
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index fe36a52b4c91..bb28414b88bc 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -691,23 +691,15 @@ static void rtllib_softmac_stop_scan(struct rtllib_device *ieee)
 
 void rtllib_stop_scan(struct rtllib_device *ieee)
 {
-	if (ieee->softmac_features & IEEE_SOFTMAC_SCAN) {
+	if (ieee->softmac_features & IEEE_SOFTMAC_SCAN)
 		rtllib_softmac_stop_scan(ieee);
-	} else {
-		if (ieee->rtllib_stop_hw_scan)
-			ieee->rtllib_stop_hw_scan(ieee->dev);
-	}
 }
 EXPORT_SYMBOL(rtllib_stop_scan);
 
 void rtllib_stop_scan_syncro(struct rtllib_device *ieee)
 {
-	if (ieee->softmac_features & IEEE_SOFTMAC_SCAN) {
+	if (ieee->softmac_features & IEEE_SOFTMAC_SCAN)
 		ieee->sync_scan_hurryup = 1;
-	} else {
-		if (ieee->rtllib_stop_hw_scan)
-			ieee->rtllib_stop_hw_scan(ieee->dev);
-	}
 }
 EXPORT_SYMBOL(rtllib_stop_scan_syncro);
 
@@ -739,9 +731,6 @@ static void rtllib_start_scan(struct rtllib_device *ieee)
 			ieee->scanning_continue = 1;
 			schedule_delayed_work(&ieee->softmac_scan_wq, 0);
 		}
-	} else {
-		if (ieee->rtllib_start_hw_scan)
-			ieee->rtllib_start_hw_scan(ieee->dev);
 	}
 }
 
@@ -753,12 +742,8 @@ void rtllib_start_scan_syncro(struct rtllib_device *ieee, u8 is_mesh)
 			RESET_CIE_WATCHDOG(ieee);
 	}
 	ieee->sync_scan_hurryup = 0;
-	if (ieee->softmac_features & IEEE_SOFTMAC_SCAN) {
+	if (ieee->softmac_features & IEEE_SOFTMAC_SCAN)
 		rtllib_softmac_scan_syncro(ieee, is_mesh);
-	} else {
-		if (ieee->rtllib_start_hw_scan)
-			ieee->rtllib_start_hw_scan(ieee->dev);
-	}
 }
 EXPORT_SYMBOL(rtllib_start_scan_syncro);
 
-- 
2.40.1

