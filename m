Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1983063BA;
	Sun, 15 Oct 2023 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Czrtp+ft"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-405417465aaso35662995e9.1;
        Sun, 15 Oct 2023 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697375567; x=1697980367; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tW4gpmmxh+63YJI903yg6bkjFjycGTO0DBlFHUGBTM=;
        b=Czrtp+fths/R2j5QX2KGMHLLudBrDihnw2CsiOWBff8OhA32OKUvFMK40PN4b9h+1N
         7WkQnh5vbIbABy2uhxlNU857ROcot1FXNO7u0ORXIqGuEFoZH+sKB9Vgk7TbKh3he+NQ
         OxQQyazcjGvpAXeHsrQBAyvwJ6RHTy6fiQWa9OwIoGW0aSfKqcdwxP78dlXLDWGeHdUH
         RFFcX8y1A50XNfH5X9FXS9AVnmkkAeD/v7RpxxyoGr5wiEUz1aUW4ELJxKbj6WTzuLAN
         EvNqe8hLl4RacHiFhY48F0lt9hCFyge2zEt7VzXkIFbwb/loI8cKAIqhLxHDzZ9K4IdX
         EHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697375567; x=1697980367;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tW4gpmmxh+63YJI903yg6bkjFjycGTO0DBlFHUGBTM=;
        b=QtXpgpmt4hsN65HGgNKcjRPBI12mmR4tLAbTxOKnnU01xYT3OCfkkRqA31FNPY1D9q
         kYW+oc4SHgRxm5I05odKz5Fnq0eoil2Jt5ygw3EUMex1putmivoTsZxWehBKi14Sos4R
         bMpYe2TnNsQMTVwC0QayOGVdUjDGEMkJ4OQTQUG6s5lqREgTI8ib6hiy83B8oi5Vp3+m
         JMGwcJE2zxQDD6al5/M6hDYOhC3AatmNo5o+sqeav72YXN8n2O+XRqR8GO01YKqE1eBl
         xyjq6Bf59vq/xArkuAvXbY6xkhOxBYlwVIi+ZpfmvoaZtbJSa8wTDQpcbruOM6g/0W/S
         Trkg==
X-Gm-Message-State: AOJu0YzV6GSQw1yF1aFGcoh85h4SdPxg5cs5EEwAnSYW4NHUlbBRDNGG
	IkRHdH4bl6I2W8Rn6yRW5itIExiP7QlY0Q==
X-Google-Smtp-Source: AGHT+IHUXQ+o0u2TfCTD4y/bZVfWK0YTlVpXcTYyc02g4p2BYq725O2qRPTAP+aK3//eRfhD407BiQ==
X-Received: by 2002:a7b:ce89:0:b0:404:f9c1:d5d7 with SMTP id q9-20020a7bce89000000b00404f9c1d5d7mr27585153wmj.25.1697375566890;
        Sun, 15 Oct 2023 06:12:46 -0700 (PDT)
Received: from lab-ubuntu ([41.90.64.203])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b00405bbfd5d16sm4463112wms.7.2023.10.15.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 06:12:46 -0700 (PDT)
Date: Sun, 15 Oct 2023 16:12:43 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvince Otieno <calvncce@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: wlan-ng: remove unnecessary helper function
Message-ID: <ZSvlS18qI7G7Dvpi@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The function prism2sta_inf_handover() is called by the parent
function prism2sta_ev_info() to print a literal debug information
string using pr_debug(). The debugging utility function can be called
directly within prism2sta_ev_info().

Furthermore, to make the debugging more module-specific, the netdev_dbg()
function is preferred over the generic pr_debug() utility function.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/wlan-ng/prism2sta.c | 30 ++---------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index 57180bb71699..b5e95a3207fe 100644
--- a/drivers/staging/wlan-ng/prism2sta.c
+++ b/drivers/staging/wlan-ng/prism2sta.c
@@ -90,9 +90,6 @@ static int prism2sta_getcardinfo(struct wlandevice *wlandev);
 static int prism2sta_globalsetup(struct wlandevice *wlandev);
 static int prism2sta_setmulticast(struct wlandevice *wlandev,
 				  struct net_device *dev);
-
-static void prism2sta_inf_handover(struct wlandevice *wlandev,
-				   struct hfa384x_inf_frame *inf);
 static void prism2sta_inf_tallies(struct wlandevice *wlandev,
 				  struct hfa384x_inf_frame *inf);
 static void prism2sta_inf_hostscanresults(struct wlandevice *wlandev,
@@ -922,30 +919,6 @@ static int prism2sta_setmulticast(struct wlandevice *wlandev,
 	return result;
 }
 
-/*
- * prism2sta_inf_handover
- *
- * Handles the receipt of a Handover info frame. Should only be present
- * in APs only.
- *
- * Arguments:
- *	wlandev		wlan device structure
- *	inf		ptr to info frame (contents in hfa384x order)
- *
- * Returns:
- *	nothing
- *
- * Side effects:
- *
- * Call context:
- *	interrupt
- */
-static void prism2sta_inf_handover(struct wlandevice *wlandev,
-				   struct hfa384x_inf_frame *inf)
-{
-	pr_debug("received infoframe:HANDOVER (unhandled)\n");
-}
-
 /*
  * prism2sta_inf_tallies
  *
@@ -1724,7 +1697,8 @@ void prism2sta_ev_info(struct wlandevice *wlandev,
 	/* Dispatch */
 	switch (inf->infotype) {
 	case HFA384x_IT_HANDOVERADDR:
-		prism2sta_inf_handover(wlandev, inf);
+		netdev_dbg(wlandev->netdev,
+			   "received infoframe:HANDOVER (unhandled)\n");
 		break;
 	case HFA384x_IT_COMMTALLIES:
 		prism2sta_inf_tallies(wlandev, inf);
-- 
2.34.1

