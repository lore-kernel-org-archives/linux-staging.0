Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FAB3D54C;
	Mon, 11 Mar 2024 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710164748; cv=none; b=cci6kQC2om8HP93yOOkh3e36577sGrE6XNbMxxz82EaAEvgZXv6NmIelGfOEHtpjhVOwHAxWQ8UzsAAsy4sZ08SHNATGfTbTc3G8lhoQAIlo9ZvTBMXAdvFg1nQ70DmWFIHS1Bcvp4WmJE8Js8zVb83JOIUzkTEAJmiuksdT+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710164748; c=relaxed/simple;
	bh=2rrzPqkrjgWCQYKn2ILmStPNQpOGa0V13tk49G8e/R0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sn9Ga+SY6HVZRAw31zho/OegX+bc0qwA2ZnHIhxvAIWY2AZwM4wVtBfHU9vVfiw8+hLEsTa103cyvW8UhaS/qHS6wzI6LCTX0NxCcU1raUO1p7xpRaMNoLQxwzjnYF0av7leBtIsUl8urkzc2E6f2YCnapM24fYgjramGdvQKA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5spzdmn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5spzdmn"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d2509c66daso47664771fa.3;
        Mon, 11 Mar 2024 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710164745; x=1710769545; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BE7Hdm8gFkauiUDN4V0wRVBSytuZIdkLYWEr/2RSfnk=;
        b=I5spzdmnccWS/2okpUDOuHk5juMpk9c1h7fbbvmYU1IsrJ0CYmIn+oW+AN6eCDwZTo
         sJ/zU3FqcFWs/K8JaJEUV+Vj7H0Ep3YJsu4BPqrPgVQ3oEur0AHblVddt5UMhRJPt09c
         /67Q0KNYvqod7Ed6SSRGar4XMdsb8lEn1mbD2UrThPru061ogw2bpM/ON1ADItxD1oLn
         r7M96gbsIYtveL5GHprI6gvCwfOqIyR0do/+cOTmd2IedT00M3svzFstYuQ2KvJM1WUz
         uvPfhpcTWK+Hj1KhS7ry1Cq2Ha6t7D0ULTj7muDq4oeK7efzxZSXyyRlJgIqRh8Dn/Lp
         4oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710164745; x=1710769545;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BE7Hdm8gFkauiUDN4V0wRVBSytuZIdkLYWEr/2RSfnk=;
        b=vRboznZIn/6HRSZF6ngXVa70lJwkG+i3Y+weS8bPMzDJDrbIXZ52tQcW+vOaocMxgs
         4k9mawq1qGyURoUjW1lJVuRam4Dm39TM+dg96oa9MKuNiqAznIDi+EROORMviP5G1Hjg
         baduTAlX/Yk6b9CG9sfYQy29p9eta38WPQGDUfO6j5k6W9kJFDSutsTWF/LY344tRs0F
         jV/k9zhZh8tHjlQ9QB/xcIw2GbGcmiPQLYl6PrgVm6FYZRRKT/ju6Jtgf1BUVPBzKMGQ
         Wnj8PpZCopXoBaNkly54Nq30PC63CsbMAc1pg90d+Y4CCnDxySz95X1S1z6hwrljwV9z
         Mm6A==
X-Forwarded-Encrypted: i=1; AJvYcCWPQS1paz0ArwSinlxkuc9HeyoSnj2nlZ+axjjc2zCv7OgigW/EpUKdGnyYn/fe2acdud4CErgPXlL6ZiqZ1dPZcm+RvMUQ0lBdgvf7UQ==
X-Gm-Message-State: AOJu0YxsQat9WHkbFpSB9DerCWdVEnYfm9WggdYy/KVYWvq2+4BiR0Ry
	APb/VAt00Ajy3IppuLe23c9jmc69QA48MNTt2RfMlY585Zli5Kv3+FoL4D3ZyZIrJg==
X-Google-Smtp-Source: AGHT+IEbNZtmkUjJIkytLL9HCTN+M1rBvIgb6FokHboOUqK3133d8V/mkBGqOpoWqXri8zY0e22iOw==
X-Received: by 2002:a05:6512:ac7:b0:513:49f7:70f with SMTP id n7-20020a0565120ac700b0051349f7070fmr5816606lfu.57.1710164744380;
        Mon, 11 Mar 2024 06:45:44 -0700 (PDT)
Received: from MOLeToid ([102.244.155.48])
        by smtp.gmail.com with ESMTPSA id v15-20020a170906564f00b00a44bc99cd89sm2890384ejr.42.2024.03.11.06.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:45:44 -0700 (PDT)
Date: Mon, 11 Mar 2024 14:45:41 +0100
From: "Felix N. Kimbu" <felixkimbu1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: cfg80211: Remove parentheses prism2_get_station
Message-ID: <Ze8LBf6xSjCRt4rd@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary parentheses around 'wlandev->msdstate != WLAN_MSD_RUNNING'
in static int prism2_get_station(...)

This change ensures adherence to coding style guidelines.

Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 471bb310176f..7451fd2bb580 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -247,7 +247,7 @@ static int prism2_get_station(struct wiphy *wiphy, struct net_device *dev,
 
 	memset(sinfo, 0, sizeof(*sinfo));
 
-	if (!wlandev || (wlandev->msdstate != WLAN_MSD_RUNNING))
+	if (!wlandev || wlandev->msdstate != WLAN_MSD_RUNNING)
 		return -EOPNOTSUPP;
 
 	/* build request message */
-- 
2.34.1

