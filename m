Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C760270
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 23:54:35 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d1so4899483pll.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 16:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Y4/3fSf/KmbpyyGbeX2xJ39stxqbAErUC/okq2TDDk=;
        b=L3rnIL1slWAx5Y0hA4TCkr+OsTOuLk/bFjLK9EkWCAEu5FLK9xCkU6IqxwBFvcA45O
         DoRehTlcd4qcd/Fy6DSG2E7MNx+G7lEVIj3/cuD33zPD7XCBhAZWzqt4ZOosP0xjjxIH
         peeF78xQT8tdIXZbwhUqmzDNInzRAl/5rCSI20/1t3/q5eMMpFCyrV6KcA2Q2FW0pDhV
         b5JnJ3Cn0G09+LOSvBJkQegO6rYJUm6sEib2kC8g+ybB7lvIrw3BXIMQxMGXF461ArLg
         Wf97Yu+wlMgAQQqkwGNeCLiL+X5CvbKDVqjvUl6noDaqmyVajp67+BF5PmpEtjwQF4Mi
         cHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Y4/3fSf/KmbpyyGbeX2xJ39stxqbAErUC/okq2TDDk=;
        b=GME9bEriMrDMIbDjTlKkyKbCCH21ikgX2c00Z1er21xtNiD+r2D5OUq6jOwy2ru1+m
         hSx/jZ1aZuI7mvB6mTYQ59/svGaAzp/fDYeB98qXucSRP9uoxQUwF4SgrFJiaYWsemRA
         Pr4Xu7bI7Ne6w/prdoib2hcBnawJvwbeW8wntQ140mVekAPI9KW27Y9UdQss9g1EbsyR
         KIBzuqQ2QpKZupx2U9fbq7utAAS3/isviKLXjfLw0VVlHhnXU9qw4HyIToa7hrxtq0o4
         gMNuqZTduaP3F73yI9vdi6zZSva7w+3B2wmzvmDlWZkuZA+caPil92aU2gnsRgG33/T1
         iFfA==
X-Gm-Message-State: AOAM533tcZVCumUY7Vmw3Co2SyvmbN2Bw6ENJmhuxbM0jZ0p3KjPazAU
	Zq9wp6E5GFWJxX3m8VbF7F0pTtvqEYBV0LZ0sl8rDA==
X-Google-Smtp-Source: ABdhPJw4+nymE93DzmpNsy3fsXtqpKUg7uzbJ1hfJjgXx9prl+Z2EY4F0ODmxoroDl8DlW0pmalddj1/h5vKzOLFKOA=
X-Received: by 2002:a17:902:ac87:b029:12d:3e59:cb7d with SMTP id
 h7-20020a170902ac87b029012d3e59cb7dmr1257600plr.22.1628726075469; Wed, 11 Aug
 2021 16:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210811201450.31366-1-martin@kaiser.cx> <20210811201450.31366-5-martin@kaiser.cx>
In-Reply-To: <20210811201450.31366-5-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 00:54:24 +0100
Message-ID: <CAA=Fs0=2gSn8_gECcqLJtXSSzzbA5=92pU6TAyYQdmO+ggMOPA@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: r8188eu: remove CONFIG_USB_HCI from Makefile
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Aug 2021 at 21:15, Martin Kaiser <martin@kaiser.cx> wrote:
>
> We already depend on USB. There's no need to set CONFIG_USB_HCI in the
> Makefile.
>
> Some other Realtek drivers use #ifdef CONFIG_USB_HCI in their code, the
> r8188 driver doesn't.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/Makefile | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
> index cca7a58c5f29..6bd3a0590aa3 100644
> --- a/drivers/staging/r8188eu/Makefile
> +++ b/drivers/staging/r8188eu/Makefile
> @@ -4,8 +4,6 @@ EXTRA_CFLAGS += -O1
>
>  ccflags-y += -D__CHECK_ENDIAN__
>
> -CONFIG_USB_HCI = y
> -
>  CONFIG_BT_COEXIST = n
>  CONFIG_WOWLAN = n
>
> --
> 2.20.1
>

Dear Martin,

Looks good.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
