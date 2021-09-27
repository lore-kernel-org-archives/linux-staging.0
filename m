Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345EC2FB2
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 15:50:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB3066103B;
	Mon, 27 Sep 2021 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632757858;
	bh=UCCvAHzd6lqyG1Rjf5H7gKg4GmJepqO6vvcgkEy7RZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQ7PLdBdmuetfPXJ+PSPCgtbNt6QSQONep2sWIwT3Fl6uEyefMyjSyj9BXRQX8yND
	 dUrCCIq3czIyt0u7FZSuEvl+Ul0WW8+nSiJZtoCo2IjtyUfnI+To5GVW4Ak4eNx17N
	 eFYBEnHT8vGskYHaRBgzWwqebJv4TvJpwlOYcqXQ=
Date: Mon, 27 Sep 2021 17:50:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: force fcnt=3 on Renesas GEN3
Message-ID: <YVHoXyULqXsWktMN@kroah.com>
References: <20210921165130.24178-1-nikita.yoush@cogentembedded.com>
 <YVHjQ95lbDjvVR73@kroah.com>
 <17e51208-18b9-56d8-e8e3-2e40d6e94438@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17e51208-18b9-56d8-e8e3-2e40d6e94438@cogentembedded.com>

On Mon, Sep 27, 2021 at 06:40:13PM +0300, Nikita Yushchenko wrote:
> > > +	dev_fcnt = pdata && pdata->fcnt ? pdata->fcnt : fcnt;
> > 
> > Please use a real if () statement here and do not bury real logic in a
> > crazy line like this one, as that is all but impossible to maintain over
> > time.
> 
> The same source file already uses the same form of conditional expressions several lines above:
> 
> > ret = pdata && pdata->enable ? pdata->enable(pdev) : 0;

It's not good there either.

There is a reason this code is still in drivers/staging/ and that is one
of them.  Let's not duplicate bad code for no real reason please.

> > dev->disable_platform = pdata ? pdata->disable : NULL;
> 
> Shall I use real if statement for my expression while keeping those as-is? This looks ... strange.
> Or shall I convert all conditional expressions to if statements?

Do not add additional ? : statements in this patch.  I would be glad to
take an add-on patch after this that fixes up the other uses in the
driver, but that should be separate as that is a separate issue here.

thanks,

greg k-h
