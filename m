Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF23FC1
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 17:53:40 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id r2so2318735pgl.10
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 10:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QnhrKb9fsy/ZBD0qfjeHSev1bAl3ZIGL9b4MHAvFavg=;
        b=1GocTiMk4sq3+M4s/GkMG0fW6ATqHhJevDe/U8ZczJh8ZT2O7zuS8KUVtTIGvN9EIy
         IG5bWFYmtmk+2GzNIly9dIKsmoIVA1P4zs7nPzPsoutGXhotFmW+L0igHog677jS2IdK
         67n8Wsh6UGb25McHCQZIzQrc9kTu8xAp68AQ89ocbNBzYa9oAeTtlAXc78CBxebY4LMf
         p8WASJZxyfSRkPtqKV89ivauHU4mkjdFTznd9AMxb5wkG15PVhqz46EqNRAW571Zh0eC
         PwM/AvomHFsOoS2Ysp0xjWKRJ9KXZ6ZgKv0TtwYt0LLjbN37n7jFQLVkHxvxr/JQsHqx
         yKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QnhrKb9fsy/ZBD0qfjeHSev1bAl3ZIGL9b4MHAvFavg=;
        b=qMF8SV0DW5JrcZqbZYwWbBjMq2wOlTG1WJ+CjA1itzIPe6GZ51eoVz5/59fYQuPUs/
         rOaHgB6LWrSXYut80vZSKKYKuRiD0axX6HUOcwQpBjFnTwBCROwItMYwlecjx6HKE+Ul
         ZEC5PFmYuVv7GvDNYelrogXqrCVnbUP3P5/m2ehkH8A72ikAPN8E6XLCrajjHdL0e97j
         d8XlZm7L76O6bEu4u1q1mGB4/KobYAcT02T9qAt5q/hnpK14EpIiAd644AACA0rigbzw
         WlKbCmvo0tBfCRVXO/4b7zQZF4VJjpiXFn0r7rtwrVhnD4Co9zIfP2oocoJHFQRM3gdL
         KNqg==
X-Gm-Message-State: AOAM530cCfiEH/WCiZoSEJn/lnGWmSg8gjj3QgsAPy4al6/3+z6BvvMl
	C0IEtCFCOw8TjlblQuaqG6gLloLkGJBualF0hrSHhA==
X-Google-Smtp-Source: ABdhPJxYfJgqnyk3VuUHulejj2+44RV8+pgXi1bCUYVuN7MpyZYVC89NpwtNPKIiztcu4lS71NNbNyqHQlYSt302MV8=
X-Received: by 2002:a63:1a65:: with SMTP id a37mr4433700pgm.338.1630778019574;
 Sat, 04 Sep 2021 10:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YTNrjG1y05ByN54+@user>
In-Reply-To: <YTNrjG1y05ByN54+@user>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 4 Sep 2021 18:53:28 +0100
Message-ID: <CAA=Fs0ki06L55d080iUVT=HUG3boOw0zf17e8VKoBtomUHeMcg@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: core: remove condition never execute
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, 
	Michael Straube <straube.linux@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Sept 2021 at 13:50, Saurav Girepunje
<saurav.girepunje@gmail.com> wrote:
>
> Remove condition which never get execute.
> as pattrib->mdata is always zero before if condition check.
>
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index 4178b3c1ff57..f314f55997bf 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -5669,9 +5669,6 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16
>         else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
>                 SetToDs(fctrl);
>
> -       if (pattrib->mdata)
> -               SetMData(fctrl);
> -
>         qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
>
>         SetPriority(qc, tid);
> --
> 2.32.0
>

Thanks for this.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
