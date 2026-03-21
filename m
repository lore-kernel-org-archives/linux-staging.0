Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5C31862
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 21:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774128913; cv=pass; b=aEP/6w/Vwo871pNF34Dq3YG5DL8vJ89bKcErqv9k3L8zBCWiArABx69eOOm4KBuWxl7vVeogvk5sghFOVJUeLtWWM0fDiSYjzJQ1nfa1VKj4frDMc0iBNSr2abxu2sIkC6YQgLiDg2HzbfGZGg5e9brsF8BtOdaVp5sGXLuMBKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774128913; c=relaxed/simple;
	bh=sJu8AKu2m0H9Hb/m+muO0rpNINffjCYlfj83aKqiT8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVWqoDb8+V+ZEkh//9u5st8GSj769KyzSitWycYOlH5BmoLWR/AiJ98hXxJm6doPa0lG151xVwJfjuLbe7wyTdWlBq6e+fKjmQvG93LYjkox9/eH8oJ9XkISInVimGeIN2marB0u3ePS2zb2fm14l/eewj5ch4C7MKM3KWbgNzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJ8qv2HT; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ8qv2HT"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3870778358aso20347651fa.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 14:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774128909; cv=none;
        d=google.com; s=arc-20240605;
        b=CI9Dl9lqGa96dCWSdrP7moa6JmnJbvATIBw/yBItAw+Curo1FC38l9g9tRnXJ20pgr
         if+T++nnoJn6fXnmvgAFCcpBflBK7AHcNCTE+BW/G5CnHOglcZ55QMYD6IKmHC4xAbit
         hvxXjyilA2LmeK91cB9/5+X3a1tsj0/UfA6Pchu+K+XUKoF37LmFVx/Cv/fDhKjdK7tu
         hI6PvzQiiEMpigWP77WaVxt87jCI1nzxAfJoQySkqXPwvBVtbvUuU7NYtob8ur/3OcOi
         YT5oWINQdGdi9+phPe0bGjEgKIuB/yjF06kgoJC0VOzrHIIc6cLNnLLUrPRfugRFh+cd
         JZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ozqm31xNtDr1caT46RLW5KApLroJV/B9l7d4djK797g=;
        fh=uU7sSmH7TGaX457pN3hoC7pYD7luDBemm7dmig4VDdo=;
        b=ejnfi2vlFgXHy7Ee33ja5cBZmRHLGbg/enctgBkm0PLvEZGg30l9rHcrZzij1bGJt0
         iLeYgGB20Geb05MS8DbzG9YiKYnGcaTrw/RorjlsjyaUCDUaMiyt0NbRIKgcU/GUIliT
         2kAc5TvSxzOp9qa10hxx10oii00A9Es0VQovBEs1B4MkkTFVZxQ5vJpycl/nlWH+RrBA
         HcYVxjDvTjp+9uTrDQzfGvNGGhDkkLI0YUwrG6NHV4dA9q3j+mQMpeIK/gcGGBy7dQm/
         mmvIcq5eUKq9rHSf5ZV/fzKEL9O6izeX6wjPIk4st8l5ukkwUfK8kpXOP9qquwWX4e2I
         SLpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774128909; x=1774733709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ozqm31xNtDr1caT46RLW5KApLroJV/B9l7d4djK797g=;
        b=iJ8qv2HT/XOf8wXYPQIsrr2px0eC8lwCIR1kCHjxOWlVtA79GPDe1vO2zoNSBIIqHV
         DSwDzHjXtoZ7xsgLLsdsV9DCY+ap/SV4uVr1AFyTRkvatPgcXmf0nHcuKWcwKAdVClqt
         L1urcG7lztkWC4krTT6KgayRVgXXTn9feD5lYayepQY9YasQPCoZHKJNakiURuV0Daic
         o0Ol4Mgkuju06ayCKVpZMgyZHLwdR8RX2D9YMMXBetRd5janyd11fxr+SAYtwAhdS+Ae
         LWOO4Ky9b0FhqG1oJlOsTg8SnmtEqDggDcNauEJkfLECeuAy0auWElan8is4EPcgWCZe
         LXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774128909; x=1774733709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ozqm31xNtDr1caT46RLW5KApLroJV/B9l7d4djK797g=;
        b=Ac+CxHV0xqo8hBI7gI78Fmx2hpx/y/mW9/enqNBF/9/fDHbuZJZLAbVBh/c9Z52TJj
         gqfVzYHzsybb6KvxSpd2A2np1S02gJ+7EPfBh4aJkXsWMeXaDsTy1t2B5l5nKchnEoG6
         t61oulvWMX73Jn28AGNtbm+dqopA4HQBdaF0G0Vd+dliDEzfJNnkbFbN9BLzoOWrUppt
         e6ChbHkvNJk2RgkiZjEeaRxjrKJXvp1q8Mgw1cdcr77U1P2xkMSrGEDvthJBc41SH+CR
         FLBmJfkrwue7Jd0qX66YucP+ZDpLSWFOk7B7kZIWT6dIMsesPz2oxTUWWi2sq+evf7rl
         zG0A==
