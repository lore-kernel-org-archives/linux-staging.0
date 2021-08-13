Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D455672
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 06:36:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E64B960F57;
	Fri, 13 Aug 2021 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628836606;
	bh=OWcCVrWs+Nrv4OBKjq7wxpgmmBG8z8MYon/afD2MLQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkvYzqPiCf++jHMx0GFAmCe9nW2fcxCI2cYmkFxWe1NX5aDffwgOI6pzTin6lh5dW
	 ZcnIF9eIzz2fvnkm6W1qKJB5zTqtOjqd82Co12V0K3DSEWY6soayHJXG46/WFamS3N
	 yFAM8vQ6iufxcNVarUCoOQx3VU8hoi9h8LrszhgY=
Date: Fri, 13 Aug 2021 08:36:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>, hdegoede@redhat.com,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove cfg80211 residuals
Message-ID: <YRYS+4I58YRnAepF@kroah.com>
References: <20210812132725.18404-1-fabioaiuto83@gmail.com>
 <c2abe840-98b4-cddd-e427-2243d456ec19@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2abe840-98b4-cddd-e427-2243d456ec19@lwfinger.net>

On Thu, Aug 12, 2021 at 11:51:56AM -0500, Larry Finger wrote:
> On 8/12/21 8:27 AM, Fabio Aiuto wrote:
> > remove cfg80211 implementation residuals:
> > an headeer file and build condition in Kconfig
> > file.
> > 
> > Signed-off-by: Fabio Aiuto<fabioaiuto83@gmail.com>
> > ---
> > Dear Greg and Larry,
> > I thought that cfg80211 had been implemented.
> > Should we add a TODO file telling developers to
> > do it in the near future? Is that a condition
> > for mainlining r8188eu? If so please drop this
> > patch and sorry for noise.
> 
> I thought so too, but something has gone very wrong. Please hold off on this
> patch until I figure out why cfg80211 is not being used.

That's odd, I'll drop this from my queue, we should be using cfg80211
