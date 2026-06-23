Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD4346777
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782192988; cv=none; b=coyA4nRVe1VvheUsjamv82A/r6VOKJOXoCHw16GdZ0o3YTt8dF4V02wK/McLPo6sbpbrzIH1rdmK5b99M1ror7a1mYtf+mup1Tlc9O6OvI8jnJvwkIcdUuYRSkFXFpM0qSEPe/EvhD6Itmuwq4QZKmoKKRx5r1kzmlDXyZWnTeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782192988; c=relaxed/simple;
	bh=E9PaT4ktJQlmfw39/OI8QY2BfRmLENqrqr1K0stBSD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K63XxUN/Mt9muYT3+urSjFGdMQVew6dOKZioEdL6BpRvx0bQ1rb4Ke8bDLG3T8rMMvXKCB7nChvkWPjdossdFdxfzgq3TWsXRnhPuKWKXPqWgOgGzlmXRO4V7+yUHYAQ0OE/vCusxQ4I/dFjOgXW3jEQkzyUqaVQ62vYjIlgrkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LirVfjdS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LirVfjdS"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c0868ca8738so607689466b.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 22:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782192985; x=1782797785; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OaxV6GgEVyL0zz/zTFoFcvflrDxYKTmOf8mAQ4j2Lro=;
        b=LirVfjdSe8FZ4mTgnY2oJEC402e0JXJjgbOAn0Lt4RQdhqjbE+qe4HvHNXJufif7FO
         DSR7Ro7kmsEgX7TpvPg4XU4xrRRwjwk+70mu52+LINuXsNx/DAKGkTgCboM+ytikbCjj
         lnsOJlfoUsIz9K5+yh9i0lILpRHtD/acEaCplcNXIRNjHoLGmWrNlt88WbYbWqkmxjss
         q532tK5sVrnBQBHIj5cerywftp7UzCO1K4EFQ2kYXy8PQEWnut7oshKvMCWNvA1wrAX5
         GWCEn42XAX7QKttUwsW+zRhFRNstRpQbIkATWIxe4u8ILNaPiR2vmlYu4r1CQBJExDx7
         aOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782192985; x=1782797785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OaxV6GgEVyL0zz/zTFoFcvflrDxYKTmOf8mAQ4j2Lro=;
        b=pjSAyVVDlo2ni362D2MUwZm9E0lrRVyItzXrQqyPpCVKdVdiC6dtmme4JkizDhqaTr
         EC4QKga0UegybxvZTX3/ZxjE0cq+4qen7qPrMQgZejsIz127IFOlr4AsGpi8OTuV4MgV
         2t7u40jupB3VkrZoktBeKR0QZ/ao99ti7j9NXR2qDstq8A+4AX75UIAgJGBwxfZRm57G
         bnzBRB6P1PminvW7Vup80/agVul9b0eAUYRZIYh2h0V+/81G+p60kEngXtK4WDq2BDmj
         j42VJceKdv2YHMYGFx3ljsuMGV4TyIbEwgaLF5zrJ3IZZ1x1vbZ8WvwNCe3CSd52XhQD
         EoWQ==
X-Forwarded-Encrypted: i=1; AFNElJ83uXzYK36YzDrGxG7Ba0IGHVd+80xFdXfp/e7OHKyvkOOqL7DI85q+MAyA6Lc1pDjlyjbx517A8uHRea9l@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe4JXXzoALS+R6GrAXkooHr3kUOgS8h9IITD+N0EUwj9knCqKF
	THhKZiHseXyeLfodHf5++bFkIuDZtmQeHZmN8qLNUr5O0WU7cYOaU3nlRSmkyw==
