Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090AB3FC2
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 00:19:50 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id x4so11832587pgh.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 17:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H7sOgxh5lem9cj1KEc6iLijk0s6lVtzJesrQOxI4gds=;
        b=uHimCnK1Nx6nSJI1ckIog8xmVyEcgTbj8/8lr+Co5tESOxjFw/kMy5VphX1OhNziDI
         sjLI1Rwe6X07PfGWL5LNbMaChqTMwXOk8MJfHa7Pc2K5AqAoXGgEz/sfWZbjT53Xxb+e
         qMRaXfrCeuQKe7WlGAlAxuEJiZsDYh2WabR0/8DkLz3qWwNIYVtjLcudUOWmHXZQKDOE
         Ox20pKVzBzIZzKMHMREXoQWeG6fWeFrUFJ4oXTQYSDDY2vNf8m5kFaL1eX+9Oe/9fN+m
         ywICRtDU42L7MuTYXdzd/F0zeOLRK/MYgIFm29qyx8C0xK7/CAR7C0hq1Ith4e9gAIsd
         11vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H7sOgxh5lem9cj1KEc6iLijk0s6lVtzJesrQOxI4gds=;
        b=OGsAHw7/Ay5cY7giUMTUqTlJYHH37VXtm5d/umF+ch1Zc6Oll8OkY9pZSjrZoEgLFZ
         5cbIrr6yLvjzRf6qIhYNsf/0wl26Ugr30KCuL2SKeAdYVxnbWvOIMX6m6JhQNIqbErUv
         VqEi4wWb9AvjIGc/zgtQD0WuS3vrahMFIVxPOmfC+lpR9FAsY7l93jeAEjiC3s/9fF82
         3SG/PvSkRBhJValla6pcTVzyP/yMIOeG+3eC4hKxEJMKRo8BKN+vJgNaHm70Ce96F4RS
         jEu1xQBv7dV3JGe6mTqnswUzQD9SyV7NDEObHZU00ce0UZbMH9gEwkkMk4NYe3HW5nI6
         NMfg==
X-Gm-Message-State: AOAM530hVWS7rv5IQaq3gGaaQUlktR4qVfQa+jsEtuVU3nLdK79JEB9p
	fKKcsmPxplwYI59+Y92faDuGaqw44BDNk2FJsGNZgw==
X-Google-Smtp-Source: ABdhPJwKlOTWeEPfQEVZRR7XtLkcR6KCPwIGPD6VLKroMmyDLZlA05Wr0RIjpw6JJm4zQG2bTf4QjvtRx0rhnzp9os8=
X-Received: by 2002:a63:d910:: with SMTP id r16mr18988975pgg.318.1630282790557;
 Sun, 29 Aug 2021 17:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829180717.15393-1-straube.linux@gmail.com>
In-Reply-To: <20210829180717.15393-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 30 Aug 2021 01:19:39 +0100
Message-ID: <CAA=Fs0mf+Ay_xLY6xqY2rjNTqbLLw8kH0=ia0ZjUDzGyUJXE1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: r8188eu: remove unused constants from wifi.h
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Aug 2021 at 19:07, Michael Straube <straube.linux@gmail.com> wrote:
>
> The constants WLAN_REASON_PWR_CAPABILITY_NOT_VALID and
> WLAN_REASON_SUPPORTED_CHANNEL_NOT_VALID defined in wifi.h
> are unused, remove them.
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/include/wifi.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
> index 0b3fd94cea18..eb07ac9b8943 100644
> --- a/drivers/staging/r8188eu/include/wifi.h
> +++ b/drivers/staging/r8188eu/include/wifi.h
> @@ -126,8 +126,6 @@ enum WIFI_REASON_CODE       {
>  #define WLAN_REASON_DISASSOC_STA_HAS_LEFT 8
>  #define WLAN_REASON_STA_REQ_ASSOC_WITHOUT_AUTH 9 */
>  /* IEEE 802.11h */
> -#define WLAN_REASON_PWR_CAPABILITY_NOT_VALID 10
> -#define WLAN_REASON_SUPPORTED_CHANNEL_NOT_VALID 11
>
>  /* IEEE 802.11i
>  #define WLAN_REASON_INVALID_IE 13
> --
> 2.33.0
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
