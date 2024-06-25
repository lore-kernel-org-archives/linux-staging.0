Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ACE144315
	for <linux-staging@lists.linux.dev>; Tue, 25 Jun 2024 19:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719344766; cv=none; b=Yi6pO/RHRyVG3c4Qo+bZvqTxXmDeQ6irStOpeS9LPS6rUo/oJIvuzFHEcJaeTwrt5p7ZXHNUxSq+6NW3OniJxeQtTBtx7jLDsIkpC9/nk0n8mUnW7jxQQbID1gcn/feFG7Qrm+zqowdy5SnB+acN/z0M/v6EoeRTDGNFO8KtTWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719344766; c=relaxed/simple;
	bh=VwBrEZVFp25N9X9nSaPoLwiMlNl+UokOPiDvV1Ha+xE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3pLazd46HLcnJtz8DaiaTsdZRwIsfH5aQCSLWMLrrBDtDvnGP9nD3ybWExjvJSluBw8fa5/SI7ei89fwOZi145/gmRV7P3FT0k0Lh3NhhLh/7Wwa19miWzeLWB91vpn76ACX7je6osIzfW+/UvF7Lt80UOre7LE7CK0aQ71IGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOEyEXXp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOEyEXXp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42110872bf9so7359865e9.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Jun 2024 12:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719344763; x=1719949563; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uj592VFsfsXigJjlHKa8dxpsEP+lDZMRz5sitwN8a0k=;
        b=QOEyEXXpfHrrFOc3j7heRDiKmqhZf8xUk2EkDwLhA5Ycd9Yfokr/yoXxOHtOjbjCoQ
         rSVHCH/uepHCaxiVOJbbu7ckw6bDmKLhL5VUsE3ghrE9USjqIamufMwfx3UVn3TQEofC
         btziyMLAG7VHqBGqdEocXQ++2i5GodMk5PFDjZiZ41K8V5MkktndrduMYRVpsDRPKFmr
         xYQKpuZSrzq+fkFbVJRe5A36uO4mIVK+/xsii5tLvThvkQgOVZCvvqBic0HO9wOufWit
         KchHxEbmlKFoAh4Xgk7Xk5ntHjm/4I938qC/h964MLLl5dt02l0tMBMOdHIqtchrUTnz
         ifhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719344763; x=1719949563;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uj592VFsfsXigJjlHKa8dxpsEP+lDZMRz5sitwN8a0k=;
        b=gaHW5iAG3SweAVrg7jtQkHccYGTvze9HMCApYZXN5QiSheFaL0sKkbxMyu5x7BxK/o
         9ZLGymSqLI+JiS5sqe4gWgduL5qSxNmD6B7PKaLfTBCxT6YpojWOfxQtebpCh/y2C5cL
         RtpmN9aSe9eYq+t5XFZLVwh0eyxJWfO76SWDeVtATO5gbbiEDLN2KorgcEncQgCylnu3
         BuR19WeA2lWiXxPUD1jaHN5FxBqxOm8A4+EzKQ/rTZZmE5E0qCvCITyYmRz25/4FlYWR
         eAyrDW8nhLnT2lYazXwkUDkpvQAAM1hahyu4CakZ3iAZaIDEq21Uk1XIUMbZI8QcogDR
         jy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAB9hzP/oiT6ThClpPbesqJaQeiPNe/SGFEk0307M3QRL8t4Esj5oZQBbN79ObEm6wQLPmPnV52VtStvXT+JHN7dQWn+GFrcOueJrtkg==
X-Gm-Message-State: AOJu0Ywu1RR1+NKeRSNql3hz/G8saH+tF76sq2gLPhky2qa/IqALpR0u
	GTyVDc19j4VlpwCMuLVGMmScVTGsDI/3fk8VuhWIlW+mmqzGmOhY
X-Google-Smtp-Source: AGHT+IFdeQrMKSiBuQQY+9Ba/MjPwOWVh6dSr+tITWeZVHuGdXgj2KK5Q67gqOADz3/VQb9LzbTAZA==
X-Received: by 2002:a5d:59a4:0:b0:366:f743:7f92 with SMTP id ffacd0b85a97d-366f7438017mr4163387f8f.1.1719344763315;
        Tue, 25 Jun 2024 12:46:03 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8aa6sm13833708f8f.105.2024.06.25.12.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 12:46:03 -0700 (PDT)
Date: Tue, 25 Jun 2024 21:46:01 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Remove unused variable pwdev_priv
Message-ID: <20240625194601.GA16828@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variable pwdev_priv.

Fixes: bdee203cd80c ("staging: rtl8723bs: Remove switch(type) as type is constant")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406250759.FnxzD3PK-lkp@intel.com/
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Tested with rtl8723bs in ODYS Trendbook Next 14
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 2bd8b1447698..eb3c73cc2662 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2550,7 +2550,6 @@ static int cfg80211_rtw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	u8 tx_ch = (u8)ieee80211_frequency_to_channel(chan->center_freq);
 	u8 category, action;
 	struct adapter *padapter;
-	struct rtw_wdev_priv *pwdev_priv;
 
 	if (!ndev) {
 		ret = -EINVAL;
@@ -2558,7 +2557,6 @@ static int cfg80211_rtw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	}
 
 	padapter = rtw_netdev_priv(ndev);
-	pwdev_priv = adapter_wdev_data(padapter);
 
 	/* cookie generation */
 	*cookie = (unsigned long)buf;
-- 
2.45.2

