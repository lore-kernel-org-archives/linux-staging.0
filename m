Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3299C2C80
	for <linux-staging@lists.linux.dev>; Wed, 24 Nov 2021 13:33:50 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso4298343otj.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Nov 2021 05:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=091FqIUggUob/ZEgOD1UGmSVx8eqHMlVt+VyvTQhn6A=;
        b=au7ap2L3XVfmUQpDFUV9q1z2pzfV6tI1hSANpw6nK8oEcVxFuNz5gSJIvT/yvvg2bx
         Nuv4km9vsK494RjCnFecvyL9gkhsZcPyPSih1HKuC20rY6MyRkFa18MegezQgC++nuks
         CvsSP1SwWUXLCcB/XfTbseSNmHdkjGPMYqOcHAxXUZ+qXxNwjn9Ngp1zyNAOKTURMfhr
         Ca4FKU9DVcZT8K0qYgmdTAajooM+YTaQZWa3WvNkqOX6oFLapRcYh8UZWvtGz4gqIbM7
         VksRTeP0M3vRDtzDbC2pA1SlIOjht+BRgpNuDaduf1VaPny9PiRYQKDIKFHDTJPZQPZn
         ecmQ==
X-Gm-Message-State: AOAM533TNF+yIvUOYabK6ST99deC2os7Vf7jAq6vhYvnBB/7VbbF8F1r
	9nX66baNAPFFzYyEUurfYwO1X9EqOXS2uYnLWWA=
X-Google-Smtp-Source: ABdhPJzQoNI/Fsb1RYaYMIo8ITBU8mCa/gSsaWPVLoUcuICuMNXnffh1kRK/Zt6rxw8a35LfxbFQ+4vJZ0v59kljSMQ=
X-Received: by 2002:a05:6830:348f:: with SMTP id c15mr13170421otu.254.1637760829265;
 Wed, 24 Nov 2021 05:33:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-13-keescook@chromium.org> <CAJZ5v0iS3qMgdab1S-NzGfeLLXV=S6p5Qx8AaqJ50rsUngS=LA@mail.gmail.com>
 <c5d1ee1f3b59bf18591a164c185650c77ec8aba7.camel@linux.intel.com>
In-Reply-To: <c5d1ee1f3b59bf18591a164c185650c77ec8aba7.camel@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Nov 2021 14:33:38 +0100
Message-ID: <CAJZ5v0i61F9SpwfER8o5J_Kf=J9dJUv-qd+bG9hcL42X2eMRtw@mail.gmail.com>
Subject: Re: [PATCH v2 12/63] thermal: intel: int340x_thermal: Use
 struct_group() for memcpy() region
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Kees Cook <keescook@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, linux-staging@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	clang-built-linux@googlegroups.com, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 24, 2021 at 12:53 AM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Tue, 2021-11-23 at 14:19 +0100, Rafael J. Wysocki wrote:
> > On Wed, Aug 18, 2021 at 8:08 AM Kees Cook <keescook@chromium.org>
> > wrote:
> > >
> > > In preparation for FORTIFY_SOURCE performing compile-time and run-
> > > time
> > > field bounds checking for memcpy(), avoid intentionally writing
> > > across
> > > neighboring fields.
> > >
> > > Use struct_group() in struct art around members weight, and ac[0-
> > > 9]_max,
> > > so they can be referenced together. This will allow memcpy() and
> > > sizeof()
> > > to more easily reason about sizes, improve readability, and avoid
> > > future
> > > warnings about writing beyond the end of weight.
> > >
> > > "pahole" shows no size nor member offset changes to struct art.
> > > "objdump -d" shows no meaningful object code changes (i.e. only
> > > source
> > > line number induced differences).
> > >
> > > Cc: Zhang Rui <rui.zhang@intel.com>
> > > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > Cc: Amit Kucheria <amitk@kernel.org>
> > > Cc: linux-pm@vger.kernel.org
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > Rui, Srinivas, any comments here?
> Looks good.
> Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied as 5.17 material, thank you!
