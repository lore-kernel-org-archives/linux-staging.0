Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511AB2AB53;
	Thu, 12 Oct 2023 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXBRseXG"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-57bb0f5d00aso763546eaf.1;
        Thu, 12 Oct 2023 10:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697132854; x=1697737654; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZ5cBSWgR34rbCxupj7uHLFbP8vjmFBvwRGEvSBQmBE=;
        b=bXBRseXGYNVX/0JfM/V1pmw6DJafnx1SlN8dydfhHIaaEteYGyI2FrUNqagA7Krt8c
         WX70KM72+wcDTFp08Jft2ZH2iGu4PDdh5WSWEk2kx5CuJkuJX2ZT9yLitSDEht8LXdoJ
         7lTbhqgvjhccLXD8ob935YgCWvofxB+kFfCcBP9Y5QjwO7Jk5Zxnys+7ZvBVYovWWX8J
         sdDBIazi9Y7Ka9yoLjgsYxf5EZj2OKN9SXoIqQ5MsXCowQ1nM430dRFL1PP5hCzTsy/s
         p2D0wOEQHLJS1W7fsLsPUYMEDt+e+VFwrR6ES4aBmv91w7SmS9r5wALbzICefgfdLaBB
         3JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697132854; x=1697737654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZ5cBSWgR34rbCxupj7uHLFbP8vjmFBvwRGEvSBQmBE=;
        b=QdZ4hzCw3DqA7d58zIiZe6xXq1MAzJQj7LYeLv/N8s8+9Ty45kezRkX7PryE0B0Oai
         2VbP+9jU7Nr7FXxPbCuwcRWGKrHMGaKl83xqb+pgcCJjThuhOOewEVGeOXmXlcvMSgJQ
         jgCWAbmiNvgQhFFWL9Z9Hckk9bO+Ny5eiBsv5++LuRWigo6WD7e9gYnZlY8fgL1IJbik
         JUq5E95HbfCYB4HElGpcPe+Rd9yA0Z22XwgbSF7pxS6gGuZ9+sC+B0e/W50c9aAtVge1
         G9qqxA3Ev45LDOFRjEtwHld/RZ5L0K5dOAusoJixU+lZzFA6k32mxMjjaZW1jIl/efxw
         Tmzw==
X-Gm-Message-State: AOJu0YwQCENOD/O/M/OoQcR7ctj7Do0vmd7gpd3X/6pDbgtmSlmViZkm
	OYAKXswoN0tljngetnGC033BRelhrqHUWNM8kWI=
X-Google-Smtp-Source: AGHT+IGebWKoIkiyVL4Zv+2u6gnjQtw4yarEaWmsPUToyBHoZzdphDOgqkw3QNX07uCFBmo/240cPNDISGcBH74mrC4=
X-Received: by 2002:a4a:9b0b:0:b0:57b:6d88:4cb2 with SMTP id
 a11-20020a4a9b0b000000b0057b6d884cb2mr26109502ook.1.1697132854386; Thu, 12
 Oct 2023 10:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZSf8VcH8JQ+L+Z/r@lab-ubuntu> <2023101234-extenuate-regain-2e36@gregkh>
In-Reply-To: <2023101234-extenuate-regain-2e36@gregkh>
From: Calvince Otieno <calvncce@gmail.com>
Date: Thu, 12 Oct 2023 20:47:23 +0300
Message-ID: <CADFX3OQWXU0bxe17QmCVdASC2oRzMk3A3SBW=5SnO9SSBzR2FA@mail.gmail.com>
Subject: Re: [PATCH v2] staging/wlan-ng: remove strcpy() use in favor of strscpy()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Archana <craechal@gmail.com>, Dan Carpenter <error27@gmail.com>, Simon Horman <horms@kernel.org>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 7:42=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 12, 2023 at 05:01:57PM +0300, Calvince Otieno wrote:
> > In response to the suggestion by Dan Carpenter on the initial patch,
> > this patch provides a correct usage of the strscpy() in place of the
> > current strcpy() implementation.
> >
> > strscpy() copies characters from the source buffer to the destination
> > buffer until one of the following conditions is met:
> >       - null-terminator ('\0') is encountered in the source string.
> >       - specified maximum length of the destination buffer is reached.
> >       - source buffer is exhausted.
> > Example:
> >       char dest[11];
> >       const char *PRISM2_USB_FWFILE =3D "prism2_ru.fw";
> >       strscpy(dest, PRISM2_USB_FWFILE, sizeof(dest));
> >
> >       In this case, strscpy copies the first 10 characters of src into =
dest
> >       and add a null-terminator. dest will then contain "prism2_ru.f" w=
ith
> >       proper null-termination.
> >
> > Since the specified length of the dest buffer is not derived from the
> > dest buffer itself and rather form plug length (s3plug[i].len),
> > replacing strcpy() with strscpy() is a better option because it will
> > ensures that the destination string is always properly terminated.
> >
> > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > ---
> >  drivers/staging/wlan-ng/prism2fw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-=
ng/prism2fw.c
> > index 5d03b2b9aab4..3ccd11041646 100644
> > --- a/drivers/staging/wlan-ng/prism2fw.c
> > +++ b/drivers/staging/wlan-ng/prism2fw.c
> > @@ -725,7 +725,7 @@ static int plugimage(struct imgchunk *fchunk, unsig=
ned int nfchunks,
> >
> >               if (j =3D=3D -1) {  /* plug the filename */
> >                       memset(dest, 0, s3plug[i].len);
> > -                     strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - =
1);
> > +                     strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len);
> >               } else {        /* plug a PDR */
> >                       memcpy(dest, &pda->rec[j]->data, s3plug[i].len);
> >               }
> > --
> > 2.34.1
> >
> >
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/process/submitting-patches.rst for what
>   needs to be done here to properly describe this.
>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot



Hello Greg,

I did amend my first commit

I used the command: git commit --amend -v
The result of this commit action is what I sent over.
--=20
Kind regards,
Calvince Otieno
