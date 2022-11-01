Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EBC7B
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 01:15:13 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so1994535pjl.3
        for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 18:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TqIE/LapQHrEfxANUi03hwjnlAbgryHwG0hnnbnZenU=;
        b=mgeTVaCdrR/wrpGGCIDBFDYvg8HmbhLV6BxKQqYjECEOnStWq2kfF3RP6wmo+TF/UR
         aq+0lT6Vw08HjG0b4yvBCOXBBqWFeqRa9IybIOUNm+PuN8lGR1LlVVgwVGoe+gApW/Z6
         dP7+aA7lLlYgmKWuIEuj7cva32xnkHbH1iuLEW6B1aDyWbDmK7Yx33683dpjzjQ3FfVU
         gsXALUuEZ9Ko7DYkWdVV/qIh29U5Tk9vVMYhkNzcQ4wq6oWbW3pY8bPbtV/6t3DTd/Ul
         was8c5dwzkq5zaXiYYTES7oYV5WCU5qI959u5Gk8Xr7B2/eeHkm0EPV6Kj1rMqCMXdGV
         Gkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqIE/LapQHrEfxANUi03hwjnlAbgryHwG0hnnbnZenU=;
        b=jpba2BoM5YeIPFng1s+vx4pv2+sqSQFPYz9EbQ81b2DT2aS0Eo8kDQD9nJutpJR8Or
         N+EjJ8Wn4cb0i+P4rQcbyxKqbI2LjFu8CPmOO/AoP9ULLKcHXQopiPYuGdY6+drJZGdt
         KPQ0u8BWtm5DFNf2bZ8zgYI2VpdjV8u0JjRbX5vprSIJR1s2w14R6IRCEqnDxfB7CZxF
         CBJuq9nk82e7f1B5cm40QI3F0XAyZuHpVroOw2bggVWencG5tVUIbZ06Jrf6uj58kWGu
         +IjTiaK7Ps+baRX0OGAU69/weNEtUIgGOxRRq/ptKYgXhzyeDPQ8aueWCBT2tuR47brS
         poDQ==
X-Gm-Message-State: ACrzQf1uZA1k3gEp2tTTR/kowjGmXulKKStAI8bUgrArPwTVKAXuxsH1
	m4RSbrzDFjNlleC5xrMIB8E=
X-Google-Smtp-Source: AMsMyM7rq08U7eoxNrl6Hloc9s/M/xa6SXit7USWaJgsmkOW/AzwK+WyVekuw5c13OlGQOQYdaUyvw==
X-Received: by 2002:a17:902:db0b:b0:185:51cc:811a with SMTP id m11-20020a170902db0b00b0018551cc811amr17187034plx.85.1667265312674;
        Mon, 31 Oct 2022 18:15:12 -0700 (PDT)
Received: from ubuntu ([218.237.158.230])
        by smtp.gmail.com with ESMTPSA id q18-20020a170902dad200b00178143a728esm5031463plx.275.2022.10.31.18.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 18:15:12 -0700 (PDT)
Date: Tue, 1 Nov 2022 10:15:07 +0900
From: Gabhyun Kim <kimgaby415@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Remove line breaks to match coding style
Message-ID: <20221101011507.GA3802@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove redundant line breaks between function definitions to correct the coding style

Signed-off-by: Gabhyun Kim <kimgaby415@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 1a3ca3e57623..78828ecac28a 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -22,7 +22,6 @@
 
 static void rtllib_sta_wakeup(struct rtllib_device *ieee, short nl);
 
-
 static short rtllib_is_54g(struct rtllib_network *net)
 {
 	return (net->rates_ex_len > 0) || (net->rates_len > 4);
@@ -147,9 +146,7 @@ static void init_mgmt_queue(struct rtllib_device *ieee)
 	ieee->mgmt_queue_tail = ieee->mgmt_queue_head = 0;
 }
 
-
-u8
-MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee)
+u8 MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee)
 {
 	u16	i;
 	u8	QueryRate = 0;
-- 
2.25.1

