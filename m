Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C7D20E6
	for <linux-staging@lists.linux.dev>; Sun, 21 Jul 2024 04:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721537031; cv=none; b=l1o6439CS2EKOY5q8SIcnW9u4zwcdj9/JOCqtO8pleLd+kYbg2K9gL7kzAeQ/wkVAIEs+dSe6hf4RQus9vSwke60gEg4on0xrNF3JEXg//83g+6Nedl6x4k3iV1CIq6PhUnGJsh90Mr5p7JHN1i+mHTsjCwaeihBYZ821mhl1o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721537031; c=relaxed/simple;
	bh=71orTOzWg3XZlDyBElqxuxqZlopxFIzVZT31RLN6YRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSgx9RFKqNjSy5JzPRYi0M0/5eHkEGNd72FlK900JgIm0GsK1DR8iOu9v0pQqq15QEChmc5jipaNb/fkUk6qOza/ZzsaIUN5p+r85uwXjpPDeILffhgFSYCl0Um0GlvJ4uf2o/kPeN8MeSS/pGSl+nXujOvQNmY8D3zKy86kI2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtPtjgEU; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtPtjgEU"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b7a3e468a9so17958816d6.1
        for <linux-staging@lists.linux.dev>; Sat, 20 Jul 2024 21:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721537028; x=1722141828; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6XwsCeqrR8s45EskYwahPzpCyXtFs+T8vWc8Jo4nhU=;
        b=XtPtjgEUrMaE9hM6cT1Ro6n+biTH9bHzEyFitnUo3am4jTsprUorqXKETQvXLGcNWh
         DA5oWpb6KwnOFsoKSW+xO3tA6pD4Lq+Y3Y/NFm1CNS5GKaxQsuzHxaRRfXIj6nc6vGVd
         GzY7ERMLlW38pTdof85O6voZCEdF1/4Vt+xEgHB/lYSLhaviFX/Ue/y1iBMijLor1hwD
         tRTYn4IbzsD0po6I/jFgomL3eAT+/oWpudGFqbdV3taojG9OLmmv08QQe5bRo39NsgWu
         xi07NSoNv7v7AxVle0ISjzvb0Rz3wnYx/AJDYlxQQm030zk2MBikgaxxmWS3lNqnKHx0
         6V7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721537028; x=1722141828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6XwsCeqrR8s45EskYwahPzpCyXtFs+T8vWc8Jo4nhU=;
        b=Sf9PEV/0tPuVP20QLSJQ5zVva/PUlS1mqKLRWuGCvZIx7Va4dcWAdHvQmgTtvq9aTh
         J/dSYn5vtjYWx1nGOM+xAJyvhGF6KOZ4dlZetimcmQPA9VWOpXp+aiPNRljKM6bf8mo/
         z6sG14pWNMdxtSvSHAls3Pr6GDddADHKeo5jk42R+t5TfOD65TMyrgirmeohp5YpUpJv
         m9OYzYmffhgPdPSCsczrvmk1utzwUo0uDKMc19iMAxrllpBFbVyVhHkJft/ZEU7Imnaf
         pUPgp1RaDsT7fwzJ30VV3Q/BcVNFkuxhyNkH7WpyOI2s0PnK56CILvqWAvDXoJdAqoII
         PR3Q==
X-Gm-Message-State: AOJu0Yx/ZyCp/gQReg3SGCqz9I0foRw0GYNeGBNY+VXRfW8o04ex1jpQ
	eHUIOYJXf0aBdhsWWF73Wbl8nBkmjvFgaSq51mq3GBRouVS+c+FXYws+uerOtvq2RfuBwlzDpyp
	GPrQPgFh9248D63Ii+/bb0TulOaA=
X-Google-Smtp-Source: AGHT+IG9WzMDEINSZdVEwZMtXI0WGWNF8bs4dN8/EmFppmJ/MjoqPz4QWv/ESaeqEOIq7PxYNbIvMxJikbZwDp/BxNo=
X-Received: by 2002:ad4:5762:0:b0:6b5:d663:bb53 with SMTP id
 6a1803df08f44-6b96102598amr49788226d6.5.1721537028510; Sat, 20 Jul 2024
 21:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240721040504.1483-1-yyyynoom@gmail.com>
In-Reply-To: <20240721040504.1483-1-yyyynoom@gmail.com>
From: =?UTF-8?B?66y47Jew7IiY?= <yyyynoom@gmail.com>
Date: Sun, 21 Jul 2024 13:43:37 +0900
Message-ID: <CAAjsZQzTMtsX4bVqadG1ZKDt+8XLUOHGt0bkoBS+M8vqw-X5Bw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: rtl8712: style fix multiple line dereference
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 1:06, M=
oon Yeounsu <yyyynoom@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Moon Yeounsu <yyyynoom@gmail.com>
>
> It fix the following checkpatch.pl warning:
> Avoid multiple line dereference - prefer %s
>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Moon Yeounsu <yyyynoom@gmail.com>
> ---
> v2: Fix email address and checkpatch.pl warning
> v3: Fix incorrect commit index, start with new thread for new version of =
patch,
>         place notes below the cutoff line, provide appropriate CC,
>         include 'Suggested-by' sign for those who gives good guideline.
>
>  drivers/staging/rtl8712/rtl871x_cmd.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8=
712/rtl871x_cmd.c
> index bbd4a13c7bb9..ffeb91dd28c4 100644
> --- a/drivers/staging/rtl8712/rtl871x_cmd.c
> +++ b/drivers/staging/rtl8712/rtl871x_cmd.c
> @@ -528,8 +528,9 @@ void r8712_setstakey_cmd(struct _adapter *padapter, u=
8 *psta, u8 unicast_key)
>         if (unicast_key)
>                 memcpy(&psetstakey_para->key, &sta->x_UncstKey, 16);
>         else
> -               memcpy(&psetstakey_para->key, &psecuritypriv->XGrpKey[pse=
curitypriv->XGrpKeyid - 1].
> -                      skey, 16);
> +               memcpy(&psetstakey_para->key,
> +                      &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid -=
 1].skey,
> +                      16);
>         r8712_enqueue_cmd(pcmdpriv, ph2c);
>  }
> --
> 2.43.5
>

Sorry and thank you to all of the reviewers and maintainers who take
care of my patch.
I make a new problem... I think I check my patch and email over and
over and over.
but, again, I sent the patch incorrectly. The body of the patch
contains improper content,
and also sends the email as my nickname, not a real name.

Sorry for making spam and taking your invaluable time.
Next time, I'll send a right and valuable patch.
