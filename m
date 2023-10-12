Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F586DDB6;
	Thu, 12 Oct 2023 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fhz0wW+p"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-57bce354d94so393246eaf.2;
        Thu, 12 Oct 2023 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697104651; x=1697709451; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwdR5UfKZdkaWRIAkpPnNZMh5uS4lp1PwggWWgtXHKw=;
        b=Fhz0wW+pRpJsq/OggtZI4dnsm57Cjig8kgY07XsJAFPLuQcPjSDOc1WLSNpFDZjD5w
         smwvt8hRQXzL+3FIgq0fq6uoXXYdnTIGJGTJiq7sJuFMdZSYlGBi9+fQXA5vDdRVwizd
         puMwXgxvMtBTjMso54Mz3sTsIv16QOtVCVhVIMRchKbAo/SK2QXgDQtixY6TYVxt/ke6
         ad1k175lSdveTgOpePmq/XWkT6I2TRvuEoLf38nlcoME5GHyUhaSMITEijcugwYc6Yd/
         Ls5ItBH9FeLA2P0wjtKiAbBs9b2RXEt5G0KJ+8Psi5360Ml+F2OAJu+IP83465s/Y4N8
         ddkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697104651; x=1697709451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwdR5UfKZdkaWRIAkpPnNZMh5uS4lp1PwggWWgtXHKw=;
        b=B1Aiw8n44MOt7d/qrwclSKYczRnokmOoxd69GNmEEYsx2h2e8rtHE+AjXY9E/MtVSI
         Aq+ND6/clDzkF0dRpyhayijim0qkT+qfldNv23+sEwMKrkSI5V5L8gS7wFXd+smyDDhq
         n/wX37uGMkriIfergLPkr76kY7UOvsqMv50sY7lvwQ9l58UUchn3aUVbLWQXI/iGuElw
         iJLyNp8sRAgcnAtSPow9QfAL6vAcKcVxVRovXCdLvoH6iznHTq5L4TcSU/xaDWhEQgr2
         R2cUaVZv6Qy3SaWzitWMImlxvKT+oCHIrVqRbohG3lcNvVLW/fI4jFv1ibDKoY5EU32l
         Pf8Q==
X-Gm-Message-State: AOJu0YxuHwUf7XMMAGKUvd9doQp2a/P3D5Ucr8xeUA/bMN/MnhIyhJnY
	Khql4Okf1kl5AQXfHLp3SHd8l+1hdrZANgqfDq8=
X-Google-Smtp-Source: AGHT+IF203hK+9NVxRy43xv7sJ3KAyfzjvWa14O47XbIsgfVV5/DnyirAzXXOjXkmqnHjtBT6L4wpBPa6G8sZiG97vI=
X-Received: by 2002:a4a:301c:0:b0:56c:dce3:ce89 with SMTP id
 q28-20020a4a301c000000b0056cdce3ce89mr22961387oof.5.1697104651071; Thu, 12
 Oct 2023 02:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZSeD1UojAgrsOh16@lab-ubuntu> <1e2cfefb-c4dd-4611-867a-2b2e9e5f7467@gmail.com>
In-Reply-To: <1e2cfefb-c4dd-4611-867a-2b2e9e5f7467@gmail.com>
From: Calvince Otieno <calvncce@gmail.com>
Date: Thu, 12 Oct 2023 12:57:19 +0300
Message-ID: <CADFX3OT4fAGjVrp-D2fPTi6DtxUMbk+-Z0OcwRTWDBEEwb8ukQ@mail.gmail.com>
Subject: Re: [PATCH] staging/wlan-ng: remove strcpy() use in favor of strscpy()
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <error27@gmail.com>, 
	Archana <craechal@gmail.com>, Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, strscpy() has the same behavior as strncpy(). It is preferred to
strncpy() since it always returns
a valid string, and doesn't unnecessarily force the tail of the
destination buffer to be zeroed.

On Thu, Oct 12, 2023 at 12:17=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> On 12/10/2023 12:27, Calvince Otieno wrote:
> >               if (j =3D=3D -1) {  /* plug the filename */
> >                       memset(dest, 0, s3plug[i].len);
> > -                     strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - =
1);
> > +                     strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - =
1);
>
> Is this strscpy() behavior same as previous strncpy()?
>
> --
> An old man doll... just what I always wanted! - Clara
>
