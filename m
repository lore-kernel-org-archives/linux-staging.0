Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113983222
	for <linux-staging@lists.linux.dev>; Thu, 26 Jan 2023 16:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=YwsGbP8UqP9PCAPALAZHuxiR6vSJEQg7mBCwK/505D4=;
	b=Qus+ZU4RfOcNTS5rGnxfoQBcYpzPyF+aRz3PIQVZfjvTUjFpmtXeWmvp4rw3S7WD4kIU1isAjNCvI
	 qUFaf54lfngcQlsAyzn24QB3jg6dJQZkwRy6ly958KbRgFoeCt50M1sQ+1V2A0na3zKwfSSZ+BYCfi
	 svYtBApqryHA65/AytjF3mjQIlcOArwXu3tumrruNQocjmqLszEyWasAT29despRAzu0aObcNzXFBK
	 v0ytzr0e6G8s8tDhyint0ydbcValxEsn4ABDRtgPQ0br5+OrWW6rVQPIsnBDgzQ8nRQ8WiuKVDc8U0
	 nHkv92BxdqWcfXVuUnCtBBmCycCDUXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=YwsGbP8UqP9PCAPALAZHuxiR6vSJEQg7mBCwK/505D4=;
	b=52qvCSVoaxzKZeZmgUDnZYFeQCCVuo6KfDcOqqSiktTnnPsDDyAxqd+8jTSlziHCfI76MLtMpL0Iy
	 vITTQDACA==
X-HalOne-ID: 27718327-9d94-11ed-b665-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id 27718327-9d94-11ed-b665-7703b0afff57;
	Thu, 26 Jan 2023 16:11:58 +0000 (UTC)
Date: Thu, 26 Jan 2023 17:11:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee@kernel.org>
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
Message-ID: <Y9KmTFl5YbypgMZy@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
 <Y9KNziZJxMjCffbs@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9KNziZJxMjCffbs@google.com>

Hi Lee,
On Thu, Jan 26, 2023 at 02:27:26PM +0000, Lee Jones wrote:
> On Sat, 07 Jan 2023, Sam Ravnborg via B4 Submission Endpoint wrote:
> 
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > With all users gone remove the deprecated fb_blank member in
> > backlight_properties.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > ---
> >  drivers/video/backlight/backlight.c |  2 --
> >  include/linux/backlight.h           | 22 ----------------------
> >  2 files changed, 24 deletions(-)
> 
> Applied, thanks

Some of the dependent patches in this series are not yet applied.
I have them queued up for processing this weekend, but I missed the -rc6
window for drm-misc so they will likely not hit upstream in the upcoming
merge window.
I can try to expedite it.

But if you have not yet pushed it, please revert this patch.
Then I will resend only when the remaining patches are upstream.

	Sam
