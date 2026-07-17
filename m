Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F133FBEB8
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 12:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293031; cv=pass; b=KcnEE9wCS7J+Qu2xlU1AN0gcILMfOmhEPS+RZSAheAV15kUuUzb5AkzyuXlv6FgdyJ8dzpXswIe+DA4bTsGPNlK85revp91h94BZ9zsmzWicvztQG/d3MP7S48vtsdZ1gmGOFU+JcrKhOVkhosg9LSyDuc2t69A4iYEOxGHkLaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293031; c=relaxed/simple;
	bh=VxRwuygTU9AoUQ0S4EdfU+bCUToEaxOHkB8It6+r9Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaG2AuKJcwrwJ9Uw18jBkiDJJ/b7rio8uYno7yzbzlFZF6jfANG4vPhIzVxizruNwFAsuONBmTh/2HoTEHXwj0dBSzIi/YUEBPM8xC7rvHe/Ud/CD8+o6zVUovEIQYB/+H3C0tpfjqKC8/gcqOGD5gOXdx2tI72r989298BTAoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQJi9h1D; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQJi9h1D"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c160420289bso1085332266b.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 05:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784293027; cv=none;
        d=google.com; s=arc-20260327;
        b=KSXeVqy2H2xgcrJvRMduhJSZIOg935aP40Bkc0wEYLbcSzxTE29/hh6d6LYaBi7yCJ
         bqATG7I69FaF8fQi2NulLSQBrob59I+QrwkcDPPadrIgEUWOWKCC0Q74legekzh/n4Z+
         eXlI4GRRct5XGwm1KNqd/BnwAXuo5Bei1JrorpJKEa4rXphKC6+Xsu6I6E0I+f9ws08+
         hBeoOG6q3FLmXfSsiK44Wht7w7hK3NERvx1E6vJifYxbQCn9K7EICAZmIHbT6ch6rBRw
         itH5GsRN3yXEjMVfxkn0xKvm1tY3T5+GYuVnFS5kB2WMsdA02t4m4iG+x7xs+Kv1WwQZ
         /8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=svTgFu9s+lNvR0ImLSl7IFWMvijrBYhlNbArZkaFdUY=;
        fh=ycebxEjTnsNh9MFGfctE6W+/mNEO+K1hUVRqH2OKtks=;
        b=eyVlIU7eRX1wo3XjDrIKxi+Bwjn70t1aL20gy9OleCCEnYTJF0olEmqrQfm6uSnDJ3
         pmTRJlxWQoRmrpIT5Zml553oNnnUwlHyZOZJSOesIoigmHzS8EXe0XvE8rB9ITNbqv6J
         9u1X+an+2JZ9skFGYyB7IzdwZhJxJsA/XOr95N082O0qdg+jm7Vig9NYwdpR12zVQxzj
         /jfPgHaf4uJeWHP5Vrs9/8z+19tmSL8VfZKLqu5zG8hGJigFlfQWC0ozqVpCrIE6oqWF
         F+rJeMbL5LEMfVxre18zRhpoR1L7XeyFJPSx5V/Jm4sslBc14CS4SNXG426Cby/4Ai+B
         LMIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784293027; x=1784897827; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svTgFu9s+lNvR0ImLSl7IFWMvijrBYhlNbArZkaFdUY=;
        b=bQJi9h1D+UVWwUeYKa9/C46LqWxTWBMfT0AsPfbPnuPeHa/AQ708WQ/OCjEq7pX52q
         4ejYYsoMhiC7amO8cv6QEuxQRoV4b4uRj0cjSf5zoLR4Hh9ncR4kX+uvUW9uu0q+krth
         rV77FgDbD6dz9pyzcd7HVR/RjE5uBPk7bcVISpYAL0UtVkLxIMdS7D1dzTm7QCRJ+OS1
         sI/FQPWv1O7Xg3zI0V0na8t6jH2H+2UGVvoyGbosB6Rw1iIWMply5B/cO5rXCLMcSNek
         03DHbI7CR23AqTaOt8B151SKRhQ/VIWDzvCi5iwzZANHDyTG9XRVc1KH3xaFozMGg9l3
         bUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784293027; x=1784897827;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=svTgFu9s+lNvR0ImLSl7IFWMvijrBYhlNbArZkaFdUY=;
        b=Ojet8f+0y+RvngnWPxoUsPC2lgJLYqmDGtPFhtaSHd6ptuCqM/uOBDl/kFsdnUXcfI
         ffgjYsFQYx3fV//Zg6oKexpa+xrudIh23HAUGYAuaXEUyL4r3UFhI/BW0qpYpQo1CxmH
         0zn/j0mhcDxuk9SX2gQvDKdaQOLHJt1yZ6dSEPALrLNP6El7fmUyI/rK8R6pbVgmMK02
         2XcK71HvNFyh7O+egpGROlCg/mKwlB95S3+8VPkByY5QfWtK9TNQ4RIM39h6sFKJqgUS
         8kQj6KUpy/cYQ1KtV10mLVbXBKOCxg7zFjizJEe7T9R4/15ancsKYbXOqCaL8oloeB5y
         Gy/w==
