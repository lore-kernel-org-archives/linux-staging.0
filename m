Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571502901
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 15:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E4FC385A0;
	Fri, 22 Apr 2022 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650640395;
	bh=GSg4cKn8K7Kb7YLezUWWALENHN/BmeeuDFc8lszaIh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaMbMs6JoP5KhJZRh3Ctuhun2xY4R+R2Q5z295CSpRETPtM58rloMPd1zp2Kl3Mm7
	 DtQf1b+4KF/puxCxVEtniCviypLvQyqRCVt6mQcbyWyeZPwqHDrYZxU7Rn1g8z/iat
	 rtpH6X3Hb69cBqLmQ8GL8s4L+cAW+/PKwUYO1I5k=
Date: Fri, 22 Apr 2022 17:13:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Adrien Thierry <athierry@redhat.com>,
	Maxime Ripard <mripard@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] staging: bcm2835-audio: delete TODO
Message-ID: <YmLGB8bhHs8cRFVM@kroah.com>
References: <20220420174401.305964-1-athierry@redhat.com>
 <YmK+aiaaVLtadGVT@kroah.com>
 <97917592-6e11-dd82-3f41-893da6b15f6a@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97917592-6e11-dd82-3f41-893da6b15f6a@i2se.com>

On Fri, Apr 22, 2022 at 04:58:22PM +0200, Stefan Wahren wrote:
> Hi Greg,
> 
> Am 22.04.22 um 16:40 schrieb Greg Kroah-Hartman:
> > On Wed, Apr 20, 2022 at 01:44:00PM -0400, Adrien Thierry wrote:
> > > Delete TODO since all tasks were completed:
> > > 
> > > 1 - fixed here:
> > > https://lore.kernel.org/all/20220408150359.26661-1-athierry@redhat.com/
> > > 
> > > 2 - there are no remaining checkpatch.pl errors or warnings
> > > 
> > > Signed-off-by: Adrien Thierry <athierry@redhat.com>
> > > ---
> > >   drivers/staging/vc04_services/bcm2835-audio/TODO | 10 ----------
> > >   1 file changed, 10 deletions(-)
> > >   delete mode 100644 drivers/staging/vc04_services/bcm2835-audio/TODO
> > > 
> > > diff --git a/drivers/staging/vc04_services/bcm2835-audio/TODO b/drivers/staging/vc04_services/bcm2835-audio/TODO
> > > deleted file mode 100644
> > > index b85451255db0..000000000000
> > > --- a/drivers/staging/vc04_services/bcm2835-audio/TODO
> > > +++ /dev/null
> > > @@ -1,10 +0,0 @@
> > > -*****************************************************************************
> > > -*                                                                           *
> > > -*                           TODO: BCM2835-AUDIO                             *
> > > -*                                                                           *
> > > -*****************************************************************************
> > > -
> > > -1) Revisit multi-cards options and PCM route mixer control (as per comment
> > > -https://lore.kernel.org/lkml/s5hd0to5598.wl-tiwai@suse.de)
> > > -
> > > -2) Fix the remaining checkpatch.pl errors and warnings.
> > > -- 
> > > 2.35.1
> > > 
> > > 
> > Great, so now it can be merged to the real part of the kernel?  If not,
> > what's left for that to happen?
> 
> bcm2835-audio depends on interface/vchiq_arm in a parallel directory. Its
> TODO list is a little bit longer.

Ah, yeah, still more work to do :(
