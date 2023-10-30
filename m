Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D47F137E
	for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCxF8sAp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32df66c691dso2726634f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 04:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698663757; x=1699268557; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U1lhozIxyHBL/jN8zh4HAqe7ydkGHNrsZdasWYJCoeU=;
        b=JCxF8sApTK/tZcb3JTPXb4+h3RDl93QK6KqLIGhCeTiPVgFbKkzUE4/NiXE1z4vVCb
         O0j8J7YMPjrD8NtCq6UgClYE+WBeZKs/+VLDHXnSsn955HgyAaqTLCJ1NQvLFpStXja+
         eMFwpVkRov9XqUbpZqaZAqXiw8FoJh6r9+K3Kg04cCXkM0Q5sHlf/CjcI+gC/PVOKmXB
         gq6qWqhrOeCOUVoicSGouul13KePRRqYGwnxHb7Y3JyUYcdc0nxTevv+80NA2dxJe5wM
         r6onbPPisKQ3qHNwbjEjHfJF6DFMdxs2GCTFP4uVvEKVuYbZaipU3+zJUJeNTdo2Sxnr
         QMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698663757; x=1699268557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1lhozIxyHBL/jN8zh4HAqe7ydkGHNrsZdasWYJCoeU=;
        b=VxGwK0C95ztRkyjGdcmh9l3OtG3TduSySs+6quffsMM/a+TzkTKS1Q9l2k2e8xsmzF
         e7y6gHHsGSoutP0IepSa53kKS0dxBRnkDsv5CGQ7VR8w35qvwXlZFn3P+d65tUoty7Ac
         EDAv2XyCLwgdph6ojzHnwsoNj3sTE0S7ic/Ink08FJ148ts474vtLYqtNHwUb+kBGuDw
         F+TXSPA/XGv+AMSyCZFZ7sKGerxTXArNzHYweuXYEMqGwW9VFKlxllU+Yd+5NJ4lUbv+
         iu2qGqNrs/7Cg0gvJ3/cAI63ml5AX3jt7jrGrIMWx0S26WfpeL+g8IPlLfqm3Oy5K7Oj
         4Gew==
X-Gm-Message-State: AOJu0YwHZbztbenbxv/poFpYh6cOE7zzf3r7rxQ9GjoplLBVryFVLsy8
	LSQ6U9fwMust4fSLu/wqrUFuYQ==
X-Google-Smtp-Source: AGHT+IHacRR+tU2esAAKHMXuWVCgDRo+jroaDmCpDRW5vjNxUTBKgis0G7GPkFz/oA7wycrVWfSGfw==
X-Received: by 2002:adf:f24a:0:b0:32d:a476:527a with SMTP id b10-20020adff24a000000b0032da476527amr7320948wrp.50.1698663757422;
        Mon, 30 Oct 2023 04:02:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o12-20020a056000010c00b003232f167df5sm7963731wrx.108.2023.10.30.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 04:02:37 -0700 (PDT)
Date: Mon, 30 Oct 2023 14:02:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Oliver Crumrine <ozlinux@hotmail.com>, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 2/6] staging: octeon: remove typedef in enum
 cvmx_helper_interface_mode_t
Message-ID: <50cb7891-44ed-4229-b0df-088a701beef5@kadam.mountain>
References: <cover.1693236450.git.ozlinux@hotmail.com>
 <PH7PR11MB7643DEB4401AA83A0578087CBCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
 <32e9ad3c-191e-4dd1-b1cc-07f7b93c3f28@roeck-us.net>
 <2023103049-daybed-abstain-bad9@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023103049-daybed-abstain-bad9@gregkh>

On Mon, Oct 30, 2023 at 07:24:37AM +0100, Greg KH wrote:
> On Sun, Oct 29, 2023 at 10:17:21AM -0700, Guenter Roeck wrote:
> > On Mon, Aug 28, 2023 at 11:39:07AM -0400, Oliver Crumrine wrote:
> > > Remove typedef in enum cvmx_helper_interface_mode_t, and rename all instances
> > > to cvmx_helper_interface_mode
> > > 
> > > Signed-off-by: Oliver Crumrine <ozlinux@hotmail.com>
> > 
> > In linux-next:
> > 
> > Building mips:cavium_octeon_defconfig ... failed
> > --------------
> > Error log:
> > drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_get_stats':
> > drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status' isn't known
> >   204 |         struct cvmx_pip_port_status rx_status;
> >       |                                     ^~~~~~~~~
> > drivers/staging/octeon/ethernet.c:205:37: error: storage size of 'tx_status' isn't known
> >   205 |         struct cvmx_pko_port_status tx_status;
> >       |                                     ^~~~~~~~~
> > drivers/staging/octeon/ethernet.c:205:37: warning: unused variable 'tx_status' [-Wunused-variable]
> > drivers/staging/octeon/ethernet.c:204:37: warning: unused variable 'rx_status' [-Wunused-variable]
> >   204 |         struct cvmx_pip_port_status rx_status;
> >       |                                     ^~~~~~~~~
> > drivers/staging/octeon/ethernet.c: In function 'cvm_oct_probe':
> > drivers/staging/octeon/ethernet.c:801:22: error: variable 'imode' has initializer but incomplete type
> >   801 |                 enum cvmx_helper_interface_mode imode =
> >       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/staging/octeon/ethernet.c:801:49: error: storage size of 'imode' isn't known
> >   801 |                 enum cvmx_helper_interface_mode imode =
> >       |                                                 ^~~~~
> > drivers/staging/octeon/ethernet.c:801:49: warning: unused variable 'imode' [-Wunused-variable]
> > 
> > Bisect points to this patch. Bisect log attached.
> > 
> > As usual, my apologies for the noise if this has already been reported
> > and/or fixed.
> 
> It has not been reported, thanks for it, I'll go revert the offending
> commits.  And I need to figure out how to build this driver better, I
> get no build-failures from anyone for it when stuff like this happens,
> odd...

We did report it.

https://lore.kernel.org/all/CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com/

It only fails for Octeon def_configs.  Just cross compiling on ARM
isn't enough.  All the stub code is just for compile testing and doesn't
work...

regards,
dan carpenter
