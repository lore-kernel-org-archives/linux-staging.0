Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D3C381B1C
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 04:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174656; cv=pass; b=spKvZgmSfwxRmb6NGlkg+GfqD2Eyy/Ss9EqcnnJpg4SjDqqZP7LROyFAUwLacbPerDwwAuvdlmSsmvdi/xod3qe123SipwMYV9EiMNFPLs3iLqVnUb04WL+amxoXtA+eYDF/vnN/d4eJPprsWAsiHVl93wLVGYZnb6kRU7pJA98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174656; c=relaxed/simple;
	bh=YyLiQa8QwDTwEC5WgDzVFtJl209xA95J0rJyPqJy5kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBnBpV8815cY83M0w5adjD4X/zba1KsKjzh0q0AyOs52Z54D1E/Tqr7A9/Xo+MNzrHjVILUvc1/fcROX5Gs3FaMVQRoJyTxjVoUYJxUshP1UkdTAZa5mA7BSkWKLKXjv/4PQCeGqf6EUVHF2wxDcYbPCadlnf9f04US1ZMKlapQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdaskApz; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdaskApz"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c167bda216fso238087966b.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 21:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784174653; cv=none;
        d=google.com; s=arc-20260327;
        b=dUQQh55wpGOYywBQdrj9XRGGfDcriaOOZMWy0KVRsqPQXOdJhZNmdsJLjljs81tU8M
         7C+LPTlogtEZ08nX/M9xNfsvBN3rHGTJj6r9T5PjCtl/gZaFMlNWSkTUkf/A4JvqW+Uh
         CkgOroNJqSRG+sP+p4wbIW9/v5lyEVWEWJhql/eckQqsyglBv9Bn7X2QZb2CVWYq2uEK
         AFev8FKnfiXsxWmJ5cbUrL0W/O517sM89Vri2nnhxOxpM83CcZTfDWohAz4D8wO+zKRJ
         ULE3g4wkQ2gKthRRUDrjp80vnKVnjLOVcO8B6SMeSBS6CIBrrLlMslhLEjteH0KVZw/U
         R5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V+R/iJvYpW8F2hzggTk5BeainGnDHmOhAeEBnRqEGx4=;
        fh=iF+upiwN0S8JobbSYdu9o9IXABfya9LQIy+B/hGKxYo=;
        b=QDhu+uBK/SnD3hp77SbT09+rl8NQ7R5s5DKwIjvrKuMIU2UwKa4AGF+SQA1a7R/BDQ
         bfYqZJ+tfZLKuTxPrh5G0H3tDCzucdEZfig8JmRwIGnRF0kle5nNHdgq5nGU0LJab8H+
         5BJX64gU6PZcF9XS82BpNGHA35X4ffnrdDRHKYnhOXcfqlI4paw9VWlde2mGqci9i9a/
         Zryj5hAv0saVbpI6VbDw8x+dzrxt00sn71h7/fXEjmt7C5YD0AvOEK61eimgJg70GfWA
         j+u9OaMOmRRhlj7BC9bS0HgJH+lzMPDgD6Rr2nvc+/vU7ElDsLndKidiCsU2R64mETGt
         slXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784174653; x=1784779453; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+R/iJvYpW8F2hzggTk5BeainGnDHmOhAeEBnRqEGx4=;
        b=rdaskApzmBQlypBM94WnWIYfyEcusjNyDnQgUPaV5AKt2T2fDoXpP21S7NJvmIgrGJ
         sdIQEcLENQvvLa2lWfEyjEECzA+ixjpv36sCYgvXqY7T+2JfbHeXnGcfkUgovzJgxNgX
         6JturkFFyO8Hg5+r+6ZuVRCm9UXuqcql1OJLGWY/6E7ZZFGJ4WENccWVuD+nzrNx//XP
         InJz/VUstmki1pqCOgFW2jQkhPjCWiCkNHkFUMm3TFZ+RNvb66s61c0o7ZXDW2QdV4iE
         /rAUNy7REGuAjXgM1BdUlvGTBcMQa6mr/2B1/aOu7Mnp+7ZRps1vQGT0UM/U7tiArLzI
         igdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174653; x=1784779453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+R/iJvYpW8F2hzggTk5BeainGnDHmOhAeEBnRqEGx4=;
        b=I5YQtrtuD7i6ZmUlmajTCu/rg/f2gYsa3ZcWLO0/eW9nYMwBdcGbG4MLgzXnQjMqmu
         dUPscpaBrGef8bHjQxXfjO5T3vyOypdGtzDhAy+1IB8Hlc/xZsyP9AO9mNAbYH1fT7T0
         NLzTCAb3fe3RKX4Qw+T6otCENzz4YP2z4iPADb0fpgld3pPmRH3JQWGIYMnt8Kg1wZso
         8+43hTzUiKhbhv6Ix1SSzip4ej0GejJlZxz3RLRyK30hwnYRnlLQU6eBTZInM3nJeJuz
         1kGKx9JEOlUC0Ldi2X6D1qP4RwDDTXCgzjRxcjkPMyagHZZ80dVrKqk7KaGJGCmFtJo4
         /z8w==
