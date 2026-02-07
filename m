Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB395FDA7;
	Sat,  7 Feb 2026 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770465432; cv=none; b=VmxSAUkHQi1cHoZVSMlfsbXFwdOOVVzPOtEz06A3vdUccezcvCPIXSCRIolwMYzkBja2tLhFSvA3pRLi/nEL2M/FNViyKIekxwDoA+7k9utAAwJNpOcsW0QcKqbRLaZxlcfGvAfniElFv3njB6AH+bj6jhHtbJWEVVqfIt+b0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770465432; c=relaxed/simple;
	bh=uMeAp7jw/NOelCfdYtlH7uNU0f8JAeKXDat9sAWeSV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2ZV9DgrByVcSqvtTRUhQMi2qS0XYGUE3lfkPWOkI8j5ivLuhh6OCYHekUlXJfrlY1xtELkeuFMuEmK+vJvKQfkD3nIKA8axwfGmx8ySW4Zg9DKT8BMAbnKVhg7GcOLEI+ExK92QT9rLObCbV0m1fQuoQZeLpGSxQ4v0BveO6Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fz68kCPB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fz68kCPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F6CC116D0;
	Sat,  7 Feb 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770465432;
	bh=uMeAp7jw/NOelCfdYtlH7uNU0f8JAeKXDat9sAWeSV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fz68kCPB9KIwlpAJEddUBnAOdmfyJ3+odeVO6oCyJnyqbRjB2xeXb8yCQBwcaL+wY
	 pmYAbD1iSMNP4gpT2UT5By6YxMPxofNtxxRzuoZnlLeLEPuU9YTBGjE1fMlTp4BcRs
	 swZUFB7kRHbVQjnEuu3tOnJiRAn3wJbaeYMR1NH4=
Date: Sat, 7 Feb 2026 12:57:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: most: dim2: convert pr_info/err/warn to
 dev_info/err/warn
Message-ID: <2026020726-ruckus-imperfect-6ca5@gregkh>
References: <20260207023433.3935-1-zeeshanahmad022019@gmail.com>
 <2026020759-conductor-going-669d@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020759-conductor-going-669d@gregkh>

On Sat, Feb 07, 2026 at 12:56:15PM +0100, Greg Kroah-Hartman wrote:
> On Sat, Feb 07, 2026 at 07:34:32AM +0500, Zeeshan Ahmad wrote:
> > The dim2 driver currently uses generic pr_* logging macros. Hardware
> > drivers should use the device-specific dev_* logging macros to provide
> > better context in the system logs, especially in systems with multiple
> > controller instances.
> > 
> > This patch converts all applicable logging calls in dim2.c to use the
> > proper device-specific APIs.
> > 
> > Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
> > ---
> > v3:
> >  - Removed "staging-next" and redundant "[PATCH]" from the subject line.
> >  - Shortened commit message lines to stay under 75 characters.
> >  - Added this changelog below the "---" as suggested by Ethan Tidmore.
> >  - Cleaned up temporary submission notes from the permanent commit body.
> > v2:
> >  - Rebased against the staging-next branch.
> >  - Fixed CC list to include relevant maintainers.
> > 
> >  drivers/staging/most/dim2/dim2.c | 44 ++++++++++++++++----------------
> >  1 file changed, 22 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> > index 80af965356d0..4bcafda481f9 100644
> > --- a/drivers/staging/most/dim2/dim2.c
> > +++ b/drivers/staging/most/dim2/dim2.c
> > @@ -246,9 +246,9 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
> >  {
> >  	u8 *data = mbo->virt_address;
> >  
> > -	pr_info("Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
> > +	dev_info(&dev->dev, "Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
> 
> My review comments from your v1 patch remain the same here.

And note, that's the problem with going "too fast", you spent time
respinning patches without allowing others to review the original patch.
Please slow down and send updates maybe once a week.  There is no rush
here.

thanks,

greg k-h
