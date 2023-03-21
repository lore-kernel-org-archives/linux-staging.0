Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC3929AB;
	Tue, 21 Mar 2023 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679416546; x=1710952546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d4C2/AuIe0bNckdUCfINRJ7nt+ZejqKOdAwLq7jWVYE=;
  b=TziekbAmY9FiqdxlUol5cWMCsCzof5XnvoSr7XyW6jiLHURMwtAuXXEu
   KzL3MjxqaJrAfzfgiyTNAJ3qpVf3OOwkY1C1Y5B8kSXffsFdhzNUkNHRk
   0nyJkrd2fcCIL2Vlskou/5nXXBHU5auZUB90vaani+ey6w0EQ4eBtS3A0
   pnDLN8DLz+2To7i+NZBzFpGKkyelU9FCcQa48XD3t9cxjYJEnwJcf7mSy
   LSV+rES9HAIubtC/libmlRYhhfN9jYGPyJa+lcUxhhsqcq273aJIa0s24
   jk8DculoD8uVVWTh4ih7PREVtxCXbige8f05IYKWAw9kT8xH/sVFLGSyz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401561090"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="401561090"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 09:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="1011010868"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="1011010868"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.251.21.85])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 09:35:44 -0700
Date: Tue, 21 Mar 2023 09:35:42 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: merge split lines
Message-ID: <ZBnc3qWTSeWw0Ulo@aschofie-mobl2>
References: <ZBgYsqkpdYpGQniB@khadija-virtual-machine>
 <ZBnZj3JbTOsplHvw@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBnZj3JbTOsplHvw@khadija-virtual-machine>

On Tue, Mar 21, 2023 at 09:21:35PM +0500, Khadija Kamran wrote:
> On Mon, Mar 20, 2023 at 01:26:33PM +0500, Khadija Kamran wrote:
> > If condition and spin_unlock_...() call is split into two lines, merge
> > them to form a single line.
> > 
> > Suggested-by: Deepak R Varma drv@mailo.com
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> > 
> > Changes in v3:
> >  - Removing tab to fix line length results in a new checkpatch warning,
> >    so let the fix length be as it is.
> > Changes in v2:
> >  - Rephrased he subject and description
> >  - Merged if_condition() and spin_unlock...() into one line
> >  - Link to patch:
> >  https://lore.kernel.org/outreachy/ZAusnKYVTGvO5zoi@khadija-virtual-machine/
> > 
> > Link to first patch:
> > https://lore.kernel.org/outreachy/ZAtkW6g6DwPg%2FpDp@khadija-virtual-machine/
> > 
> >  drivers/staging/greybus/arche-platform.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > index fcbd5f71eff2..6890710afdfc 100644
> > --- a/drivers/staging/greybus/arche-platform.c
> > +++ b/drivers/staging/greybus/arche-platform.c
> > @@ -176,12 +176,10 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  				 * Check we are not in middle of irq thread
> >  				 * already
> >  				 */
> > -				if (arche_pdata->wake_detect_state !=
> > -						WD_STATE_COLDBOOT_START) {
> > +				if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
> >  					arche_platform_set_wake_detect_state(arche_pdata,
> >  									     WD_STATE_COLDBOOT_TRIG);
> > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > -							       flags);
> > +					spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> >  					return IRQ_WAKE_THREAD;
> >  				}
> >  			}
> > --
> > 2.34.1
> >
> 
> Hey Outreachy Mentors,
> 
> Kindly take a look at this patch and let me know if it is okay to work
> on this file or should I look for other cleanup patches.

Hi Khadija,

I thought you were abandoning *this* patch, and doing a refactor on
the function.  I'd expect that would be a new patch, probably a
patchset. One where you align the work based on the 'rising' and
'falling' detection, and perhaps a second patch that centralizes
the unlock and return.

Is there some other concern with working on this file?

Alison

> 
> Thank you for your time.
> Regards,
> Khadija
> 
> 
