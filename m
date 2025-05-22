Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315E2F85B
	for <linux-staging@lists.linux.dev>; Thu, 22 May 2025 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919449; cv=none; b=rOARCPNbZAsR5pvui9nFLGv6UdH+fdjMuwJukiQcNcWfJM+yXYmmlN3KBdmRcMLWlFZx8BSa/VCp/b8ZAjZt80v61rF9r2zfnOS/w18XoVZkI9gkjp8kVABn+ExdZpahnJ49AO8LWtLF/Z2Ek3ebJHtLrtzK3qrErkKD7JLZLTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919449; c=relaxed/simple;
	bh=TRnQMiGSywGTvry+RmOU17bGkSLW04i4CIZ0IfklDL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRSOHFbT45YHQwwrV0u2fUb2tLUVoFr3tu9Z2dcIHpL7Sdc1EqjE7CkpmvEfjZqx0Y1wObVR+aqrwXbR+E/X1qjYwG9QvSBSKXViumS/WUhFlfAsEMzVCGKy5gDm9B47oU62I9eDGka0+/2fzQg1PZDUe2uhM8ZcKezabDohGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GD86eSCE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GD86eSCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3517CC4CEED;
	Thu, 22 May 2025 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747919448;
	bh=TRnQMiGSywGTvry+RmOU17bGkSLW04i4CIZ0IfklDL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GD86eSCEw/48hl4G0i0/Ab2mMIXQyS1t7E/8olyXv5KlFONBczYUKyiqdimBHEPEP
	 c3QSdlM2CBUYsqZ9CfXe74CfHX9SEjFOLj/iMOWquV3H6iENijhcyzQNCSrsY3sN/Y
	 zI7EuMXwySUFgr9+GvjVZjl1eIWwLbPJKIsSIZpY=
Date: Thu, 22 May 2025 15:10:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: gbphy: fix up const issue with the
 match callback
Message-ID: <2025052248-tattling-appetite-bfff@gregkh>
References: <2025052155-peddling-happier-f825@gregkh>
 <aC8e3ldqe6j2vxv7@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC8e3ldqe6j2vxv7@hovoldconsulting.com>

On Thu, May 22, 2025 at 02:55:58PM +0200, Johan Hovold wrote:
> On Wed, May 21, 2025 at 04:55:55PM +0200, Greg Kroah-Hartman wrote:
> > gbphy_dev_match_id() should be taking a const pointer, as the pointer
> > passed to it from the container_of() call was const to start with (it
> > was accidentally cast away with the call.)  Fix this all up by correctly
> > marking the pointer types.
> 
> This one too should have a:
> 
> Fixes: d69d80484598 ("driver core: have match() callback in struct bus_type take a const *")
> 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/staging/greybus/gbphy.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> > index 6adcad286633..ab8a1af36808 100644
> > --- a/drivers/staging/greybus/gbphy.c
> > +++ b/drivers/staging/greybus/gbphy.c
> > @@ -102,8 +102,8 @@ static int gbphy_dev_uevent(const struct device *dev, struct kobj_uevent_env *en
> >  }
> >  
> >  static const struct gbphy_device_id *
> > -gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
> > -		   struct gbphy_driver *gbphy_drv)
> > +gbphy_dev_match_id(const struct gbphy_device *gbphy_dev,
> > +		   const struct gbphy_driver *gbphy_drv)
> >  {
> >  	const struct gbphy_device_id *id = gbphy_drv->id_table;
> >  
> > @@ -119,8 +119,8 @@ gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
> >  
> >  static int gbphy_dev_match(struct device *dev, const struct device_driver *drv)
> >  {
> > -	struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
> > -	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
> > +	const struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
> > +	const struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
> 
> Making the dev pointers const is arguably a separate change, but I guess
> it's related enough:

Oops, nope, you are right, the dev pointer should not be const here, or
anywhere else, that's not needed, I got too energetic.  I'll respin this
and add the fixes: tag, thanks!

greg k-h
