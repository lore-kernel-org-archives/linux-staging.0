Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FD530B501;
	Tue, 20 Jan 2026 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923556; cv=none; b=iuYZJznYgJKkH2V0s9T4/YMm5Q8KuA3D+ZwoR7nq8c5tFVd9ncNPWpUPeEJYpvMq/QSNtkI5hO2ejWsicbuxyrV5VC2jgzNneBGL/b0f1vvZ10FtfzR/5f0CK52xuYqsrsKGEMrtuP84iLtfdMNKlF8KCbvOaWSdGVWfZR85/uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923556; c=relaxed/simple;
	bh=Ix4eNfF8dYoJVSQT2lsth3XuEIZr/nIM/PLhNP6hdmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmnHhnPkhCOZ32QUFS50/Zaq0U3GHitCO0Cy8NQuNukxFnda60xEjx4BQZ+djuPHXjs8RR87tVp+6zdnvMurthyOgt4SxUieDfTdu/XpNWtJ7ZcrHzv9KI3kWfl708szy3ROLHHZyWe/+lklCHfLA2y3Z70lD2upNCYd7HOaNzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ngjE+uQw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ngjE+uQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD2AC19422;
	Tue, 20 Jan 2026 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768923555;
	bh=Ix4eNfF8dYoJVSQT2lsth3XuEIZr/nIM/PLhNP6hdmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngjE+uQwzp4CslFo2PQdfLdvc1ek6o4WH0CFRCLdK/IrsD6okdcEZgyRzmE5JK+3C
	 lMqolWWwQvSCR0P4NgXR1UNl//SegpHIoQ659I3q2x9ODNB8JtorNHXNzkFXxtLd5L
	 ivyyYZDj2IJtRHyIYDEaXEKGlZyybbjLS0KbHh8M=
Date: Tue, 20 Jan 2026 16:38:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use kzalloc directly in _rtw_zmalloc
Message-ID: <2026012000-parlor-blissful-dc5d@gregkh>
References: <20260120054036.3783680-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120054036.3783680-1-s9430939@naver.com>

On Tue, Jan 20, 2026 at 02:40:36PM +0900, Minu Jin wrote:
> Replace kmalloc + memset with kzalloc for simpler and cleaner code.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index a00f9f0c85c5..be46132a533a 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -24,12 +24,7 @@ void *_rtw_malloc(u32 sz)
>  
>  void *_rtw_zmalloc(u32 sz)
>  {
> -	void *pbuf = _rtw_malloc(sz);
> -
> -	if (pbuf)
> -		memset(pbuf, 0, sz);
> -
> -	return pbuf;
> +	return kzalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);

So there is now no more calles to _rtw_malloc(), so why is it left in
here?  Oh wait, it's a wrapper for nothing?  Odd.

And the in_interrupt() check really doesn't work, that shouldn't be
used.

And finally, try to just replace the callers with the real call to
kzalloc, don't propagate this mess any more, the wrapper needs to be
removed entirely.

Same for probably all functions in this file, right?

thanks,

greg k-h
