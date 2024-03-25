Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D9F5C89
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711392659; cv=none; b=VMpy6gUK/en8gBs3vIvJCpuq9VqQ/sayJOVY0BZC5JtyYt53FRu9Ws8ang9tQ09kJwh86YalQmqm+Z0T+btwIKI80mAftaJXZYh597Nd517fLSsK941TLafjPL1RB1jc5mgNn9dcPDDQkoWHv/sQaYkSCuZpWs7J81O2Jhu/KlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711392659; c=relaxed/simple;
	bh=BF4UHxrA7PcCQf24IMBehx8zXAO2lhS3FFGTZokYJAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHlrH12bSAdmgF3g56YAj+W6j2SmMimNPs6xfbh5dvDDB7mwhwrjOtsuEOAn0s9u+JEjEylAYOO68IXu6RUQyJAljBjEi1HIJlFlwxyJRu7xj20Hx/4OvW872g9u9+yRZwUwMqdySD6SBX+Scq+jlwLgK7g81d4pGbE7Mbtuhqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mukT9J7o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mukT9J7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46112C433F1;
	Mon, 25 Mar 2024 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711392658;
	bh=BF4UHxrA7PcCQf24IMBehx8zXAO2lhS3FFGTZokYJAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mukT9J7oMc9MKKa0ufROyUOdHrvL4bfExuw7RufQ+vAikPFHiU7Wv+Ag9hvUDIdyU
	 M7CAk/kt4O0B1T6VV53gG+cH4t2tkdqeywDIy7iVgiV1qUHrbgaOTaILvI0sboW7Y+
	 C6hwPICsGwhbt8slWX/uhGN5dt8eOzkUemJ5DlRg=
Date: Mon, 25 Mar 2024 19:50:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alex Elder <elder@ieee.org>
Cc: Rui Miguel Silva <rui.silva@linaro.org>, greybus-dev@lists.linaro.org,
	Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	linux-staging@lists.linux.dev, Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH] greybus: lights: check return of get_channel_from_mode
Message-ID: <2024032510-planner-caterer-3693@gregkh>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
 <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>

On Mon, Mar 25, 2024 at 01:31:34PM -0500, Alex Elder wrote:
> On 3/25/24 12:25 PM, Greg Kroah-Hartman wrote:
> > On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
> > > If channel for the given node is not found we return null from
> > > get_channel_from_mode. Make sure we validate the return pointer
> > > before using it in two of the missing places.
> > > 
> > > This was originally reported in [0]:
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > > 
> > > [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
> > > 
> > > Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> > > Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> > > Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> > > Suggested-by: Alex Elder <elder@ieee.org>
> > > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > > ---
> > >   drivers/staging/greybus/light.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> > > index c6bd86a5335a..6f10b9e2c053 100644
> > > --- a/drivers/staging/greybus/light.c
> > > +++ b/drivers/staging/greybus/light.c
> > > @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
> > >   		channel = get_channel_from_mode(channel->light,
> > >   						GB_CHANNEL_MODE_TORCH);
> > > +	if (!channel)
> > > +		return -EINVAL;
> > > +
> > >   	/* For not flash we need to convert brightness to intensity */
> > >   	intensity = channel->intensity_uA.min +
> > >   			(channel->intensity_uA.step * channel->led->brightness);
> > > @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
> > >   	}
> > >   	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
> > > -	WARN_ON(!channel_flash);
> > > +	if (WARN_ON(!channel_flash))
> > > +		return -EINVAL;
> > 
> > We should NOT crash machines just because of this, the WARN_ON() should
> > be removed and just properly handle the error please.
> 
> Greg, WARN_ON() doesn't normally crash the machine.  That said,
> it's reasonable to remove the WARN_ON().

The huge majority of running Linux systems in the world run with
panic-on-warn enabled, including the one in your pocket :(

> I think the purpose of the warning is that this is a case that
> should "never happen," so if it does, it's making some noise.

Making noise by rebooting the box is not good.

thanks,

greg k-h
