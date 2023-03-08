Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D837B
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 06:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2B6C433D2;
	Wed,  8 Mar 2023 06:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678257174;
	bh=FGjfVmVwQrVJ+ulcabVxrdEkeJD5iSPljTjshiF2fqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTL3dPbgeOEIB4nxjW12Ec1xT8nMnQIbMBhPIvsMxWDIgdmGPGwgWwwHm4YcV+bXL
	 0EabW+X1bAHb7rVkB54WXX/NCjHciwer+jleuOPKpj6yQWVrDikPefQWUzthP4ALED
	 ux7HpCGmi8Mlos0Iz+6Lf6YRxH3R3bR/znjMQN3g=
Date: Wed, 8 Mar 2023 07:32:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Jes Sorensen <Jes.Sorensen@gmail.com>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>, linux-staging@lists.linux.dev
Subject: Re: the future of r8188eu (was: Re: [PATCH 1/2] staging: rtl8723bs:
 Fix key-store index handling)
Message-ID: <ZAgsE210Cna2hGet@kroah.com>
References: <20230306153512.162104-1-hdegoede@redhat.com>
 <f23d6700b79500e2da9875964aee356c60a60529.camel@hadess.net>
 <3a17dd23-c396-7cfb-3cfa-19cdec39f2ff@redhat.com>
 <20230307204010.xl6s5wka2izoncbm@viti.kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307204010.xl6s5wka2izoncbm@viti.kaiser.cx>

On Tue, Mar 07, 2023 at 09:40:10PM +0100, Martin Kaiser wrote:
> Hi all,
> 
> Thus wrote Hans de Goede (hdegoede@redhat.com):
> 
> > Note I have heard that the r8188eu is now (starting with 6.2 ?) supported
> > by one of the non staging realtek wifi drivers. So I think that maybe it
> > can just be removed from staging altogether ?
> 
> thanks for bringing this up.
> 
> Indeed, the r8xxxu driver does now support the rtl8188eu chipset. The
> code for this chip has landed in Linus' tree for 6.3-rc1.
> 
> The r8xxxu driver uses mac80211 and seems to work well (at least for
> me). The Kconfig entry says that features like power management are
> missing, this is supported by r8188eu.
> 
> So this raises the question about the future of r8188eu. It might have
> more features, which are probably not well tested, but its integration
> into the rest of the kernel is far behind rtl8xxxu. A lot of people (myself
> included) have submitted cleanups for r8188eu and improved it. Still,
> when 6.3 is released, it's likely that the users of rtl8188eu-based
> dongles will switch to rtl8xxxu.
> 
> I guess we might have to bite the bullet and give up on r8188eu...
> 
> What do you think?

Yes, we need to drop the staging driver if there is a "real" kernel
driver that supports the same hardware.  We can't have multiple drivers
in the kernel that try to bind to the same device, we've done that in
the past and it causes nothing but problems.

I'll go make up a patch now to drop the staging driver, thanks for
letting me know.

greg k-h
