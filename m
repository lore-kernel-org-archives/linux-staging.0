Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E862FB6
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 08:24:31 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id bt14so21226268ejb.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XWMVRav6ugv9WWVXZW+zfSfmx/O7fFWaPEDTpc7u2Cw=;
        b=ckQ2cEAdZCjilMxM7opJafyEFC18A+swrf1K8Xk6hz05cJ+HP7hoFtkYjGkwMYaQ6r
         mjybwe7ZQd4uFiPREkjj8tseehNLmoJIOOvSoiLbv5dQjXOCKZWklzKwnRmTHDDb+41B
         s9aXKg3mS7aRLe0+9QVU+Z7IOTlw10FLWi4+UFVTkohoTHvD05f0aQ2JAFW7CzTVK6Kt
         YdBsklz0FeudxOcE6ar0W/O1xPFDS3GfLNILkPklpFmRY1wW2cyld0CP7J5B93aqm1ch
         E9w86LkDryCi7RS73620AhtuDI7nfZ9EW70Uk1BjemNktypz8eJFjWtIt+QdJCCnN1HC
         PCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XWMVRav6ugv9WWVXZW+zfSfmx/O7fFWaPEDTpc7u2Cw=;
        b=pSm0oek+U0oBnDkrWfsFDMKLURKITchjsGr2OTg0RaYVTmkMyAdlcHCx2I8ylypCyA
         Zw68QjbMbQ74CbFFebt/zzKzCuPuE0h/22TilNf8f+tWUDflJ2aQmgefYkg7ran3R3fY
         xD731oypLhtBtjMNCoLKLgUV4RbFHTjubSz7K07x3vf4Xvh7Mht1HhQOxq2e31b+MnjE
         6U1UhL5v980cJDil66JBL2MOaGbQBZoPchaEnmuMfJpsIcgUqLkSZZ7EH9TuYv6T1oYo
         EmYaHjxwBCqEsVQlrneKUctwCEcuoL85ioaAZypBCxI1vHg+WmoB+QOcu8u7YuiLDUPz
         gO4w==
X-Gm-Message-State: AOAM532SKnWo6cZolzx/fZpPiZIgcDAps/9TJfjFZ2L8O1nfHGXP9D+2
	SS/Meq+8vpCfsAnyHUspVxI=
X-Google-Smtp-Source: ABdhPJy/dy7kB/oa9zwBuD8ZKie+GxZtZZwR+sxj12VwJndXxXfLSOdKZ1p/uTpo5D4xOCq60xk85Q==
X-Received: by 2002:a17:906:ecfc:: with SMTP id qt28mr2652489ejb.70.1629188670333;
        Tue, 17 Aug 2021 01:24:30 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id s24sm669565edq.56.2021.08.17.01.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 01:24:29 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, daniel watson <ozzloy@challenge-bot.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging:iio:ade7854 surround complex defines in parentheses
Date: Tue, 17 Aug 2021 10:24:28 +0200
Message-ID: <1759012.Riodu3x9El@localhost.localdomain>
In-Reply-To: <20210817043038.GA9492@challenge-bot.com>
References: <20210815023115.13016-1-ozzloy@challenge-bot.com> <YRizb/FGfYpGbpJy@kroah.com> <20210817043038.GA9492@challenge-bot.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Daniel,

Welcome to drivers/staging.

On Tuesday, August 17, 2021 6:30:38 AM CEST daniel watson wrote:
> If this is a false positive from checkpatch, I can submit it as an
> example to the checkpatch maintainers.  Do you think I should?
> 
> On Sun, Aug 15, 2021 at 08:25:51AM +0200, Greg Kroah-Hartman wrote:
> > On Sat, Aug 14, 2021 at 07:31:15PM -0700, daniel watson wrote:
> > > Error found by checkpatch.pl
> > 
> > What error?

Please, understand that Greg K-H is very busy, so he often is quite terse in 
his responses. That does not absolutely mean he doesn't care.

