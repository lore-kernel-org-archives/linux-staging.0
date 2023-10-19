Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673632C64;
	Thu, 19 Oct 2023 19:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItrlLLfl"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5b837dc2855so60563a12.0;
        Thu, 19 Oct 2023 12:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697742869; x=1698347669; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0c2Ykg+NSYzL507uf61vrkxf/qCgVQVxVY+6Rum2lE=;
        b=ItrlLLflEHp83Dn1WjWkGpdhXqyC31UA9mRN5Z3mUwfot97osqeq7NFG/jxU9Qo9KF
         15f0rPYSPS9gw6PIa0ejhcdx9dOQ6YwEESskiVde4CfmKz/906/5sNOCJB67i5WgbbS7
         Gb32Oi2ACe4GhF1ifF3YebdhDLuwW2agp4oFVTpu07dV/QqwqqWKi0cY8bM6I5h2VHq9
         WKR4FWWIudziASzvzW3N5Pz8aIUWKiCKZ7HU3OL2v++WV5OpFGhUZLRseD0Btf55FCWp
         EQIbtBn2hIrnGnKTlBTkS+3B8ZOCbQcS59Y95I/OCTg+Cuk038s5qR9eddsRrpLsF705
         71TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697742869; x=1698347669;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0c2Ykg+NSYzL507uf61vrkxf/qCgVQVxVY+6Rum2lE=;
        b=HPn30SvvFrXJ6uQ2sSueQOhaKmoN+1GfWEiOY/QHTFNGswmRIebdVLHruEDaqsoLTg
         WWh5OfOzBicprWKtllWyU/LpK+gizHHn/CMbPboh1zTrxeAbJKhsQrlaE2D+dunEg03s
         Rbgz03sWu/fbUd2Rwrmemz1Ewc7M88U04GmD9R6ulln2RvWuLi9OmU7Nc+fiVWZedF2S
         662LcNAR6sE+QrHVQJLwEzWP09W+2nk6dWmB9RXB55XKCvl6nmimmq119ptNviubmN8m
         YEvGNXgGBwpSbEVPNjV62/EPitDoz2d3eEkkEGHbmbBGWB8O16fpGElgP9Y7AyK4y1Z9
         +A0A==
X-Gm-Message-State: AOJu0Yye77YZc2fz+BYXDYJA64au0p0MccrONn0L0BcrZpGxs8EIiXkj
	gH9wQ75mlGFgh/mL+Ue7CiEzsUOR/DUelA==
X-Google-Smtp-Source: AGHT+IEAg0sopFfjPaXNffNo+Co1dZ3z90JYHckrKJv95HTWg1k/kLDXOPsZU++MoPY7CSEZUgh6mA==
X-Received: by 2002:a17:90b:23d6:b0:277:3565:30cf with SMTP id md22-20020a17090b23d600b00277356530cfmr4267350pjb.6.1697742869255;
        Thu, 19 Oct 2023 12:14:29 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a4d8800b002791491f811sm124789pjh.8.2023.10.19.12.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 12:14:28 -0700 (PDT)
Date: Thu, 19 Oct 2023 12:14:28 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/2] staging: vme_user: Use __func__ instead of
 function name
Message-ID: <20231019191428.GA32717@Negi>
References: <cover.1697696951.git.soumya.negi97@gmail.com>
 <996c9f92e7fd288f67c02dfb0ba524ab7c5fe421.1697696951.git.soumya.negi97@gmail.com>
 <ZTFOGIu5U+ZUodXW@ashyti-mobl2.lan>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTFOGIu5U+ZUodXW@ashyti-mobl2.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Oct 19, 2023 at 05:41:12PM +0200, Andi Shyti wrote:
> Hi Soumya,
> 
> On Thu, Oct 19, 2023 at 12:20:10AM -0700, Soumya Negi wrote:
> > Replace function names in message strings with __func__ to fix
> > all checkpatch warnings like:
> > 
> >     WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
> >              this function's name, in a string
> > 
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> 
> you forgot my ack here:
> 
> Acked-by: Andi Shyti <andi.shyti@linux.intel.com> 
> 
> Andi

Sorry I forgot the tag Andi. I'll add the tags in v3(Greg has suggested
more changes). There will be some new patches, so I'll leave the tags out in 
those as you may want to review them first.

Regards,
Soumya
> 
> > ---
> > Changes in v2:
> > * None
> > 
> >  drivers/staging/vme_user/vme.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> > index 640b2dda3ac6..e533cce8e54e 100644
> > --- a/drivers/staging/vme_user/vme.c
> > +++ b/drivers/staging/vme_user/vme.c
> > @@ -424,7 +424,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
> >  	image = list_entry(resource->entry, struct vme_slave_resource, list);
> >  
> >  	if (!bridge->slave_get) {
> > -		dev_err(bridge->parent, "vme_slave_get not supported\n");
> > +		dev_err(bridge->parent, "%s not supported\n", __func__);
> >  		return -EINVAL;
> >  	}
> >  
> > @@ -576,7 +576,7 @@ int vme_master_set(struct vme_resource *resource, int enabled,
> >  	image = list_entry(resource->entry, struct vme_master_resource, list);
> >  
> >  	if (!bridge->master_set) {
> > -		dev_warn(bridge->parent, "vme_master_set not supported\n");
> > +		dev_warn(bridge->parent, "%s not supported\n", __func__);
> >  		return -EINVAL;
> >  	}
> >  
> > @@ -1576,7 +1576,7 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
> >  	lm = list_entry(resource->entry, struct vme_lm_resource, list);
> >  
> >  	if (!bridge->lm_set) {
> > -		dev_err(bridge->parent, "vme_lm_set not supported\n");
> > +		dev_err(bridge->parent, "%s not supported\n", __func__);
> >  		return -EINVAL;
> >  	}
> >  
> > @@ -1612,7 +1612,7 @@ int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
> >  	lm = list_entry(resource->entry, struct vme_lm_resource, list);
> >  
> >  	if (!bridge->lm_get) {
> > -		dev_err(bridge->parent, "vme_lm_get not supported\n");
> > +		dev_err(bridge->parent, "%s not supported\n", __func__);
> >  		return -EINVAL;
> >  	}
> >  
> > @@ -1649,7 +1649,7 @@ int vme_lm_attach(struct vme_resource *resource, int monitor,
> >  	lm = list_entry(resource->entry, struct vme_lm_resource, list);
> >  
> >  	if (!bridge->lm_attach) {
> > -		dev_err(bridge->parent, "vme_lm_attach not supported\n");
> > +		dev_err(bridge->parent, "%s not supported\n", __func__);
> >  		return -EINVAL;
> >  	}
> >  
> > @@ -1682,7 +1682,7 @@ int vme_lm_detach(struct vme_resource *resource, int monitor)
> >  	lm = list_entry(resource->entry, struct vme_lm_resource, list);
> >  
> >  	if (!bridge->lm_detach) {
> > -		dev_err(bridge->parent, "vme_lm_detach not supported\n");
> > +		dev_err(bridge->parent, "%s not supported\n", __func__);
> >  		return -EINVAL;
> >  	}
> >  
> > @@ -1750,7 +1750,7 @@ int vme_slot_num(struct vme_dev *vdev)
> >  	}
> >  
> >  	if (!bridge->slot_get) {
> > -		dev_warn(bridge->parent, "vme_slot_num not supported\n");
> > +		dev_warn(bridge->parent, "%s not supported\n", __func__);
> >  		return -EINVAL;
> >  	}
> >  
> > -- 
> > 2.42.0
