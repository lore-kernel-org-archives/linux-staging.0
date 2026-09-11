Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F249E13D
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106296; cv=none; b=RW+1EwEOWzdaUvtM4Jvh/PN1Jau1/tQWRVeguAv1m38RubhekoGIw9lxVIwLf61rZBe8r9wecaiGA4swXujOkTKn6ERWlObrbmtggs67I3h5aCRlS2yYCdGRdgyt9re7taFoEwLYKkBygiRPjdKg8DhRSDjOBhM7c7ItiSBEjXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106296; c=relaxed/simple;
	bh=eXfu6BGHMmp/y+4vHOUwtXe3fwP7H3z1RPBy5jUqwyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyZT8eel00S/x3CVw87yv1c8A/EvxvZ8deIuMmZwQYfTWM4W4wJEObuRfBe75H060pIF71yV9AFpgIxtwq5Xw4w6z7wBC/K54zkiLX5cDjiHm3L2cm1UAokgAHe9Gmiihj5qHAFmivyDhen0COa1BVPI8y+sF9Epw7Y6S7P7+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wRnFfiaE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wRnFfiaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D871F000FF;
	Fri, 11 Sep 2026 05:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789106295;
	bh=1iRUcModynPW587XbXjOtYMqlYj/tHb3/rgHAAJyQJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wRnFfiaEf/wFjMFdCBCjPkcMEs1eqTVK8SKZRDHjThktcsrWQ8CzmJEW2Tg3yHbY+
	 oEmyTB+s4rkYizMz3qAR+0Br455YAQgPbi7wJqjekxb+2WfiVWIUCu4pJTh+mvtczp
	 HFiAYe+TNpK3auiBYvgpOvGBdAifvxrjYl58dsnU=
Date: Fri, 11 Sep 2026 07:56:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: YiCheng Lu <01luyicheng@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: audio_codec.c: remove unnecessary
 parentheses
Message-ID: <2026091136-shortage-debate-050d@gregkh>
References: <20260911051119.320619-1-01luyicheng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911051119.320619-1-01luyicheng@gmail.com>

On Fri, Sep 11, 2026 at 01:11:19PM +0800, YiCheng Lu wrote:
> Remove unnecessary parentheses around simple boolean expressions in
> the if condition. The kernel coding style prefers not to use
> parentheses around simple conditions.
> 
> Signed-off-by: YiCheng Lu <01luyicheng@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 1100 +++++++++++++++++++++++++
>  1 file changed, 1100 insertions(+)
>  create mode 100644 drivers/staging/greybus/audio_codec.c

Your patch just adds a whole new file :(

Please take a look at the kernelnewbies.org tutorial on how to make your
first kernel patch, it should explain all of this.

good luck!

greg k-h
