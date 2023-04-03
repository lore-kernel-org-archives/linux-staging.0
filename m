Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E097C;
	Mon,  3 Apr 2023 03:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680491711; x=1712027711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5/aGi2f/6EiulSB2KOAHTAyAiYCY2CyKwnlMGSiRbBQ=;
  b=gGhJ6gamG21Xipb1mVcOb6UXPrRqhifdw94JvW1pl6PfiZeZJpG71mhL
   2UMVy7Cl0NHDdJT+EeYReOpSEZ4eW/DNJztVx2CPL5fzU2dYkiPGxNywo
   r1jeS1lBFb8KvZcqNs/cQ3gpkZtZrTzke+NHm2N8iLBKbpJ1zYGllU+ui
   qgyCyNmEaVGKkDjAjiwZF5FO6h1FQVEEzfoZG7bFH5y6Dn4B5VHZkX/zb
   K+7KUZ0fsYizpeGt60738i8CxhoNAg2p0vYsRgtLfrOlLiYxgoJHlmfjJ
   L+vu0KQEYaHA5qaD9PJ9DM66n+q3/FTlrAc23wxHoZMjgV8l7snwabQn2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="322193534"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="322193534"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 20:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="750341088"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="750341088"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.209.19.220])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 20:15:10 -0700
Date: Sun, 2 Apr 2023 20:15:08 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: Ira Weiny <ira.weiny@intel.com>, outreachy@lists.linux.dev,
	hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: add a single exit path to
 arche_platform_wd_irq()
Message-ID: <ZCpEvPR7KNkG+xsj@aschofie-mobl2>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <e670baa9bde47a3bdb02e59ec37a438a62c52dd1.1680185025.git.kamrankhadijadj@gmail.com>
 <642a1fdcb2648_394c3829469@iweiny-mobl.notmuch>
 <ZCoqMSy1Ary0sAp9@khadija-virtual-machine>
 <ZCpC7wpDsUFZVWkQ@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCpC7wpDsUFZVWkQ@aschofie-mobl2>

On Sun, Apr 02, 2023 at 08:07:27PM -0700, Alison Schofield wrote:
> On Mon, Apr 03, 2023 at 06:21:53AM +0500, Khadija Kamran wrote:
> > On Sun, Apr 02, 2023 at 05:37:48PM -0700, Ira Weiny wrote:
> > > Khadija Kamran wrote:
> > > > arche_platform_wd_irq() function has two exit paths. To make the code
> > > > more readable, use only one exit path.
> > > > 
> > > > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> > > 
> > > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > >
> > 
> > Okay, noted.
> > 
> > Also, would it be okay to send a patch revision with the changes or
> > should I wait for the feedback on Dan's comment. Here is a link to it:
> > https://lore.kernel.org/outreachy/6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain/
> 
> Khadija,
> 
> It's customary to wait for folks to respond to your follow ups, and
> address  all the current feedback before sending out a new revision.
> 
> Ira asked a question about using positive instead of negative logic.
> I probably steered you down the negative logic path, perhaps it can
> be flipped to a more preferable positive logic. 

After I hit send, I worried that wasn't written clearly.
All the current feedback includes, Dan's, Ira',s and the compile issue.
(not only Ira's)

> 
> Alison
> 
> 
> 
> > 
> > Thank you!
> > Regards,
> > Khadija 
> > 
> > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > ---
> > > >  drivers/staging/greybus/arche-platform.c | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > > > index fcbd5f71eff2..a64c1af091b0 100644
> > > > --- a/drivers/staging/greybus/arche-platform.c
> > > > +++ b/drivers/staging/greybus/arche-platform.c
> > > > @@ -153,6 +153,7 @@ static irqreturn_t arche_platform_wd_irq_thread(int irq, void *devid)
> > > >  static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > > >  {
> > > >  	struct arche_platform_drvdata *arche_pdata = devid;
> > > > +	irqreturn_t rc = IRQ_HANDLED;
> > > >  	unsigned long flags;
> > > >  
> > > >  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
> > > > @@ -180,9 +181,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > > >  						WD_STATE_COLDBOOT_START) {
> > > >  					arche_platform_set_wake_detect_state(arche_pdata,
> > > >  									     WD_STATE_COLDBOOT_TRIG);
> > > > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > > > -							       flags);
> > > > -					return IRQ_WAKE_THREAD;
> > > > +					rc = IRQ_WAKE_THREAD;
> > > >  				}
> > > >  			}
> > > >  		}
> > > > @@ -204,7 +203,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > > >  
> > > >  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> > > >  
> > > > -	return IRQ_HANDLED;
> > > > +	return rc;
> > > >  }
> > > >  
> > > >  /*
> > > > -- 
> > > > 2.34.1
> > > > 
> > > > 
> > > 
> > > 
> 
