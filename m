Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8821FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:53:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99be4c6910aso50576666b.1
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617186; x=1691221986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JtNNMKVctD5AB1/ghPcVnIk7MTbF2tjuWXvT1X7yr94=;
        b=fSMC6wj31p92FQd0M6sBG77NpbA8cMu7xV8Tf+cbWzl5ka0pLFp9d5WJ8r3iMOP5ZC
         63+koSetpSqAmMoaRGWTBIH6FKJwrFrZzdxMdxNpk8yB30FXRNIwAFHO7Liaf1PHS555
         eKWE+I4AlfJodfb23CnWQ74+huvAPms4nvDBn41vczmpgEoc/K8E8rRPoh8Nz9iMcAcr
         z6ghqrzdJVoACTnlSx8q48liBKBB2BgvdzymKalrsPGMVuYW79/wQBAjriAzAJI2ZTjx
         iwSOFw768I1wmqoJmSzUwmWg67mE/4u+cY361Uqo+d7Y/JO2ITxFO9s4DcKAcIbqJHyc
         DV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617186; x=1691221986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtNNMKVctD5AB1/ghPcVnIk7MTbF2tjuWXvT1X7yr94=;
        b=ga+fBiUeKeLYk6NX/8U/wjXS+lJ005sV4SOVEOn+uWFou+GbgyWq+tvCYad3So2g4o
         ZzQVuZE2YdSRPRTNnCV1RjwnWNNPoxNSN+Xq4MpvkItwPHtbJoOTrqtxkKUwDthR9hda
         7heqxlOg8i3vUCVRfs4hrxQ4RLnx/TIMx/3N8Ltb3r9HHklY29qU2MILPTexZsMBduG6
         2kikmwyYp2+ulNnEtdWPL7Eb/VGRhTZioknObIQcm8OCbwlTEUCw2KK2epySgRHpjo+J
         Xdk2gzjrrV9aK28UUgEUI/ir+nKZ33LMMTk92ySiIArFbLwaV9MJ1SmiZSRDa6EOfWKj
         6jxA==
X-Gm-Message-State: ABy/qLb/YDk9JJA9oNd64VfNbkKuBz8SOsN9q3WaoOkADpGFujmD/eKc
	ZDm7l3DGcdQOF1vcY19R4xc=
X-Google-Smtp-Source: APBJJlHTzHLEeG0vOMaH+EkCFgU3IUP7z+nK1TOpr2dvGXKiJ+2zB5geKAdvUyZFiQQfGdHQf15nAQ==
X-Received: by 2002:a17:906:20d0:b0:993:eed1:8f7 with SMTP id c16-20020a17090620d000b00993eed108f7mr1467115ejc.3.1690617186162;
        Sat, 29 Jul 2023 00:53:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id n21-20020a170906689500b009944e955e19sm2974774ejr.30.2023.07.29.00.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:53:05 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:53:03 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Remove empty function
 rtllib_rx_Mesh()
Message-ID: <7c1aee16a95cd52149faf80c83b6fa19d6499913.1690615475.git.philipp.g.hortmann@gmail.com>
References: <cover.1690615475.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690615475.git.philipp.g.hortmann@gmail.com>

Function rtllib_rx_Mesh() returns always 0. Variable ret is already
initialized with 0. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index b9d220b015f6..8a4029f26835 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1473,12 +1473,6 @@ static int rtllib_rx_Monitor(struct rtllib_device *ieee, struct sk_buff *skb,
 	return 1;
 }
 
-static int rtllib_rx_Mesh(struct rtllib_device *ieee, struct sk_buff *skb,
-		 struct rtllib_rx_stats *rx_stats)
-{
-	return 0;
-}
-
 /* All received frames are sent to this function. @skb contains the frame in
  * IEEE 802.11 format, i.e., in the format it was sent over air.
  * This function is called only as a tasklet (software IRQ).
@@ -1509,7 +1503,6 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 		ret = rtllib_rx_Monitor(ieee, skb, rx_stats);
 		break;
 	case IW_MODE_MESH:
-		ret = rtllib_rx_Mesh(ieee, skb, rx_stats);
 		break;
 	default:
 		netdev_info(ieee->dev, "%s: ERR iw mode!!!\n", __func__);
-- 
2.41.0

