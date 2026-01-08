Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E4F47CE7E;
	Thu,  8 Jan 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871141; cv=none; b=mlqVJdJ+YtyxHfzYqv/rO/26VFUB4wbl1AO5V/AIFmbHuvPa4ttC6tAOLinbbUKSrsRlAv4zLi15EpEMOoGJ08QNAUzCdkp14CfDP+QqssvqtXpTZZ/k+ZkBTt/FEPiGwE3uNxzFmTnuS1xirYkvEw1hfVa6b7JoTe+I2t9ZLw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871141; c=relaxed/simple;
	bh=FGZwQSyMZHD7CiCo1EdHjpE0b5HIwayn41VqK5ITwy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plTpCRse5osiczl1mXtls02yuQ5GbWWxVckN63hMOCS3kCtmbWZGS/fhcDcLUbWd0s8kD8c78Kl+RHohWFy9gwXPpbUqWt+wEEUEW4q1B5gtrhGXIWyAvlDq5WaJhLawP1uuKVIzeAxkEnNTiVvqc1zb+WWOl2G/HDaZGM5bmrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BWQJ8pp2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BWQJ8pp2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5077C116C6;
	Thu,  8 Jan 2026 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767871140;
	bh=FGZwQSyMZHD7CiCo1EdHjpE0b5HIwayn41VqK5ITwy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWQJ8pp2/0jHRsG6oUsiTGMB7SJQKIX4H+XK5gmolG+GfqtWhInDKIkGRfpATXENc
	 5nxtW96cw1cio38BW6v+RRe9jy8/BoXQJjML8nC0ZUh96jVONnrNf3BohhAK92o5cW
	 GQLKG8Y6mvr6yH1VsopY+pOZQWOGpqa4pRHCMrMQ=
Date: Thu, 8 Jan 2026 12:18:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
Cc: rui.silva@linaro.org, rmfrfs@gmail.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: lights: avoid NULL deref
Message-ID: <2026010848-untouched-stranger-dd3c@gregkh>
References: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
 <20260108110926.29018-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108110926.29018-1-chaitanyamishra.ai@gmail.com>

On Thu, Jan 08, 2026 at 04:39:26PM +0530, Chaitanya Mishra wrote:
> Hi Rui,
> 
> Thanks for the review.
> 
> I sent v3 with the version history below the --- line (no code changes).
> I couldn't add a lore link yet since the first version doesn't appear to
> be indexed;

I see it there:
	https://lore.kernel.org/all/20260108103700.15384-1-chaitanyamishra.ai@gmail.com/

> if it shows up and a respin is needed, I can add a Link: tag
> and carry your Reviewed-by.

You should have added it from v2.

Also, slow down, there's no rush here.  Usually you should wait at least
a day between new versions, right?

thanks,

greg k-h
