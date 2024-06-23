Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55149184137
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165508; cv=none; b=drCVxNz70E6F+/BzR0LU/4wiX3nkY3J0axVAsDnYLEY12Pqsj81UCaVlzYQ3sOzYmj1G3l9gPSlWNOBCM4q2N6FpZNM+5UWBh6XiO5LJtiyn8q0vxqGUqogo0lK30qhfm6IDDfHTvI05b5cs4U7Ry/w4p+XcFGBcqSgouefodKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165508; c=relaxed/simple;
	bh=c0a3Pr0ZOQG6hRnnht8gNUqkLt66dO4HBllllz7OIIU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLbRgDzWjPipXyyIUmKo71N3OeWqhHZvPG1RvLF7J9H563ydYfbxVXAdRjtJTGrlq0nlOt5xMGtnM1J5+kKgqMks55GLRIXuAoc1F/NupZEpw5T7tK9V8krQk1Z4RYZKaDE2DTBxh8YbtNuZlS4oGwFI5DW8KwUT6RUNJkjK3FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m84kHQRs; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m84kHQRs"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d1594f3a6so569387a12.2
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165505; x=1719770305; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=axOwCCFkiHXRQoWrBYOvBy8/Yk0F9t8t/fQByhrED9E=;
        b=m84kHQRsU+Z6pGXF9dsnGnofenWvFz/e9+sgcRyzk8QRti565kWP6ikruqw7xlFAQc
         oWXabsQKDhR9HI093yfGp9/vCWwzX0wzf4O2tRRC/u0AsDP9chCVJhYkdfxQT+0msrnD
         EG+oPsOYZp9/YRlA3p9yXkbQ4KBuC9kHtQvDPWXQyKelPWvzEJP+u3VQKJRffrQF36+F
         wYzjJ4FW7ts/FfKuvOYumihat9rpfcVo4yyUav2FPEWJbly6/UD+eAFc2sI8zTIoJ12+
         Rw6KgJ2/A5UmTA9yz50jQgz5TbLvzzZII9clXzP+dKf9xeiW6iEjj6ozjVka6+yVSqjo
         W9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165505; x=1719770305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axOwCCFkiHXRQoWrBYOvBy8/Yk0F9t8t/fQByhrED9E=;
        b=k9wdpacG0Hj2R6opmwpW1GCP9fCeketK8btNjlv9QceRRe8VVK7H52I8Ni/yAEvP2X
         m235v/njfOP8JPlRmpTYjPX3CBAwt57BJq8wd6iLAv21E6zyhil8YcTgFCRl/CGjUKlQ
         /H9m0DS+hoKMx2C+tjKkEgq6JUwpxWMwajPeFGiWmcQPZZcM/JFpMIiYnU55dUE8kHaX
         HvT+VcocfE27Tzscg3h0zye9Y6G1612+QFh7fU9XebAR0hxwsdo3NiCWK3Cwi++Hsx3D
         /3euTBcZKjXBT1SXWaBEtktere7pV5j3RyfIL4xaK8GkxRHqjpIGHHp3Hes4wScbaGnc
         f94Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtPPGO7xb2LYOLhYI6R/2ahjj3ZZJkuE2O68D3/F5V7PbV0nmocK9le4rPWlZqWfe3omdQ9D7tVXjAcyXM0YXBVdDUorVpbkHTvmoLmw==
X-Gm-Message-State: AOJu0YxhULqKr5rNfo1LI89S3JpF6Djzed5LY11hTWBRY0Glu0iKcvYb
	HayP+TcIlTIx4brfM0/F4DdW8bw8vYPna1ofQ3ZQlsoPtIqQcIHGVCCm/A==
X-Google-Smtp-Source: AGHT+IENE7Gapd83HNRZmNE/54dQQ4aIVciES6cnxcJVr6P3l8hZt++p9nvFw+N6HFqqAxkG9r34Qg==
X-Received: by 2002:a17:906:258a:b0:a72:51d8:bf30 with SMTP id a640c23a62f3a-a7251d8c3d0mr59225166b.0.1719165505554;
        Sun, 23 Jun 2024 10:58:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf549385sm325730566b.105.2024.06.23.10.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:58:25 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:58:23 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] staging: rtl8723bs: Remove unused macro in
 ioctl_cfg80211.c
Message-ID: <0a33ebb3e11558f41dc847dcaa9733bfe1cf4ba6.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove unused macro.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 82722897d6cc..2bd8b1447698 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2588,7 +2588,6 @@ static int cfg80211_rtw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 
 static void rtw_cfg80211_init_ht_capab(struct ieee80211_sta_ht_cap *ht_cap, enum nl80211_band band)
 {
-#define MAX_BIT_RATE_40MHZ_MCS15	300	/* Mbps */
 #define MAX_BIT_RATE_40MHZ_MCS7		150	/* Mbps */
 
 	ht_cap->ht_supported = true;
-- 
2.45.2

