Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D927644064A
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 17:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876832; cv=none; b=aidE51m0/gVZfXNnSr2F53fnt/j7PyEe02E25PYzQYHdWqnMFoARLCi/+jLg5fUxqMKRHqXNuEpXCJEO5VqSZNje9tOV78F11DKLLOtjfGg6G3Ak/FlEjBHwQ16fssTcTDdjbmK7Uvk+yVhvvHKtLb/LZ+aA5VkTTQvvTSERv9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876832; c=relaxed/simple;
	bh=yrsdKmL2y9lPPr18nFAgKM0SX9Dw5bHdA3om1AWFKw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqyjxHQqLAnh+v9wrPCqTeaE9K3LJ7TNHoJzVzN9wBtvN1bKTGAde5RyjTTkIKKF8sOOGkEHExRvE4N77XC/N+HnFdMnIZS9JshoiIlbd8EuOTchpTQ8vZAY3PE/RVDYcd/xQzrQVVd4kFLw9WfCNGhLKxRhD2cbi4dLl3EFCW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM7XgFiK; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM7XgFiK"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so1077009866b.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 10:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790876827; x=1791481627; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H6z/w//LhWCZLSKNntdvRXZK6X4eFaUVprUdafE2INY=;
        b=nM7XgFiKvpkjVDHQEetl8ip1jdNYzu3+TEUipmBcss1E9zTZwHK8ec9moxxPsrgNgC
         Uwxt92UIBPvs/HNqUQwAieFqXYM2WPwqrptmou/C0l2EJ48MiBUN9cnxqmVUFd07Mwpd
         mlElJXQTWEAWefajGix9y8hDjek2tBR11sluZXfEbLEOaEbSix3XuHQhufQ/ZUsk59iH
         3EMvZlq8Z4dZ5LglZz3Ea0034yP5UKSIh9WwMFLbSopdlLv14mpEDoBhyPInkZwxsGru
         tbB1fpvSLaP2Y5h/QaY7fBgwM+8nNcnV7VpKJcbe4vQiTbpiIwYtk8H/1KqCoUBfJHwe
         APtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876827; x=1791481627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6z/w//LhWCZLSKNntdvRXZK6X4eFaUVprUdafE2INY=;
        b=xWICG2+8Firny9vaVqbs4ht7KUJPDRCDew/SF0BWweSxEx2HM8fBgmXJCxtwgTpzEQ
         0jEhpoa9ZE9urU/cSbZTDQzBgXD8wLN/s4E5av41GVWUowiBKh3IgX0bMTtpqtR2jmE6
         Yd5KSjXuKS606WGk24GoEJcb8KYc+lYbV6BNFedDHRdT79H0JlGUvcqGXQ+exEdeZgSB
         JpSU/v9BLBqdqAeS7Ns1FfCjOU/mvgSti5hcOSxArG8V5xzyrQGtmNDkZ/PqQaKHtBfK
         rwWM8jaQhMe6dTQGQUm+cAXx887tojXY1UBZJbnerXWKKGhmJqJy17JowXv/Xf07jSVr
         eWHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYIIPf14EFtV9Caw7s1hwuuY+zvyeXyotfQdyi60zpNhji5yIqkA6jE7uVGzEF+zkRZmU1lioEKTFxV9Dz@lists.linux.dev
X-Gm-Message-State: AFuF++lO9OikD6A8tm4npc93/ICSTnRASoLYCVzw91fgx7X5vAAf8geP
	U/kp8rnVroKpSSC2gKUiWc0L/dMF4UOSwHtGKM87y89QcyKWAJ61FF1U
X-Gm-Gg: AYBFou2ZUPjLl537lJra5xzeR5Stl6YcsXmvng6CgnIMuZidHxJts2uj4TADrfmdmmg
	GyRMMnDkB15G/CrrpKEXsNPPwqnHWHE0mgzo8Bt1gXob3bPQxCbIL78gSvI9D6FEcbKKxoWkYlN
	vglOhvyRwNx3ddT0Sk0F58l/FfrgLIW7FY1FjsXpU2K3o1gWXnNXPyv4VW5zLj0euzjeZIeeMfw
	jsxfzbjSfFAcIQLHdhkTnrtzaoxhHoheVZRN+i+kuhfFKyPNAkxoQd8pdhVz8GZhay7jYrRZuT6
	mjW+ZKus0x/YcT4TL3xWuIir37hFwlrastf3XfRNZdWWha1watyL1vScXieyji937DLg/eCPQwq
	CUfG0dHWSVoCkKiatI39ixgkPtko+Hhe4h1lYAQTI9oIiD78i3KsS0lb/smyd+L/I4mVnJVcoAc
	Zt3L4fN8uOaUl/CH4EU5I6gc8OqP04G4FaYyOpR+lQKkPtONSSL8juJ71WIPZkKJakfWba7CzrG
	JErJw==
X-Received: by 2002:a17:907:ea8f:b0:c25:6c9a:88bc with SMTP id a640c23a62f3a-c2e4ad565f4mr28222466b.19.1790876826406;
        Thu, 01 Oct 2026 10:47:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4b9b1f4csm11560766b.69.2026.10.01.10.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:47:05 -0700 (PDT)
Date: Thu, 1 Oct 2026 20:47:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Amirhossein Hajimohammadi <info@hajimohammadi.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: stop overreading monitor
 interface name
Message-ID: <ar6clK3N4by6EN0O@stanley.mountain>
References: <3B4B0B72-4DCE-4E40-9E87-732DCBAA4EAF@hajimohammadi.net>
 <2026092915-luxury-shush-6b29@gregkh>
 <ar4vH3F5lLFijgTU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar4vH3F5lLFijgTU@stanley.mountain>

On Thu, Oct 01, 2026 at 12:59:59PM +0300, Dan Carpenter wrote:
> > > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > index 4416d0ec1..8f5032844 100644
> > > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > @@ -2158,7 +2158,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
> > >  		goto out;
> > >  
> > >  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
> > > -	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ + 1);
> > > +	strscpy(pwdev_priv->ifname_mon, name);
> > 
> > But we are replacing str*() calls in the kernel with memcpy() calls
> > where it can happen, so why go backwards here?
> > 
> > What caused you to notice this change is needed?  Have you measured a
> > speed up in throughput with this change applied?  How was it tested?
> 
> This seems like a legit patch to me, although it's probably AI generated.
> 
> net/wireless/nl80211.c
>   5199          wdev = rdev_add_virtual_intf(rdev,
>   5200                                  nla_data(info->attrs[NL80211_ATTR_IFNAME]),
>                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This means that it is a string up to IFNAMSIZ (16) bytes long counting
> the NUL terminator, but it could be less.  So doing a memcpy() is a
> read overflow.
> 
>   5201                                  NET_NAME_USER, type, &params);
> 

I tasked ChatGPT with writing a Smatch check for this and it noticed
that the "+ 1" in "IFNAMSIZ + 1" is wrong as well.  "name" can only
be 16 characters long (counting the NUL terminator).

drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2164 rtw_cfg80211_add_monitor_if()
warn: buffer 'name' too small user_len=1-16 for 17 byte copy

regards,
dan carpenter
