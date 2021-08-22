Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31C3FC0
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 11:06:13 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u3so30440687ejz.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J/K1zJt9K2vM4YNNzqxi4TbMv+urfoGymzw1sNlJiRY=;
        b=AX55T5qy7NO40os7OlBFpccap583qZZmZt4H4RNz41wp2sjxm0BQdKU8VJ1dyE21aM
         4l27B2JJsOt0eL+0Cie02TTqnEs1b0WGNPKLIgNM2j8FHDtLUV6m4729HjDbmcuNh2tT
         p/l+dqSYDPEUfRbC1Fp9QsQSwQ5mzWSXuvAD72/LzVDRrjBSoUQc7EXH3vUUfztNQYQk
         jx24P8gwXO5bT33pMIbCOD4TT8IlrZCxQbpXB9JTcKTS30zlRDOpuRzSbgbRmg0flqZk
         NbyHmVHONiTeNk1Hs4GMm9B0GXswMRdxoB7C5CIv6SqkFPzcdsAB1q3C9BuQLvaqSRTd
         MM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J/K1zJt9K2vM4YNNzqxi4TbMv+urfoGymzw1sNlJiRY=;
        b=iHp8/6aEUIzCuiMPLL20ZhZqZdzVJIAzw4wMdd0ayl7xlgKWeTNlOYyJwBIu0kybEI
         gsvtpNjdhC6UoUrDrOfJJvSa4FytcHk8GZQbST2UWqQ5Ietyur4Bcg17ZL6v9Abk6DUe
         b0/inj6HjptVpz6Y+xLXkh3yxVCEMUrK0AMICN3fEhYkZ13lISShWq6N4wW8v9pzQ74T
         jYE4CDoZpllNBqMq5X+b5IQsjKiivNMyqs2p3E+gBnjE3Ul1ppgf2RXkueThvfeVpL+M
         Uis74BMdkLsMn2A6y8eri/QoCbMjyEJG9WklOv8SFl8Dzuru17oSRRFwX0oERlIU3zLh
         Vs/g==
X-Gm-Message-State: AOAM5328xpPv2wEGnv9b+sa67JH57gq8AB6pNYd52wPsYxbu5ta+B9tt
	XIl0lrE7//mn5rTDlJ+P3VM=
X-Google-Smtp-Source: ABdhPJwNyBU6A/Uc3oCrD+++ujwNXshWTb90/l4LeX9WrRGPjk2SOwIQsxCGb1MDnAtD10kk4CpyQQ==
X-Received: by 2002:a17:906:eb53:: with SMTP id mc19mr30478652ejb.22.1629630371782;
        Sun, 22 Aug 2021 04:06:11 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id g10sm5580146ejj.44.2021.08.22.04.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 04:06:11 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Phillip Potter <phil@philpotter.co.uk>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
Date: Sun, 22 Aug 2021 13:06:09 +0200
Message-ID: <1821445.fzUCeO1EU3@localhost.localdomain>
In-Reply-To: <CAA=Fs0kByg1NztU+Nf__RUzTHuVh_q2hvcyh+3JqXiVgn+_VeQ@mail.gmail.com>
References: <YSFgrLUfXzgcT6k4@user> <CAA=Fs0kByg1NztU+Nf__RUzTHuVh_q2hvcyh+3JqXiVgn+_VeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Sunday, August 22, 2021 1:58:10 AM CEST Phillip Potter wrote:
> On Sat, 21 Aug 2021 at 21:23, Saurav Girepunje
> 
> <saurav.girepunje@gmail.com> wrote:
> > Remove the condition with no effect (if == else) in rtw_led.c
> > file.
> > 
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > ---
> > 
> >  drivers/staging/r8188eu/core/rtw_led.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> Thanks for this, looks good.
> 
> Acked-by: Phillip Potter <phil@philpotter.co.uk>
> 
> Regards,
> Phil

Dear Philip,

Before acking, please check at least if it applies to the current version of 
the tree and check if it compiles without adding warnings and / or errors. :-)

Thanks,

Fabio
 



