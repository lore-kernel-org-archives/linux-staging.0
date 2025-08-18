Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC9524DCF9
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531426; cv=none; b=uTVLMBJpkfVpyUSh855rp8SlfZzMkl8lWAzcBCB8Gb48vjwDD7/COILp/nILNcZW/z5cIJUL6yadYAgBkLuVvZ4TOjZaPPWelz6sNnbOJTdbJ4ahY7nly8kNCu+i4EOEmv4+aHk0CVYoIo1LtUwAKCA3cJ4cVqlm3zTE/7GXM2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531426; c=relaxed/simple;
	bh=k/H8oG8FJ/KNAXVFQEahMziIkd6GKMRM8pwD91rQQ9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CF2UtvMXuYmGdDKPUPZHUkAlROafjMoQaDohCZJtWPbuBmZSbMAZU6Rwa75zbIKNWO1O5mHKXHXG1sXmX1A0fEd/yFFEeM62A9MNMC+0NEIdtPo+DHmK3/v2wE0J6tVjMk2DnFjamdd8r1VMAYdtpsYwn9ZxgCnDlHyAD1Y0AbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-50f8ad279f8so3027482137.2
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 08:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531423; x=1756136223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPnXyjQyRiPNxWrfvyKTF8MriephV3eeN7jOjaXGjKk=;
        b=OPOZGjhwtpv2X4hYxzsjwBzV8OGI8YtTRKo2NFn7dApzg3wuJTauGPJp0Ld60+qXo1
         uYX2jfTuBko42IyOiFMjIONElu0f1I/Dn7kzwkjJClvQD9JnHx9B75kfSCMDisXi0+/W
         Mm10M2uCO79C6P43U0hSqFTsbGdRMCo1akT144tubEL1tt+KDLkxVXAK3JAjbMqEKqWB
         tPSG7STrfJ9WG8HL+m2a8pS6+1oJpJbZoNkeRwBOMQI4TG3zGACXG7Gx8aubw5Q3iEfU
         NflKl3ICCcdvZlH5nk+IGdcPrR1lVLPV3g+AWohXttn0izdyHXdXv0WEhSpHe9JHNrrw
         kzQA==
X-Forwarded-Encrypted: i=1; AJvYcCXhS3rd0w9ue3LXRD4kkDgX4UbhpHQs28yl9Zi4OfsDdlAtAqSlryXchxdUxbgM6j6X8Glfb3sSbXJJTBeS@lists.linux.dev
X-Gm-Message-State: AOJu0YyGX7+hoaSxMNhwCKKhMMqtwGT3Bj7cdlpNe/8+4eBHWcAL22gE
	K3JWYeZL/Qzo0iJsk65UnZwHHWqbgnjVK5JM/fDY1fGWimCGdVGHlNEbVxf/6Emh
X-Gm-Gg: ASbGnctrwTaBt0hF2GsiZPFdT5hbYyNzkPjvP39peXLQdmpzvEF6jTg5wpVFi6woNJM
	ION4+y1U0zM0X+fcw/TVuBUSs3dPW85ibGTeHGivNZPyHnw91pfUYbfMrXZkKrPWnQhssyuRahC
	tFBsv8rA8YiFYTEQcp54tpRdtqgCUqLeq/S2ZqLm/WuAQDDfUoFdZNVAiPbWdsjzfAdKqKQPKZG
	ksGZ34W1RxZ+Q6LU+Q530W2sU9/aBiJUV0P49rEn5nor035YtFAuCOdV0gkwX5FMlnVCHAy27Qj
	cVcM49xf4plKci4cqYzZld5ncgKfL4rWbE4yTakCvfqVygRSLocOmJvo7thuJIgZrXmX+wkWTLp
	Ge93vFh8AsIqOn0VlMpcRqoLit9RCqgx9iaoQUTxETGarASLJFqW870CmMsuO
X-Google-Smtp-Source: AGHT+IGNFsO0Re5IBQ/cqM9ooXAHDR4VueeGTjj7mRwF1u2nTJg31VEuKhW3cpcLCeVIw9jehxMFvg==
X-Received: by 2002:a05:6102:38cc:b0:4e6:d94f:c197 with SMTP id ada2fe7eead31-5126d218da8mr4788448137.23.1755531422836;
        Mon, 18 Aug 2025 08:37:02 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bd51987sm1931926e0c.4.2025.08.18.08.37.02
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:37:02 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-890190bf2dbso2459128241.2
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 08:37:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOedrgA6E9uNOcvcBySnHhVjAZk+GUpM17iL5uOIIdSi1fex4FhUn0ZMO8pqEzaCGwTAGOE2jN+b8yZQ/4@lists.linux.dev
X-Received: by 2002:a05:6102:4a84:b0:4ec:b2cc:de60 with SMTP id
 ada2fe7eead31-5126af22cf7mr5384089137.11.1755531422341; Mon, 18 Aug 2025
 08:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
In-Reply-To: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 17:36:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQfUCYdt-PJX8rYP3bf8Z_ea3Obgunm-_7KmJxMrU_fQ@mail.gmail.com>
X-Gm-Features: Ac12FXw4gbFdT9fnsf3GhA6Uid_mXhbaQ1tCt30kMl8rgK4UTMaDn8DaYsPtEDE
Message-ID: <CAMuHMdXQfUCYdt-PJX8rYP3bf8Z_ea3Obgunm-_7KmJxMrU_fQ@mail.gmail.com>
Subject: Re: [PATCH] staging: nvec: Silence unused argument warning in
 NVEC_PHD macro
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mohammed,

On Mon, 18 Aug 2025 at 17:10, Mohammed Guermoud
<mohammed.guermoud@gmail.com> wrote:
> The NVEC_PHD macro was defined with three arguments (str, buf, len)
> that were not used in its empty body, causing a compiler warning.
>
> This patch silences the warning by explicitly casting the unused
> arguments to (void), making the intent clear without changing
> functionality.
>
> Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>

Thanks for your patch!

> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -28,7 +28,7 @@
>         print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
>                         16, 1, buf, len, false)
>  #else
> -#define NVEC_PHD(str, buf, len) do { } while (0)
> +#define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; } while (0)
>  #endif
>
>  enum ps2_subcmds {

The proper solution would be to remove the custom NVEC_PHD() macro (and
NVEC_PS2_DEBUG), and just call print_hex_dump_debug() directly instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
