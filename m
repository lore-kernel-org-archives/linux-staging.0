Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735914122F
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 14:45:46 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so4732705e9.1
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695998744; x=1696603544; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1F0jmzSQsTMHopJS20TQ/aPFFBAaPT1nKsTJzCXy4g=;
        b=YOWYihwCzABGH137QncKWAj60BZEAdYMlPILajBURz6RxQvK5mc1b8GIHpf3FLvo5/
         wjXXS7FbEByAxrLRqfDlNM8uxOP/2t40CfoKnAyNBObLNXyPvsgsubTjkSRJuE7e+/uR
         BPS6+MtdBRbyqoz0H5PrvtWx1O+DCUfznIPYyDlaOn3b+Sj+fta5PZT9JR+ReAlqmznU
         LgXNrIIcfTC5FJ6YGPdglQ/KZQxUZLmMyze6CcKx/g6xg+DxEi2hLYDTSUR/Jidb/YrB
         J3gATsy1Jt5H05tAB10dEA+x86K/VVuer3McvtOow06jYvqwZXaW7jBLBYx4Ojs1ZWlu
         3Ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998744; x=1696603544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1F0jmzSQsTMHopJS20TQ/aPFFBAaPT1nKsTJzCXy4g=;
        b=u6p/T61jhiW6lt0/tO/JwPHxp1i1ouQnoVSf5QIqRjlFIqT4rte8aiG74WaXU28bPT
         VcVrXtFzsyrXVKBknJQ9gYeW9Zw2g55j5Im99oGP/XcRiNYIiOBrCk5/9BzmC5s9TOql
         af9XNWiBTA5x2c/HBz0ynPT0ZS8KZweSGpNjTysGHrHfoQpf0BP/iQIPfIybvcyl23WG
         iv2k8mM+Lci5Jm4CxgVNqHnWqE49c66p6U57bgOQevIFS93dUamHhd/mHJKrsCCbGr2+
         B89PdwXRfn1ETzR+16we/eTd/mxycRFdEQOMdGK0Y/taBh9+o+r05pnkhKsTf8iv1vmZ
         Xtnw==
X-Gm-Message-State: AOJu0Yxr9PCyEZ5p8ULYDayIln5HYrfVL/FplRqMbCB8d/5kyyFeQHh8
	qlMbFzJS089viMZ3Yuq3xwfTVg==
X-Google-Smtp-Source: AGHT+IEhITBVhRNZEGs03cCgFKEzGiXTWsGzoh/jNUr5RPvZWP24s4gEhBS1OqmZV8t5O4h63M7KFA==
X-Received: by 2002:a05:600c:3644:b0:406:4e2e:b185 with SMTP id y4-20020a05600c364400b004064e2eb185mr3887296wmq.1.1695998744493;
        Fri, 29 Sep 2023 07:45:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b9-20020a05600c11c900b0040596352951sm1575517wmi.5.2023.09.29.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:45:44 -0700 (PDT)
Date: Fri, 29 Sep 2023 17:45:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
	linux-mips@vger.kernel.org, linux-staging@lists.linux.dev,
	Oliver Crumrine <ozlinux@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: next: mips: cavium_octeon_defconfig failed -
 drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status'
 isn't known
Message-ID: <f43c92cd-bb2f-43a2-8025-707e4274891d@kadam.mountain>
References: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
 <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>
 <511073d8-3292-4914-9bcc-8c9acefe3b9a@kadam.mountain>
 <b2da789f-af96-4269-bd5c-54d4cb6f05eb@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2da789f-af96-4269-bd5c-54d4cb6f05eb@kadam.mountain>

On Fri, Sep 29, 2023 at 05:43:41PM +0300, Dan Carpenter wrote:
> On Fri, Sep 29, 2023 at 05:39:46PM +0300, Dan Carpenter wrote:
> > On Fri, Sep 29, 2023 at 05:18:31PM +0300, Dan Carpenter wrote:
> > > This is weird.
> > > 
> > > I managed to reproduce this once but couldn't reproduce it again after
> > > that.  It seems like an intermittent thing to me.
> > 
> > Nope.  I'm just dumb.
> > 
> > Commit b33a296d8311 ("staging: octeon: remove typedef in structs
> > cvmx_pip_port_status_t and cvmx_pko_port_status_t") updated
> > drivers/staging/octeon/octeon-stubs.h but didn't update
> > arch/mips/include/asm/octeon/cvmx-pip.h.
> > 
> > I can send a patch for that.
> 
> Actually, perhaps we should just revert the patch?  Staging patches
> aren't supposed to touch outside of the staging directory.

I think all of these break the build...

b33a296d8311 staging: octeon: remove typedef in structs cvmx_pip_port_status_t and cvmx_pko_port_status_t
4fffe4733cfb staging: octeon: remove typedef in enum cvmx_pko_status_t
8d26aa90458f staging: octeon: remove typedef in struct cvmx_pko_lock_t
28fae776c69b staging: octeon: remove typedef in enum cvmx_pow_wait_t
a13f7e45823c staging: octeon: remove typedef in enum cvmx_helper_interface_mode_t
7bebd8321776 staging: octeon: remove typedef in enum cvmx_spi_mode_t

regards,
dan carpenter
