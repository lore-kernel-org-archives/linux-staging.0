Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4829258F
	for <linux-staging@lists.linux.dev>; Thu, 26 Jan 2023 16:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28DCC4339B;
	Thu, 26 Jan 2023 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674750667;
	bh=Tm20dHbAFf/pXPytexrgAnAHrgWKBBgE48u5vZAscGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1ecaBNcHoRmufYHj10lOotbnn0rWIQC85lVIDoK4Jm1+YCHjDUbSzDYa1M7Lb2eZ
	 5zKnI4ZD6kA0Sx3frT3CCnQhLrRlyTcK2v/Tysoqavyjp2/XGir4/+wORpaH9Di7NP
	 X875HViKzvPZ4wp3hh21NVyv8azAYawVFTzXj5WBkP6ScuV/NFaipOxjxoZMEsvPow
	 Oq80oSIW4Ng994V3as2N1R37s7/KdSBZOK0qTummzoIvwhx2VMaA342NYcdZtQ0Voa
	 OpSYzhQrqciYSeDQvRYwJ5vY24jDZatfR0MgTeoqE4uP/w0LRqaHYBANBXcRT02F7w
	 D7Osl9C/KWIdQ==
Date: Thu, 26 Jan 2023 16:30:59 +0000
From: Lee Jones <lee@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Antonino Daplas <adaplas@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Robin van der Gracht <robin@protonic.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y9Kqw7ey6I7rQuZu@google.com>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
 <Y9KNziZJxMjCffbs@google.com>
 <Y9KmTFl5YbypgMZy@ravnborg.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9KmTFl5YbypgMZy@ravnborg.org>

On Thu, 26 Jan 2023, Sam Ravnborg wrote:

> Hi Lee,
> On Thu, Jan 26, 2023 at 02:27:26PM +0000, Lee Jones wrote:
> > On Sat, 07 Jan 2023, Sam Ravnborg via B4 Submission Endpoint wrote:
> > 
> > > From: Sam Ravnborg <sam@ravnborg.org>
> > > 
> > > With all users gone remove the deprecated fb_blank member in
> > > backlight_properties.
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Lee Jones <lee@kernel.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > ---
> > >  drivers/video/backlight/backlight.c |  2 --
> > >  include/linux/backlight.h           | 22 ----------------------
> > >  2 files changed, 24 deletions(-)
> > 
> > Applied, thanks
> 
> Some of the dependent patches in this series are not yet applied.
> I have them queued up for processing this weekend, but I missed the -rc6
> window for drm-misc so they will likely not hit upstream in the upcoming
> merge window.
> I can try to expedite it.
> 
> But if you have not yet pushed it, please revert this patch.
> Then I will resend only when the remaining patches are upstream.

Thanks for the info.  Dropped.

-- 
Lee Jones [李琼斯]
