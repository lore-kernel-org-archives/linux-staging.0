Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF4D23A5
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 09:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE8BC433EF;
	Wed, 22 Feb 2023 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677057665;
	bh=TgIaH9NMwPd4IhHNqQrT8ss2+K0UDdLN1lq1CLdEZCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w1SvIo8TA/ZkeGpPbu4v1va1H22ECi2GS/Kb6d3Y+5sxapIw0kZYFBUWTzJetBkwd
	 qXnzkkqXCQzjsCwmS+UnCzOapWwSpROaY3AUeTHvlaAurUoVyye5MREZkerH8Z06Pe
	 XxsAVLaZoKjjjgDSX6y81ebjN5UrdKXW6QZ8Oqss=
Date: Wed, 22 Feb 2023 10:21:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/Xefn/76JW1C03d@kroah.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/UbMH5tXDgsvSbD@kroah.com>
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>

On Wed, Feb 22, 2023 at 10:19:47AM +0200, Svyatoslav Ryhel wrote:
> вт, 21 лют. 2023 р. о 21:27 Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> пише:
> >
> > On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> > > FM34NE is digital sound processing chip used for active
> > > noise suppression mainly on ASUS Transformers.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/Kconfig          |   2 +
> > >  drivers/staging/Makefile         |   1 +
> > >  drivers/staging/dsp/Kconfig      |   7 +
> > >  drivers/staging/dsp/Makefile     |   2 +
> > >  drivers/staging/dsp/dsp-fm34ne.c | 364 +++++++++++++
> > >  drivers/staging/dsp/dsp-fm34ne.h | 845 +++++++++++++++++++++++++++++++
> > >  6 files changed, 1221 insertions(+)
> > >  create mode 100644 drivers/staging/dsp/Kconfig
> > >  create mode 100644 drivers/staging/dsp/Makefile
> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.c
> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.h
> >
> >
> > Sorry, but why is this going into drivers/staging/ at all?  What is
> > needed to be done to get this out of staging?  Why not do that work
> > right now?  At the least, we need a TODO file in the directory that
> > lists what needs to be done and who is responsible for it.
> 
> Because this driver sets up fm34 and switches it to bypass mode allowing
> sound to work on the device. There is no dsp framework in kernel which could
> be called to operate dsp from the actual sound codec. (If there is, I
> would be glad
> if you show me). Fm34 must be active only on DMIC use, all other cases require
> it to be in bypass.

That does not explain at all why this needs to go into drivers/staging/
and not the normal portion of the kernel.  Why this specific location?
What is wrong with it that requires it to go here?

In other words, you need to document _WHY_ it must go here as it is not
obvious at all.

thanks,

greg k-h
