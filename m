Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27207256C84;
	Sat,  7 Feb 2026 13:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471535; cv=none; b=WyLfr2VfHAroxjrQ8tOHG6e8ivBvPlitaoF9eeCyFE1cEEUBP+W1dvzTjeWlNok/Ko9IZkTzFPH8wfqFfAAvVSsN41GOUF3/xekl1fi3RiYr2W5ygR7r9C//zvYYa8FPzFMpESvHulPBGbU250qURVR/TaShWoaKMRFm1/gyqPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471535; c=relaxed/simple;
	bh=c3BrW7RvTCIAb6OImzo6XVdZAO4auXYrJs2bvJYsUlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmkwkPRicwf45ROyqiVHkM0g5ZuT86JNRRq5aQOPEYs0dz9moUqsSrPxGxVmM0R2MCv+LhluVWnQ622TW6n09OVZgAL1CIeCqme8C8FD4NIjmF9xB4P8GvCCZWYfLjTEpOTPiQ50DgBd0z2dIy+iZ9zLQ2VTVazwrD5/cEH1XMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=otFV0YEa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="otFV0YEa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7121C116D0;
	Sat,  7 Feb 2026 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471534;
	bh=c3BrW7RvTCIAb6OImzo6XVdZAO4auXYrJs2bvJYsUlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otFV0YEaIS8m/BJ2sZJX+YSnGK5urIr9+H3FKEhD0gBiRUAeSlyASLvYiWJNF8+Dn
	 k7HCm7f5wo/xo3B+HI/l31BBRo5r/tA9vEcbr+EVZ3xmwID/htMyZf8n06vNN3fp0L
	 CaE1QnF5diei1Eb42fK5tKNg17RYQ01pitxMSbsE=
Date: Sat, 7 Feb 2026 14:38:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] staging: greybus: added comment to mutex
 declaration in fw-management.c
Message-ID: <2026020704-velocity-palpitate-afd2@gregkh>
References: <20260204183003.182728-1-rchtdhr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204183003.182728-1-rchtdhr@gmail.com>

On Wed, Feb 04, 2026 at 06:30:03PM +0000, Rachit Dhar wrote:
> Added comment to mutex declaration, to resolve a checkpatch.pl check.
> 
> Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
> ---
>  drivers/staging/greybus/fw-management.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 152949c23d65..07a0e6b63cf3 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -28,7 +28,7 @@ struct fw_mgmt {
>  
>  	/* Common id-map for interface and backend firmware requests */
>  	struct ida		id_map;
> -	struct mutex		mutex;
> +	struct mutex		mutex; /* protects fw_mgmt->disabled, and serializes ioctl */

How do you "know" that this is what it is for?

Fixing this type of checkpatch warning is hard, and requires lots of
documentation and checking.  If you didn't write the code originally, I
wouldn't worry about this type of issue at all, it's best for new code,
not existing code.

thanks,

greg k-h
