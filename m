Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661E81B14FE
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 07:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725868688; cv=none; b=Bb+uP/3osadZbwDOxSrY5Nh68qx16D+d9B+64CpQMxjtmI+Q3ACoKIXOPkUANkBVeUsETlMnxzI81iJYJTfMbQ0/JscJheIUxyNX/xx5Jy3/YDsryno+UOmZwQknmNj6b4mg2cAX73pXCk8SzO2X/e7z7TGvvlIzJzmW83H9WuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725868688; c=relaxed/simple;
	bh=ujQZ7V9Cm02L09suGBtipIxQCYQBICBuJyEa1q23u6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWI0BrUoaAatmgwi7LVW8eWYqzvCSpw55g+vvkLow7Hb7JON06PUJHiz1uDUEfLcfq/fpLXswcIfTdOWZPOckaZvugDOGzBckxO5+ajjt8Ca5CZ0AP0Bf43Oz8MO6lgjcfAmNXqd5BtcTaLxhJWvEcdLQdOZcKKig4gRK5ucFlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Azat5aDT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azat5aDT"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-718e6299191so684118b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 00:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868687; x=1726473487; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WLpjFUUtia9zYW7FEaGOWh41pWa41DKtXQj0BBM9zQ=;
        b=Azat5aDTtVxeeb5ZV4abZpkYf2uLllJ0lwOD8FfH7g5ELb4vMStzN5zL1kcsrLi8BN
         C/DcnPYBPaoWVR0mbZxsK+bO/dmHMyS/uMsrz3TBLumE7KstThKlebuPJUfST4Zi2gO8
         E6ehpYGu7DJUNVYOcFrL1+9E7M3hf6uNHbBp5+UNCEq7Ke/tiiFHA0lwaE5gvNu9d1aD
         G3dcIxV7N7rMP0OlxAEhpeckzIfSu6EyuBQ3St0L5z5F1PKVwZXjufnE5QCuvQXjkDVl
         ocfeUcNpDlYFiYKDN5eIvfecfRoh51s/WwSnrQWOhqv87Dp8iXRA+HvxHmW0Ijwk7Xx7
         WTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868687; x=1726473487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WLpjFUUtia9zYW7FEaGOWh41pWa41DKtXQj0BBM9zQ=;
        b=ao6rp6XsRp91+HroqQOM+4FhSnQ86mE4/z9zAAlGJiEiH40YRY8pRObA9GNv63ThFl
         2wZyNBrybXmiA7ZaiT5GwJ/wY9yWlZBm7id4wElWhbwpp+A5/FGi60oof3tTVTj3Chq7
         SlGMcJtQ7H51KhkqoidpTGEKcD2aRfNNZiqeLe73stnHUj5Hv3gTP/Ieno6exGEqoYDP
         /2zgzHfirHsBQkf8KLrtiq5IQl0FLTsTEID640RhtvUqflW3BSidWF0T3XtaMJ7HCKic
         FXBnGX6Pc0+uh0Qn50CbxsX1x+uTBQ5IrZaj1H6pRv4sOFKPJ3uHlMiFerPwUyacdBcO
         jyUA==
X-Gm-Message-State: AOJu0Yytd883N5Da4XOroozXTLsPMo+xRO1BBKfqWKdjL6NTGExQRp0E
	5AgSf40jwtSkIl29g/LxYl8JQj6v3uYjXaL7vd9CIo3V1F1DoVA8nYl1Bhyctvclh9bv2mo5f6v
	ByW6BaL8swqA8HTLxQMa5Ur5SqlU=
X-Google-Smtp-Source: AGHT+IGlg6KQbu8efR4O6zSp7JM9bj/ucZq060p+QZxUZrTjOrFZ+t+vWteJBrj/2K9uVa6f/Geos3mOGlUDcyzedk0=
X-Received: by 2002:a05:6a00:94a2:b0:714:1e36:3bcb with SMTP id
 d2e1a72fcca58-718d5e0f288mr8741735b3a.9.1725868686660; Mon, 09 Sep 2024
 00:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
 <20240908101110.1028931-2-sayyad.abid16@gmail.com> <4176c4f5-7da4-4f0a-a632-d2a46b8d3035@gmail.com>
In-Reply-To: <4176c4f5-7da4-4f0a-a632-d2a46b8d3035@gmail.com>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Mon, 9 Sep 2024 13:27:31 +0530
Message-ID: <CACVUEB=BJKSGiW3vDd_t56AZCiUGAEuvyZTM2t9K-DLepEqO6A@mail.gmail.com>
Subject: Re: [PATCH 1/6] staging: rtl8723bs: fix use of tab wherever possible
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:53=E2=80=AFAM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 9/8/24 12:11, Sayyad Abid wrote:
> > This patch fixes the coding style issue by fixing the use of space
> > instead of tabs on line.
> >
> > Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
>
> Hi Sayyad,
>
> please make your "Subject" line more unique. Consider that we may end up
> with having dozen of commits like yours, all of them referring to
> different removals and all without the necessary information to tell
> what they differ in (except the driver/subsystem). So it would help if
> you add the changed file or function to make it more unique.
>
Roger that, I'll keep that in mind while sending future patches.
> Please also improve the Subject Lines of the other patches.
>
sure, will do.
> If you send in a second version of this patch please use a change
> history. Description from Dan under:
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
I think I am having some issues with the local repository,
I'll rebase and check again for the discrepancies. If the issue persists,
I will send a v2.
>
> Thanks for your support.
>
> Bye Philipp
>
> >
> > ---
> >   drivers/staging/rtl8723bs/include/rtw_security.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers=
/staging/rtl8723bs/include/rtw_security.h
> > index 98afbd3054a4..487d69460cec 100644
> > --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> > +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> > @@ -75,8 +75,8 @@ struct {
> >   };
> >
> >   union Keytype {
> > -        u8   skey[16];
> > -        u32    lkey[4];
> > +     u8   skey[16];
> > +     u32    lkey[4];
> >   };
> >
> >
>
Thanks for pointing out the issues.


--=20
Abid
