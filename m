Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0B3C078
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVxz7r5o"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c5071165d5so14409991fa.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 13:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698350559; x=1698955359; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONjs2cH5CApPBAHPgpSMiUb1ljLRxVKfmwTZ42RwfII=;
        b=lVxz7r5o9B2gpcri8EYMcd+ct/KAPkNQEcje7Sov6lWM3Hpi7wLiudpC70tlpqG2UM
         8NWMSqzuWRXc138Db0FTjtLwH6F5bmyXMXyxndojMq3kRCNewNqXzQ/rtzfgLbdp7qSA
         +VlHibWl2IVl73brqwWOh4hT3fuowYyCrm3/SBBiYT5fcnTLUG/QfEDy7cP9mqtiw39U
         TTqUvegDneiGfWrjuyWosvZhLItTSX763O1kPUY/mEwlBsX7aYMrZkDCo8zVDYkeDes8
         KFRVJbrUg+kELKXoLmQPa7cyMZCpCQzm0srTFEsYAFMebUWdAa1WskydIylRroltZFEA
         0fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698350559; x=1698955359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONjs2cH5CApPBAHPgpSMiUb1ljLRxVKfmwTZ42RwfII=;
        b=wLrOCB9mRNGRVF2/iosTuTjpnXE+ygo9Rs1OVB46Xg+V9dtXhVSZZuqMJx5GJODUrc
         VkuwNkd63bRYx7MW5LJeaVg8S9F3GiSb6s7THZ+TcNqtA2WdBYwOK2MVjBLVSi/WcTud
         b0QBcm9+YJq/ESy7ddr3I3Kh7Z01wglJKhwkbIwoRBaCHkxoCFqRTBunG+zaZfIieIG7
         CibWQmMjQpIQeWmJOZcKoyugW3wjfsWYFcME1AAszPTXgfwEmtweKGU36+ogVhSuOeTU
         SKIHncZNrSF3sEuxPmh3anfBeK6itpIZzm4FJnl8WhiQfOvOSXG4skYjHctDmj8TCmh0
         w04Q==
X-Gm-Message-State: AOJu0Yzm7nphfQbZsEM3ebS2d5D/2SGaMt/JMb+UJw3loEthFK2FfTj6
	gJSWSsYUzuT9UNXU6vZbmnI=
X-Google-Smtp-Source: AGHT+IHoY3Ca81vomgs9IcEqPDy/cXtcgXAgDKSZri5WJ8oEhDFDyj8CO2/eru4bqdr3tSuWfRBtlg==
X-Received: by 2002:a2e:bc81:0:b0:2bf:f32a:1f68 with SMTP id h1-20020a2ebc81000000b002bff32a1f68mr492841ljf.19.1698350558295;
        Thu, 26 Oct 2023 13:02:38 -0700 (PDT)
Received: from HP-ENVY-Notebook (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.gmail.com with ESMTPSA id a26-20020a2eb17a000000b002c02cf6cac5sm2971096ljm.83.2023.10.26.13.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 13:02:37 -0700 (PDT)
Date: Thu, 26 Oct 2023 22:02:35 +0200
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] staging: octeon: Fix warnings due to introduction
 of new typedefs
Message-ID: <ZTrF27Wm3v0Nn4IA@HP-ENVY-Notebook>
References: <20231021101238.81466-1-bergh.jonathan@gmail.com>
 <7e866f48-840a-4b9e-a28d-2016075abb4b@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e866f48-840a-4b9e-a28d-2016075abb4b@kadam.mountain>

On Mon, Oct 23, 2023 at 05:41:38PM +0300, Dan Carpenter wrote:
> On Sat, Oct 21, 2023 at 12:12:31PM +0200, Jonathan Bergh wrote:
> > This patch series fixes (removes) the introduction of several new typedefs
> > for enums and structs in the octeon driver. First the declarations are
> > fixed and then implementations are updated to remove references to the 
> > old typedefs.
> > 
> > Changelog:
> >  * v1 -> v2: Fix breaking change spread across multiple patches
> >  * v2 -> v3: Break changes up into individual patches for each removed
> >    typedef
> > 
> > Jonathan Bergh (7):
> >   staging: octeon: Fix introduction of new enum typedef cvmx_spi_mode_t
> >     in octeon
> >   staging: octeon: Fix up introduction of new typedef
> >     cvmx_helper_interface_mode_t  in octeon
> >   staging: octeon: Fix introduction of following new typedef
> >     cvmx_pow_wait_t in octeon
> >   staging: octeon: Fix up introduction of new typedef cvmx_pko_lock_t in
> >     octeon
> >   staging: octeon: Fix introduction of new typedef cvmx_pko_status_t in
> >     octeon
> >   staging: octeon: Fix introduction of new typedef
> >     cvmx_pip_port_status_t in octeon
> >   staging: octeon: Fix introduction of new typedef
> >     cvmx_pko_port_status_t in octeon driver
> > 
> >  drivers/staging/octeon/ethernet.c     |  6 ++--
> >  drivers/staging/octeon/octeon-stubs.h | 48 +++++++++++++--------------

Hi
 
> Please don't change the stubs without change the arch/ code.

My tree was out of date, so these changes had already actually been applied
by basically the same patches (ie removing these typedefs) around 17/09 
(Sep).
 
> regards,
> dan carpenter
> 
