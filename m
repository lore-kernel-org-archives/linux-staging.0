Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC811A733;
	Wed, 18 Oct 2023 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LPOr7bru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0335BC433C8;
	Wed, 18 Oct 2023 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697635396;
	bh=joKmWNY9VbWhIfQ/mKSkRyaTHyCBreEtFSASbGm5sak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPOr7bruIYPbgt1xPhFtXldnnWQppBGI8uYTAkw1/Zbx/VLmsRGknJ6/ERtpXYKi3
	 JqM+yJCjFHWewSsb78yJKr98fUMBOcaHYBYptgp7ZNWRgA6foR7QVcBCsbgW/NWsjS
	 Uw+kFQ6UWji/O4jfJ+zX12tbmh1MoAAIENzkZt/w=
Date: Wed, 18 Oct 2023 15:23:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dorcas Litunya <anonolitunya@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	dan.carpenter@linaro.org, andi.shyti@linux.intel.com,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: sm750fb: Remove unused return value in
 program_mode_registers()
Message-ID: <2023101836-earful-freight-9c51@gregkh>
References: <cover.1697619623.git.anonolitunya@gmail.com>
 <492e63bbc58147fb534930ef9e1fb5d844ae8769.1697619623.git.anonolitunya@gmail.com>
 <4b7129ae-27f9-7ff4-845-9c327aff488c@inria.fr>
 <ZS/Wr9ShnEe3umeY@dorcaslitunya-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS/Wr9ShnEe3umeY@dorcaslitunya-virtual-machine>

On Wed, Oct 18, 2023 at 03:59:27PM +0300, Dorcas Litunya wrote:
> On Wed, Oct 18, 2023 at 02:06:41PM +0200, Julia Lawall wrote:
> > 
> > 
> > On Wed, 18 Oct 2023, Dorcas AnonoLitunya wrote:
> > 
> > > Modifies the return type of program_mode_registers()
> > > to void from int as the return value is being ignored in
> > > all subsequent function calls.
> > >
> > > This improves code readability and maintainability.
> > >
> > > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
> > > ---
> > >  drivers/staging/sm750fb/ddk750_mode.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> > > index 83ace6cc9583..e15039238232 100644
> > > --- a/drivers/staging/sm750fb/ddk750_mode.c
> > > +++ b/drivers/staging/sm750fb/ddk750_mode.c
> > > @@ -73,8 +73,8 @@ display_control_adjust_sm750le(struct mode_parameter *mode_param,
> > >  }
> > >
> > >  /* only timing related registers will be  programed */
> > > -static int program_mode_registers(struct mode_parameter *mode_param,
> > > -				  struct pll_value *pll)
> > > +static void program_mode_registers(struct mode_parameter *mode_param,
> > > +				   struct pll_value *pll)
> > >  {
> > >  	int ret = 0;
> > >  	int cnt = 0;
> > > @@ -202,7 +202,6 @@ static int program_mode_registers(struct mode_parameter *mode_param,
> > >  	} else {
> > >  		ret = -1;
> > 
> > Is it still useful to have ret = -1?  Maybe the ret variable is not useful
> > at all any more, but one would have to check the parts of the function
> > that aren't shown.
> >
> I agree Julia. I will remove the setting part for ret = -1 but keep the
> ret variable just in case it is being used by parts of the function not
> shown.

No, don't do that, you will trip other static checkers if you do so.
Remove it entirely as it is obviously not needed anymore.

thanks,

greg k-h
