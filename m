Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A931990C7
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531607; cv=none; b=TBRm6fiV4SyD3P2bUkKe6w+5/L/3UgNdlCx3OYs72UaXLppxbCD10hHXLePvuEVK5pPEG/YfW8WrJBbqySE2BUjsBA6o/Pf96KOswlOIgUjenE7z8hCRu/WkvfW/hXIT6njp8OqBFDhPaGvgxbOg1xo3EXqh/FEiZeZvB/yB3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531607; c=relaxed/simple;
	bh=v2XMI6rt6Wcagz/ONLCx/bmlovqImrX7MjP59W4xvL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9R700N4IU3yyI1zphwndEsTLLAeSyA3IWsePEuihiqev7Yg2i3FPaug4AgHt9l9lnBf7R0tESUhCKHOkX8v+Chkm33qw2jLOHOr91s2GvbKPpNOj9vg075jsJ0WNwKBLR/A5nsgxT/zoIMQiT3HgnLovoIWcNUKdbzEMST2u4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+wHoXPw; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+wHoXPw"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ccce57762cso40783096d6.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781531605; x=1782136405; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTkflnFzBxrBA+AhdgmOSHDMHBNlmdvBwLVRtYBoOe0=;
        b=i+wHoXPwF8nF05e+68djUKBdjvz5zkIu2+jcaGtNGj/qOMDxfnLjtNC7NpIIz9O4gD
         QwBIAN868+p43mqezX+elDGQMP8i/UGdiM2aGXyyEsobXle9pLBR9NWT+0ZhpqjMENlx
         ZBwg3OtxU7d7g7ok7GThEpm/qqKJs7D8mU96cNkCCakQlWhUVcHy4xsnB9o22FMgm/ku
         n4oDixTX/PEuGHs7aeGEgpGGCFl6y50ILLSM8jt/jrfM00x3GF1+xdLAB6xeOrADAkdS
         1mplIPz4VX7/jJEgbLFVR3C+mCQKOaYd5Ut8s5+SdmKTa4Cu2L5qyCnK+BzGLf2edfZj
         pmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781531605; x=1782136405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTkflnFzBxrBA+AhdgmOSHDMHBNlmdvBwLVRtYBoOe0=;
        b=NrFaxRYrcqDaGj8etIZzEBSbAr6xM3Lo2jlNsAVChEAhLtN0moDmbPHfuaSUOHcxHF
         vsN5F29TAZ9+hzBX6tuueHEpc3mGDYy/xxA2woQ61CV7s5APnQclXt3BGZQLpzQ6Y5Z8
         71EPw5+EQ7Q03/I5cqqaYbuOCkV3KXm3Q/iyyJsrq3q1NoJyZOZy261VPjWwkpl7V2C1
         oVreZTH4mNt6wpjpNpZRFqr8NKbrHX7xW6jnUj8U9PzEvfK/a3/rMhMnjbqL1K74EO3d
         kxY59+AfoBT/P0eZO40EV/cRiUU2ukiEMhOXVhdb0vPfYF9As0g8gVh13j5xgtbVtr61
         fomg==
X-Forwarded-Encrypted: i=1; AFNElJ8IpXa7S4inZf9tXit0lgW4H/baI/4PSmzlI4ATJxFS7i2WzIO3rxIHMxyW39WcOJV2YkkD2QkDEDFzpXWm@lists.linux.dev
X-Gm-Message-State: AOJu0YypvFWuOiBlYwsEe1p61426UpYZ3WoJXikCG8amQbjJoai0tBIY
	yOK3M406R9y9Q3/cL0glxf3kXqF3huKhit26VD0NQcIqhsNvEBt3xJPN
X-Gm-Gg: Acq92OH5wkIEAuAC13Qj9urpYfLOQboL3koIXPeR7qDgmYciudP3gpbc8RcL0epkuX3
	MDLJ4RzcECJDyGzPVh5O3x+lxhTCZU8VxKgNhvbF9soyZhcWpCMmlRD1t7y7FP4V7b33oRfxq3Y
	B6aXEGaYGnW4WCJSVweTQix+BnYMmQFENtx6A2gDaV7tQBPI3kO/aH5ZXhVbE+goB3kERTuGSnH
	vjJwRix0FSawqzlhrHuLTG2Y42Z5RKM7oV45B4oq3RjwTzKu50jFpzTvVsRidTqRYy8DYtUlt0U
	3eYL4xIvA+cSPOlzJj40JTZMp7oqyuP5LerVa2P4K7xp4tEjnMHrqdb5+SpSstJ+5MLcnwvzOaw
	irHbBb17xtfHXIpxc2UKhR7w84MfBjjaofoUCpcjJjmfgL/S4tcR1CYAk6obExl5Nnhw3js6n/9
	VF5kzSR9H6MsCge3+T
X-Received: by 2002:a05:6214:4382:b0:8cb:e81b:576f with SMTP id 6a1803df08f44-8d44c6a62f5mr191044646d6.5.1781531604652;
        Mon, 15 Jun 2026 06:53:24 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d304b5df2fsm114856286d6.34.2026.06.15.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:53:24 -0700 (PDT)
Date: Mon, 15 Jun 2026 16:53:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>, Kees Cook <keescook@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ajADzfIcMxTecOsv@stanley.mountain>
References: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
 <20260615072841.3113700-2-dawei.feng@seu.edu.cn>
 <ai_d0B8YOZAwnqu_@ashevche-desk.local>
 <ai_kfgkuDYcFd0bG@stanley.mountain>
 <ajAC6E3Pc0edjySZ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajAC6E3Pc0edjySZ@ashevche-desk.local>

On Mon, Jun 15, 2026 at 04:49:28PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 15, 2026 at 02:39:42PM +0300, Dan Carpenter wrote:
> > On Mon, Jun 15, 2026 at 02:11:12PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > The bug was first flagged by an experimental analysis tool we are
> > > > developing for kernel memory-management bugs while analyzing
> > > > v6.13-rc1. The tool is still under development and is not yet publicly
> > > > available. Manual inspection confirms that the bug is still present in
> > > > v7.1-rc7.
> > > > 
> > > > An x86_64 allyesconfig build showed no new warnings. As we do not have
> > > > an Intel Atom ISP platform with the required camera sensor hardware to
> > > > test with, no runtime testing was able to be performed.
> > > 
> > > These last two paragraphs do not suit the commit message. Please, drop them
> > > here and better to describe all this in the cover letter (if not yet).
> > 
> > This is how the documentation says to write commit messages.
> > 
> > https://lore.kernel.org/all/ahgaOigklcDCYvRp@stanley.mountain/
> 
> Isn't it enough to have in the cover letter?
> 
> Thanks for commenting there, but I would insist to move these two paragraphs
> from the commit message here. Maybe Kees is okay with that, I'm thinking that
> this is too much (since we have lore archives).

To me the "An x86_64 allyesconfig build showed no new warnings" information
adds no value at all.  It is assumed and if you didn't do that then a lot
of people are going to know and complain.

regards,
dan carpenter
