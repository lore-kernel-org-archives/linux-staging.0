Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736DC6AAD
	for <linux-staging@lists.linux.dev>; Wed,  8 Feb 2023 17:32:20 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id p16so8465536qki.9
        for <linux-staging@lists.linux.dev>; Wed, 08 Feb 2023 09:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ab1RjUdxvP17+YGwr2cWF8s+ENzo57KFBShZI3lUZaA=;
        b=dfxnruPINjNPupZYXweFRu5h9z2HOASWI2s5bsoyRZLaIuhKPy783w+jBOyUYwKL1f
         4ga5HhDOj9gT4nSGM2uFITLBXvsOVfPSdHWvm185EwXzPRVDMDwAzUvvdj07oKl4TopS
         ErRuK9b6kbUv9+HVR7/Yv13SvTzfMv93oUO6BqmnxAL6TJGpbm+f9zTKULXV2guJWx3C
         DmkFMXbsVEUmhc5Iir3S2gY1tMkJxjDFePZWEHLOBIfFNtDbYfLYY/GXvPMVpo/tbB61
         Ffv7lbLzhUCDNhqVf9iteS3AL7aSOjqsiJYzSsyhwaRjdLp6CGHRdgc3HaVdVjsKY7jd
         x5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab1RjUdxvP17+YGwr2cWF8s+ENzo57KFBShZI3lUZaA=;
        b=v2giMvidFjsuPa8bT2WgTHhUlqgbEUbWRpM3nRQNEco8jBuhHBs6oPOp3EPBedemPg
         lo7DUcYwTl/+VHOniTCAERaMYE4LDKuJZbGHd7W4DSrvFEep9JD+cp8UlaJJ83UILzHW
         KuSW+ToBK23OJMAieapXuigW5sK+BaGgsR/E++m9IsCbr7i0//mWZZ+QUUJEiCzQ+Gnm
         6mWADrBLsYDTDmUOK1AGc8Mqs03O1D6NaZHwD1N0hWjyFoAfk7LRB8BeF2bQIWSlUSF5
         Gq/j/xrAtT74WK9PVEfcBTq8+tchJG7fFK3RlFZHmAmcvTxfcE2iC7CdiO3NuMf4jHPg
         Tdcg==
X-Gm-Message-State: AO0yUKVjHJNFK2QWueHNpInmt+Dk6e8tZCPx7Anrk/4YdmJ5QoolUPr7
	fGe45WQNHEcAzz2AysfS2jM37ukwaul8+yu6Cgo=
X-Google-Smtp-Source: AK7set/8yzHFxOA1zz0vOqmp7SOH2rfQnyZiVpjaexktNnocUhy7OEJ4UUxky8bxv3T5hufGAI+Z5ijT9lzJEpFMVVw=
X-Received: by 2002:a37:9a97:0:b0:706:7bf0:3440 with SMTP id
 c145-20020a379a97000000b007067bf03440mr753000qke.9.1675877539199; Wed, 08 Feb
 2023 09:32:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230123125205.622152-1-hdegoede@redhat.com> <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com> <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
 <Y+PCulPVN7GGz2T7@pendragon.ideasonboard.com> <CAHp75VcEaEwFVyAm1QijXjw0tF+D9JSr2JET0RJUNMea4nGMew@mail.gmail.com>
 <Y+PH7V9vggOLDybV@pendragon.ideasonboard.com>
In-Reply-To: <Y+PH7V9vggOLDybV@pendragon.ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Feb 2023 19:31:43 +0200
Message-ID: <CAHp75VeC8UM8WA-EECB98n+DZQ5J5kgdx5yrxnpYjpBRQjtQ-g@mail.gmail.com>
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 6:04 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Feb 08, 2023 at 05:50:26PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 8, 2023 at 5:41 PM Laurent Pinchart wrote:
> > > On Wed, Feb 08, 2023 at 01:27:37PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Feb 8, 2023 at 11:52 AM Laurent Pinchart wrote:
> > > > > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:

...

> > > > > > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > > > > > versions of these register access helpers, so that this code duplication
> > > > > > can be removed.
> > > > >
> > > > > Any reason to hand-roll those instead of using regmap ? Also, may I
> > > > > suggest to have a look at drivers/media/i2c/imx290.c
> > > >
> > > > While this is a bit error prone example, a patch is on its way, ...
> > >
> > > The two cleanups are nice, but they're cleanup, not error fixes :-)
> >
> > It depends on which side you look at it. I admit I haven't dug into
> > the code to see if endianess can be an issue there, but the code
> > itself is not written well, esp. when one offers it as an example. So
> > definitely there is a fix on the upper layer.
>
> Did I miss something ? Your two patches replace a tiny amount of code
> with helper functions that don't change any behaviour. It's nicer with
> those helpers, no question about that, but "not written well" is a bit
> of a stretch and feels quite insulting.

Sorry for your feelings, what I meant is the pure educational purposes
of the example. When one takes the mentioned driver as an example and
uses the code in a slightly different environment the endianess issue
may become a real one. That's why we have helpers in kernel to improve
robustness against blind copy'n'paste approach. It does not mean your
code is broken per se.

> Feel free to submit patches that
> add new "well-written" helpers.



-- 
With Best Regards,
Andy Shevchenko
