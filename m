Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE3070
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 23:54:02 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id bo18so6382801pjb.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 16:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/BfnxJUIum/GqIyPdmVGfVe7SAmeaJmks+RumyxR/fU=;
        b=OP56ebMQGRpCRrLw6NB7S6hJH3uBzWIouq8V4aMAtLkW0MY8hcMq/gabH0fRTE+xt/
         /Yzj3ItRP61oCAgQSdADawbhoVPjfd0w8ykOvnh49KAg2m7/mRoFt102fRsnbIv/py7B
         vXO9KybQ8MRK3Vv+p74C0oqqVNm9Ri1FP9vqdrkxcUo+BR1pyxwlIv8quGcLyXiPC+Aq
         EO/GG/MiJyynilp2C/TmmHOL4sOBC7ogOX4sM6hWflqqtknwwZhftHspc6u9/Xe6qUEJ
         ic+GrrM2tr5nBzlrAGFDxYzB3IisJXem1AnOeQmy1AfAQ0ashKb4KglbeUA2on7dR1CE
         o7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/BfnxJUIum/GqIyPdmVGfVe7SAmeaJmks+RumyxR/fU=;
        b=Mn4eCqelO9HYsEQYyFPtiWw2PErFUvd9lFDuo6HZkrPJXUGAkarypuiygP485W8tLG
         FaPAdRQKKH+5Z37vwvxeViR1Qq1vZfj7jQPSjSXBTkU3FjjeShk2HOT+a6pDac5+qpj6
         exhK9cnemNb6IKFSiciDr9yeHR7wesKJ5993F77QnpTBEqoIn056oKu2y6zYAWEph9/F
         4xmuGsfja+yDt8NSYuuEHFilTpbiaAP/oYLPFLXDafUKkCo9sDjgyYfBXKPxHAqSTx8H
         fjFz2vzuKIujhavWveTyPVe4j/HQGZOipwMyZ3NlJlT6HakAUicdq2BVzbRiCGNo4YKZ
         04/Q==
X-Gm-Message-State: AOAM531+fmYo2E2BYA/p0ODuPYjvYlsQ7C0YbaSNKyp6yFQFHjqFm6bc
	p27O/VBfwS3JS03CyAvXhZaTRQnpD7LGD/Q5j6WUAQ==
X-Google-Smtp-Source: ABdhPJwMQgiLfKy68hyqHxu0Tp/geWrxhjyw/YdEhxhmUx6bbRQrT0xaDP+FkFn+yryA8X6HO7hDsZQJl/65jow/7sw=
X-Received: by 2002:a17:902:ac87:b029:12d:3e59:cb7d with SMTP id
 h7-20020a170902ac87b029012d3e59cb7dmr1256113plr.22.1628726041809; Wed, 11 Aug
 2021 16:54:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210811201450.31366-1-martin@kaiser.cx> <20210811201450.31366-4-martin@kaiser.cx>
In-Reply-To: <20210811201450.31366-4-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 00:53:51 +0100
Message-ID: <CAA=Fs0nmM4EKX7x0ZrHJrsE9KJ50sBW6ROXkY=djryG-6TKJZg@mail.gmail.com>
Subject: Re: [PATCH 4/5] staging: r8188eu: use proper way to build a module
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Aug 2021 at 21:15, Martin Kaiser <martin@kaiser.cx> wrote:
>
> It seems that for now, we can only build this driver as a module.
>
> Use the same mechanism as other drivers (such as rtl8723bs or the
> deprecated rtl8188eu) to enforce building as a module, i.e. depend on m
> in Kconfig instead of setting CONFIG_R8188EU = m in the Makefile.
>
> If we set CONFIG_R8188EU in the Makefile, this setting will not be visible
> in .config.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/Kconfig  | 1 +
>  drivers/staging/r8188eu/Makefile | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/Kconfig b/drivers/staging/r8188eu/Kconfig
> index 6323d63a4a1b..dc1719d3f2e4 100644
> --- a/drivers/staging/r8188eu/Kconfig
> +++ b/drivers/staging/r8188eu/Kconfig
> @@ -2,6 +2,7 @@
>  config R8188EU
>         tristate "Realtek RTL8188EU Wireless LAN NIC driver"
>         depends on WLAN && USB && CFG80211
> +       depends on m
>         select WIRELESS_EXT
>         select WEXT_PRIV
>         select LIB80211
> diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
> index 7f6658f931d1..cca7a58c5f29 100644
> --- a/drivers/staging/r8188eu/Makefile
> +++ b/drivers/staging/r8188eu/Makefile
> @@ -4,8 +4,6 @@ EXTRA_CFLAGS += -O1
>
>  ccflags-y += -D__CHECK_ENDIAN__
>
> -CONFIG_R8188EU = m
> -
>  CONFIG_USB_HCI = y
>
>  CONFIG_BT_COEXIST = n
> --
> 2.20.1
>

Dear Martin,

Looks good.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
