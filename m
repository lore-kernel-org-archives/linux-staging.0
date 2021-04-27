Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA4F72
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 12:10:31 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id c3so22440482pfo.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yFns5/VsmEuhW6BFWribM/FHEmMkehdcNDcB3HXxuuw=;
        b=HNETH0OLfLiShq7AcW+L88ywPZDO8cU6Y6ThAvLx4MoB+YWrRf4Pq3xMYOjS9nJaXc
         xBlPQl402XFA9l/GEHmI6/aO7otQIMfCwyOr7vmJqqrDEq6txh7URe5y1rslCUt0zxlb
         0wXm1NL3Xfk5BgOArWcqNvWYkI3cXlvm1+02gz0SAOaAH2HtLpUMNYj8MDgci0ReAMzd
         k92/kisjqNKvdGAu8ElYjtP4vzwCT+B5O4oZBfPvw+2NqKWiv/fjvJsiXjm+3o4ng0Ow
         KC9niJ3R00A0lG9mwUg0Y1cX8PXFBgdA10W5FciKCTemu4pRML51RMcREDN1+IIt1fde
         blYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yFns5/VsmEuhW6BFWribM/FHEmMkehdcNDcB3HXxuuw=;
        b=tqjagDhCXE1oB6SNoURjgO3SEFDqqOUSU8k5Y6mdRVzJryixGDT8ilLS4g7LmVXMGz
         8fMrNvh/A2URSNLTAaH58i04wFYOCUsDUnez+DYS75a0E5NGKlfZE+oR+ggSWQzj5PwN
         YrENohdNgY097p45DTLVshFBg+z6Pla5auVu/Mm6D1qr/7UI+WacEtDOi1T5xxhblsar
         MD1TedG2T32T07eKln6nYscojvXZWmD2quWXe6h4nxtDRlHNuCnrKjpHimm7YLb4MMi7
         rK4JBaAE1KrnfYXz4DZrW/U/QJMWhIKm7J2ksTIxTY0D70H7fENR9Ijrrbc1j+iajkE6
         u8lQ==
X-Gm-Message-State: AOAM531SEDgUhEhTRJjRSVqOKP3n45H7bfxw427dMbILMQ0DPLO/PUWS
	5c7ldUkGUW6I/jJh6hZmYbRRfSNgG3zjFH1G1vM=
X-Google-Smtp-Source: ABdhPJzxZgX8TOkf06ULjK9UhatMG6bwCZGoTYAzSH7DAex31IQ5gsrlyM/5e/vVr5Nvm8eb9Y29b5AE65ZU6gtJ7wU=
X-Received: by 2002:a63:a847:: with SMTP id i7mr21248455pgp.203.1619525431391;
 Tue, 27 Apr 2021 05:10:31 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210416142044.17766-1-andriy.shevchenko@linux.intel.com> <YIfwZ/oPVB9splQq@kroah.com>
In-Reply-To: <YIfwZ/oPVB9splQq@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 27 Apr 2021 15:10:14 +0300
Message-ID: <CAHp75VdkPWKVSYmYqerMs=6BpkS81KcL9DnYGL5XbkMm-rrW9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] fbtft: Replace custom ->reset() with generic one
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 2:09 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Apr 16, 2021 at 05:20:41PM +0300, Andy Shevchenko wrote:
> > The custom ->reset() repeats the generic one, replace it.
> >
> > Note, in newer kernels the context of the function is a sleeping one,
> > it's fine to switch over to the sleeping functions. Keeping the reset
> > line asserted longer than 20 microseconds is also okay, it's an idling
> > state of the hardware.
> >
> > Fixes: b2ebd4be6fa1 ("staging: fbtft: add fb_agm1264k-fl driver")
>
> What does this "fix"?  A bug or just a "it shouldn't have been done this
> way"?

There is nothing to fix actually, it's rather a pointer where this
change has been missed for some reason. I'll remove the tag.

> And as others pointed out, if you could put "staging: fbtft:" as a
> prefix here, that would be much better.

Got it, thanks!

-- 
With Best Regards,
Andy Shevchenko
