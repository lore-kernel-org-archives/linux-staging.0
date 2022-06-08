Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1267B17F7
	for <linux-staging@lists.linux.dev>; Wed,  8 Jun 2022 10:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60062C34116;
	Wed,  8 Jun 2022 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654685108;
	bh=eRVrxw2TtDyOfO8gMWB1zIDrWzECqh2i9AYfRsqK6Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3oZWf32QmN9uDJsIiHuUTFynEfYTOa1VnGwHnfllpgzxF7HurwOAgMNfPpQHycxQ
	 4IPqpl3lWWUQbdF3YWN8aj3OGKzrK0Ua1rTeuxLDcki8UUMuJ1Js1ovfnHcG6wqaHE
	 OI6lmEVVS36JRlIeXqLvsR6iPZpUJYHZgpyJaIwc=
Date: Wed, 8 Jun 2022 12:45:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Martin Kaiser <lists@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>, phil@philpotter.co.uk,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] staging: r8188eu: driver stopped working with commit
 ("staging: r8188eu: add check for kzalloc")
Message-ID: <YqB9siuACKQMKXhv@kroah.com>
References: <20220606064055.12565-1-straube.linux@gmail.com>
 <ded4b3f5-a9bc-4612-33cc-68bd85cb92fe@gmail.com>
 <20220608092731.hz26q37fhmrhipmj@viti.kaiser.cx>
 <01d6737a-9e2d-c009-4e24-c2c54b39b80c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01d6737a-9e2d-c009-4e24-c2c54b39b80c@gmail.com>

On Wed, Jun 08, 2022 at 12:34:45PM +0300, Pavel Skripkin wrote:
> Hi Martin,
> 
> On 6/8/22 12:27, Martin Kaiser wrote:
> > Hi Michael & Phil,
> > 
> > Thus wrote Michael Straube (straube.linux@gmail.com):
> > 
> > > The driver does not work anymore on my system. In dmesg there is:
> > 
> > > "r8188eu 1-4:1.0: _rtw_init_xmit_priv failed"
> > 
> > > I bisected it to commit f94b47c6bde ("staging: r8188eu: add check for
> > > kzalloc").
> > 
> > > ~/kernels/staging> git bisect bad
> > > f94b47c6bde624d6c07f43054087607c52054a95 is the first bad commit
> > 
> > > At the moment I have no time to look further into it.
> > 
> > See also
> > 
> > https://lore.kernel.org/linux-staging/YoyU4zXf45UpF1Tq@kroah.com/T/#mb5e56a285b8eb1ebb0e798462fc388cb02b4a7cc
> > 
> > Phil said in
> > 
> > https://lore.kernel.org/linux-staging/YoyU4zXf45UpF1Tq@kroah.com/T/#m7a21d460b2569f6b59965ecc3298a6337fa3458a
> > 
> 
> There is the posted patch [1]. I also have to apply it every time I want to
> test smth.
> 
> [1] https://lore.kernel.org/all/20220521204741.921-1-phil@philpotter.co.uk/

That patch is in linux-next and will be sent to Linus later this week.

thanks,

greg k-h
