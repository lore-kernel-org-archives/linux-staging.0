Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89F6D0D
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 10:43:14 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id g35so11589725pgg.9
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 03:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qw2EKXYMWZRnicc+aMShWEuB5bBUZiy5s0ziuNVRtBQ=;
        b=eZTVN0SPDlqlBoNWSDPAie9ZGUDyLEUSKQQKZYhDvLfACBxjfq7+HJ6I8VpjQD1qS9
         eZaiuIaLojXN7D6Sx30KRThU7BF3277QLOEPZYYerN/NBnqqDEVJTRapc46bLrnCp/7v
         WNfnlkbWuUFy7lMQclinpDPs0mtZ9yWAN4xetC7hspctM0iwEYfAAHsImBQflZzGZWyD
         Etj+gnaCWnR77x+BbvvnssGM3R6Y6VB+bsaCQzflU3lo4BVaod4tpdvitsWJsrY63O+I
         t6ZQStRKNPL5o5p82vh5Qxn0zni7iivSP5vdhEPsJX2Nk+Vo8+/YeSvKlOTljvi/J8Xb
         6aJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qw2EKXYMWZRnicc+aMShWEuB5bBUZiy5s0ziuNVRtBQ=;
        b=NdQ+r3n7s1rOV0kiYqbvLLp7+u/dqmut0qVldDU53Y7OKw/LVxEU5+LWmtNITbjv30
         UXrVY60JTZ63gfDmSd/gGjAGIVl6Iti2lp3aHfH3aP/17KAe818a3V2/fhlFUDYH4ctY
         8IklcPfUEQrAuscnmaaTXtSN51fGHUmgympcKnXT3OpVDK63STlWkxJpf6lAEMP9ukuG
         D5uhyOly1CDZXFCqkQcTezk4xBi147yIvRpIYUgwCafToe6cuWzB1Mb3czJFTtHreHZC
         vgHrJ0Gl1BnMvZimDUowM4tjIPB1AYqhZkh9ETd/ieErRIuFKjndB2CnYvLYBpZ3K3Y0
         NQ1w==
X-Gm-Message-State: AOAM531v2jGkBoFn6vC5uWFYfzv/6TQkSsY0DZaVFWroILLG7aQAFjW3
	jCE4nX4Ot4DeIqVCGVRE7BY=
X-Google-Smtp-Source: ABdhPJwkuvSV7oolipndPbe8waLm2NhLAIOqhfbn15lIqcruDdUjQsolWQv3IYhkX8BIgFBmUv35iA==
X-Received: by 2002:a62:e70e:0:b029:245:3a00:5720 with SMTP id s14-20020a62e70e0000b02902453a005720mr23911234pfh.0.1618310594185;
        Tue, 13 Apr 2021 03:43:14 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id g18sm12411160pfb.178.2021.04.13.03.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 03:43:13 -0700 (PDT)
Date: Tue, 13 Apr 2021 16:13:04 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2 3/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <YHV1uOq9pXmGUD+x@kali>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
 <f18b704654797e29f3bbbe49689eaa2c0ad28d59.1618289130.git.mitaliborkar810@gmail.com>
 <20210413100134.GR3@paasikivi.fi.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413100134.GR3@paasikivi.fi.intel.com>

On Tue, Apr 13, 2021 at 01:01:34PM +0300, Sakari Ailus wrote:
> Hi Mitali,
> 
> Thanks for the update.
> 
> On Tue, Apr 13, 2021 at 10:46:06AM +0530, Mitali Borkar wrote:
> > Reduced length of the line under 80 characters to meet linux-kernel
> > coding style.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> > 
> > Changes from v1:- Reduced length of the line under 80 characters
> > 
> >  drivers/staging/media/ipu3/include/intel-ipu3.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > index 6a72c81d2b67..52dcc6cdcffc 100644
> > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > @@ -247,7 +247,8 @@ struct ipu3_uapi_ae_ccm {
> >   */
> >  struct ipu3_uapi_ae_config {
> >  	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
> > -	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
> > +	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
> > +							__aligned(32);
> 
> Do you still have the other two patches in your tree? This doesn't apply
> here due to the different attribute syntax.
>
I have patch 1/6 and 2/6 in my tree which you asked me to drop.

> >  	struct ipu3_uapi_ae_ccm ae_ccm __aligned(32);
> >  } __packed;
> >  
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
