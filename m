Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409A3FC2
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 15:57:28 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id bo18so7684512pjb.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AJeoq+Z5WucmTQVKUtIcwcvIvzIMIDi7YIzeoCuQoP0=;
        b=oIxFw+GWAwZs8paucH0s/In4m5BgJDLq+dmzX+m7YKc4gCfgmo4JI2M4BsORRDjuci
         qAYG9G5n+7RQUkylKMqlb1PMW/ybYfuvOAKQsZeE3AgNOJAe0FYCQwED3j3ea2q1qoXd
         5B7pTsEFDxH8oJwSmaEr+SvpFW0GYanuTjebY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AJeoq+Z5WucmTQVKUtIcwcvIvzIMIDi7YIzeoCuQoP0=;
        b=Y5ZF6W62rSi3a7lSLP9v8DkKN3wY8pgliM1/+kxtKbxo37KGHTmJ2PGoV7fHjpqd6x
         WzjSul+8YFVdDKxbWs+saccwTUvMsA/g3aXeybjWTPKeoG9YiW3HNNbv10cqM3e6kNIt
         QuSHfkNQRzciBpu+lIz5JNVXXbgpV1e6GXiTU9x2wVBCd58WzuvrX+7CSGpFAX1oNrQj
         2AXypCLzv1ZFzqVAFVR146QDdBNE8kd8aHFMb9e8qTF4zInTTVkMJF3huNQcHs3my4m6
         DNA3w6Qz/X5zqhbdlpDT/o40aQcgvE/doDXHi7k8leQTpznbi1OpfA9Se7XwwvkTTO8C
         InmA==
X-Gm-Message-State: AOAM533BBc18XB6ouQXbILXV5lHc7gt7siDpqLs/cY3raMyO7OBVJ66E
	5x3azNL44W1XF1mA0F9B+xQW2g==
X-Google-Smtp-Source: ABdhPJzw8iPuALjJ/8kpXHMg33VLmYMXrF5AQDF992t6FjpOqQ1z2rFQNZkt6dgaqjw8sRY3eqQNTg==
X-Received: by 2002:a17:902:c215:b0:12f:b1b6:9f07 with SMTP id 21-20020a170902c21500b0012fb1b69f07mr7880820pll.82.1629475048022;
        Fri, 20 Aug 2021 08:57:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z20sm7604377pfr.121.2021.08.20.08.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 08:57:27 -0700 (PDT)
Date: Fri, 20 Aug 2021 08:57:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Stefan Achatz <erazor_de@users.sourceforge.net>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input <linux-input@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
	linux-staging@lists.linux.dev,
	linux-block <linux-block@vger.kernel.org>,
	linux-kbuild <linux-kbuild@vger.kernel.org>,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 55/63] HID: roccat: Use struct_group() to zero
 kone_mouse_event
Message-ID: <202108200857.FA4AA13@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-56-keescook@chromium.org>
 <nycvar.YFH.7.76.2108201501510.15313@cbobk.fhfr.pm>
 <CAJr-aD=6-g7VRw2Hw0dhs+RrtA=Tago5r6Dukfw_gGPB0YYKOQ@mail.gmail.com>
 <nycvar.YFH.7.76.2108201725360.15313@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2108201725360.15313@cbobk.fhfr.pm>

On Fri, Aug 20, 2021 at 05:27:35PM +0200, Jiri Kosina wrote:
> On Fri, 20 Aug 2021, Kees Cook wrote:
> 
> > > > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > > > field bounds checking for memset(), avoid intentionally writing across
> > > > neighboring fields.
> > > >
> > > > Add struct_group() to mark region of struct kone_mouse_event that should
> > > > be initialized to zero.
> > > >
> > > > Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> > > > Cc: Jiri Kosina <jikos@kernel.org>
> > > > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > Cc: linux-input@vger.kernel.org
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > >
> > > Applied, thank you Kees.
> > >
> > 
> > Eek! No, this will break the build: struct_group() is not yet in the tree.
> > I can carry this with an Ack, etc.
> 
> I was pretty sure I saw struct_group() already in linux-next, but that was 
> apparently a vacation-induced brainfart, sorry. Dropping.

Oh, for these two patches, can I add your Acked-by while I carry them?

Thanks!

-- 
Kees Cook
