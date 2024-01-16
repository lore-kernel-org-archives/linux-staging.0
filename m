Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB3320325
	for <linux-staging@lists.linux.dev>; Tue, 16 Jan 2024 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705441169; cv=none; b=JRpEKtKVYuEiV92N+CgM8Fvs049pdAmImXWX1pb7KiD7dsI/8OplEt0FdZ6WH1ZYxXAXLecszg7SvHEED4G7As2J37mreUxwInWwDl2tDKUmrEQNDwjKWTiZem/vcw2zKJ+IAjqd1W9mnI8DhkvPBrdvZDInrH+xePfNxGWCJYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705441169; c=relaxed/simple;
	bh=zZoAMhSNnLaP8BjduYu5bdBbD/Mt3VUCcdoe1rW7jfA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQlRiIvIr78rWksIbFCOcr6YH0k8n9BmVo6DXbE10h3Jn5ebTSJzETU13mTN93OTCdn/q3YkIvlZvpSrKVTXbrGpE+UtvLWU77XFmIOFgOd3u0ciou817lfdt1frOzK6Ow1+WQ3fHsl8X4Lg/T/J1n6jHq42+6EvNyEMhb0DPXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAXXNhQQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAXXNhQQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d45f182fa2so83557225ad.3
        for <linux-staging@lists.linux.dev>; Tue, 16 Jan 2024 13:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705441167; x=1706045967; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1vNJBlEh8DhYGD6roTSgxFREzSSomsGca9zVOoxkHA=;
        b=RAXXNhQQ0Q/noZ5A9Ht0qVsdzOo+Ez0aXadUxc51r1lFA7u6iTGTdsnVP5ZStEWUZx
         cekuuzqon3yOHqoA8oc7b6AmSzMjdOXtXad87r1lGnQs1gbD0WGdHaL46qAF7xvR8Kpq
         rlUPX83xmv8zwoVBFChah+dPcaZZIT/NFuigmTXNXjAxDd+5dYs7Tu/f8uJ7IrRkv3N+
         lGhseADMPtXmIxLs3AnBU5icM92hqjlT028gKlqh5I0ViWsO9ghfRCNrhP6NkmW5ygv1
         nD2XS1lw4Vlps/G5myaL2tZGT0pt1rW6wpgUMJ/48p2Qy8bEXPcFyuCMOEkUIbgezy2M
         PqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705441167; x=1706045967;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1vNJBlEh8DhYGD6roTSgxFREzSSomsGca9zVOoxkHA=;
        b=EJ2YhNg+E9iiIF3d04PAiWq+nwRB1NoLj212EgWTOpNoSvBLnPXJ3gHKkscE9rmQZN
         N/2nVhiiy6qnSq1wADGsgwJcCiIXgl4wu64z3Meo6zpgEatp/FPEfApi2hmMzoXDRE/z
         /AaDqMuof7OWkJExEFgtBYSiaYXDWECjJSQ2pSvIUagHG/BpgtnWDSyCHyOvkjB4rCh3
         QxYYVgiN5dEMxbvlgUBA87zP8wy/evz3PCsED23aTPSp37oh5Vh4o7DVZxc/sBwLqmj4
         EBnPFJABS4PEDgwyv5S0dMClWHX5SxX0ZQ51wFwKdg4gSxoggx9J4vY+Kn0ZptZ8w2UP
         5qLg==
X-Gm-Message-State: AOJu0Yx+748Z8hIMplBSnMttZb4X+cFWctgo9lCXuVtzlxsU0rTBr9E5
	ioKEyx4bYvLqsOqUwBAUSzG0t4ECFmb6Fn3+
X-Google-Smtp-Source: AGHT+IFtB06t8e2Z2ul6N1BmmHOA/WphDQZ/RnQiKeBm58pTznSISZi7C3iWQOJdEw0Ok48Blqm8ug==
X-Received: by 2002:a17:902:ea10:b0:1d3:f285:ab4 with SMTP id s16-20020a170902ea1000b001d3f2850ab4mr9385379plg.121.1705441167438;
        Tue, 16 Jan 2024 13:39:27 -0800 (PST)
Received: from LAPTOP-7VGLEE77 (19.216.252.27.dyn.cust.vf.net.nz. [27.252.216.19])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902a70900b001d49f61cb64sm9643014plq.262.2024.01.16.13.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 13:39:27 -0800 (PST)
Date: Wed, 17 Jan 2024 10:38:13 +1300
From: Hoorad Farrokh <hourrad.f@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: prism2mgmt: Fixed a parentheses coding style
Message-ID: <ooj7nta3skljhnpwtz3wk37uztyayaewfoz2k2b7bnfivnoqtr@ymml6q24k5y2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed a coding style problem.

Signed-off-by: Hoorad Farrokh <hourrad.f@gmail.com>
---
 drivers/staging/wlan-ng/prism2mgmt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
index d5737166564e..a1adf69ba9f9 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.c
+++ b/drivers/staging/wlan-ng/prism2mgmt.c
@@ -1288,8 +1288,8 @@ int prism2mgmt_wlansniff(struct wlandevice *wlandev, void *msgp)
 
 		/* Set the driver state */
 		/* Do we want the prism2 header? */
-		if ((msg->prismheader.status ==
-		     P80211ENUM_msgitem_status_data_ok) &&
+		if (msg->prismheader.status ==
+		     P80211ENUM_msgitem_status_data_ok &&
 		    (msg->prismheader.data == P80211ENUM_truth_true)) {
 			hw->sniffhdr = 0;
 			wlandev->netdev->type = ARPHRD_IEEE80211_PRISM;
-- 
2.42.0

