Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5526A6D13
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 20:48:33 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id t7-20020a17090a5d87b029017807007f23so17226373pji.5
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 13:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WZtJjyJUTegQi3wtal7UFzYebMO2uoYzz3xW5Q9+lNM=;
        b=xJYMhr371aaJjypYVWjnTM0IqjW8glBa79jTURUd9BuX4UySQyLRSCJdXCy/+o8s3s
         l3htzamHMjgR9S4yl/mpWjIyhdSwD6AbAxc9zCAzAYGt++hYSdBom0e4d5ap1SwdNvec
         3nBi4wNDbrwqRV6RAIypQGvIsblw7ZSDfyo4r6sB75a9ONrRSp0xSlZ2kfoE+PRugjnU
         fWKWlwR1IEKQjSoJD9got2vfRtLfI+bYXo3Kw/ibIHNgU7/cfBZ3n9ffzMxem6H3KcsL
         lWrPaxmpIUS9NBHfHiw6HqWnHHsrp22/BdYYuV2IKrQcQotidIZ01XeE9HlH4+lMR5zP
         li+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZtJjyJUTegQi3wtal7UFzYebMO2uoYzz3xW5Q9+lNM=;
        b=fSVZVDMRk8jCx1yEBHKht5jwA7A/nx8DUwFbiOhHLWwt/cRXfgE/9qb9rX6a1FNCzr
         RSxXGSF8CWtpDGCZvQxSbWKa/pzYqdwnEvgCbgxLSWlZWmmeFMhZ+rNlyPmNUAitUpnz
         UwejPGDaW0hjX/hqFBNhonhIZnXGzPmQyN36D/58mykXbHVEI7Zu+dPZRKe3SGDXd5Dg
         yUcIKr9ObtdnfHC7HzGi6gcDiW23/jlANnNZvhmu6iqqUm1NtIivEqXwMHi3ojgTsGQI
         WQiVOz3aImnsQkCCnhuEZ0hcVmSQ+eay/i9d8WQF5bA75uuFDzL6K8zBCBJhkG2JhVit
         Fmhw==
X-Gm-Message-State: AOAM533W9CxXzBtALGGMbaaofqaM5l2qDEcu9taUYo+YNdWZj08qPCaG
	VGqrMSk4/0KJZcN1cGcOMzfGs0DhQKQc3hB10ZLoEQ==
X-Google-Smtp-Source: ABdhPJxPw98RMdkQuhmUls7t9NhJ8obMPDiruC8nzoIoNzH58LUl196AhTQStq0hVEUd9U+FUAwZU6ra+FdqIoWdF+w=
X-Received: by 2002:aa7:90d4:0:b029:3b3:2746:5449 with SMTP id
 k20-20020aa790d40000b02903b327465449mr5856929pfk.81.1628801312873; Thu, 12
 Aug 2021 13:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210812132057.22579-1-straube.linux@gmail.com>
In-Reply-To: <20210812132057.22579-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 21:48:21 +0100
Message-ID: <CAA=Fs0=6xJtTBo5n4_JAvFezZZ1zGnRDZAbh4ExWko=o2sPR6g@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: replace custom hwaddr_aton_i() with mac_pton()
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Aug 2021 at 14:21, Michael Straube <straube.linux@gmail.com> wrote:
>
> Replace custom hwaddr_aton_i() with mac_pton() in core/ioctl_linux.c
> and remove the now unused functions hwaddr_aton_i() and hex2num_i().
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 40 +-------------------
>  1 file changed, 1 insertion(+), 39 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index d059b738b348..38ee41f9d2ba 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -89,44 +89,6 @@ static const char * const iw_operation_mode[] = {
>         "Secondary", "Monitor"
>  };
>
> -static int hex2num_i(char c)
> -{
> -       if (c >= '0' && c <= '9')
> -               return c - '0';
> -       if (c >= 'a' && c <= 'f')
> -               return c - 'a' + 10;
> -       if (c >= 'A' && c <= 'F')
> -               return c - 'A' + 10;
> -       return -1;
> -}
> -
> -/**
> - * hwaddr_aton - Convert ASCII string to MAC address
> - * @txt: MAC address as a string (e.g., "00:11:22:33:44:55")
> - * @addr: Buffer for the MAC address (ETH_ALEN = 6 bytes)
> - * Returns: 0 on success, -1 on failure (e.g., string not a MAC address)
> - */
> -static int hwaddr_aton_i(const char *txt, u8 *addr)
> -{
> -       int i;
> -
> -       for (i = 0; i < 6; i++) {
> -               int a, b;
> -
> -               a = hex2num_i(*txt++);
> -               if (a < 0)
> -                       return -1;
> -               b = hex2num_i(*txt++);
> -               if (b < 0)
> -                       return -1;
> -               *addr++ = (a << 4) | b;
> -               if (i < 5 && *txt++ != ':')
> -                       return -1;
> -       }
> -
> -       return 0;
> -}
> -
>  void indicate_wx_scan_complete_event(struct adapter *padapter)
>  {
>         union iwreq_data wrqu;
> @@ -2512,7 +2474,7 @@ static int rtw_get_ap_info(struct net_device *dev,
>         while (phead != plist) {
>                 pnetwork = container_of(plist, struct wlan_network, list);
>
> -               if (hwaddr_aton_i(data, bssid)) {
> +               if (!mac_pton(data, bssid)) {
>                         DBG_88E("Invalid BSSID '%s'.\n", (u8 *)data);
>                         spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
>                         return -EINVAL;
> --
> 2.32.0
>

Dear Michael,

Looks good, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
