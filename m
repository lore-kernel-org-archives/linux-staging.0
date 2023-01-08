Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D91FAF
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 09:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Oybl0kFzJk1OHKBfarCPAX+ldUYM8qIDtwFbpLc8Wqg=;
	b=OMBp7D4Q1taCLAC26KHZDvW1MnN8LDDXjmMIinVqeHcS40c2e/r5bEtpEA1YOrQKsE8uJwyy+dzX1
	 4JKIKJwtxexTCDBai/T/gN1pQFF6GZA/r8/jGnp3ACvSRRpcV8FriJldv+JY/8nNw3PBeN3zBHgAQS
	 gqwLkZC+F6kFgl05fAfdYG8tRkpCGkZwSL5dkqVYiQSgQQ/aMCdQHrSn/VegiB4aoijKO5TFJ9bump
	 HWqdwba3Kn4ZlYTE9d0fRPV50RONoQmTzzLdRTRPjJ82VVzJsAfRc4taGrrIqPH/zeF2yTJogJvsBY
	 Akt7pBD48e76OSMuArRnMD0vHtnM3jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Oybl0kFzJk1OHKBfarCPAX+ldUYM8qIDtwFbpLc8Wqg=;
	b=1bH+enBd3Rzx4lTdU2Ew/3w4RNpW2B4i5DDhzGEZCxhwTP59EcA+tuKMI2XuhVP+RWekbgj/wgKSQ
	 SVYt0YTBw==
X-HalOne-ID: f2a3e065-8f36-11ed-9179-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id f2a3e065-8f36-11ed-9179-7703b0afff57;
	Sun, 08 Jan 2023 09:29:30 +0000 (UTC)
Date: Sun, 8 Jan 2023 10:29:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Robin van der Gracht <robin@protonic.nl>
Cc: Stephen Kitt <steve@sk2.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Antonino Daplas <adaplas@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Robin van der Gracht <robin@protonic.nl>,
	Miguel Ojeda <ojeda@kernel.org>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 12/15] auxdisplay: ht16k33: Introduce
 backlight_get_brightness()
Message-ID: <Y7qM+ZlG5gQiOW4K@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
 <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>

Hi Robin.

On Sat, Jan 07, 2023 at 10:02:38PM +0100, Miguel Ojeda wrote:
> On Sat, Jan 7, 2023 at 7:26 PM Sam Ravnborg via B4 Submission Endpoint
> <devnull+sam.ravnborg.org@kernel.org> wrote:
> >
> > Introduce backlight_get_brightness() to simplify logic
> > and avoid direct access to backlight properties.
> 
> Note: Stephen sent this one too a while ago (with some more details in
> the commit message, which is always nice); and then he sent yesterday
> v2 [1] (to mention the functional change with `BL_CORE_SUSPENDED`
> [2]).
Thanks for the pointers. I will try to move forward with Stephen's
patches.
> 
> Anyway, if it goes via drm-misc, feel free to have my:
> 
>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Though it would be nice to have Robin test the change.

Robin - can I get your ack to apply Stephen's original v2 patch to
drm-misc?

	Sam

> 
> Thanks!
> 
> [1] https://lore.kernel.org/lkml/20230106143002.1434266-1-steve@sk2.org/
> [2] https://lore.kernel.org/lkml/CANiq72kRhmT37H1FAGYGny83ONYXeqJuO8ZPbym0ajQOWKY4Kw@mail.gmail.com/
> 
> Cheers,
> Miguel
