Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8631F0E3F;
	Sat, 21 Dec 2024 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734787636; cv=none; b=e3Afjwxzi4w6aDdTl68zlo5U8QJLYiZXqEHPeLIBIF61bWfNAE/Qxi1OTkkgSShrLB8hPsrF+jnJgp4wC0dvAH2LZz+ZqtfTW7cEBbHeZNtNcGDe7hrRVrQ4ODCZzw3tae9u1ivqabB4qZOtjzPafFgJWVh7TQ+MO+YJaZTOgk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734787636; c=relaxed/simple;
	bh=IrQfaWG0S34gcasdLD+2ibOyBB7hqqsBOKwtZ+kfCs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhUgyM6FUZX+s3aMq4pjfDi1n6PcW0H7cFvbczzPlUA4LxwvP5LPBAm7tt4kOJ45C51G4dmEhV7PUaZZ58kRiC3t/GdF743CiKKlKeKEgygnywZASJHJ/8ZXpgugrnlt2EaCuRCHthp6XDfyPsrn8ffBCQMiuoWc9hbAkUYXi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yr8zFJfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yr8zFJfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED831C4CECE;
	Sat, 21 Dec 2024 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734787635;
	bh=IrQfaWG0S34gcasdLD+2ibOyBB7hqqsBOKwtZ+kfCs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yr8zFJfZjEmZZook/3jPtNQfYRcxXtLDJO/X4x8LDORU0crcb6tnEHE0BlvdAxVqh
	 m0M94gEHk94RTy9UWDyIdMP1nZgsPPI7J44yqvsOqqqqotxUB0tkCtqfNRNq5XCCSp
	 W95UGOwfamKPYPTlHQJVURVoOmumBXQxoiKoANFU=
Date: Sat, 21 Dec 2024 14:27:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nihar Chaithanya <niharchaithanya@gmail.com>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org, roheetchavan@gmail.com,
	arnd@arndb.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] staging: gpib: cb7210: Add error handling
Message-ID: <2024122150-overarch-cough-a86b@gregkh>
References: <20241221091121.35476-1-niharchaithanya@gmail.com>
 <2024122119-unclamped-affecting-0e0a@gregkh>
 <2024122133-outskirts-causing-099a@gregkh>
 <fc10d4ac-8ad0-4756-8d65-8700aa7f8f21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc10d4ac-8ad0-4756-8d65-8700aa7f8f21@gmail.com>

On Sat, Dec 21, 2024 at 04:59:31PM +0530, Nihar Chaithanya wrote:
> 
> On 21/12/24 15:13, Greg KH wrote:
> > On Sat, Dec 21, 2024 at 10:25:41AM +0100, Greg KH wrote:
> > > On Sat, Dec 21, 2024 at 02:41:25PM +0530, Nihar Chaithanya wrote:
> > > > The if condition in cb7210_init_module() would always fail as
> > > > the value of err is constantly 0. The function
> > > > cb_pcmcia_init_module() can be refactored into a single line,
> > > > and can be replaced entirely with pcmcia_register_driver().
> > > > 
> > > > Replace redundant cb_pcmcia_init_module() with
> > > > pcmcia_register_driver() which returns appropriate error code if
> > > > it fails. Handle the error if it fails and print the debug message.
> > > > 
> > > > This issue was reported by Coverity Scan.
> > > > Report:
> > > > CID 1635894: (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
> > > > dead_error_line: Execution cannot reach this statement: return -1;.
> > > > 
> > > > Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> > > > ---
> > > > v1 --> v2: Replaced the redundant cb_pcmcia_init_module() with
> > > > 	   pcmcia_register_driver().
> > > > 
> > > >   drivers/staging/gpib/cb7210/cb7210.c | 13 ++++---------
> > > >   1 file changed, 4 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
> > > > index 63df7f3eb3f3..abd6632d8448 100644
> > > > --- a/drivers/staging/gpib/cb7210/cb7210.c
> > > > +++ b/drivers/staging/gpib/cb7210/cb7210.c
> > > > @@ -1351,12 +1351,6 @@ static struct pcmcia_driver cb_gpib_cs_driver = {
> > > >   	.resume		= cb_gpib_resume,
> > > >   };
> > > > -int cb_pcmcia_init_module(void)
> > > > -{
> > > > -	pcmcia_register_driver(&cb_gpib_cs_driver);
> > > > -	return 0;
> > > > -}
> > > > -
> > > >   void cb_pcmcia_cleanup_module(void)
> > > >   {
> > > >   	DEBUG(0, "cb_gpib_cs: unloading\n");
> > > > @@ -1526,11 +1520,12 @@ static int __init cb7210_init_module(void)
> > > >   	gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
> > > >   	gpib_register_driver(&cb_pcmcia_accel_interface, THIS_MODULE);
> > > >   	gpib_register_driver(&cb_pcmcia_unaccel_interface, THIS_MODULE);
> > > > -	err += cb_pcmcia_init_module();
> > > > +	err = pcmcia_register_driver(&cb_gpib_cs_driver);
> > > >   #endif
> > > > -	if (err)
> > > > +	if (err) {
> > > > +		pr_err("cb7210: registering PCMCIA driver with the bus core failed\n");
> > > >   		return -1;
> > > Not your issue, but "-1" is not a valid error number, shouldn't this be
> > > returning a real error (i.e. the one that was returned?)
> > > 
> > > And err += is crazy, thanks for removing that, BUT you forgot to unwind
> > > the previous functions so now if pcmcia_register_driver() fails, you
> > > have a semi-registered system and then the module will unload (as init
> > > fails) and bad things will happen :(
> So I need be unregistering the driver if the pcmcia_register_driver() fails
> right?

Yes, all of them.

thanks,

greg k-h
