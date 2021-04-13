Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6875617F
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 10:56:45 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id i190so11171848pfc.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 03:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MAGppu7VhjPYwD2qxh3YHD4bU0Gc/HYHrVGQQoZyahU=;
        b=IpBgHtCyRL3gNX7opeVdx95bt1xmEcYgkCa30wTNZuMfWkAVXRuTEWI4jgzM1rBc42
         m1D37NMSaDkwEZJSB1NgiZZO29QYuHbeG7k2kgGriwCVqfXTG+J71SRz98Vcrj08K8G7
         /vNA4lDX4R3bmuN7vN8UhCKOjtX/CT4AK00ly9qczRoNzkFH6RmIc/plfHTzm8QL3EDQ
         olouQdpxWpRtS8QKQtbd5L5PoJxG2Vs708sNFKzU8OJzxxAMM7nDZL540Ltip/bWog2t
         atYMFAR8BBQpZx45KnpCL466T40IgtZM9HkW/jrXLgKXxgqTYhAOVSUf7UZ8WUteI/hC
         TnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MAGppu7VhjPYwD2qxh3YHD4bU0Gc/HYHrVGQQoZyahU=;
        b=Li+N6prmPYyCsfj0jt8n0oQSgQizyu499aOKk/cmXx9tdsqbkzxoKlHDYCYXxnaL4i
         Yjv93WEEqPOmKuaGJflMMWiM7iDfCFy6w59FDSrpfXNKhxKEkT0Gzo2nrOrFGk7jFHP1
         L2dcmtiNkot4qTLdlG+/Ze73q3bGFm/UBw1AeVehPOSL6J6+vM7SUnNGx8ZdSG9m9F7J
         3dlkhMkqQH2OG/1hXi09q7u7Ps7bZiUm6HW0px+3fBJk7LsKopluOpeTFEZcv9IDAU4P
         tRx5G4hfnDS0nSGsTNDfEflDJ6K3f/YnDR6wcs5rBUbBE9iDCr44C1TssNCrjgWY752T
         +qAA==
X-Gm-Message-State: AOAM532qHAOSabnt6908HhHQ6O35QwWRrUZVziz3Z4HXS6sRHWzVepTs
	aO0Zb1JiA0i6RTSyfMWgXuU=
X-Google-Smtp-Source: ABdhPJzTKQeZIzirwZSD206tzj/T5X/VUTXAEmxsu+8U62aE7swXsuUaMYXGjeJg9TJkqfZhp7MHQw==
X-Received: by 2002:a63:703:: with SMTP id 3mr31987197pgh.253.1618311404850;
        Tue, 13 Apr 2021 03:56:44 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id h68sm12219382pfe.111.2021.04.13.03.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 03:56:44 -0700 (PDT)
Date: Tue, 13 Apr 2021 16:26:36 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2 3/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <YHV45I6ZDsXNwdiG@kali>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
 <f18b704654797e29f3bbbe49689eaa2c0ad28d59.1618289130.git.mitaliborkar810@gmail.com>
 <20210413100134.GR3@paasikivi.fi.intel.com>
 <YHV1uOq9pXmGUD+x@kali>
 <20210413104432.GU3@paasikivi.fi.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413104432.GU3@paasikivi.fi.intel.com>

On Tue, Apr 13, 2021 at 01:44:32PM +0300, Sakari Ailus wrote:
> On Tue, Apr 13, 2021 at 04:13:04PM +0530, Mitali Borkar wrote:
> > On Tue, Apr 13, 2021 at 01:01:34PM +0300, Sakari Ailus wrote:
> > > Hi Mitali,
> > > 
> > > Thanks for the update.
> > > 
> > > On Tue, Apr 13, 2021 at 10:46:06AM +0530, Mitali Borkar wrote:
> > > > Reduced length of the line under 80 characters to meet linux-kernel
> > > > coding style.
> > > > 
> > > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > > ---
> > > > 
> > > > Changes from v1:- Reduced length of the line under 80 characters
> > > > 
> > > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > index 6a72c81d2b67..52dcc6cdcffc 100644
> > > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > @@ -247,7 +247,8 @@ struct ipu3_uapi_ae_ccm {
> > > >   */
> > > >  struct ipu3_uapi_ae_config {
> > > >  	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
> > > > -	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
> > > > +	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
> > > > +							__aligned(32);
> > > 
> > > Do you still have the other two patches in your tree? This doesn't apply
> > > here due to the different attribute syntax.
> > >
> > I have patch 1/6 and 2/6 in my tree which you asked me to drop.
> 
> Could you drop them and then submit v3?
>
I am extremely sorry Sir, but I am still learning to use git, drop them
means to delete those commits? Even if I delete those, this patch was
made after those, so the changes I made then will remain as it is, so
what to do now? 

> Thanks.
> 
> -- 
> Sakari Ailus
