Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A748D1F614;
	Wed, 25 Oct 2023 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/fcUxgA"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5822a990ea6so2176258eaf.1;
        Wed, 25 Oct 2023 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698224347; x=1698829147; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OoRfk8TiJfkU9ICiHia2fB6rWTj3/err/dH0p5XAZI=;
        b=d/fcUxgAv0JNW44JKtw+1XedMwqHtRL3Vwj3VGWzlmjp0SizYuiXn7aHjZqvIiZ4fc
         fkkLwi4Q8MI2x14OYG6gTnWbZB/8kV5BibweCogKxVf0n6+lCKzyOd5ONCe0U6enwPzl
         RrcAewNLpz4nQAj6VVBPeKGoXd/JfcJ2u37EYvmNfrMqy2nTD4UsLcNCuvxiIN8NCyaY
         CWqzMQXtEpAAfltld/YbXcBs5cdO9fAtExaXmMnVZcb+rghx9+Ddh8rHWyB/EJEsvwTP
         OHWRMcTZwnynLtlf26FSrL9LIH1KcZ6i6yA+CEzKGEfK9XNg+eGXt31JZKpvKoF8FkNb
         Zb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698224347; x=1698829147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OoRfk8TiJfkU9ICiHia2fB6rWTj3/err/dH0p5XAZI=;
        b=Yb1vaQEoM9SLIFt1vkGbPBpQI+F0bG40d+vuLVXTLmA946ggNgmk+3IND2x1U5LBaT
         e0G4kNbi6b37jhCPhO3FPx2jvxLGRKknyRsl3ei/GnT0MNV3jiw1YyZ44AH3vah2dYWy
         FBaE7LMg89ns125s8aYMR1PCvzGilNPHAjp1KqpQNUctHAGcQfPqzaKlv93AOOrXKi1X
         fAe01jkCZnm5N3xkzN5DaCQ7epKe2Kk0VMjtydVDV84XtCMJv37h5nC/EHxhuptc1ymn
         s0tvzU73DirFuy1vFL73gCqaMOKtjlZI1zLqhGpDvcxXPFANcPW/qEvedtr5qwscgseJ
         MYcA==
X-Gm-Message-State: AOJu0YzeGB3AxKvTewp+/GO5BpHMULmWegsqfZK7LxNh3GM7IyP8/c/6
	1Nd0OjGeiABgg0PxFD1T7kv56qBb6rlJ3nP0D2c=
X-Google-Smtp-Source: AGHT+IGBrI0wc7QaHBc4415Gij9LLUXRwuQNFXhbInIu0PiII136ku6ME1+5+ut2C6+Uz+cvvEx4NOvZVwgWXGIKgNM=
X-Received: by 2002:a05:6820:2183:b0:56c:dce3:ce89 with SMTP id
 ce3-20020a056820218300b0056cdce3ce89mr14624633oob.5.1698224347600; Wed, 25
 Oct 2023 01:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZTjRWkqXeoS74E52@lab-ubuntu> <2023102502-decipher-startle-5115@gregkh>
In-Reply-To: <2023102502-decipher-startle-5115@gregkh>
From: Calvince Otieno <calvncce@gmail.com>
Date: Wed, 25 Oct 2023 11:58:56 +0300
Message-ID: <CADFX3OTfJQzqeHOLZBJ=6e6YOxkS4xcoeeQR=UnrUU6d1gN8Dw@mail.gmail.com>
Subject: Re: [PATCH] staging: wlan-ng: prism2mgmt.c: rewrite flexible array member
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.or, 
	Julia Lawall <julia.lawall@inria.fr>, Deepak <dvarma04@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 11:36=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 25, 2023 at 11:27:06AM +0300, Calvince Otieno wrote:
> > Declaring zero-length arrays is allowed in GNU C as an extension.
> > Although the size of a zero-length array is zero, an array member of
> > this kind may increase the size of the enclosing type as a result of
> > tail padding. The offset of a zero-length array member from the beginni=
ng
> > of the enclosing structure is the same as the offset of an array with o=
ne
> > or more elements of the same type. The alignment of a zero-length array=
 is
> > the same as the alignment of its elements.
> >
> > Declaring zero-length arrays in other contexts, including as interior
> > members of structure objects or as non-member objects, is discouraged.
> > Accessing elements of zero-length arrays declared in such contexts is
> > undefined and may be diagnosed.
> >
> > There are some instances of code in which the sizeof operator is being
> > incorrectly/erroneously applied to zero-length arrays and the result
> > is zero. Such instances may be hiding some bugs.
> >
> > This issue was found with the help of Coccinelle.
> >
> > [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> >
> > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > ---
> >  drivers/staging/wlan-ng/p80211metastruct.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/wlan-ng/p80211metastruct.h b/drivers/stagi=
ng/wlan-ng/p80211metastruct.h
> > index a52217c9b953..c8b73c867391 100644
> > --- a/drivers/staging/wlan-ng/p80211metastruct.h
> > +++ b/drivers/staging/wlan-ng/p80211metastruct.h
> > @@ -71,7 +71,6 @@ struct p80211msg_dot11req_scan_results {
> >       struct p80211item_uint32 signal;
> >       struct p80211item_uint32 noise;
> >       struct p80211item_pstr6 bssid;
> > -     u8 pad_3C[1];
>
> But this is not a flexible or 0 length array at all.  Why change this?
>
> And are you sure you are allowed to change this?  Did you verify where
> this structure is being used and how it is being used and why this
> padding field is in here?
>
> And how was this tested?
>
> thanks,
>
> greg k-h
I have looked through the code to see where the pad_3C member variable
is referenced or used, but I didn't find any instances.

I have to admit that my search might not have covered all the possible patt=
erns
and usage scenarios. It appears that the member variable is only declared
within the  struct p80211msg_dot11req_scan_results.

Dan outlines that the pad_3C member variable is used for padding. So,
I stand corrected.
Thanks.


--=20
Kind regards,
Calvince Otieno
