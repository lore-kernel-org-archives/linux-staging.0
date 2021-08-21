Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD8372
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:19:55 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id s11so12407310pgr.11
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJqDRMlDTbCVcYPNxrceaAe7PZIeJkJfPeabIkZWfYk=;
        b=TAubwlClWIgR+E7imbcoZoD84wK9ZBHruAslXeVraHZLyeodHIVEQtMk7sGO7C+a8Q
         ITItDAfybuoXr9dnsN5aAShG0Edz0afI4B5Gi6Oq479bmvXJZMlesXpefSX5V0FJWlKA
         Pmmclv77/6LXrneXkggntH+ZD9qUPwWSa9pV/52c++CWkrv2sGV98Aw/H3lCbpYTig6c
         Y7tP/I3FTqKtyWOr92K7cOYPU8UKO5UyLz7ptAwV9j0uVgPVYHAHIVIsNt52yNjnn4up
         o53pLrr5/PjIBMLEU6eqUqUbQn5VUv94EiiuCiKCahfH+8EFGR96F/p+7E8dldcZkJb2
         7sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJqDRMlDTbCVcYPNxrceaAe7PZIeJkJfPeabIkZWfYk=;
        b=m2iMuUkGEHa21EBIIbsqErQ1eTL25wGbNmQqG0V9zTdiJyhZpcLDJfjz0zQga7c+BS
         w9d+7ap+m8Gmf06M6wADZ0Yw6sixCsyqCKKEkXhr3HVdRRbzoEU7hlvIV9uQOzpxTP/3
         xMQWO7QAcft6kJ61X6ztYTbVQdk7JKWPEqR3E9zKo8IZUc+aLwcPnDAu5kZuyOR3RyzY
         gG7pUYFDISZZ+eoPuuWUiEp3xI69d/awowei51HKD7CXIuYrohZWaEvjSP7ANfPgMXaS
         6i8dAzNpmzaE3DUGrAIIn9/zjkjt86vX5+LYp1PLoiyG77eyspFwrYCcoamZtYncvdLW
         w8uw==
X-Gm-Message-State: AOAM530UrGCrVAbRdcZANFcwcXpJw0u+fVYo6Ms6lnA065W5waLmDrJM
	r5agY7AQshUkZ79cp3tdT8RDHJCnH/Z7UCLGbTCPwg==
X-Google-Smtp-Source: ABdhPJy6ylZbR57e+7hyJLrXYjwGJm131TCM8DexgRkBOH5xugPIZAdzrIHAZ55jalo4ypShBWzRO7n0KHlY2wUys+Q=
X-Received: by 2002:a63:d910:: with SMTP id r16mr24100046pgg.318.1629566395100;
 Sat, 21 Aug 2021 10:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821151459.26078-1-Larry.Finger@lwfinger.net>
In-Reply-To: <20210821151459.26078-1-Larry.Finger@lwfinger.net>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:19:44 +0100
Message-ID: <CAA=Fs0=8mr_+wBERVSbJD-5HYDLo3pYB8P51xxo96b-nod=h6g@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: Make mult-byte entities in dhcp header
 be big endian
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 16:15, Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
> The 16- and 32-bit quantities in the dhcp message definition must be
> big endian.
>
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> ---
> This patch will set up all the reset of the endian warnings,
>
> Larry
> ---
>
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index ee52f28a1e56..62a672243696 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -640,16 +640,16 @@ struct dhcpMessage {
>         u_int8_t hlen;
>         u_int8_t hops;
>         u_int32_t xid;
> -       u_int16_t secs;
> -       u_int16_t flags;
> -       u_int32_t ciaddr;
> -       u_int32_t yiaddr;
> -       u_int32_t siaddr;
> -       u_int32_t giaddr;
> +       __be16 secs;
> +       __be16 flags;
> +       __be32 ciaddr;
> +       __be32 yiaddr;
> +       __be32 siaddr;
> +       __be32 giaddr;
>         u_int8_t chaddr[16];
>         u_int8_t sname[64];
>         u_int8_t file[128];
> -       u_int32_t cookie;
> +       __be32 cookie;
>         u_int8_t options[308]; /* 312 - cookie */
>  };
>
> --
> 2.32.0
>

Nice, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
