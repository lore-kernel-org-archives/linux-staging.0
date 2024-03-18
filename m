Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1F723775
	for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710748881; cv=none; b=qh2aRsyRY/NHo+CvYG1cIt6H8wVW2TSC6/2PMm/BBXljfKN2cYbWXB773aCd/6yPeGHU+lZIbFu7nvc5YHFQ/EXLKltKUH6A0LI88WGAkC7AUBWNTveg+lKhPlRjafjMi7xRGYxQAsvHR9VYTYOCrOv+Kqzn+ZhOTTPreH9ulsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710748881; c=relaxed/simple;
	bh=iB85aYGmUCbO9V/e5pZGdJl9hpxyDlCg+1fwsehbscI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQPVEEXFAMlCJDe6shehjamxYoIuAxoueB0kj3Je5yro4uQ+57Z75kuqvbOB5EaMBVMyjkPPFHiv+xKpB+poR1N10tMe8RSLetmzSkVObN62Zl+0aDweGqoiIEUDs7xjc5OvQ3zGaNTL1MPTQWzp9+AbTP67cx5rjolJ1omqzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sgno1sLo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sgno1sLo"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56a2bb1d84eso856960a12.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710748877; x=1711353677; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MKMaAttCP6hb7C+u7MLE+GUVtnN97FseTKGTtYCu3sU=;
        b=sgno1sLobbu6W3xyedVk2z9+kHawfnJPhsxXgKj0DIdohdqqjPFW/TB4kt1SApOSjR
         f1N3zmFJdFNzNceknCvwLdE5XAJhCv64zvwSpInRTDdPEiYsHF6XDcjUVUVZWY7MolxV
         XEuovtgX/LTeossMJZUVoLaj1SKIK/cgPFhI/KTNlo68tkQRbHKMNjHuOltyV9Gqg8Aa
         cUWQS2r69E7URjVtBEpHMjd5z8dmtJKbObEm9618BU6rgq4FEP0lGEjmf7iP7Of759+J
         fVyW1T1xPoPh5Rc+Omj3SsxnB2Xl5ElT4Uc2rw0417mZMDolOt6wWSgyAN1n7skVxhvl
         HPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710748877; x=1711353677;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKMaAttCP6hb7C+u7MLE+GUVtnN97FseTKGTtYCu3sU=;
        b=KUgRirWcFKPHJyUVHSo91JGscdlymxTEuUyt85tC0fFZbJP9/7ubO7f436fl7osY+x
         FcCzhyvwg+uYtzIArfSQLrzcCABZH5gBYPRHcLqdaVJwabFHu+NO5MQWWyCrwXHzoVo/
         5PvEVyaRYBox4yCwR/AJGEl0tP2FGfKs/sKjLM/k8Exkwu3irnjJtfqqzPCmpYJeHc2j
         4mXoEPU13mSF7y8RqJOm16tQ7PmI1+aYgTz70ny97l8id0ysq7PGJODk2sxIG4l707c9
         cXHJp1yKnqldicaQPuNsIiVk4ittQcMQkGuhfxlYm8bJ2Rtwk75dC8f92w8tHbUxT0Dq
         MXfg==
X-Forwarded-Encrypted: i=1; AJvYcCULbA4F9rEKNFGqiXWOqchsPpb84Icj8PSMjfRui6k+WYXirwks52d6n2Rluq2LXmo5LRNmvXs1YM/Kb0BVFG26o31xnl7FZz2jS7SpXg==
X-Gm-Message-State: AOJu0YwCvzlVFI0o+6m9OunEVpJfwZMua1PuiatumlIv0NZRDSi4BJnL
	QMEars83tFVSvwfX3ckps/ZXn6JvdA7RTddLE/YdyJxJqk9ElI7P8KJ3TS9ywLE=
X-Google-Smtp-Source: AGHT+IFoXELRc9Tw5lJNGAKg3uNqc7S1nog4kOCdlgZSG1DP3JVGB0UzWwCQsfcef1Guf0Wv2xW3sQ==
X-Received: by 2002:a50:cccd:0:b0:568:b71a:5954 with SMTP id b13-20020a50cccd000000b00568b71a5954mr1828600edj.10.1710748876538;
        Mon, 18 Mar 2024 01:01:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cs4-20020a0564020c4400b00568a1ce4562sm4157752edb.25.2024.03.18.01.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 01:01:16 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:01:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kalle Valo <kvalo@kernel.org>, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC] staging: wlan-ng: Driver broken since kernel 5.15
Message-ID: <cbdb25ca-f419-4afe-9b58-7d274445aefd@moroto.mountain>
References: <6dc14151-e71e-4118-826d-3ca5c8ee907f@gmail.com>
 <fba3951f-00b7-41af-8ef4-1e7c86e0cb48@moroto.mountain>
 <6c772d15-d249-4175-93f4-ca523006129b@gmail.com>
 <5716d138-ace0-4621-ab34-118610255207@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5716d138-ace0-4621-ab34-118610255207@app.fastmail.com>

On Sun, Mar 17, 2024 at 09:20:34PM +0100, Arnd Bergmann wrote:
> On Sun, Mar 17, 2024, at 21:07, Philipp Hortmann wrote:
> > On 3/11/24 08:04, Dan Carpenter wrote:
> >> On Sat, Mar 09, 2024 at 11:09:24PM +0100, Philipp Hortmann wrote:
> > You are right with the statement that it is this commit.
> > commit ea82ff749587807fa48e3277c977ff3cec266f25 (HEAD)
> > Author: Lee Jones <lee.jones@linaro.org>
> > Date:   Wed Apr 14 19:10:39 2021 +0100
> >
> >      staging: wlan-ng: cfg80211: Move large struct onto the heap
> >
> >      Fixes the following W=1 kernel build warning(s):
> >
> >       drivers/staging/wlan-ng/cfg80211.c: In function ‘prism2_scan’:
> >       drivers/staging/wlan-ng/cfg80211.c:388:1: warning: the frame size 
> > of 1296 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> >
> > But It is not depending on the line you pointed to.
> 
> Right, the kzalloc() already clears the data, so the memset
> is not needed.
> 

No, it's inside a loop so it needs to be cleared on each iteration.

> > I need another week to look into this.
> 
> I'm fairly sure this fixes the bug, the problem here was that
> the cast to (u8 *) hides the incorrect conversion:
> 
> diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
> index 471bb310176f..9d6a2dd35ba9 100644
> --- a/drivers/staging/wlan-ng/cfg80211.c
> +++ b/drivers/staging/wlan-ng/cfg80211.c
> @@ -350,7 +350,7 @@ static int prism2_scan(struct wiphy *wiphy,
>  		msg2->msgcode = DIDMSG_DOT11REQ_SCAN_RESULTS;
>  		msg2->bssindex.data = i;
>  
> -		result = p80211req_dorequest(wlandev, (u8 *)&msg2);
> +		result = p80211req_dorequest(wlandev, (u8 *)msg2);

Ah, well done.

It feels like this is the kind of bug which should be caught with
static analysis.  One of the things that people want from static
analysis is looking at what a patch does.  So if we pass &msg2 and the
patch moved msg from the stack to be kmalloc()ed, then print a warning.
It's not something that Smatch does.

I have my rename_rev.pl script (https://github.com/error27/rename_rev)
which I use to filter out variable renames or see if (1 << foo) is
converted to BIT(foo) correctly.  Maybe I could extend that to check
"move stack to heap" patches...

regards,
dan carpenter

