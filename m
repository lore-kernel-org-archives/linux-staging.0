Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB442EFDBF;
	Mon,  5 Jan 2026 06:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767594076; cv=none; b=e3QYS4mqAfx4dvs69fVFPJDyUkLv9Z41BpFQpYzm75ouhl+p0spmtYpRDBh687preNrgVwqn+gcr2WzBoYOkkGuyCr2jz4+n9LTEM6KD9yTnLauTc42PqQO0UhBirxaG67ETU8HcbW8b18LohngBtTdBDJ2YEmYhx0cBOf5uv6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767594076; c=relaxed/simple;
	bh=BIuzz/EPuN1+s7QUbl6KSoA/jInW8sw3qTTl6xlEblk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neN+X6wlCbjqhGR5eZgkqHpuVGOzPqtlYQHNjheYv5MRylPORc6EYLHMvEqGbc8k11AObdS9kJoxat/YdWAo9vHyFp0uiFvWFJHG1F1KH24bGJwDKUBllvl0d6CzA5YdKu6rlTJUJmBbz9Dc13Hs0oGT2M+mDNxyTVTSPkv6NTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l32S8+G6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l32S8+G6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD8CC116D0;
	Mon,  5 Jan 2026 06:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767594076;
	bh=BIuzz/EPuN1+s7QUbl6KSoA/jInW8sw3qTTl6xlEblk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l32S8+G6h/VipSFVClsplOT3oPilCpLTJLVwXnT0FbAcRZSQA9NWrJFcFTM4Djxt+
	 fBNEvHMwfUdjToddyqdEPw58JbqFSbWH0H4k+yT9syFrrWamNXwNYKVUaBa7fd3oUX
	 TOInkuWAF1wkbiwAc9udzOGMkf6fAtB9vTAYFwVg=
Date: Mon, 5 Jan 2026 07:21:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gideon Adjei <gideonadjei.dev@gmail.com>
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: replace WD_STATE_COLDBOOT_TRIG with
 state
Message-ID: <2026010547-slacks-comic-bc68@gregkh>
References: <20260104132541.17989-1-gideonadjei.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104132541.17989-1-gideonadjei.dev@gmail.com>

On Sun, Jan 04, 2026 at 05:25:41AM -0800, Gideon Adjei wrote:
> use state temporary variable to replace WD_STATE_COLDBOOT_TRIG argument
> in arche_platform_set_wake_detect_state. This keeps lines under 80
> columns and satisfies kernel style guidelines.
> 
> Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index 8aaff4e45660..bb9b3c3c7a2d 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -155,6 +155,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  {
>  	struct arche_platform_drvdata *arche_pdata = devid;
>  	unsigned long flags;
> +	int state;
>  
>  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
>  
> @@ -179,8 +180,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				 */
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +					state = WD_STATE_COLDBOOT_TRIG;
> +					arche_platform_set_wake_detect_state(arche_pdata, state);

No, sorry, the original code here is just fine, don't do things like
this just to make checkpatch "quiet".

thanks,

greg k-h