X-Forwarded-Encrypted: i=1; AJvYcCXck/J/B1oRlNPpSmL7gWxr001gKVYmKqv/UT1IfP3mvW82d+3P9y1KSNX9atgQXOPu9Vi3m4hNwjvECRwz@lists.linux.dev
X-Gm-Message-State: AOJu0YzDFr8lRvke6Toj9BFmmUfADspKLeoONmuiw9Hsr0pYZgvYZ618
	PlKHqQSYXXfVbwNLSpk/9BXAcMXMU35qBb26t7oLWPl0K3zAQ0yFOqE6bI4Dv35VNrigxq6ea1o
	zZA9/c1MzRdaFAdGKGUywpIJG/SfzcB4=
X-Gm-Gg: ATEYQzzFfjgw3vNGNLMJq63bGUiVCrOmFlFTzyuIOd7Ex3dqwnMiDhWtiK8S9YpXNX8
	9vS+vH1YwaarfdRI0KiM8bOZ6+W/P6RdS96FtpUb13WzeHInQEJADaH/QGpEVmDpUOtAlISrLHY
	+CdyTJAUHfto62oa9QDWNxUaqMqppHD5fgXZYfZK/bX8iaah8L/EBQGKOON+zt+mQOfsZ0Fb5Bh
	FBJk5TOladi6xuE6ouHvU6YtkoQA2LLA3G/AlMbTSoDQlarQiM+MPaIDd5S5/e5tgFtHjZphE8g
	93qXb2vl
X-Received: by 2002:a05:6512:39d1:b0:5a1:2a71:cc3b with SMTP id
 2adb3069b0e04-5a285b06943mr2439861e87.18.1774128908792; Sat, 21 Mar 2026
 14:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320072951.54045-1-omer.e.idrissi@gmail.com>
 <20260321201738.16278-1-omer.e.idrissi@gmail.com> <ab8Mk8uOyKrNpykg@stanley.mountain>
In-Reply-To: <ab8Mk8uOyKrNpykg@stanley.mountain>
From: Omer <omer.e.idrissi@gmail.com>
Date: Sat, 21 Mar 2026 22:34:57 +0100
X-Gm-Features: AaiRm51RyG8s3AxKEjMa1qjxrSs7gDzVwZ-yuWHti52ZeTvf9Pv8STTz4a6SfiE
Message-ID: <CACx49Ndn9EtUUN=O6HW2Sw7bZ9zt0zy-2kO7LWPRCO6OLNrBfg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: change error handling to use
 standard errno
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for responding sir.

Most of the functions called in the probe function are only called
there so it should be easier to fix.

I will move on to do that.

