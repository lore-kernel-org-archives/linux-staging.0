Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FB03FC3
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 05:53:39 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 17so11353843pgp.4
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 22:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n5/Fdihjp+sDSxDi7gnmgBq3lW7NxjDo15wwIp1cvr8=;
        b=jxnHy9tw+uPx9gLCPBuo2eIbIpbfLs5GKdg+q+UXapZoMdQphbEG7j/tREfxRG73OB
         SMWtJ0ITPEg4cOqbhT2q65n0qQve0xXezqIsrltEEXfOUnSEA0/gmXbVVP9eYrgf2etD
         RVl0Q81t1zmKq8SW7wDArG67dNTELuMQoqXrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n5/Fdihjp+sDSxDi7gnmgBq3lW7NxjDo15wwIp1cvr8=;
        b=YNMl/z9uKlQvwucoMBhRaWEYp2l4SktwnRxiIuddgmAlajsEPdT4E6iQI3naOgnpPU
         gAA+CH31W5BK680V+SR4d8UyAHsbcVxks7GhroH2Zyzfep2ITO/nZP7KFdZpJMbdcglO
         pQJ8Ru4rRqn4yuCnF8vsebVoaHchijYxwEPDUbdLfh3pd0Q/ggW8WWPE1uFeglSKC4di
         VlCoBJcunbKTNeupc+wKhM0uHEOBURtY0aIa84OHK7EtD6heM2iuj0H9yiD65b5VoKKA
         uSi9iKPVMVhtardaG5tOWz94u2yz6Mws5fCv+9iA/RT6m75y8sjWkrF09NXGZXPz+QTW
         a8wQ==
X-Gm-Message-State: AOAM533UxvQ+ZuDliKtrWv8aJU3cbGve/2zjv9x3bBC2n5wMs7TDAp6j
	4mEpOdSPF0iRPsk14m8CfSUs8g==
X-Google-Smtp-Source: ABdhPJyskjxZyotgOIKyGsFoHq5YHJFwfaG3QKD/1U0ag0cbf6kv2IpN7RrgEwlMDFLSbey+tudoeA==
X-Received: by 2002:a65:6701:: with SMTP id u1mr21890145pgf.138.1629525219086;
        Fri, 20 Aug 2021 22:53:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d13sm8666004pfn.136.2021.08.20.22.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 22:53:38 -0700 (PDT)
Date: Fri, 20 Aug 2021 22:53:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
Message-ID: <202108202251.F3033355C@keescook>
References: <20210802143820.1150099-1-arnd@kernel.org>
 <202108130937.7848F6B318@keescook>
 <CAHp75VdkAO+fiiCVs=dyc2C83mZuLCQCvqs9C+6PF6JnhKDxCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdkAO+fiiCVs=dyc2C83mZuLCQCvqs9C+6PF6JnhKDxCA@mail.gmail.com>

On Thu, Aug 19, 2021 at 08:24:11PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 13, 2021 at 7:39 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, Aug 02, 2021 at 04:38:14PM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > The input_system_configure_channel_sensor() function lost its final
> > > return code in a previous patch:
> > >
> > > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
> > > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
> > >
> > > Restore what was there originally.
> > >
> > > Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > I hit this too. Thanks!
> >
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> Me too,
> Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Mauro, are you able to get this into your tree, please? Or Greg? It's in
staging. :) This is breaking the build.

-- 
Kees Cook
