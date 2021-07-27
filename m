Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3056D70
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 21:47:25 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d17so110982plh.10
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RmWu5L4XF1JSf6SMuIfCAjF4w7lZ2j3Pm51HCxVaooA=;
        b=kT5nbH7QT643iQGqVSJxPNGwwBlfdxw5cCyQX6gaBzOcqz4ajIPGMOczsYHolmn62d
         eW8ICZNFrJ1d3HiFUcApnGkXgvWlWnUUGLsdAOvKSLOBSwaj/BB+s0Fa9Bal55XOCrIt
         E/hihwg5GtX2PF8wCIvqM4CT8+GGunjYl5M0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RmWu5L4XF1JSf6SMuIfCAjF4w7lZ2j3Pm51HCxVaooA=;
        b=gB2Ji5rfOdenA5vrCsN3WjQvCilAcHES6YxnL/Sy2DmfashMkm5EmmPdQ66G4zk1TA
         Hgd/1AWRpLBtaj18Pzvss+cOCfd7/QuqzN4QC68nRihx1+OV/OZ2zW7JyXBnUNLIAqmG
         5uMihYFryxilLXjU7PaGQXSV5W0UY5Q7rYoMzokxP5fAKfUPKHSlo76ondcsdgNA91mB
         8IP55/27bhvLVYIG9eNxfWTfOFNvQx4iLN6v+FFMqdE+ue+15RC7lvu0omFNFne0KEf7
         XuZY+529H3VXpO28NsRoFOZ8lX6CVqYSslIH4fjb3Jeax/50FjldOMsQEBvAtSE54YVW
         MLiA==
X-Gm-Message-State: AOAM533BpcG7TrIIr1eYXPXhH435yao4sy60bloWxB/f1d7xcNJTeYOH
	rwHBlJYwQqyb7ce7b7utRzS9Tw==
X-Google-Smtp-Source: ABdhPJwYpkbqYJB6T9w906hSU82h1v3vr+z3zO2Lp7j72zPJyvd83IHc+CMakx8xlv5Jq50O8i9yVw==
X-Received: by 2002:a17:902:a513:b029:11a:9be6:f1b9 with SMTP id s19-20020a170902a513b029011a9be6f1b9mr20025348plq.55.1627422444596;
        Tue, 27 Jul 2021 14:47:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t37sm4805774pfg.14.2021.07.27.14.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:47:23 -0700 (PDT)
Date: Tue, 27 Jul 2021 14:47:22 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 31/64] fortify: Explicitly disable Clang support
Message-ID: <202107271434.039A9777@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-32-keescook@chromium.org>
 <da989ffc-da64-33a2-581e-6920eb7ebd2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da989ffc-da64-33a2-581e-6920eb7ebd2d@kernel.org>

On Tue, Jul 27, 2021 at 02:18:58PM -0700, Nathan Chancellor wrote:
> On 7/27/2021 1:58 PM, Kees Cook wrote:
> > Clang has never correctly compiled the FORTIFY_SOURCE defenses due to
> > a couple bugs:
> > 
> > 	Eliding inlines with matching __builtin_* names
> > 	https://bugs.llvm.org/show_bug.cgi?id=50322
> > 
> > 	Incorrect __builtin_constant_p() of some globals
> > 	https://bugs.llvm.org/show_bug.cgi?id=41459
> > 
> > In the process of making improvements to the FORTIFY_SOURCE defenses, the
> > first (silent) bug (coincidentally) becomes worked around, but exposes
> > the latter which breaks the build. As such, Clang must not be used with
> > CONFIG_FORTIFY_SOURCE until at least latter bug is fixed (in Clang 13),
> > and the fortify routines have been rearranged.
> > 
> > Update the Kconfig to reflect the reality of the current situation.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >   security/Kconfig | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/security/Kconfig b/security/Kconfig
> > index 0ced7fd33e4d..8f0e675e70a4 100644
> > --- a/security/Kconfig
> > +++ b/security/Kconfig
> > @@ -191,6 +191,9 @@ config HARDENED_USERCOPY_PAGESPAN
> >   config FORTIFY_SOURCE
> >   	bool "Harden common str/mem functions against buffer overflows"
> >   	depends on ARCH_HAS_FORTIFY_SOURCE
> > +	# https://bugs.llvm.org/show_bug.cgi?id=50322
> > +	# https://bugs.llvm.org/show_bug.cgi?id=41459
> > +	depends on !CONFIG_CC_IS_CLANG
> 
> Should be !CC_IS_CLANG, Kconfig is hard :)

/me shakes fist at sky

Thank you! Fixed locally. :)

-Kees

> 
> >   	help
> >   	  Detect overflows of buffers in common string and memory functions
> >   	  where the compiler can determine and validate the buffer sizes.
> > 
> 
> Cheers,
> Nathan

-- 
Kees Cook
