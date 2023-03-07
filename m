Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8733E9
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 20:42:42 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1pZe6U-0000EO-SH; Tue, 07 Mar 2023 21:40:10 +0100
Date: Tue, 7 Mar 2023 21:40:10 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
	linux-staging@lists.linux.dev
Subject: the future of r8188eu (was: Re: [PATCH 1/2] staging: rtl8723bs: Fix
 key-store index handling)
Message-ID: <20230307204010.xl6s5wka2izoncbm@viti.kaiser.cx>
References: <20230306153512.162104-1-hdegoede@redhat.com>
 <f23d6700b79500e2da9875964aee356c60a60529.camel@hadess.net>
 <3a17dd23-c396-7cfb-3cfa-19cdec39f2ff@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a17dd23-c396-7cfb-3cfa-19cdec39f2ff@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi all,

Thus wrote Hans de Goede (hdegoede@redhat.com):

> Note I have heard that the r8188eu is now (starting with 6.2 ?) supported
> by one of the non staging realtek wifi drivers. So I think that maybe it
> can just be removed from staging altogether ?

thanks for bringing this up.

Indeed, the r8xxxu driver does now support the rtl8188eu chipset. The
code for this chip has landed in Linus' tree for 6.3-rc1.

The r8xxxu driver uses mac80211 and seems to work well (at least for
me). The Kconfig entry says that features like power management are
missing, this is supported by r8188eu.

So this raises the question about the future of r8188eu. It might have
more features, which are probably not well tested, but its integration
into the rest of the kernel is far behind rtl8xxxu. A lot of people (myself
included) have submitted cleanups for r8188eu and improved it. Still,
when 6.3 is released, it's likely that the users of rtl8188eu-based
dongles will switch to rtl8xxxu.

I guess we might have to bite the bullet and give up on r8188eu...

What do you think?

Thanks,
Martin
