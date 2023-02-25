Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6CA566E
	for <linux-staging@lists.linux.dev>; Sat, 25 Feb 2023 18:20:47 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id l1so2292206wry.10
        for <linux-staging@lists.linux.dev>; Sat, 25 Feb 2023 10:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677349245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YAkY5lWd2mIuBvpl4SjoFin1YMe8Z/rLiJhwo7Z2OPc=;
        b=B1eiWnexElXDHgwxS0+ddCOgB6pVW1iCzuLqe9IQsIaawvDHDf8sQCGPGOdeDgkRzk
         GHWiYS2TQRx5xKZYU/3gTF2EfdvT/yHtxUsOdpr/h7ITgmWiwZn0Rd9ucpHZREuSFl/C
         DpYD8hkPzGGD4FljPbw8/iIpvWt7bRikJjEyPp0h8g0iw+BBDQHFYlfcGR3Q78+YkOJh
         2Uye0zwyDE2XZUuz9G4ApxzV6uz5Q5Y6ktdb/mNzEM0upTiT2JRJYqqJ/veKMJl79sAS
         nnOSN1ADN4jONNGrdc8UGbXVZROK4pfTj4977Co/PoAxWHvQ+byLxawvNMFJrR4XfxXu
         RrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677349245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAkY5lWd2mIuBvpl4SjoFin1YMe8Z/rLiJhwo7Z2OPc=;
        b=4CkaZxrY27o253EyEmc4vK1bSbCbJQfhwTLaAkuAkDoyje/q6Z0YV+zalbpoP6Mp71
         zjsJUbto8F1Dbn9m0HZpZ0H5UEmvjn4+i+8GwORw/mu/AXrFhCW9E9XZVwAvw5fHXaGJ
         lNVSYoP5mTJjYjZapozoG9qWEDEBj0Vm0oAYJqrqcJ+o30yZRfGQz4wI6DtxyB1WTJwD
         VlOAhvcJEMPd9aP2vTjRipisyx+6bBRoiaYEMqSnQWSkYCsHTI7D/wTsXVC+BRYe0Rve
         oBo2ih4H/mAQvWqQaQhmb21v3BuU+ljRp05rvBINfOSUpYkeWbssF+VM8AgpeE3/rVXz
         7NkA==
X-Gm-Message-State: AO0yUKU/7oOib2LRV46Iyl0LoJh0uqITVyh+yqKd/YkCB9TsXYQQABWM
	JLIumIPWLnaSZyoRdrZ9kHM=
X-Google-Smtp-Source: AK7set/7mZeQBjNSPHLMZWfPKrfwHMZh8Wlq1RFqWrNIjqW9Y5gq/FQTC9gR7uzFPbfo7xTYdmUtRA==
X-Received: by 2002:a5d:6a8e:0:b0:2c7:1c72:69ac with SMTP id s14-20020a5d6a8e000000b002c71c7269acmr3880175wru.2.1677349245596;
        Sat, 25 Feb 2023 10:20:45 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id f12-20020adffccc000000b002c705058773sm2352715wrs.74.2023.02.25.10.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 10:20:45 -0800 (PST)
Date: Sat, 25 Feb 2023 19:20:41 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8192e: Remove checks of pointer to
 stop_send.. and rtllib_..
Message-ID: <f12e9167499344059f77991d2058c050bbe744d2.1677345331.git.philipp.g.hortmann@gmail.com>
References: <cover.1677345331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677345331.git.philipp.g.hortmann@gmail.com>

Function pointers of stop_send_beacons and rtllib_ips_leave_wq is set
while executing the probe function. Therefore a NULL pointer check is
not required. Remove checks as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b06baf5ff6d4..7b73c5df5e2a 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -659,8 +659,7 @@ static void rtllib_beacons_stop(struct rtllib_device *ieee)
 
 void rtllib_stop_send_beacons(struct rtllib_device *ieee)
 {
-	if (ieee->stop_send_beacons)
-		ieee->stop_send_beacons(ieee->dev);
+	ieee->stop_send_beacons(ieee->dev);
 	if (ieee->softmac_features & IEEE_SOFTMAC_BEACONS)
 		rtllib_beacons_stop(ieee);
 }
@@ -728,8 +727,7 @@ EXPORT_SYMBOL(rtllib_act_scanning);
 /* called with ieee->lock held */
 static void rtllib_start_scan(struct rtllib_device *ieee)
 {
-	if (ieee->rtllib_ips_leave_wq != NULL)
-		ieee->rtllib_ips_leave_wq(ieee->dev);
+	ieee->rtllib_ips_leave_wq(ieee->dev);
 
 	if (IS_DOT11D_ENABLE(ieee)) {
 		if (IS_COUNTRY_IE_VALID(ieee))
@@ -1584,8 +1582,7 @@ static void rtllib_associate_procedure_wq(void *data)
 	rtllib_stop_scan(ieee);
 	HTSetConnectBwMode(ieee, HT_CHANNEL_WIDTH_20, HT_EXTCHNL_OFFSET_NO_EXT);
 	if (ieee->rf_power_state == rf_off) {
-		if (ieee->rtllib_ips_leave_wq != NULL)
-			ieee->rtllib_ips_leave_wq(ieee->dev);
+		ieee->rtllib_ips_leave_wq(ieee->dev);
 		mutex_unlock(&ieee->wx_mutex);
 		return;
 	}
-- 
2.39.2