X-Gm-Gg: AfdE7ckNHJTdp2HezL0gNiOoJAfTyng35KlYpCOqy8eFv5ifBEScFEcjG/FbarKTdUG
	PZ9gq8smGm5MrKv0FApeC1zFJWI5WQaV5mY7JqItlVFb9mjmYgJB/P9egrZd2worHLR9a5ZOhcX
	UF5T+8O+rfWfdU2JgRI7T6l8F6H0QSldhVPU8/a4qSuEYE+WcvX2ThiCuZwqiM2faiF5zIUlWSF
	Z0TVqRnThSdX6+gxIkSevtvwKsgBVM4iCDLXSoz9AKYH05+QZYRy/p7zsFWgVJfxGVmzVYuhAuu
	rd383uwkarVI2TMpwTU15Uc5+l200NW+u4N+LZyOKIoUq86n/js+vTKIwmCUbTST5g4kGeMqc2D
	x/oF/K+btfNgNK4NC8ufmMniyj8GFf6Z42CBnJCB0FE6a+zKeQt0q1BdTAegb7ieFN/ili6Hy3W
	wBftDmoO3U
X-Received: by 2002:a17:907:c008:b0:bed:5774:7c17 with SMTP id a640c23a62f3a-c108c7fdaafmr35648466b.5.1782192985279;
        Mon, 22 Jun 2026 22:36:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e9994d5sm455915866b.15.2026.06.22.22.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:36:24 -0700 (PDT)
Date: Tue, 23 Jun 2026 08:36:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: clean up style and dead code in
 rtw_recv.c
Message-ID: <ajobVOpSu1PMHaNo@stanley.mountain>
References: <20260622200239.14683-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622200239.14683-1-andrem.33333@gmail.com>

On Mon, Jun 22, 2026 at 05:02:39PM -0300, André Moreira wrote:
> Fix checkpatch.pl warnings in rtw_recv.c by removing an explicit '== true'
> comparison with extra parentheses from check_fwstate() and dropping a
> redundant 'else' block after an early return.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index f78194d508dfc..3fb48a8a52b17 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1597,7 +1597,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
>  	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
>  	pattrib->eth_type = eth_type;
>  
> -	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
> +	if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {


Someone already did this.

>  		ptr += rmv_len;
>  		*ptr = 0x87;
>  		*(ptr + 1) = 0x12;
> @@ -1841,8 +1841,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  			/* Duplicate entry is found!! Do not insert current entry. */
>  			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
>  			return false;
> -		else
> -			break;
> +		break;

This change introduces a bug.  I created a Smatch check based on the
new bug.  It's in the Smatch devel branch.
https://github.com/error27/smatch/blob/devel/check_pointless_loop.c

KTODO: review loops that are really if statements

Some of these have comments where it was originally intended to be
a loop but it lead to bugs so they hacked around it by only looping
one time.  These are mostly quite old code and they seem to be working
okay so probably they are false positives in one way or another but
just I feel like most would be more readable as an if statement.

kernel/rcu/tasks.h:1521 rcu_tasks_verify_self_tests() warn: replace while loop with if statement?
kernel/bpf/btf.c:7383 btf_struct_access() warn: replace while loop with if statement?
drivers/net/wireguard/selftest/ratelimiter.c:170 wg_ratelimiter_selftest() warn: replace while loop with if statement?
drivers/video/fbdev/sis/sis_main.c:2226 sisfb_sense_crt1() warn: replace while loop with if statement?
drivers/video/fbdev/sis/sis_main.c:2228 sisfb_sense_crt1() warn: replace while loop with if statement?
drivers/video/fbdev/aty/radeon_base.c:1556 radeon_calc_pll_regs() warn: replace while loop with if statement?
drivers/media/pci/tw686x/tw686x-video.c:133 tw686x_memcpy_buf_refill() warn: replace while loop with if statement?
drivers/media/pci/tw686x/tw686x-video.c:159 tw686x_contig_buf_refill() warn: replace while loop with if statement?
drivers/ntb/test/ntb_perf.c:462 perf_cmd_recv() warn: replace while loop with if statement?
fs/afs/rxrpc.c:526 afs_deliver_to_call() warn: replace while loop with if statement?
fs/xfs/scrub/attr_repair.c:532 xrep_xattr_find_buf() warn: replace while loop with if statement?

regards,
dan carpenter
