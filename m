Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148617EC
	for <linux-staging@lists.linux.dev>; Sun,  3 Sep 2023 09:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97089C433C8;
	Sun,  3 Sep 2023 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693734001;
	bh=sLLDzaG7f3XyGmQPkTTb8MqLp9cXNzqQeHYjomE0Hp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJ2VR08VxXuf6PveoHUCtCd0ON11sFpWgCVi18Io9vRlA/jRjZf1/mED4xVoS/VNj
	 uHGmw4WRPVPy9uLHm6hNcLuBlEGvG/P52GYvFHjQFv0A8LIFoD2tPcB0YJBAfOcSsv
	 l3tJL/QZPmAQ8ZruDNgcQUpV/sNLAz8+EEcSt1No=
Date: Sun, 3 Sep 2023 11:39:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: Fixed some formatting warnings in the vme_user
 driver
Message-ID: <2023090349-fresh-empirical-425d@gregkh>
References: <20230903082253.562042-1-bergh.jonathan@gmail.com>
 <2023090324-recopy-unisexual-db41@gregkh>
 <CA+MPq=VjvQSmY_coVxrmisXavgaZa78ram-SH2pHvOZ=AvaqRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+MPq=VjvQSmY_coVxrmisXavgaZa78ram-SH2pHvOZ=AvaqRQ@mail.gmail.com>

On Sun, Sep 03, 2023 at 11:17:41AM +0200, Jonathan Bergh wrote:
> Hi Greg,
> I hope you are well. I got this response from your bot!
> I pretty much followed your FOSDEM instructions for *first kernel
> patches* so i thought I was doing it right.

That's a really old talk, things have changed a bit since then :)

> Based on the video of your talk, is more required in the SUBJECT and
> BODY for such a (basic) change? It seemed the above was pretty much
> inline with the terseness / examples you showed in your presentation.
> Hopefully thats the case.

Yes, you need a better changelog and subject line.  Read the link that
the bot referred you to and look at all of the examples commits that
have been accepted for the files that you modified to give you an idea
of what is needed.

thanks,

greg k-h
