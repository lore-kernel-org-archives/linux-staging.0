Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C7417724
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:45:16 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-533c71c5f37so3313500a12.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167915; x=1696772715; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJBUFu7bxKPi5/cjKbiiUEWg33kyTMQhk/fPobqwOVM=;
        b=aOxBHzui/cSx2Q8XJHRleixNp6afsl2zIC0ZVn1xCtEDL+9VvCAEwSNZ//c0Y9dvJG
         C4sVDJvZRjlpTPsXu69Ba7AjZ/GgU9KSYvSepA6V/TXa7n5KrawZVQm/x7RBkb0v683g
         nYIkbk7Gh79gNAZrNWyNLSc0bXHTNiGZZFJMhkDpgPoUhJDCMov9YaOBAJ6LRwj2EOXS
         8czfyRHSnrbCjyPapxm9bb0Owoyh2hZR/NYtxJzoX8jRUlt6As2pcSLUYTdy+oUufblh
         29rLU3Q5n6nSX6SLaw8gAfP69exLueCKPbFOYTx/cuUduGdI2InduQQYzYld5MjDj/Tx
         1jmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167915; x=1696772715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJBUFu7bxKPi5/cjKbiiUEWg33kyTMQhk/fPobqwOVM=;
        b=F8T+2d4WqpgCgrCP/FVe7OV1GW606ynZhEuNRgTobExJ0Dc3EFSSyJwRtaeKyhPzjX
         QRDhD4o8P2YklEeHGbAV5BmYOs616NFQDUTohWbMgw/eLH61cu4DCml2aEyspd4YDKkf
         7ZB217eiUPSm7lPuK0PpSKU9XLKX4U9ASAXfCwAwi84K4RDrceYKLq7WqUW6iJFb1Zhh
         lQYlMz7QMjPC7O22+cw56iiP6r47rvZpF9GP2FNdR4pqSpha7VSE8rypDkpzrGt/PK3z
         dx2kWz53OZb0aQV27cxmA16aoEyM7atDVVNT3nVWTl9w4z04HU05HstsUMzr9GyCWocu
         h/Vw==
X-Gm-Message-State: AOJu0YzvPb82vUnB7gCyPVC1qWpBjyCPCS+rkAR1xeLii4hckOLo0MgW
	7oCnJSJG9Yc+Gasczf6Mj+g=
X-Google-Smtp-Source: AGHT+IFO2Ur+EotY/d0w3fxqHOa31udA1k4+93ugAEuEW89WOrwJhtH9oB7TiA9qwOkFbIN4dz/tEg==
X-Received: by 2002:a05:6402:4403:b0:523:220e:a6ca with SMTP id y3-20020a056402440300b00523220ea6camr9357263eda.3.1696167915126;
        Sun, 01 Oct 2023 06:45:15 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id q8-20020a056402032800b00522828d438csm14009728edw.7.2023.10.01.06.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:45:14 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:45:13 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] staging: rtl8192e: Remove unused variable
 is_silent_reset
Message-ID: <124d8f91db347e0e35184b356ba4ec39f52871cb.1696165351.git.philipp.g.hortmann@gmail.com>
References: <cover.1696165351.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696165351.git.philipp.g.hortmann@gmail.com>

ieee->is_silent_reset is set to false and never changed. All
equations result accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         |  1 -
 drivers/staging/rtl8192e/rtllib_softmac.c | 10 ++--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index aa198983cb3c..004818520ea8 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1211,7 +1211,6 @@ struct rtllib_device {
 	bool	bForcedBgMode;
 
 	u8 hwsec_active;
-	bool is_silent_reset;
 	bool is_roaming;
 	bool ieee_up;
 	bool cannot_notify;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 72d0225dfdf1..777338fd2664 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1298,10 +1298,8 @@ static void rtllib_associate_complete_wq(void *data)
 
 	netdev_info(ieee->dev, "Associated successfully with %pM\n",
 		    ieee->current_network.bssid);
-	if (!ieee->is_silent_reset) {
-		netdev_info(ieee->dev, "normal associate\n");
-		notify_wx_assoc_event(ieee);
-	}
+	netdev_info(ieee->dev, "normal associate\n");
+	notify_wx_assoc_event(ieee);
 
 	netif_carrier_on(ieee->dev);
 	ieee->is_roaming = false;
@@ -1334,10 +1332,6 @@ static void rtllib_associate_complete_wq(void *data)
 	psc->LpsIdleCount = 0;
 	ieee->link_change(ieee->dev);
 
-	if (ieee->is_silent_reset) {
-		netdev_info(ieee->dev, "silent reset associate\n");
-		ieee->is_silent_reset = false;
-	}
 }
 
 static void rtllib_sta_send_associnfo(struct rtllib_device *ieee)
-- 
2.42.0

