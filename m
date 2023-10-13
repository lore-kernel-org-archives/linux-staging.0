Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1D46D39;
	Fri, 13 Oct 2023 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6ctNH4O"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53dd752685fso3306096a12.3;
        Fri, 13 Oct 2023 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697188541; x=1697793341; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jeq0ADBKASlsQywUrFjTJUUlHr48GRLZ05MNLo+BnWA=;
        b=X6ctNH4OXQQkhVMtmcphNE/O4EvHbhOp5TrDz48QuwXSG4Y+rwyiOfESMgLT7zuOGM
         9WPC1RL62MxHbCUzJ0cUyOIQ9YsHG9pp69maAd/6cMo5PzNMoyAtzypfK2dkv4hK1p+k
         4FBVbh4VFb16+krsW3hlIVBupbyqxiI2axKqm4Bod/GBMbz7urOptqh3KLoMAzhJtrCh
         HZEqUc7kce2X9kEMJS7vS73Ttv6YFjBnubvNOoru0XOhDnsob5CkYRGLY+KgKR/iQ+ow
         TK0lbN2qKoWuzwrAsv1qhkSk3wK4ZqBtztszZRoqb2fAy+m8eKuiTdNMji5PTDIX2t0J
         y+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697188541; x=1697793341;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jeq0ADBKASlsQywUrFjTJUUlHr48GRLZ05MNLo+BnWA=;
        b=JHfUgRmQFpKjrNY6VTvBYKypbg9ohDX/x1BzkZe/hOiN6ia6Xc1SA9Cqm8iyiSz0TY
         EIQKEd9k0PsAP6ojLh9wJtapVF3VnF3DF7uFqZ0xRi7vfVYEUwclyKncXZ9W2rAatGaQ
         lyK0YMBUwyy/VV+5Va8cPkKFh8pANypkRj11/zdEN2e69XVzOAo2tS5nqJUyKVwOWByE
         7wRg4DAO4w3y4+pXxKz9xCUKzqXrnjRvWnTX3EuHn7lsQlsvFvbvaPmbbZ8nLcP+uCVg
         fEnJBEtZZcb/9y5Ffvj7YRqlP/UqloUTqAKdoLZnNNIRL3LccfxPDZ+pT6lHGEE0O0d5
         B3kw==
X-Gm-Message-State: AOJu0YzSHvW14MEJdT1eEjbjti0XkrRjOIG3dVXtVwGeGAEr2bKHHNR1
	CH48rrDi2xKfdAybtVHD5mezd/K9QAAIQ4ab
X-Google-Smtp-Source: AGHT+IE42F9R/8o1jQEEVanxvfrLDLYyZjYzoidBWJx4edPLLO039ItXve0O7tJPYGu+/RFAueuYkA==
X-Received: by 2002:a17:906:73d1:b0:9b6:4b5d:7758 with SMTP id n17-20020a17090673d100b009b64b5d7758mr24708273ejl.68.1697188541444;
        Fri, 13 Oct 2023 02:15:41 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id u16-20020a1709064ad000b009ae54585aebsm11945500ejt.89.2023.10.13.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 02:15:41 -0700 (PDT)
Date: Fri, 13 Oct 2023 12:15:39 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Calvince Otieno <calvncce@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: wlan-ng: remove helper function
 prism2sta_inf_handover()
Message-ID: <ZSkKux4LMgYiaNMx@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

prism2sta_inf_handover() function basically calls pr_debug() to print
a literal string. This can be done by the parent function directly.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/wlan-ng/prism2sta.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index 57180bb71699..caeceb89c9fa 100644
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
@@ -1724,7 +1697,7 @@ void prism2sta_ev_info(struct wlandevice *wlandev,
 	/* Dispatch */
 	switch (inf->infotype) {
 	case HFA384x_IT_HANDOVERADDR:
-		prism2sta_inf_handover(wlandev, inf);
+		pr_debug("received infoframe:HANDOVER (unhandled)\n");
 		break;
 	case HFA384x_IT_COMMTALLIES:
 		prism2sta_inf_tallies(wlandev, inf);
-- 
Calvince Otieno

