Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C095B2D60E;
	Wed, 25 Oct 2023 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfHlYB2o"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1eb39505ba4so2815774fac.0;
        Wed, 25 Oct 2023 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698225677; x=1698830477; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7YTjhq7LQ6Y3merZ3N1iis6dMDgnT68aVt/7VjLWEQ=;
        b=CfHlYB2o6qNrelxyHXhmZt3pyzhxcQUsxA+vIR9/OZo5TVFvqYXuYNpIA0LW2OhUYF
         MZGAyGiENG65+yvqdkHi1w+FhLoMOHuNe2cerQJmXz2uszLmfZ/NBPPzXQ9JYa+gKAZ9
         jlf5iMNWv7HLOMrT5sxUXRdq3oMzvuACtGXJRGFv1Hpj78KfWFD335omxkdq+8SABUgH
         6z0vvcvl/V79PKVlsxP+scSQJUOIDf7UM4/JSnQkxTRBipn6TBDgrzaINacWVPX6u2Ox
         +BvBV6r8zZGQdhcEDRgyRKzhNd767tM3bahbRf/DA99+TKZ0xsr/bLE3eStxKP6AZGiF
         OStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698225677; x=1698830477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7YTjhq7LQ6Y3merZ3N1iis6dMDgnT68aVt/7VjLWEQ=;
        b=JT6wczxzESbxFNglvzT82/qiwmvDnLIK8HkOLpS5MUqkcmAL+aghonkEW3G/CBrajq
         FnyNhpFm2khwCOswkBTBHI/1CDOVcYeJnZMp/+rc03vWqg6FOGAfjb5Trk2CYNu50VEP
         lrUa4agjgE2KLNCm3uDqoX5wi9iKYQ6elsTBEDQ3di9aJjLK5H0I+viLxNmvpwvX7JYl
         DL4LnE9fBTdIb4ipjV6xIIdZEhr264idq8UzeWiOVp1b3Dp0oQT45dQ13/H9MlYPtTqo
         urjPwIZluXeQxSW8+N8TxD96P0ThXveuklexaRl+U3QQCQQF/ituCDIj1reY/svU3jpY
         cv9A==
X-Gm-Message-State: AOJu0YxNiEkNHYtr6Z2kM6+Zdmm7kHyJHmqPAvuavjak9F6eARLsiZ9Z
	9QUs2F9OT5ah6YiuYHoKJCe5WrD80k4IUL6jax0=
X-Google-Smtp-Source: AGHT+IERc9Q4B1Iyatie8Cmnqb3DqPhVz6ynfPK50hCJl61luZ+dN9IjZP2C9sejCUiZTcSokVjThOn+FVDmJKa7fRU=
X-Received: by 2002:a05:6870:831e:b0:1d0:e372:6b06 with SMTP id
 p30-20020a056870831e00b001d0e3726b06mr17388536oae.25.1698225676729; Wed, 25
 Oct 2023 02:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZTjRWkqXeoS74E52@lab-ubuntu> <2023102502-decipher-startle-5115@gregkh>
 <CADFX3OTfJQzqeHOLZBJ=6e6YOxkS4xcoeeQR=UnrUU6d1gN8Dw@mail.gmail.com> <2023102543-country-tissue-96df@gregkh>
In-Reply-To: <2023102543-country-tissue-96df@gregkh>
From: Calvince Otieno <calvncce@gmail.com>
Date: Wed, 25 Oct 2023 12:21:05 +0300
Message-ID: <CADFX3OTw=6mhEwiM9nA5VZ472J3W+BJQexujr88zEeJDAbPe6A@mail.gmail.com>
Subject: Re: [PATCH] staging: wlan-ng: prism2mgmt.c: rewrite flexible array member
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>, 
	Deepak <dvarma04@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 12:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 25, 2023 at 11:58:56AM +0300, Calvince Otieno wrote:
> > On Wed, Oct 25, 2023 at 11:36=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Oct 25, 2023 at 11:27:06AM +0300, Calvince Otieno wrote:
> > > > Declaring zero-length arrays is allowed in GNU C as an extension.
> > > > Although the size of a zero-length array is zero, an array member o=
f
> > > > this kind may increase the size of the enclosing type as a result o=
f
> > > > tail padding. The offset of a zero-length array member from the beg=
inning
> > > > of the enclosing structure is the same as the offset of an array wi=
th one
> > > > or more elements of the same type. The alignment of a zero-length a=
rray is
> > > > the same as the alignment of its elements.
> > > >
> > > > Declaring zero-length arrays in other contexts, including as interi=
or
> > > > members of structure objects or as non-member objects, is discourag=
ed.
> > > > Accessing elements of zero-length arrays declared in such contexts =
is
> > > > undefined and may be diagnosed.
> > > >
> > > > There are some instances of code in which the sizeof operator is be=
ing
> > > > incorrectly/erroneously applied to zero-length arrays and the resul=
t
> > > > is zero. Such instances may be hiding some bugs.
> > > >
> > > > This issue was found with the help of Coccinelle.
> > > >
> > > > [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> > > >
> > > > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > > > ---
> > > >  drivers/staging/wlan-ng/p80211metastruct.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/wlan-ng/p80211metastruct.h b/drivers/s=
taging/wlan-ng/p80211metastruct.h
> > > > index a52217c9b953..c8b73c867391 100644
> > > > --- a/drivers/staging/wlan-ng/p80211metastruct.h
> > > > +++ b/drivers/staging/wlan-ng/p80211metastruct.h
> > > > @@ -71,7 +71,6 @@ struct p80211msg_dot11req_scan_results {
> > > >       struct p80211item_uint32 signal;
> > > >       struct p80211item_uint32 noise;
> > > >       struct p80211item_pstr6 bssid;
> > > > -     u8 pad_3C[1];
> > >
> > > But this is not a flexible or 0 length array at all.  Why change this=
?
> > >
> > > And are you sure you are allowed to change this?  Did you verify wher=
e
> > > this structure is being used and how it is being used and why this
> > > padding field is in here?
> > >
> > > And how was this tested?
> > >
> > > thanks,
> > >
> > > greg k-h
> > I have looked through the code to see where the pad_3C member variable
> > is referenced or used, but I didn't find any instances.
>
> I think that is because it is being used to map a structure on top of a
> data blob read from the device.  Dig in and I think you will find where
> it is mapped somewhere.
>
> > I have to admit that my search might not have covered all the possible =
patterns
> > and usage scenarios. It appears that the member variable is only declar=
ed
> > within the  struct p80211msg_dot11req_scan_results.
> >
> > Dan outlines that the pad_3C member variable is used for padding. So,
> > I stand corrected.
>
> I'm interested in what tool told you that this was a variable length
> array that should be modified?  It is a 1 element array, in the middle
> of a structure, which is not what a variable length array looks like at
> all, so perhaps some tool needs to be fixed as to not trigger on valid
> code like this?
>
> thanks,
>
> greg k-h

Actually, it is a simple coccinelle semantic script of my own making.
I executed the script against the drivers/staging/wlan-ng

I was trying to match scenarios like the following:
struct a {
 some var[1]
}
struct b{
 some var[0]
}
I was reading through the variable length array suggestions and I came
up with that.

--=20
Kind regards,
Calvince Otieno
