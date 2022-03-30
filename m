Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38763366;
	Wed, 30 Mar 2022 01:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648602453; x=1680138453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8KIRnNLoi9wMoGub3g/iUrpxj6QpD9v0f1yJbTbQg3I=;
  b=h3fosuhljMh5GrBHP2rBkGeSDaClH04t+2cldcmy0QCE8S2wey62R8m/
   TWJRkL/FushyjO8ZY5g9jOmcCrwJc8N55oHcfXEk6yetG464jncBoGvl1
   G6MbPobbbtb+t8KuNxpaEjxIHH31T6P0WMq1DgDBU2ymL8jSoXxij8i6c
   JIAWdR0Xxp5O0DccKDgw7yKT7yM8V65j/X1hKORBqtMi2gc4VWcvh9q8c
   MHCOWmw1ei9oIgg3jp2FXTUQ75BLMerIbD7jl6OfI/nKjlto2RrUNEvJC
   /3iL3FNzM/QIJnv6GyBOcJK8QUnuBxxlC8pssWNzCH4d+uVEXA7VVITV5
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="258246109"
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="258246109"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 18:07:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="787817665"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 18:07:32 -0700
Date: Tue, 29 Mar 2022 18:09:56 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Rebecca Mckeever <remckee0@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: fix suspect code indent for
 conditional statements
Message-ID: <20220330010956.GA1173030@alison-desk>
References: <YkK7ABTVt0TCbd18@bertie>
 <20220329161632.GA1169956@alison-desk>
 <YkOowzOkAE5Fr1dW@bertie>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkOowzOkAE5Fr1dW@bertie>

On Tue, Mar 29, 2022 at 07:48:03PM -0500, Rebecca Mckeever wrote:
> On Tue, Mar 29, 2022 at 09:16:32AM -0700, Alison Schofield wrote:
> > On Tue, Mar 29, 2022 at 02:53:36AM -0500, Rebecca Mckeever wrote:
> > > Align the if and else if branches of the conditional statement
> > > to improve readability. Prevent bugs that could be introduced
> > > if developers misread the code. Issue found by checkpatch.
> > 
> > Thanks for the patch Rebecca!
> > 
> > Lots of stuff done right - passes chkp, compiles, patch is sent to
> > correct recipients, the commit message follows the format of the file.
> > 
> > Let's set a pattern here for all checkpatch related cleanups,
> > for you and others that follow.(Thanks for being the first ;))
> > 
> > Commit msg says 'what'. Commit log says 'why'. Acknowledge that
> > it was found using checkpatch in the commit log also. (In the future
> > you may be acknowledging use of other tools like sparse, coccinelle.)
> > 
> > Note that the 'why' is never that a tool reported an error. The 'why'
> > for these checkpatch reports is usually to follow the Linux Kernel
> > Coding Style.
> > 
> > 'Fix' in the commit message is needlessly generic. Perhaps:
> > [PATCH] staging: r8188eu: align both branches of a conditional statement
> > 
> > Commit log: (what you have is fine in the log)
> > I usually paste in the checkpatch error explicitly so it can be grep'd
> > for. Something like:
> > 
> > Issue found by checkpatch:
> > WARNING: suspect code indent for conditional statements
> 
> There was a section of https://kernelnewbies.org/PatchPhilosophy that suggested
> putting the warning message in the subject line. I thought it would be
> redundant to also put it in the body. Is it a good practice to include the
> warning message in both places?
> 
The commit msg should say what you did. If it happens to match the
warning message, that's fine. Think of the commit msg as directives
to a machine. 

This patch has already been applied :)
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-testing&id=20b4b3fb383b3a499b8b47daaf1d6325faa9cfe2

You can view contents of staging-testing here:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/?h=staging-testing

> > 
> > Thanks,
> > Alison
> > 
> > > 
> > > Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
> > > ---
> > >  drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> > > index 6eca30124ee8..ccc43c0ba433 100644
> > > --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> > > +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> > > @@ -1408,7 +1408,7 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
> > >  		/* TODO: cancel timer and do timeout handler directly... */
> > >  		/* need to make timeout handlerOS independent */
> > >  		_set_timer(&pmlmepriv->scan_to_timer, 1);
> > > -		} else if (pcmd->res != H2C_SUCCESS) {
> > > +	} else if (pcmd->res != H2C_SUCCESS) {
> > >  		_set_timer(&pmlmepriv->scan_to_timer, 1);
> > >  	}
> > >  
> > > -- 
> > > 2.32.0
> > > 
> > > 
> > 
> 
> Thanks,
> Rebecca
