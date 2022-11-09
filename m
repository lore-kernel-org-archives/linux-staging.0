Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA2B29B2
	for <linux-staging@lists.linux.dev>; Wed,  9 Nov 2022 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VpdNtU3cb37xXzV9sTyynd43haU0/uQaTTIosl+w+Vs=; b=o5dKZ60fvsHa/8H7A+lpjtUyi8
	O3+p9tUG4t4U8Cc/NAJF2UWn3hI4268wI8/fJP3UseE23YJLdfZ6id+pAiS3c5rzuZ+ZqrLUq+klV
	xy+EzrlJROMxf/eEUI+JTzy59HIBzFjx/NnLbb1Wl3zywEHm2jaorffCXvfKu9UHEZ/w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oslSJ-001v3D-Fu; Wed, 09 Nov 2022 14:49:27 +0100
Date: Wed, 9 Nov 2022 14:49:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Deepak R Varma <drv@mailo.com>
Cc: Dan Carpenter <error27@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: patches for staging:media drivers
Message-ID: <Y2uv56k515cKTXU4@lunn.ch>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
 <Y2oO7fU4whKr+3hb@kadam>
 <Y2q7tFF7YeX16H20@lunn.ch>
 <Y2tLZaPSUT45TF4f@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2tLZaPSUT45TF4f@qemulion>

On Wed, Nov 09, 2022 at 12:10:37PM +0530, Deepak R Varma wrote:
> On Tue, Nov 08, 2022 at 09:27:32PM +0100, Andrew Lunn wrote:
> > On Tue, Nov 08, 2022 at 11:10:21AM +0300, Dan Carpenter wrote:
> >
> > I cannot say anything about the media subsystem, but for networking
> > patches, i will be much more willing to help somebody going from
> > Outreach to being a full kernel developers if they decide to take on
> > something more than just some Coccinelle changes. If it looks like you
> > have the hardware and want to make it better, have a vision where the
> > driver should go, then you are likely to get more help from me. So if
> > media drivers are what you interested in, go buy some hardware which
> > uses one of the drivers in staging, look at the TODO file, and submit
> > bigger patches than just -1 to -ENOMEM.
> 
> Hello Andrew,
> Thank you so much for your kind advice and willingness to help a newbie
> become a valued kernel developer. I am committed to acquire necessary
> knowledge and skills to contribute more than current cleanup and minor
> correction patches. I am sure that the upcoming Coccinelle based project
> work [if I am shortlisted] will be much more complex and meaningful.
> 
> I will explore the staging directory to identify a hardware I can afford.
> I would welcome suggestion on a driver that is not much expensive and
> complex to start with. Anything for the networking subsystem???

Staging drivers for network tend to be USB dongles for WiFi. Some of
those drivers need throwing away and starting again, others need less
work. If you are interested in that, i would suggest asking on
linux-wireless@vger.kernel.org.

Another option might be pi433? The problem with that is, i don't know
how it fits into the rest of the network stack? Could it maybe fit
under ieee802154? Or is it just unique and needs to do its own thing?

      Andrew