X-Forwarded-Encrypted: i=1; AHgh+RpCQFA2efe7KjwecAMy4rqPIZDEhL1CuJng0JSTwUQKSoY0F/PMXllxsOIsWqR0aJ2Dth/ceR6dflbOciBJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx59FTfLROSZXWowhwkEngXIrAqw+I4b9SWBZE1TQ5hvAwKBoPf
	20n+QWjjdEtLTfKIoUO88og24s88+9xbcZR5MuhDNSLygcjq9Sh/vri9dzmDUVyHBs/f9lsXD2/
	Ox8yOiB3qi9qEuEqPOE7So+i52FWz1S4=
X-Gm-Gg: AfdE7ckIe57/E9CBlNsqy3F506T1VCaxxBv/fyMZ2YRbJFviQh8LNIzZr5JiKcC2FB2
	REf/IHyjzgAObDaAz1W2SypsGEcmtwJpAPTuLgUUnd0+hPMZS+Jy7rZUx2mUjMF5ExMFTbzbihF
	pYqsZ0Aesij750t3DZ2945l4DPp7omiTPFWLQ5TvAGiL6+5vqQEmFHcqj9wQhsvs7Z/AWmCzFls
	RIWrRkllzXixfmyHV0nUiqe2tNj7XyL4qRewvcfG6KPzuGv4tuKcn1yR6zmxEq5Hk6iSb4s453o
	SCShkORVbayOQoeE/I5hyUaaw0Dlt06WQk4HhpqzaKA8aKS+k3fBHI3C
X-Received: by 2002:a17:907:72cd:b0:c16:3187:997e with SMTP id
 a640c23a62f3a-c16b46ade61mr99195166b.7.1784293027129; Fri, 17 Jul 2026
 05:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710212312.117781-1-meatuni001@gmail.com> <2026071744-unsteady-easter-16ab@gregkh>
In-Reply-To: <2026071744-unsteady-easter-16ab@gregkh>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 17 Jul 2026 17:56:54 +0500
X-Gm-Features: AUfX_myKzWSR5rEYoP3NZQmCokffDes95vQyXBZBa1acuorlTHcHVbko8mUajy8
Message-ID: <CADqcGB=nEfdZhZj_zkO3+nW3M17XYEM86mSQctG_3h-pjsz-3A@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: audio: bound topology parsing to the
 received buffer
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Vaibhav Agarwal <vaibhav.sr@gmail.com>, 
	Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 17, 2026 at 05:13:00PM +0000, Greg Kroah-Hartman wrote:
> How was this found, and tested?

Found by manual code audit of the topology parsing path in
drivers/staging/greybus/audio_topology.c.

The pattern that caught my attention was in gb_audio_gb_get_topology():
it reads a u16 size from the module, allocates and fills a buffer of
that size, but then discards the size and never passes it to the parsing
functions. The parser then walks the buffer using lengths and counts
taken from inside the buffer itself (size_dais, size_controls,
size_widgets, num_controls, num_widgets, num_routes, names_length,
items) with no bounds checks against the actual allocation size, so
every one of those walks is an unchecked trust of wire data.

gb_generate_enum_strings() in particular has an unbounded
while (*data != '\0') scan with no end pointer, which is the most
straightforward out-of-bounds read.

Testing: I verified the patch builds cleanly with
make M=drivers/staging/greybus on x86_64 (allyesconfig with
CONFIG_STAGING=y and CONFIG_GREYBUS=m). I do not have Greybus hardware,
so runtime testing was limited to build verification and manual review
of the bounds logic.

I confirmed that:
  - All four block offsets (dai, control, widget, route) are validated
    as ordered and within the buffer in gbaudio_tplg_process_header().
  - Each per-element walk in _process_kcontrols(), _process_widgets(),
    and _process_routes() checks that the element fits before
    dereferencing.
  - gb_generate_enum_strings() now has an explicit end pointer and
    rejects items > names_length.
  - The gbaudio_control_size() helper centralises the variable-length
    control size calculation and validates it before use.

Thanks,
Muhammad Bilal
