Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7488494;
	Thu,  3 Apr 2025 22:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743719859; cv=none; b=QiQVisOH0hYEgoWuIXj7VDmn9uvW9LqLNg0l7YCpmNhIcxchlTCVc7YIQGdkqd6/M+wWLfVCIxTe0qeFaFPb4Tcw56pge8xWK2Wi+dvP6LI0MoWRhcriQ7oxFxmxFxpq+yJc916b88OX0FiugSmUNs+z2l2XsLLjaqe6bYCyrWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743719859; c=relaxed/simple;
	bh=At8uSe/LEVNX/ynY+/JK1XlphOknc3w2iRCiAYOjeM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKckjoo20mnFyicud+3VXM0/YFyy5py/5oc5zH61s0f/ZDe+Nz3xQSEoU+sdZ/+qTQi+Mw85fMqbkcot2vojjzmuV16Ni5gI8a5pVkjicL41mQSBpBHd/yrtXJo9Yre9GLbpiywYhdHN4n53KWP8Y8AQPPGzHZA7B4+vAiuMi+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHxjCmxN; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHxjCmxN"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8f8657f29so11484566d6.3;
        Thu, 03 Apr 2025 15:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743719856; x=1744324656; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS5DlcsngnCJobVCdaTdFPwlcd069NhSqsAB1daMs48=;
        b=FHxjCmxN3LwjQUbsLNsjM3jYrmqsJOqiWvwZAQq4qSoSpaz0twK1qyp/qn46iy2VXX
         UiSz/yx+TngSqotmmz+yDWGxE+pkZ9RIm1vv1siCOGY10gA5WKhUQXciztmaq9A69dz3
         tG00Xbc/6WtaKJ5pa/p9LpqWc6sqW3QvPnp4qRyTwOAyWizO6FWY3ZT01tEcUHY/myWD
         ZswbblT6MwxjGLz8TCArNLRt43wfPrO10/7pGP7jfvcfC9/8FxV3Uqqdvcnv2QMrs3kX
         Ao/y3+Cu6+fTye737cu/LpsdmiqZFkuY0AIvhfDsJTuBLc5puaHaVoXorKDFX7UUhcbX
         8hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743719856; x=1744324656;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS5DlcsngnCJobVCdaTdFPwlcd069NhSqsAB1daMs48=;
        b=fcjhH9kR6/kw3Sro3YesmNroR+qh1Nb91EBjbTyoLKW52kqtEAzkK/rBR7nULi+HlP
         j8V82iQctnRVhFutDfkE3wGhXmCy5v+eGZ+8espBkIF/u0BAe6yd4+XoexB6NUYU0Ihm
         T4gPJuRbkI5YSDNhYvBlDZ4EHHQdSUWwDtR4YSPpaQUqJ3dwjO+4Bbtv3/zMr1WhYQTR
         LQNUk+B9wxsB5fOHWt7OdkNUeE7wvK0T1JFkG52e7BgRJSo9pPSswkD11TRqSs75DV+d
         o4YT6YuOHZ4MAeI+jJtrjzJWGDcSpCIeBvYh7YfaQ2cLDooVzjcuv5ksy0zWyoqyAnJY
         ZPRA==
X-Forwarded-Encrypted: i=1; AJvYcCXot6UKJ/YQroJX1Uj0SDGKsLsT3A5THBMpr24Jk3j9YIQmjTTJyiYTpCZex5AbZvl25gGQwaWPF4g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQiYT5MDypKrK9ulcU/aunACANGiVofjJVs33nFWsWit7B453i
	2Ouhxlx17O2j+cAaBL/aSdoxXNyCgu0HHiNKsg5PJxpCDY3J4Vxo
X-Gm-Gg: ASbGncu9G0MVoBBaM96tCY89VQl56itfUb4jO+ijz6HlJvPIEpcOj4HwpFQfqd8JabY
	J30ZH24N2/V6o29rWTPYVE492idogOMpVq8qxW8gZaljdsWfocCdqT/L55YkJbpks5/FIaDvLaV
	uJi4tdCy5rDia0gUpZCGkQyP+Y5b3IXa7KuL9TJKDVznrswtwHIm2tlji4b7lg2rMixanPwvXLn
	FqTIvGa6MbUPRvXNIGraiZ56i4xxe+U6aCsmsSlX6xtalITl/TAEchhSgglPhbn/xd20a0cITJ3
	Wsx5iC9gWrRh5K21Ckri1OXeC1rjvA3flTT71N6CEoQJyVLl
X-Google-Smtp-Source: AGHT+IHOYzS/ETMdRtbIcc2MnSQWpwELYBtALOBruownenEL6MzCzPF39/WnjxszG3KCe1lFNRrCqQ==
X-Received: by 2002:a05:6214:da7:b0:6ed:14cd:d179 with SMTP id 6a1803df08f44-6f00debc935mr14074396d6.3.1743719856558;
        Thu, 03 Apr 2025 15:37:36 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f14e827sm12758436d6.109.2025.04.03.15.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 15:37:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 23:37:24 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <Z+8NpFYvxPTvjGje@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The struct field uses the uint values 0 and 1 to represent false and
true values respectively.

Convert cases to use the bool type instead to ensure consistency
with other parts of the containing code where true or false has
been used.

reported by Coccinelle:

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v3:
	- Added more patch recipients
Changes in v2:
	- Improved commit message based on suggestion from Julia Lawal
	- Clarity was provided to Greg Kroah-Hartman by Dan Carpenter on why
	it is safe to make the change to the struct.

 drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
 drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ed6942e289a5..82f54f769ed1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
 		psta->qos_option = 0;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index b3535fed3de7..63343998266a 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -86,7 +86,7 @@ struct sta_info {
 	uint qos_option;
 	u8 hwaddr[ETH_ALEN];
 
-	uint	ieee8021x_blocked;	/* 0: allowed, 1:blocked */
+	bool ieee8021x_blocked;
 	uint	dot118021XPrivacy; /* aes, tkip... */
 	union Keytype	dot11tkiptxmickey;
 	union Keytype	dot11tkiprxmickey;
-- 
2.34.1