X-Gm-Message-State: AOJu0YzYglBeU0/rD3yZDLL3AiTIRIJgUL9k4WtL6sOf9d1vl3Fo9e5Z
	3aJJ7LKvGNrY/SO3nGnjWZVAod+ScUJtzfYjhgBRNXLaQi45l8O5swXmBsY72QnkHHz4ykB+FTH
	swriJVuqQsR67GCugO0W/mcDF1tj1oso=
X-Gm-Gg: AfdE7cmRRu4QUzc+fvPZGhU/CPf4dRu8hsjtmU80KRAX/AJHi+ySNb726Fvw6nZTCXu
	Zh+i+4zNvv92o4h39u5m1o4A3H8HZEkJDYM5DDlTjdNyYLn8GIo0T+jnbqfBpDT73bJFoTZecr9
	/Mg718ACFHre33rzl6p/l2u7A8+HXO9FhO1k/l5JUMIplBYHWE8z3lE2pdoSz6iOUY/GEzTknb8
	zOhs0BjVIwssCXiAEIO2SVYqSdxdcpkQjV2oFSn6GUgAYJL03+WmZjMALN5NtuS95YrtcdBbGwZ
	zklu3hcAPa+yPcUaTcxb6mksgzYxm9+fZ/5Wg0Z2X4Cb+KJhQzOu/RrcrL20FFl7
X-Received: by 2002:a17:907:1604:b0:c16:9bd:39cb with SMTP id
 a640c23a62f3a-c161f3b31e8mr977503166b.52.1784174652548; Wed, 15 Jul 2026
 21:04:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715124829.90290-1-ulijg308@gmail.com> <2026071541-spindle-voicing-fd97@gregkh>
In-Reply-To: <2026071541-spindle-voicing-fd97@gregkh>
From: =?UTF-8?B?0JDRgNGB0LXQvdC40Lkg0J/QsNGJ0LXQvdC60L4=?= <ulijg308@gmail.com>
Date: Thu, 16 Jul 2026 11:03:59 +0700
X-Gm-Features: AUfX_mwA1u5mHCzDQOuWt-BXe5c9Iol-Fh_iK6Xm-MLeSk8FZduwh5i4n1wWcgA
Message-ID: <CALVCEwZvMMOWi5D92UNbrE28Bxxxa5vNagxoFo2iOBCxpdUZ-w@mail.gmail.com>
Subject: Re: [PATCH 00/61] staging: rtl8723bs: monolithic HAL cleanup and tx
 power limit fix
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thank you for the feedback, and I apologize for the messy submission.

To be completely transparent: I used an LLM to brainstorm refactoring
ideas, draft some of the verbose commit messages, and assist with
migrating the custom CMAC logic by proposing to replace the driver's
custom function with rtw_bip_cmac() using the kernel Crypto API.
However, all the standard cleanups=E2=80=94such as removing legacy wrappers=
,
dead code, and empty stubs=E2=80=94were executed and verified manually.

