Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E796670
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 18:27:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0F3E6115C;
	Thu,  5 Aug 2021 18:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628188073;
	bh=yapX10/EEWgFV+kGLrlITQAuWVnJxAaeKMtYDb+1ltA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKkGEHglxR+36IT1loJzHpO8DG5v8nDfFN8JQe3e0ohtAcffgIE54UXPQjYEuZvJt
	 OKhABrkHRuf81f06gXXGnWft/S+R/nB7Xoh3bYIQXvlwkIYf4TpoWp7hxLbJ75nhY1
	 sQi05cs72mCNVSrfsqSzanWw0SVTVSDmVxIezBsc=
Date: Thu, 5 Aug 2021 20:27:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: remove label at the end of a
 function
Message-ID: <YQwtpmV88creZIuE@kroah.com>
References: <20210805130750.7974-1-martin@kaiser.cx>
 <20210805145026.14572-1-martin@kaiser.cx>
 <YQwmBEAdUiPCbIj0@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YQwmBEAdUiPCbIj0@kroah.com>

On Thu, Aug 05, 2021 at 07:55:16PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 05, 2021 at 04:50:26PM +0200, Martin Kaiser wrote:
> > Compilation fails for me
> > 
> > drivers/staging/r8188eu/hal/rtl8188e_dm.c: In function ‘rtl8188e_HalDmWatchDog’:
> > drivers/staging/r8188eu/hal/rtl8188e_dm.c:182:1: error: label at end of compound statement
> >   182 | skip_dm:
> >       | ^~~~~~~
> > 
> > Remove the label at the end of the function. Replace the jump to this label
> > with a return statement.
> > 
> > Fixes: b398ff88aa36 ("staging: r8188eu: remove return from void functions")
> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> > v2:
> >  - add Fixes tag
> > 
> >  drivers/staging/r8188eu/hal/rtl8188e_dm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
> > index b5f42127a751..72b3130eddd2 100644
> > --- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
> > +++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
> > @@ -145,7 +145,7 @@ void rtl8188e_HalDmWatchDog(struct adapter *Adapter)
> >  	hw_init_completed = Adapter->hw_init_completed;
> >  
> >  	if (!hw_init_completed)
> > -		goto skip_dm;
> > +		return;
> >  
> >  	fw_cur_in_ps = Adapter->pwrctrlpriv.bFwCurrentInPSMode;
> >  	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&fw_ps_awake));
> > @@ -179,7 +179,7 @@ void rtl8188e_HalDmWatchDog(struct adapter *Adapter)
> >  		ODM_CmnInfoUpdate(&hal_data->odmpriv, ODM_CMNINFO_LINK, bLinked);
> >  		ODM_DMWatchdog(&hal_data->odmpriv);
> >  	}
> > -skip_dm:
> > +
> >  	/*  Check GPIO to determine current RF on/off and Pbc status. */
> >  	/*  Check Hardware Radio ON/OFF or not */
> >  }
> > -- 
> > 2.20.1
> > 
> > 
> 
> How is this not showing up in my build tests?  Odd, let me figure that
> out...

odd, I think this is a gcc bug, the code above here is correct.  But
I'll take the fix for it...
