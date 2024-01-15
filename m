Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8466FA4
	for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 08:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li+Mr9Oc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a2cad931c50so285353666b.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 00:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705307219; x=1705912019; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwFP484EL/42mEA8eP3U7iCZLLGzI7yfwJRI9zN584M=;
        b=Li+Mr9OcWzSCpji5kSJFqQvkkbuXQ99YDZP/Z49lIVEvJjOR4eUos8eQXJF5bdoVJA
         QgqOXz63uYhScRoT7Vfupc7IAAsMXzRpUDQ3kMz+I/YS4UzN/Qs5Y3ntwEjmL0ALXRLS
         3NnvIN2MHtoQAz6y/aG8yv1QKDlbIPN/rYEoGj/N1qTP9NLhLBj0jb5w9sAK0piZJASc
         iXDCqxYYjezMxAfC3hJzxY60hpdqXIa3hi/NaXOhfQzAgVwMkCod54G/TAa2u5WToJSL
         OaUJ+npuj2SMVCJchkl1LoG1ulnkbaZmk0GaDQbRByjnJo9TKZ4QqwGUH/JkQCIhg3mr
         93/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705307219; x=1705912019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwFP484EL/42mEA8eP3U7iCZLLGzI7yfwJRI9zN584M=;
        b=JwqXTGOqht4lqx+Y88zTdo/HIPhdIs8JsuCuRWINU66UFlK/FBztuHDiW4FMw8YMxU
         mJlMehHgBN5V7k3g35pl2IW0fCde87gssbNNHjn/jShV2zUCqTlv7HeznS4PEUolXEyW
         1yPtgcCsLnGoJzKJ04jwaiXL4Co5WkhR2kvNy0zpRS/rNLXwQRxrKPYvRtzRCpyKC6Zt
         m3ZaAKwv9e7xkWn3a+bPB0VUkqsQ3DWAdeu+cAEFzAf4+zWmrtKzfMHRW8lmQDrCRjLq
         ZVfRvIMQEVrY70GaefIHiymk5HiqlD98Vt8Q1kEr2q8RGfjrLAVVJWKio6EiV6RCRrQp
         B1fg==
X-Gm-Message-State: AOJu0YyMXDUrNIg433JsWV6Z/+nWMyB2z47HhXCki/TbueJPFjPJgga0
	ytNudepgoBKX/hmm6WeJ+g0xB5D8nw7KWE0h4u8=
X-Google-Smtp-Source: AGHT+IF4k1vq/KWZ/UThsgPFVJPprdVcyL3s0TAS6ZWzFuWcDmGKlFdr94xCGFOqT/9hdzR7N9CZn4dOFhklG8DmJ60=
X-Received: by 2002:a17:907:740e:b0:a26:9829:1f84 with SMTP id
 gj14-20020a170907740e00b00a2698291f84mr2033034ejc.116.1705307218905; Mon, 15
 Jan 2024 00:26:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240115075425.108134-1-meir6264@Gmail.com> <15008951-9c0d-4bf8-8bc6-a639a6726105@moroto.mountain>
In-Reply-To: <15008951-9c0d-4bf8-8bc6-a639a6726105@moroto.mountain>
From: meir elisha <meir6264@gmail.com>
Date: Mon, 15 Jan 2024 10:26:47 +0200
Message-ID: <CAHdEp8-APpMA-m7kUjMPF0a9NXaBSTjVJn4UJepv=RUn4w=8Cg@mail.gmail.com>
Subject: Re: [PATCH] Staging: rtl8723bs: rtw_ieee80211: Remove extra space
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure. Thanks for your reply! sending v2 patch.

=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=D7=9D =D7=91=D7=
=B3, 15 =D7=91=D7=99=D7=A0=D7=95=D7=B3 2024 =D7=91-10:01 =D7=9E=D7=90=D7=AA=
 =E2=80=AADan Carpenter=E2=80=AC=E2=80=8F
<=E2=80=AAdan.carpenter@linaro.org=E2=80=AC=E2=80=8F>:=E2=80=AC
>
> On Mon, Jan 15, 2024 at 09:54:25AM +0200, Meir Elisha wrote:
> > Fix checkpatch warning: please, no space before tabs
> >
> > Signed-off-by: Meir Elisha <meir6264@Gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/s=
taging/rtl8723bs/core/rtw_ieee80211.c
> > index 30e7457a9c31..cfa994835008 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> > @@ -1036,7 +1036,7 @@ void rtw_get_bcn_info(struct wlan_network *pnetwo=
rk)
> >       struct HT_info_element *pht_info =3D NULL;
> >       struct ieee80211_ht_cap *pht_cap =3D NULL;
> >       unsigned int            len;
>                     ^^^^^^^^^^^
> How about we delete these as well.
>
> > -     unsigned char   *p;
> > +     unsigned char *p;
> >       __le16 le_cap;
>
> regards,
> dan carpenter
>
