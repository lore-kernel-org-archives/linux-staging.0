Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2797D2F82
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 13:50:10 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id w3so84598468ejc.4
        for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WNnvA9/2jBDYMEDC1w1C/VHcqT7vK38Vp7qzF/BVp38=;
        b=EfOYkhreFsfsXRF64hm7fSGQAbrmc4om/PWG9R/5+Op3S+UGlQiANlGfBAznabRs0h
         0iuWynP9DmNFyzIcz7lzfH6FLdVYt3zZdh09AWJkp0Ygl6h9Vd22yBSO2NbFBEEpGlf3
         uDJAFpUp7ru4xrmtdvUOLq8BlZJWq+IMmpDybw9PP0lX18oDECML2VQUjdd6DDvSoRGs
         QGBiYJ+4YLL1vFUaFFI8iNtmdgPe3eIOQAd2RZI7iRsQIMf6NIjAO+UqHMz5gqQEAvmH
         HIs2JH5L9xAPb3+BQXkEY6y7XXmFjMUs3YtLFOe732bU8q1vCpyBmGw/D5Y9aHRlt7kW
         w7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WNnvA9/2jBDYMEDC1w1C/VHcqT7vK38Vp7qzF/BVp38=;
        b=bzSCJj6RnGYLd//WFsBWkCi5/d9MKV2uJcl9pgnON1wEO+2TEUlSlIXm14l9pom7kt
         zHAFgROMk1f/yu/xF9s/LWoLfZgE4Rzakn7hpJhqfl0zRevLkqQEih4LbchVfG+mfj1T
         ybuYCppA5IC56m319Ns2YSIUeTOYeI8rTiFvgmtOpwnJYjtonI6K3BpvjQIAmialHMTQ
         2F/1eRE8j18+t54ZJbVzck0I+TF9xQuEPZUWF0TVEvY5ww0C1db9KnPCl/Izkoujfdmi
         tZFCWTy+8YjwwdmD515nHeRLAdGTEs6MOVujKv7pF+opKEHTQqBcoxklOXWtGOtpUliE
         B6lg==
X-Gm-Message-State: AOAM532jjk3UWPnkIehlp9YsbqJ39RyPJtzFm79/0Uyz4PEWgE3f6na0
	MkVGk/S/8WH0t2AAycDKv2Q=
X-Google-Smtp-Source: ABdhPJyS70pfKecNihEcCvlQZrTAzeE0Edi7bSj7WmzB9CaxqQs+xCg7H/LK7mu3o4a4eT4lAKoOUQ==
X-Received: by 2002:a17:907:9811:: with SMTP id ji17mr19196220ejc.188.1619445008593;
        Mon, 26 Apr 2021 06:50:08 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id s8sm14988990edj.25.2021.04.26.06.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 06:50:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Outreachy kernel] [RFC PATCH] staging: unisys: visorhba: Convert module from IDR to XArray
Date: Mon, 26 Apr 2021 15:50:06 +0200
Message-ID: <2352794.1zacegZ1vs@linux.local>
In-Reply-To: <20210426132928.GL235567@casper.infradead.org>
References: <20210426095015.18556-1-fmdefrancesco@gmail.com> <2833559.jtDpNxbUmt@linux.local> <20210426132928.GL235567@casper.infradead.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, April 26, 2021 3:29:28 PM CEST Matthew Wilcox wrote:
> On Mon, Apr 26, 2021 at 03:14:42PM +0200, Fabio M. De Francesco wrote:
> > > > -	int id;
> > > > -	unsigned long flags;
> > > > 
> > > > -	idr_preload(GFP_KERNEL);
> > > > -	spin_lock_irqsave(lock, flags);
> > > > -	id = idr_alloc(idrtable, p, 1, INT_MAX, GFP_NOWAIT);
> > > > -	spin_unlock_irqrestore(lock, flags);
> > > > -	idr_preload_end();
> > > > -	/* failure */
> > > > -	if (id < 0)
> > > > -		return 0;
> > > > -	/* idr_alloc() guarantees > 0 */
> > > > -	return (unsigned int)(id);
> > > 
> > > And it shouldn't be using GFP_NOWAIT, but GFP_KERNEL, like the IDR code
> > > used to do.
> > 
> > I'm not sure to understand why idr_preload() uses GFP_KERNEL and instead
> > idr_alloc() uses GFP_NOWAIT. I'd better read anew the documentation of the
> > above-mentioned functions
> 
> If you're holding a spinlock, you can't do a GFP_KERNEL allocation,
> because it can sleep, and sleeping while holding a spinlock isn't allowed.
>
I know that since a long time... that is last week, day more day less  :) 

I've just started to read R.Love's LKD 3rd ed. I don't have enough time to 
read it at the moment, however I skipped a few chapters and read "Kernel 
synchronization methods" and "Memory management".
> 
> The IDR and radix tree have an approach where you first preallocate
> memory using GFP_KERNEL and then use GFP_NOWAIT or GFP_ATOMIC after
> you've taken the spinlock.  XArray doesn't do that; it takes the spinlock
> and does a GFP_NOWAIT allocation.  If it fails, it drops the spinlock,
> allocates the memory using GFP_KERNEL, and retries.
>
This is something one cannot find in Love's book, unless I overlooked that.
> 
> > This will not be anymore a problem when I'll restore the use of one 
namespace
> > per HBA. It's correct?
> 
> true ...
> 
> > > More generally, the IDR required you call idr_destroy() to avoid leaking
> > > preallocated memory.  I changed that, but there are still many drivers
> > > that have unnecessary calls to idr_destroy().  It's good form to just
> > > delete them and not turn them into calls to xa_destroy().
> > 
> > This one is a bit obscure to me. I have to look into it more carefully. 
Maybe
> > I'll ask for some further help.
> 
> The IDR used to have a per-idr preallocation, so you had to destroy it
> in order to make sure they were freed.  I got rid of that about five
> years ago because most IDR users weren't calling idr_destroy().
>
OK, I think I got it.
>
Thanks again,

Fabio




