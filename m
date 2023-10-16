Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8596079D1;
	Mon, 16 Oct 2023 05:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrKlY7Uz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-405524e6769so24734085e9.1;
        Sun, 15 Oct 2023 22:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697434047; x=1698038847; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DdZ+m+g68ipyNyjyLKt02+pfvg0U+piWymGF1uR9+lc=;
        b=OrKlY7UzMbBh4jKK8ho5EOuWlQBSShZHt6kOgI2fKa1C1nKbaS74J9M+zasfQNA+85
         9fUflQ5nPFb2uG+Zgfp43/LRWiKRc+8nlIUUvuhx8pzxfR/WLDpZYdP/liHvosgsW8ZX
         9DsiPmz/2nToSIiokVBFUUMDbnrKqFRG8xbMhWV4KrTE+9IeluG7Rp81llLhRZODrzkS
         FuG2P+utrZ4QDqDfYdHZaDWgFy4u+3aNGcjcOqv9ECXzg8wy0qfgkcwCn4kWr2nd4sBR
         9gZAfnaeYlXDbDd37pq9enfhnsnyOSow39WLX44QQOxyi51r1Fl+e6KH/F34EsnxBD4f
         couA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697434047; x=1698038847;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdZ+m+g68ipyNyjyLKt02+pfvg0U+piWymGF1uR9+lc=;
        b=OGKseSvcmEdeMwGx3vIKs70x6ZIpgagQOBnrCjgFIH1xO1TYGlvRWKE9WqkYRFDGHx
         xhJLjQ69JbNQ5akVbtjRlP7XFhyeuFWe65rgyIQNloXUDOcPHFnTnXWyZvcP/bYpl6Z7
         2gReNq6s6Rg5HWygXtbwCKhWZp1BNbRePHKTZnVgfOQ8iAhu9z6JMTiLJm7xshKg403Y
         DvDsZwUIBo0EihwgK8OagfzrbqJnrv0UOlVEqxUty4f2vAfMn4I4BqTBG5168JQ+9O6g
         RwXtYWie4A2sobdczIWyuuJ85X1Zn+RvQin2eVQuAnAE6nxwzeV36pPZUKgmjHDreGnc
         pXzg==
X-Gm-Message-State: AOJu0Yy5NjX+2RiBp+UBZuKrqtAwJFotvvgk9WnYYc2uAPkhRLfRLAtd
	coZhlmb8wlJQeoqW+54v2oA=
X-Google-Smtp-Source: AGHT+IHDufePDYgd7tgKPVnuknM7a0SfeuT6CjHzJNcLHbxk5TipFuuxkgIKUdn82Jf0yMBr3No0ww==
X-Received: by 2002:a05:600c:1d1a:b0:405:358c:ba74 with SMTP id l26-20020a05600c1d1a00b00405358cba74mr4723146wms.0.1697434046440;
        Sun, 15 Oct 2023 22:27:26 -0700 (PDT)
Received: from lab-ubuntu ([41.90.67.11])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d4e09000000b0032196c508e3sm5550508wrt.53.2023.10.15.22.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 22:27:25 -0700 (PDT)
Date: Mon, 16 Oct 2023 08:27:23 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvince Otieno <calvncce@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: wlan-ng: remove unnecessary helper function
Message-ID: <ZSzJuwlEKPBj9kLN@lab-ubuntu>
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
Changes since v2:
 - Added the patch change log

Changes since v1:
 - Remove the unnecessary helper function prism2sta_inf_handover()
 - Replace pr_debug() with netdev_dbg()
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

