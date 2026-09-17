Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF334E50B2
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631412; cv=none; b=W+M8dIi7pDcogDIWZ7wVh45i2E2I9zzAAr+QS+OG3iwxL79RlQjg38ywBwdUWIx11jS45BNvF6B3U/ebnxa9EiWzV5mwinIgA+7DlACOb9aR5SYqfuC0dK20aOF6AAfs3lzoVW6CZNBDPlmc75zO3Mk1Twn93VvHj/c3PRqR2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631412; c=relaxed/simple;
	bh=aPr+Qi0GqWk/BrztXPdzLLv2v1LWbUl6I2/UmOUxrGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UL0qF9MVwh19ZmyUi8BqL8GBQpTf5qeiKlskJFv1wDzukBrIvGibpr+oveLfEnBXae1+tNighEuTl5qyHZwxvMRayoSSLrpXALPvxDF0Tz+kET+aMWgvX4COyNschTs0UXV8eogUYjEh4kwmi16kiYvGMIbsvj+y780yukD+tmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVSn4eC1; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVSn4eC1"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7daaso772128a12.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789631409; x=1790236209; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qQsMi3oaSJScdRbutpiL5WH0Qa1SNOuUKKoGIIRm5XQ=;
        b=TVSn4eC157gUsYzbGNEHmxskkHPZhd3WeZSHaSfqaeNVL0gt9WwCy6ebXCnFx/uB+8
         bZtmZ4X6HxdAv/Xy18//QdHro4RFA/fTckzc9nq/XLURy+j9b3p/DGRHMO9b9Yf5K7g2
         Iai4kwtfPNJYU/w9ddERH+3YrvMSz6ri4jUFog7P60Voc9fiI+X6icoOY6d+aUUNpQDk
         6bW0gH+TLSSB1TAwJsGk5cOw3NTzC1/CZ3T16j+a9Pqv7xuKwNTHRL3/kW4xGXjeltcX
         CN/oQH3z+vn/Yag5z1aitL5Z6dkYysixnuP2gxtUqjSVsMN49kUvx+m436ZD6b9thEiJ
         U2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631409; x=1790236209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQsMi3oaSJScdRbutpiL5WH0Qa1SNOuUKKoGIIRm5XQ=;
        b=ckWO//zzxWDiW8ZF94TFY+SWk/yTVkefqv/WovquxBsi+TgQeUQYRzWeVRyBlJEY9w
         bMeX8oWvR25IQKzcSZCn/bGG+CrN1YkmarntXcJTd7MEd3SxHfry2ohp9KJJ2zUvSze5
         y7Q4GEnflsu9HvZhFTLL85VbK8nviHttvyXOIr129zldKLA8yRKUDPsIN8LrKoe1NPO6
         mromW7DNLywAYemOfSC5vb2jYBSMYMXDf4XHGqRedV+QY/V6IK4/jrxzqYTeDV2DmAtb
         3K06Ax/MndedmffKinkXZAotB9pGivt9aWaS737dI+ZLxKwDPLEBxPvQla6NvAvij3YD
         zYXw==
X-Forwarded-Encrypted: i=1; AKwUvBzXRMoK4V70bpiAwQIXilKwcaPGZsmUn64nIJ7AzOtWTd4JXJQ95lE1ui+iG5H+Q/jMocM/md/6xbtW/6Si@lists.linux.dev
X-Gm-Message-State: AFuF++lYbezu44SXrfC8Oyh+cquxXHB1hxKt2Xi84JeORdWU2XVxFOnx
	ywZd28gH2nmFA6rylmliUZiOb6Zch5aofCuqzhRMyV1Qv0tw3ggGqiim
X-Gm-Gg: AYBFou2m7/joemM1pFTdraYeaAPx1pd43hv9DErBIMZ3CNMGbI60nrLdEpJxOsmQK32
	a+vw06P1gAujCoYhjSODviieK4TNswkFf9b8Czs1UHAR47Q8OsCn501+h2WxUbfxOseIHBGr5m3
	R+xtfgJuUYVHVt9tw7EQcEkH5y8YbqTiXtJ+vnMqXp9NMX2EYzLngVCC2SX4NvdqWRB45/5GSy9
	VlJdZJSrpzTM/yGNK9x8mu26O2iSwr+noAXwjseHc5vpe5jYGUPsSaePYmK/W/FHUtYIzG+6jWr
	YtSBh5Te1FVw6wZn5iEXAE9SM/x5U4qxygAWgXTFruTiph53UH7GStGK9XvI3RYkCPU1qrF89s7
	Dv+sE/amVN4T7sWLTGX0xneIBpKBSFWMmAczirtti2TgjNU7Hq1eF9fkH8V7RTY+hNGrwZagbNs
	e0j1oP0FUpAm1unW1bgY9WKGD4qN7pAOLb8HnU/pTWfVNxk987IvJS+3oVjqxTCEijTrg=
X-Received: by 2002:a05:6402:5d4:b0:6aa:1cf5:6076 with SMTP id 4fb4d7f45d1cf-6aa222624b5mr8120998a12.1.1789631408370;
        Thu, 17 Sep 2026 00:50:08 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2a272dsm3101894a12.28.2026.09.17.00.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:50:07 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:50:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Omer PALA <palaomer100@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <aqubqzKGtpmDkX9W@stanley.mountain>
References: <20260917071931.8063-1-palaomer100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917071931.8063-1-palaomer100@gmail.com>

On Thu, Sep 17, 2026 at 10:19:31AM +0300, Omer PALA wrote:
> Replace msleep(1) with usleep_range(1000, 1500) because msleep with small
> values (<20ms) can sleep for up to 20ms due to timer tick resolution.
> Using usleep_range provides a more precise and consistent delay for
> hardware power control operations.
> 
> Signed-off-by: Omer PALA <palaomer100@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 448611ad8..1d3262413 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -561,7 +561,7 @@ void LPS_Leave_check(struct adapter *padapter)
>  		if (jiffies_to_msecs(jiffies - start_time) > 100)
>  			break;
>  
> -		msleep(1);
> +		usleep_range(1000, 1500);

These kinds of changes need to be tested.

I don't love this checkpatch warning because it we reject almost all
these patches.  If it were new code, presumably the person sending the
patch would be able to test it...  But I guess it serves as a kind of
lesson to not listen to checkpatch and also to search lore before
sending stuff.
https://lore.kernel.org/all/?q=LPS_Leave_check%20msleep

regards,
dan carpenter


