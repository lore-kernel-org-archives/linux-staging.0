Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890203FC2
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 15:49:54 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id mq2-20020a17090b3802b0290178911d298bso7556634pjb.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JP8WFZmb9rgUa+mH2LJuzuE/iABY2L7RW9PxVxSWy1g=;
        b=k4UQQteJL7Qh1f6962sQXTg69gVAgArCnEbcoafW8q8WU3a0dFyoCb6HUcE0lFqUsS
         2TQNQdHpbA93nCoa1N/aiXdy8pDJcz4pQGJmxqJfbouuNtmtbloWKcbAnFDzgP+YEWHK
         NHH2EzfCjBYGkA2kf/rNG+rCeii3d90rhg4wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JP8WFZmb9rgUa+mH2LJuzuE/iABY2L7RW9PxVxSWy1g=;
        b=A7RltWUWZNUbs0ed73I1uae7Yhqh1Of1zCQHKd4mxax/AwgbDD1EB93pZBjDijDr1k
         1+XwBOdWCnggWQSaprAsN04+6yyAHJWgCNMlkhSwsfPNr7QeyIFyY0zT2cagvnUENElQ
         Fzmb6ca52ayk9hkrwAhCPxkH5PDaAoNN+1INsD4H45RIu4ZrMjTLXL6uz85D6yazduOy
         AbPyJ+ryNleMJaA4XmgeM9QAl2qjgwJEGXVHtHrtMCaPpE2sifTh2G7Oa/JnuDKPypLZ
         pUyM7ophNUxbypIV79rZ6wlXTS0Zxt3dHB1bgQY28XsonY/VvVWPCnXck67BgNxiKyhv
         pCiQ==
X-Gm-Message-State: AOAM5307C/vta4sXMfPm7L1aF82ycZXnNuB6VdFoiW5rMzn+poE9wMrk
	iQZjP7RrL0xbAkdYCsAmirQTqA==
X-Google-Smtp-Source: ABdhPJwhegutOkRrxvU2g3GeI5YumyD6linmLQRuyi6C1VpKbOltTluibfSiLlEYf9DDH4WcSj+Egg==
X-Received: by 2002:a17:902:7c98:b0:131:21fd:3717 with SMTP id y24-20020a1709027c9800b0013121fd3717mr2602853pll.53.1629474594147;
        Fri, 20 Aug 2021 08:49:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q18sm7564913pfj.178.2021.08.20.08.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 08:49:53 -0700 (PDT)
Date: Fri, 20 Aug 2021 08:49:52 -0700
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
Message-ID: <202108200849.9EBF036376@keescook>
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

Cool, no worries. Sorry for the confusion!

-- 
Kees Cook
