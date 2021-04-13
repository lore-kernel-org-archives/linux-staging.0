Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D47B71
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 12:43:55 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id f8so19209478edd.11
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EL1HmykK/vApgs7sw6AqzLD3lOW0gon0AditmCsSeb8=;
        b=u7lPyIPR87OkZrjxWaan08OGxcnEdPfv7JgN/iIt/d1QipKYtlYtKFVTrWwE1gl6jv
         BRLvkh3jp+NA1pF29eWCEPAu6E464v0Zid25vkeEba5Re/uZbDRELo7VfZEHkRamfGDY
         1wAEIYB6M7299J3fCyPfRcFhlL9MVmuV/pFfaZAucmFMkYAfmx2+k8rQJxEOPXS8A73q
         dgtt9Ovq0ZR4phVDLv2RsiY48RafXX4x9/beldTslFqnSyyeNlw3tUN5rfZxJUI/ldMm
         1xlMoh3XNQYKPQbaGrI5CkeqwYHe/qae1evznyy0zl3SikSt+A139eKKc1gHAVwI4hZz
         onWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EL1HmykK/vApgs7sw6AqzLD3lOW0gon0AditmCsSeb8=;
        b=sh40OHrz/+rSAC20rAIVhnjDUVt3R9MoSKm3aTUGstjqw/Pr2QGImZ19zizulqzzq8
         FVDozKQyGvK0KyHOenXA3E0U2rp8zgOm3b5MMGXkblDeDDoIEWLT6w/peUj1cdze+GaO
         d5QcBvZo0Fz6MnM46Am3GFY1AtWHYaVb7U4GE/+hnkn3GZwR92l+UnOe0ywC0JotO/QY
         o0/sNswpdVUnEx0i7biXcXmgQMDG9+BqWUKo4eFBgkCbAH+brzk12eMUIjtUXNvbHdAC
         yQMD0pfMQ6R2xhb15AJrhymODXPxjkeDLmXQNlAgiCdqxrX+RXY1fBEBraDkYqoxCRS9
         d+Cg==
X-Gm-Message-State: AOAM531wDqWEQ075pWZjRLU5FDMzGQkcFowLbhsnaQQT7dfjyjq7A7k+
	oFBa0mJydZWzkI+c2HVGSTE=
X-Google-Smtp-Source: ABdhPJw9w5RH8lPFlsFiLiVFn55EsycPX5NQiBQnftJjWUYnX8kRbs606Wbb20UYUmYX8R5afia1pw==
X-Received: by 2002:aa7:d688:: with SMTP id d8mr28010154edr.294.1618317834072;
        Tue, 13 Apr 2021 05:43:54 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id n3sm7764662ejj.113.2021.04.13.05.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 05:43:53 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, outreachy-kernel@googlegroups.com
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in, Mitali Borkar <mitaliborkar810@gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH v2 3/4] staging: media: intel-ipu3: reduce length of line
Date: Tue, 13 Apr 2021 14:43:52 +0200
Message-ID: <2015378.6QP0OQ0Ode@linux.local>
In-Reply-To: <YHV45I6ZDsXNwdiG@kali>
References: <cover.1618289130.git.mitaliborkar810@gmail.com> <20210413104432.GU3@paasikivi.fi.intel.com> <YHV45I6ZDsXNwdiG@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Tuesday, April 13, 2021 12:56:36 PM CEST Mitali Borkar wrote:
> On Tue, Apr 13, 2021 at 01:44:32PM +0300, Sakari Ailus wrote:
> > On Tue, Apr 13, 2021 at 04:13:04PM +0530, Mitali Borkar wrote:
> > > On Tue, Apr 13, 2021 at 01:01:34PM +0300, Sakari Ailus wrote:
> > > > Hi Mitali,
> > > > 
> > > > Thanks for the update.
> > > > 
> > > > On Tue, Apr 13, 2021 at 10:46:06AM +0530, Mitali Borkar wrote:
> > > > > Reduced length of the line under 80 characters to meet
> > > > > linux-kernel
> > > > > coding style.
> > > > > 
> > > > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > > > ---
> > > > > 
> > > > > Changes from v1:- Reduced length of the line under 80 characters
> > > > > 
> > > > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > > b/drivers/staging/media/ipu3/include/intel-ipu3.h index
> > > > > 6a72c81d2b67..52dcc6cdcffc 100644
> > > > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > > @@ -247,7 +247,8 @@ struct ipu3_uapi_ae_ccm {
> > > > > 
> > > > >   */
> > > > >  
> > > > >  struct ipu3_uapi_ae_config {
> > > > >  
> > > > >  	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
> > > > > 
> > > > > -	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
> > > > > __aligned(32); +	struct ipu3_uapi_ae_weight_elem
> > > > > weights[IPU3_UAPI_AE_WEIGHTS] +				
			__aligned(32);
> > > > 
> > > > Do you still have the other two patches in your tree? This doesn't
> > > > apply
> > > > here due to the different attribute syntax.
> > > 
> > > I have patch 1/6 and 2/6 in my tree which you asked me to drop.
> > 
> > Could you drop them and then submit v3?
> 
> I am extremely sorry Sir, but I am still learning to use git, drop them
> means to delete those commits? Even if I delete those, this patch was
> made after those, so the changes I made then will remain as it is, so
> what to do now?
> 
> > Thanks.
>
I think that this document can help:
https://kernelnewbies.org/GitTips

Fabio



