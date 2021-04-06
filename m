Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D06D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 19:36:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6777613A9;
	Tue,  6 Apr 2021 19:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617737776;
	bh=MJKZMQKHJHY6Vc9TMSOIgqmLg1at+USHkUd5zXJWp4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQs+DIBu7bc3HH4i/wM6Vq+v8ecI711FauSPxZYFbEyoIyieRBKlyQdgfdDaKRM41
	 IH83oRKcpoNg2QSYNHPuukF9fc+R+G5W6JMzk+NDoXtCaKDEi3WFV9XAOAyuAmcDSp
	 ALvjCkvqdRVKKi/wHvvxSPbOj/owZqQVZYhE7GJA=
Date: Tue, 6 Apr 2021 21:36:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: Re: [RESEND PATCH] staging: emxx_udc: Ending line with argument
Message-ID: <YGy4LXHBrBb/r3dk@kroah.com>
References: <20210406193409.96428-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406193409.96428-1-martinsdecarvalhobeatriz@gmail.com>

On Tue, Apr 06, 2021 at 08:34:09PM +0100, Beatriz Martins de Carvalho wrote:
> Cleans up check of "Lines should not end with a '('"
> with argument present in next line in file emxx_udc.c
> 
> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
> ---
>  drivers/staging/emxx_udc/emxx_udc.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Why is this a [RESEND] ?

What happened to the first version?

Also, your subject is odd, please look at the documentation for how to
write good subject lines for patches.

thanks,

greg k-h
