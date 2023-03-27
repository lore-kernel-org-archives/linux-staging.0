Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B5EA3;
	Mon, 27 Mar 2023 10:26:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id e18so8167164wra.9;
        Mon, 27 Mar 2023 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679912785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VqQ8VSOs059u+930ZGWsVqFbCaxhg+pQW8jwX08LpsM=;
        b=S8WB0pxBxVtKoOvG7yA//KBUCV3K15P8YcaHzE/nENaLtnYQBWHa+1DWNdEcKrcFDY
         10CbT3XJb5haW6E0XD1dE1+CV2qjYEJA+YwvtP5IW7V6F/YpA7IfxOcrLbCmeoD85EEN
         DM8EmbaCo1wu6MVRs5xqmrABoSOC0khpXfaMa12kPiJLeExc4dDBRs2B2t6hwnk398k2
         KVRJBVnITd3Tn/VJG6CvZtbAwAWvu7OXsQXCuSLbin9gwjmHBGYJgVD/x1ED0G8SE18H
         obgbK5CzG9rXVHeAEm9+lbuxCZDhUl/7Jl2BN/5NlLJ1BSTrpV1EP3ShPn/J8haAW/cM
         vyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqQ8VSOs059u+930ZGWsVqFbCaxhg+pQW8jwX08LpsM=;
        b=eqwNNGxbj1swiF5tQyIVWYxnsgb/a5Vfk5SiADc5PHatcuftIvXOuuwRWtDnoUj1Yw
         DL+YHtx1Fvp1h2cukPgvbxfNpTh0/7G2ND519M4G8v5iopwMeXwnKkfPQNo/J1cAMkGX
         uMJgUsUZyrFsRePhUZDyMRmWaZ7nWvKGRt0PB2ZjKv4RMKDFdrJ4EqxgMARSC3MlQPHG
         84HtBR19VhVKl071jIVD1Afr4R7VaoVAdmDJMVy846bhUKNkSGOXEX6G1ZL1TNdItbi8
         yrw6FoTRQb2RvyFCQGtqLqvNTWg0zS9lQc1BHoS++Mv6gYFosuKBUKED/x3uYyBXmNnt
         qTRA==
X-Gm-Message-State: AAQBX9cY2af7VKHpZFOQFIjg8p/4UunadBLyCVbb83Wzh4czRi6aVSH3
	4lkwiGmpzEcNahVlvkfSKk3ONQlrm9TaUC09vVg=
X-Google-Smtp-Source: AKy350agmst9PQwKSSj2jTRGjh3L7qPTS+8HAKN36g2fy/qR5PY3rI0dQZlHFRZfiEEgpuQ+1vlKxA==
X-Received: by 2002:adf:db0a:0:b0:2df:7c0a:df33 with SMTP id s10-20020adfdb0a000000b002df7c0adf33mr3605545wri.30.1679912785146;
        Mon, 27 Mar 2023 03:26:25 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id n6-20020a5d4c46000000b002c55ec7f661sm24764603wrt.5.2023.03.27.03.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 03:26:24 -0700 (PDT)
Date: Mon, 27 Mar 2023 15:26:22 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: merge split lines
Message-ID: <ZCFvTndYXmPvQunt@khadija-virtual-machine>
References: <ZBgYsqkpdYpGQniB@khadija-virtual-machine>
 <ZBnZj3JbTOsplHvw@khadija-virtual-machine>
 <ZBnc3qWTSeWw0Ulo@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBnc3qWTSeWw0Ulo@aschofie-mobl2>

On Tue, Mar 21, 2023 at 09:35:42AM -0700, Alison Schofield wrote:
> On Tue, Mar 21, 2023 at 09:21:35PM +0500, Khadija Kamran wrote:
> > On Mon, Mar 20, 2023 at 01:26:33PM +0500, Khadija Kamran wrote:
> > > If condition and spin_unlock_...() call is split into two lines, merge
> > > them to form a single line.
> > > 
> > > Suggested-by: Deepak R Varma drv@mailo.com
> > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > ---
> > > 
> > > Changes in v3:
> > >  - Removing tab to fix line length results in a new checkpatch warning,
> > >    so let the fix length be as it is.
> > > Changes in v2:
> > >  - Rephrased he subject and description
> > >  - Merged if_condition() and spin_unlock...() into one line
> > >  - Link to patch:
> > >  https://lore.kernel.org/outreachy/ZAusnKYVTGvO5zoi@khadija-virtual-machine/
> > > 
> > > Link to first patch:
> > > https://lore.kernel.org/outreachy/ZAtkW6g6DwPg%2FpDp@khadija-virtual-machine/
> > > 
> > >  drivers/staging/greybus/arche-platform.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > > index fcbd5f71eff2..6890710afdfc 100644
> > > --- a/drivers/staging/greybus/arche-platform.c
> > > +++ b/drivers/staging/greybus/arche-platform.c
> > > @@ -176,12 +176,10 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > >  				 * Check we are not in middle of irq thread
> > >  				 * already
> > >  				 */
> > > -				if (arche_pdata->wake_detect_state !=
> > > -						WD_STATE_COLDBOOT_START) {
> > > +				if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
> > >  					arche_platform_set_wake_detect_state(arche_pdata,
> > >  									     WD_STATE_COLDBOOT_TRIG);
> > > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > > -							       flags);
> > > +					spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> > >  					return IRQ_WAKE_THREAD;
> > >  				}
> > >  			}
> > > --
> > > 2.34.1
> > >
> > 
> > Hey Outreachy Mentors,
> > 
> > Kindly take a look at this patch and let me know if it is okay to work
> > on this file or should I look for other cleanup patches.
> 
> Hi Khadija,
> 
> I thought you were abandoning *this* patch, and doing a refactor on
> the function.  I'd expect that would be a new patch, probably a
> patchset. One where you align the work based on the 'rising' and
> 'falling' detection, 

Hey Alison,

Can you please elaborate that what do you mean by aligning on the basis
of rising and falling detection. Are you perhaps saying that I should
group the rising detection and group the falling detection separately?

> and perhaps a second patch that centralizes
> the unlock and return.

To do this I should make the use of goto statement, right?

So the next patchset should be:
Patch 1: merge split lines
Patch 2: align on the basis of rising and falling detection
Patch 3: use goto statement to centralize unlock and return

Kindly guide me.

Regards,
Khadija

> 
> Is there some other concern with working on this file?
> 
> Alison
> 
> > 
> > Thank you for your time.
> > Regards,
> > Khadija
> > 
> > 
