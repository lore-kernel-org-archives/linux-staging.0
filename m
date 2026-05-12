Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3D3395AC8
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586862; cv=none; b=FSTbPIIGKSjlTEpIWcZ9YkffNwCZsMuhA+wzxp53QEFRW6z5jdM8WWwXIsPe9jC70NNPdgB5uMWZ/hTEnpaPoxOXnDHh4ZBUsNdil6eFf86HGnOB03eQeVmTkUKYCyLkXCgNidXxE2vcEsAMaTb6ax6h9HJypHYMldgw2ASIvpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586862; c=relaxed/simple;
	bh=gL0Br2pirlJBCGgt/nkebMR0VriQ15dKaa/pjR1m15s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuHlGzlEiKMmBbAl1nUXP39GtyShvWxvY+4mjegKb+pc2KoHSXB598kmb+CcVdsxuqRB76j5EtuqSLR6b0ezgWEluqk7JzIK/Vd/GNV2VnfcDAnCfoPvPxvdeS5pIh+ZDZGaiORfOnWCSM8DGQ/AvzEC78y2yXyg5jVIct9IrXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3626631e0c.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 04:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778586860; x=1779191660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dbfddVEKaVUpeRupPeeRClb9VWLm6ZXhiSdHO6tx3Y=;
        b=GeluNjgoVA96uGuRr1MxuMyP3yxvRExZ/WbEz1WWe9Y0Fxgs9pu/U1/Fu9e0g5kXRm
         /Q+gwZkSIcz5yslY8RmO2FFLrDqgv3bWvx8TL4u7gmuriOa0DV9oeMV6sj+wVIE5Bz3m
         I5sYraRxtE7H7bWftnWqQe+apVfKMJH6A6xnwc+aJX3+u7Vm+lAyjaX9YLTAj/u4IN3A
         KXuV3Fnk7Uf5OgeuCy1p68+BoXLl24dnVLn+PFt3RDCspADVT1Xp4qodLpFPdowcyXpk
         sUArkmehpLdgV+q9vNyRBvcVSB3XrDcs6rHMZ2ycaT/Cy+tyVy6dpFSYRe/+Bhv9KmVj
         GN5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ffjXh4Xleg1DaPPqWwqQP9irAOvk0VP9PJ0VTQSm4lx1oo+jNZJ1Pf/1qE1u7S5Ynb/yGzrFoAahgKpmL@lists.linux.dev
X-Gm-Message-State: AOJu0YyDzzr1n5DMza6gZAXTA9NP92H5Zz6uONdRQrcDDsvLs3VV/IYI
	73lriNEDJzmC9SX0pNykhPFTNZOeT255vNrOMgU5OZ1BB+9A1D/q3EHs5KKah9EW
X-Gm-Gg: Acq92OGtlPD8EQtIH845Rl5tXVatrKCqXMReXytVLV7w7GFnSvipt8UIz93V9Dvv8yT
	13gJqhZOkZf76DKLPG7Ja2gmEfMOf9oDTysz8Wd6BfPcd8A3FqebC+xevbeRakov+oRmn1gFaTT
	5iZcy1DzZOCLXLfOPw5EehgfPhBuHJ2SzJLsAlvBxLWDC8Q2bF20gp+JHz/QgT4iGzcUBBXaMQB
	OTb49oA/9Odl/AP2nwHoeB8kFPA3xHHzcx0wI2DD3vp6ozyZwe6iIOYgaxN7S6eT1BYsexwliPO
	iWXvtZpDGUHmlATWVIPs+3yX9GlSWbYIo378L2ek0rivWWSxF0nq00ROJuV9knTw7tpxTlycqnq
	4vF1itYYDn4Ea2HvzAm77ADWhJX4nvbm6vX/QbxoO4dcREibLYxM8j/5A8iYJd9ygB7YqZar/Ij
	VrcGDDiq505fyWgORTbDmk7/Va5r65BWfXtvvRsutHcbFLfd4UquvwQnaL8bhp
X-Received: by 2002:a05:6122:82aa:b0:572:353f:be2d with SMTP id 71dfb90a1353d-5759927d235mr6320891e0c.13.1778586859561;
        Tue, 12 May 2026 04:54:19 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575dcef092dsm355357e0c.13.2026.05.12.04.54.18
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:54:19 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so3383897241.3
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 04:54:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+WByzE+0fDiVIlXysicOvXcfJEAip1GHiprjunVfxRYRsHnSKc5sBK9mPZ4hIBqouxCT9TTyioS1/Z4DFx@lists.linux.dev
X-Received: by 2002:a05:6102:38cb:b0:60a:9cac:d28a with SMTP id
 ada2fe7eead31-631d91da868mr6059259137.3.1778586858597; Tue, 12 May 2026
 04:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401101038.24304-1-grondon@gmail.com>
In-Reply-To: <20260401101038.24304-1-grondon@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 13:54:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4EdHPznj-9NeN=7C+07SVJK30zjp6OAYB=sAmerSDVQ@mail.gmail.com>
X-Gm-Features: AVHnY4KFARyx_ClnsPiaVwtbWZ1HA13qiI57TEp34B6TztkVz8FfQMkOnTTTiYI
Message-ID: <CAMuHMdX4EdHPznj-9NeN=7C+07SVJK30zjp6OAYB=sAmerSDVQ@mail.gmail.com>
Subject: Re: [PATCH] staging: most: dim2: remove unnecessary NULL check in try_start_dim_transfer()
To: grondon@gmail.com
Cc: gregkh@linuxfoundation.org, error27@gmail.com, 
	christian.gromm@microchip.com, parthiban.veerasooran@microchip.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gabriel,

Thanks for your patch, which is now commit fde67f5b1fc77f3c ("staging:
most: dim2: remove unnecessary NULL check in try_start_dim_transfer()")
in staging/staging-next.

On Wed, 1 Apr 2026 at 12:11, <grondon@gmail.com> wrote:
> From: Gabriel Rondon <grondon@gmail.com>
>
> Remove the !hdm_ch check. Although hdm_ch is a function parameter,
> it is already dereferenced on the preceding line to initialize
> head (head = &hdm_ch->pending_list), so a NULL check after that

FTR, this is not a pointer dereference, but merely pointer arithmetic,
due to the "&".

> point is dead code.
>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/all/acwjEHyEYg0V3OyC@stanley.mountain
> Signed-off-by: Gabriel Rondon <grondon@gmail.com>

> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -165,7 +165,7 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
>         unsigned long flags;
>         struct dim_ch_state st;
>
> -       if (!hdm_ch || !hdm_ch->is_initialized)
> +       if (!hdm_ch->is_initialized)
>                 return -EINVAL;
>
>         spin_lock_irqsave(&dim_lock, flags);

The passed hdm_ch can indeed not be NULL, according to the same
rationale as your commit 6aa2b11ce527c23e ("staging: most: dim2: remove
unnecessary NULL check in service_done_flag()") in staging/staging-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
