Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678AF2FAD
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:21:31 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id o2so2781992pgr.9
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OH0HDKV+n0nyhzkCexO3gFPelNIO9Yru8xPdeMKzgNE=;
        b=goFTNk2pOD39Gup5sODHofjJbZ0OzQuKLSJ5szOEafXDzHz5Z0wBqdtJClNs/rE/tW
         7PwbLmjnxHXjbhh0BzN3LG9dJqur3Mqs90yPp/cr//BR623UGy0jJs6TaanH9hFZouYo
         ucc1EoD4M9EZXQgtNDGs+me/sXAkgiKlFyKrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OH0HDKV+n0nyhzkCexO3gFPelNIO9Yru8xPdeMKzgNE=;
        b=c+HiBxicmptnEpqgVI0Nm817dXQa8QqwAV5+sK35dfdMu1b2t5K9G97vQBp0yPuxbm
         hXMWJLdi9yiGCoo1Pq2PBoJzmtmrI5a8JWF6o1HwwYs3FoOtiGbP7Gm1leaRx2SLVyQn
         MW8UP3ardwwrvpO+YXTHnF/H7jjOTyon4hugKOpD5cjdk2QqENhO830qDgomle1I8EDU
         ToabXIPI9zl6oL9K4cIor9eKxaHuoD/kbPOHmmlBuhIJRQAnpyUfQf1CRUOWu1mxbBHn
         4b5+xGd7mhQSb08Q/jWBe8Vc/2QF57UTerKq44sd5ynDeU63L34RoA+fxEm39GjKwMfx
         bfmQ==
X-Gm-Message-State: AOAM533VOD00LOoy9+h9qT3+It1NhnKaG4jQYyv93y4ffycUZDnzbyLW
	OSmRSJT3lucpjLtLJ926Wb+ZTA==
X-Google-Smtp-Source: ABdhPJysjR7p2Aks52eVXwNTLErN8CgrnMCpOcHbZLHJn8/HoaaFASj8USZBM3cqcWkjecc88CSxDQ==
X-Received: by 2002:a05:6a00:10cf:b0:3e2:139b:6d6c with SMTP id d15-20020a056a0010cf00b003e2139b6d6cmr10295546pfu.3.1629303691009;
        Wed, 18 Aug 2021 09:21:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q29sm220062pfl.142.2021.08.18.09.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:21:30 -0700 (PDT)
Date: Wed, 18 Aug 2021 09:21:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 50/63] tracing: Use memset_startat() to zero struct
 trace_iterator
Message-ID: <202108180918.E239CE0@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-51-keescook@chromium.org>
 <20210818093349.3144276b@oasis.local.home>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818093349.3144276b@oasis.local.home>

On Wed, Aug 18, 2021 at 09:33:49AM -0400, Steven Rostedt wrote:
> On Tue, 17 Aug 2021 23:05:20 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memset(), avoid intentionally writing across
> > neighboring fields.
> > 
> > Use memset_startat() to avoid confusing memset() about writing beyond
> > the target struct member.
> > 
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  kernel/trace/trace.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index 13587e771567..9ff8c31975cd 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -6691,9 +6691,7 @@ tracing_read_pipe(struct file *filp, char __user *ubuf,
> >  		cnt = PAGE_SIZE - 1;
> >  
> >  	/* reset all but tr, trace, and overruns */
> > -	memset(&iter->seq, 0,
> > -	       sizeof(struct trace_iterator) -
> > -	       offsetof(struct trace_iterator, seq));
> > +	memset_startat(iter, 0, seq);
> 
> I can't find memset_startat() in mainline nor linux-next. I don't see it
> in this thread either, but since this has 63 patches, I could have
> easily missed it.

Sorry, it isn't called out in the Subject, but it's part of this patch:
https://lore.kernel.org/lkml/20210818060533.3569517-38-keescook@chromium.org/

> This change really should belong to a patch set that just introduces
> memset_startat() (and perhaps memset_after()) and then updates all the
> places that should use it. That way I can give it a proper review. In
> other words, you should break this patch set up into smaller, more
> digestible portions for the reviewers.

I will split memset_after() and memset_startat() introduction patches. I
already split up each use into individual cases, so that those changes
could be checked one step at a time for differences in pahole struct
layout and object code.

Thanks for taking a look!

-Kees

-- 
Kees Cook