I have build-tested the entire series. However, since I do not possess
the physical rtl8723bs hardware, I realize that dropping a massive 60+
patchset without runtime testing is bad practice and disrespectful of
your time.

I must admit that I do not fully understand the internal mechanics of
this driver yet. I was mostly tracing function usage to identify
superficial wrappers, but your feedback helped me see the flaws in
this approach and understand the logic behind the desired changes. I
need to step back, learn the codebase better, and look deeper into the
underlying subsystem design.

I will drop this entire series. Instead, I would like to start over by
sending very small batches (up to 5 patches at a time), focusing
strictly on undeniable dead code and empty stubs that cannot introduce
runtime regressions. Later on, once I am more familiar with the code,
I would also like to look into eliminating or inlining trivial
pass-through wrappers that merely forward arguments.

Please let me know if it is okay to send the first small batch of stub remo=
vals.

Thanks,
Arsenii


=D1=81=D1=80, 15 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 20:03, Gre=
g Kroah-Hartman <gregkh@linuxfoundation.org>:
>
> On Wed, Jul 15, 2026 at 07:47:28PM +0700, Arsenii Pashchenko wrote:
> > Hello,
> >
> > This patch series performs a massive, systematic cleanup of the legacy
> > vendor HAL layer and redundant abstraction wrappers in the rtl8723bs
> > driver, concluding with a functional fix for the TX power limit lookup.
> >
> > The primary goal of this refactoring is to drastically improve the
> > readability and maintainability of the codebase, transforming the
> > highly tangled, Windows-legacy Realtek abstractions into a cleaner,
> > more idiomatic Linux driver structure.
> >
> > KEY CHANGES IN THIS SERIES:
> >
> > 1. Dead Code & Stub Removal: Eliminated several unimplemented functions=
,
> >    empty stubs (like OnAtim, DoReserved), duplicate prototypes, and
> >    completely unused helpers (NULL_hdl, set_csa_hdl, tdls_hdl).
> > 2. Wrapper Collapse & Inlining: Removed multiple layers of superficial
> >    wrappers around core operations (e.g., rtw_ap_set_group_key,
> >    issue_deauth, issue_probereq, rtw_free_mlme_priv, etc.). High-freque=
ncy
> >    or single-use HAL entry points (like SetHwReg8723BS, GetHwReg8723BS,
> >    and xmit helpers) have been carefully inlined directly into their
> >    respective dispatchers to enhance readability.
> > 3. Scope & Warning Fixes: Restructured local functions (like
> >    lps_ctrl_wk_hdl) by marking them static and aligning headers, which
> >    resolves missing-prototypes compiler warnings.
> > 4. Logical Fixes: In the final patch, a critical copy-paste bug in
> >    phy_get_tx_pwr_lmt() was resolved. The computed channel index from
> >    phy_GetChannelIndexOfTxPowerLimit() was mistakenly assigned back to
> >    the 'channel' parameter and discarded, leaving 'idx_channel' at -1.
> >    This caused the function to always fail validation and return
> >    MAX_POWER_INDEX. Correcting this restores the intended hardware tx
> >    power limit logic and resolves a compiler warning.
> > 5. Refined Abstractions: In places where removing a wrapper would
> >    decrease overall elegance or require awkward type workarounds, the
> >    cleanest architectural approach was intentionally preserved.
> >
> > TESTING & VERIFICATION:
> >
> > - Hardware: I do not possess the physical rtl8723bs hardware, so
> >   real-world runtime wireless testing was not performed.
> > - Compilation: The entire series compiles flawlessly against the
> >   latest tree.
> > - Code Style: All 61 patches have been fully validated with
> >   `scripts/checkpatch.pl` and return 0 errors / 0 warnings per patch.
> >   (Note: A few pre-existing vendor style warnings remain in the modifie=
d
> >   files, but no new ones were introduced).
> >
> > This cleanup significantly reduces the boilerplate footprint, making
> > future maintenance and eventual mac80211 migration tasks much more
> > approachable.
>
> How did you do all of these?  Without testing I am loath to take such
> large changes, right?  Did you use a llm?
>
> thanks,
>
> greg k-h
