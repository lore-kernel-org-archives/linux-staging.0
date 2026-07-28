Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CBE34A76F;
	Tue, 28 Jul 2026 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223045; cv=none; b=hxGPnZaPRKi7rk7QzsWk9u1X+OQ753IVd444eiOqbTa+K35bfImPB8vKGJ5AIYSwpjnJj53W6lpTucxQ77nlsvUrCni7b47/3WdgqmA4w9MtSsrKDHAza5DydZ+6gHRjvNfPrntevRTuzg+hTMYJwYdT3mHM5Gfx8uDwgGLn09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223045; c=relaxed/simple;
	bh=9y9YxHHgZv2mfHtTLUmFQp58np3N5C7LYIhRCMSgp9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifAYhikXhN2gbqHUyDzZCVdwGjPxA45wVLyQ7QlTRkIVrhEu6tehQAoDqMlqwTDz5napj65FpTXYXpkguZoLFdMNjMuNRme311z12ATqRH0ogWBcInLHcM7WvB155eb5/wMe41C3w16DHg422Ej+x5tS2FlgSWxjJh7sJBP/jC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mGk+MEbT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mGk+MEbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785041F000E9;
	Tue, 28 Jul 2026 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223044;
	bh=lZPuxgoWu6Op+1WU+qod13e/clfXxTim3FVV/HWqxIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mGk+MEbT41HGevX/6YnfBpPnqjyXj76fN1FZHlB5O4dY4cYRdXTZggeOEbfxP2lL/
	 BZOhrh03rW2rHMUEKeaS42qGilbpXzsXG5+M/hb7bdNWyRYAT68DVIt6RsJYhYy7vu
	 BwTjVdhJV6urwQdtwp60oDUij3Ld7nNt37GIFEdk=
Date: Tue, 28 Jul 2026 09:17:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: light: fix leak of cdev->name
Message-ID: <2026072842-protract-matcher-99b6@gregkh>
References: <20260726110039.3674948-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726110039.3674948-1-congnt264@gmail.com>

On Sun, Jul 26, 2026 at 06:00:39PM +0700, Cong Nguyen wrote:
> gb_lights_channel_config() builds the LED classdev name with kasprintf()
> and stores it in cdev->name for every channel during the configuration
> phase, which runs before the channel is registered.
> 
> That name was only released by __gb_lights_led_unregister(), i.e. only for
> a normal LED channel that was actually registered. It was therefore leaked
> in two cases:
> 
>   - a channel that is configured but never registered, e.g.
>     channel_attr_groups_set() fails, the flash configuration fails, or a
>     later channel in the same light fails to configure and the whole light
>     is torn down; the release path calls gb_lights_channel_unregister()
>     (which returns early because the channel is not registered) and then
>     gb_lights_channel_free();
> 
>   - a flash, torch or indicator channel, whose unregister path
>     (__gb_lights_flash_led_unregister()) never releases cdev->name at all,
>     so the name leaks even on a successful teardown.
> 
> cdev->name is a configuration-phase allocation, like channel->color_name
> and channel->mode_name. Free it in gb_lights_channel_free() next to
> those, since that runs unconditionally on every teardown path, and drop
> the special case free from __gb_lights_led_unregister().
> gb_lights_channel_unregister() is only ever called from
> gb_lights_channel_release(), immediately followed by
> gb_lights_channel_free(), so the name is still released on the registered
> path and is freed exactly once.
> 
> Commit 04820da21050 ("staging: greybus: light: Release memory obtained by
> kasprintf") fixed the leak for the registered normal-LED path only; this
> covers the remaining cases.
> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Cool, but how did you find this issue?  What tool did you use?

thanks,

greg k-h