You'll read from him questions like "Why did you do this?" or "What error?" or 
other similar ones. I think that while working here during the past four 
months I've become able to "decode" :) the meaning of the above questions (at 
least, I hope).

First of all you should read and follow the guidelines about how to submit 
patches: "Submitting patches: the essential guide to getting your code into 
the kernel" at https://www.kernel.org/doc/html/latest/process/submitting-patches.html

"What error?" may mean that you have not sufficiently described the underlying 
problem that motivated you to do this work. Don't assume that the reviewers 
can and want to deduce what the error is by just reading the "Subject" line.

The "Subject" should summarize in few words the content of the commit message, 
and the commit message should never be written with the assumption that the  
readers want to compose the whole picture by merging "Subject" and "Commit 
message" together: they have different purposes and they should be self-
contained entities.  "Error found by checkpatch.pl" does say nothing about 
what error you're addressing.

Furthermore, the above-mentioned question may also mean: "Are you sure that 
there are *real* errors/problems?". In this case they are just false 
positives.

An example of a real problem that should be worked out by adding parenthesis 
is the following one...

#define SQRT(x) 	(x * x)

What happens if some code uses that macro like the following example?

int a = 3;
int b = SQRT(a + 2)

Would the result differ if we put parentheses around arguments? 

#define SQRT(x) 	((x) * (x))

As Greg wrote in another message of this thread: "checkpatch is a perl script 
that does pattern matching, it is really hard for it to determine for things 
like this specific example, that it is not needed.".

The lesson is: we expect you're smarter than checkpatch.pl! :)

> $ git checkout 36a21d5172 drivers/staging/iio/meter/ade7854.h # before
> Updated 1 path from 638ccd1543654
> 
> $ ./scripts/checkpatch.pl --terse --types COMPLEX_MACRO \
> drivers/staging/iio/meter/ade7854.h
> drivers/staging/iio/meter/ade7854.h:142: ERROR: Macros with complex
> values should be enclosed in parentheses
> drivers/staging/iio/meter/ade7854.h:143: ERROR: Macros with complex
> values should be enclosed in parentheses
> drivers/staging/iio/meter/ade7854.h:144: ERROR: Macros with complex
> values should be enclosed in parentheses
> total: 3 errors, 0 warnings, 0 checks, 173 lines checked
> 
> $ git checkout 143b51a80978 drivers/staging/iio/meter/ade7854.h # after
> Updated 1 path from 21c208a36476a

OK, this is one of many common ways to explain what errors you're addressing. 
Unfortunately, in this case they are false positives (so you should have 
ignored them and move on to the next problem).
 
> $ ./scripts/checkpatch.pl --terse --types COMPLEX_MACRO \
> drivers/staging/iio/meter/ade7854.h
> 
> $
> 
> > > Signed-off-by: daniel watson <ozzloy@challenge-bot.com>
> > 
> > Capitalize your name?
> 
> I can remake this patch with my name capitalized if the patch is worth
> remaking.  I'll be sure to capitalize in future sign-off lines for
> Linux.
>
> > This is not a real change that is needed, just look at the code to
> > verify that.
> 
> Agreed, this is not a huge change.

Minor changes are very well welcome here. Move on to something else and fix 
only what really needs to be fixed. 

> I thought small changes were acceptable, if they get rid of errors from
> checkpatch.  I got that impression from this video
> 
> Write and Submit your first Linux kernel Patch
> https://youtu.be/LLBrBBImJt4
> 
> At around 15 minutes, you create a patch which removes curly braces
> from an if-else.  That seemed comparable to the change in this
> patch.  That video was posted over a decade ago, so I would understand
> if things are different now.

Read again the last sentence I wrote above. I can confirm that the removal of 
really unneeded curly braces is wanted and welcome. 

Have a nice time with kernel hacking.

Thanks,

Fabio
> > thanks,
> > 
> > greg k-h
> 
> You're welcome!  Thank you too, that was a super fast response!  I am
> happy to get a direct response from you!