On Sat, Mar 21, 2026 at 10:24=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Sat, Mar 21, 2026 at 09:17:38PM +0100, Omer El Idrissi wrote:
> > Replace non-standard return values with descriptive linux kernel error
> > codes in probe path.
> > Also replace the variable name 'status' with 'ret' to be more
> > consistent with other kernel code.
> >
> > Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> >
> > ---
> > v2:
> > - Return -ENODEV instead of -ENOMEM when sdio_dvobj_init fails
> >
> >  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 30 ++++++++++++--------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/sta=
ging/rtl8723bs/os_dep/sdio_intf.c
> > index d664e254912c..47189c849b05 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> > @@ -345,38 +345,44 @@ static int rtw_drv_init(
> >       struct sdio_func *func,
> >       const struct sdio_device_id *id)
> >  {
> > -     int status =3D _FAIL;
> > +     int ret;
> >       struct adapter *if1 =3D NULL;
> >       struct dvobj_priv *dvobj;
> >
> >       dvobj =3D sdio_dvobj_init(func);
> > -     if (!dvobj)
> > +     if (!dvobj) {
> > +             ret =3D -ENODEV;
> >               goto exit;
> > +     }
> >
> >       if1 =3D rtw_sdio_if1_init(dvobj, id);
> > -     if (!if1)
> > +     if (!if1) {
> > +             ret =3D -ENOMEM;
> >               goto free_dvobj;
> > +     }
> >
> >       /* dev_alloc_name && register_netdev */
> > -     status =3D rtw_drv_register_netdev(if1);
> > -     if (status !=3D _SUCCESS)
> > +     ret =3D rtw_drv_register_netdev(if1);
> > +     if (ret) {
> > +             ret =3D -EIO;
> >               goto free_if1;
> > +     }
>
>
> rtw_drv_register_netdev() doesn't return regular error codes
> but when you change:
>
> -       if (status !=3D _SUCCESS) {
> +       if (ret) {
>
> Then you're making it look like it does, which is confusing.
>
> You're going about this the wrong way.  You need to start with
> functions like _rtw_drv_register_netdev() which are where
> the _SUCCESS returns are first returned and change those first.
> You have to update the callers as you go.  It's tricky because
> you have to be sure you're catching all the callers.
>
> Then eventually, you'll get back to rtw_drv_init() and all the
> functions it call will return normal error codes and you can
> update that.
>
> Do it one function at a time.  Update the function and the
> callers.  Something like this:
>
> regards,
> dan carpenter
>
> [patch] update error code for rtw_init_netdev_name()
>
> The rtw_init_netdev_name() returns 1 on failure and 0 on success
> which is non-standard.  Change it to propagate the error from
> dev_alloc_name() and update the only caller.
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/stagin=
g/rtl8723bs/os_dep/os_intfs.c
> index 7ba689f2dfc8..92b52b1a2920 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -407,9 +407,12 @@ static const struct net_device_ops rtw_netdev_ops =
=3D {
>
>  int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname)
>  {
> -       if (dev_alloc_name(pnetdev, ifname) < 0) {
> +       int ret;
> +
> +       ret =3D dev_alloc_name(pnetdev, ifname);
> +       if (ret < 0) {
>                 pr_err("dev_alloc_name, fail for %s\n", ifname);
> -               return 1;
> +               return ret;
>         }
>         netif_carrier_off(pnetdev);
>         /* rtw_netif_stop_queue(pnetdev); */
> @@ -755,7 +758,8 @@ static int _rtw_drv_register_netdev(struct adapter *p=
adapter, char *name)
>         struct net_device *pnetdev =3D padapter->pnetdev;
>
>         /* alloc netdev name */
> -       if (rtw_init_netdev_name(pnetdev, name))
> +       ret =3D rtw_init_netdev_name(pnetdev, name);
> +       if (ret)
>                 return _FAIL;
>
>         eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
