Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879226E165
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771571050; cv=pass; b=bYxzGitgAsAUXnY0XG4CsFysiQGroyvoVrVv95MLnpcMJeVCBkrpoKuVvtXBvTjDfluyrtBwzrxPZ2mm1FfFr01Gobn7i5Qbv5Gkd4Jx3pr9Nlvdi+vNB3Zsf4Eu+U+BpnZiMzx+sp7TQ135Oz9z/10q11K+eWTBc5i7XJDC+LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771571050; c=relaxed/simple;
	bh=QMR+CL5aFfq+xybOxaTpFTc5JmpJYvn3yqtfhXHwfDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPVRYFdJr1WHS3ft0w6ObPAgK1KQVHXZZCZP8s0wRJ6ee3T8+XqUzW9hnfBPWe36yylip+gudknN/7oeOjLgQ0QWVCMRN7wH+ziVDiydylAfRZhL05w4sTNq8Pttmj0joBTCUbHIaPxocgrdv1rgIQIYBjdBaWzsKyX/XnnNVag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbFrQOtx; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbFrQOtx"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7948e902fadso14409607b3.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 23:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771571048; cv=none;
        d=google.com; s=arc-20240605;
        b=bwb1le0Z7LYEYBWNvzFOtvGLt4Bb0ASziHq5jI4ZbGfijj3ksJTLkaSmwe206j5iJq
         CyYHad7TMETYoOzbmXTMePFkkGBthqyqfqH4Qbutdi7kauG3c/MLm4cf6mbq9/U8SdZx
         vq5QKr/mRo6D3KqR9euLIZ0wm2/cn4ADxU83aPKwF5/ilut+Wr/F4J7FVCr5Mpu9sYO1
         /TTGaJesGcdmMnMC/tWZvAJnzaxBlRgDq8WWzjIkc1bpnPeLqnxFE+J4HL3RLLlGIEsC
         NjAcAXkkF8n/w7AMcldAt/XHiwp4rZdJ7SRXVj+vyKBDrsE4HdhhHV6C1STijOSEX9Uq
         PMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWlFRvAAv3Ez0sCmmg14nrvJGE/f1SXTlqum7nZ6ROI=;
        fh=g1fy2vih2etrDb7Py8ECJ+xLTc5XP1XU/tyQIRssSCQ=;
        b=cWXQnA6LLsciwjFEdcgGeJOlT7fQAB546pJnafGYO7p3iq0mxks/E9mBOrHM4kOmA4
         4RdSbyZpxOCvJP4LD2yF2beUMDwoFKw6bWqfdF7dGlgMdRYhhNfLb8vxschtk67R7+GC
         NfM7BcRgLfKHJl4d5kR9NKYvmJT1cUqsBMz2AgP7/r4zOpL7Arhnfy3aQ6hFztIXsYZD
         ZVqZ5AzIKNhApt6n98ySIc4AXJOFhND4RMtTTc+hLChEOnDrQVJqwyDqzqO5pSQ7HceN
         6qrahHstdUCkuk9ORC9UotFkuKPF0b8uLKs6NurwfY4d2EtAJKbe+FFTtk8aAFMLe9J0
         5ppQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771571048; x=1772175848; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWlFRvAAv3Ez0sCmmg14nrvJGE/f1SXTlqum7nZ6ROI=;
        b=hbFrQOtxFrU6eTz9YLhtHSXdujzUs1/32TgmR37vfW/aojklMPI3uv0bKE8LS1iaUM
         MyjnfREWnC9mxr7d25OL9EcXMWPbUa3nAL/VcJk16nvAVrU2MsaJ3gO+1Quz1gHTTa7A
         PX2022GqjNfhDkWNjV181uKWon3Cf4ExeSNpQD+ecFb+2eS6YTlNlKxeWG1QK5mV7Ot1
         VvdWbGOPTMCELH4aMtxI3jkH/XHh6IJ+5CPoqVZAJwgqJnlxEhC8AGQmzBwNUpnhX7p9
         lblbXUAjOFKHggUzXcsIKNizbhWoaWaHoRkadPazAHqXc3GUI4NZf8VfKQppq3P7uSgS
         hKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771571048; x=1772175848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RWlFRvAAv3Ez0sCmmg14nrvJGE/f1SXTlqum7nZ6ROI=;
        b=BlYn0hWIrCL4klS4KblYQc5BJwPE5A33l997ZlXYy95Q7pz1rTBJUJ4/RBekCg6NZ2
         1+kKcaqWDSyrJCztrNVmGLqHzL/wJUzhNdvmNKjOrf2wsTljihY1tl+3GofEOUvhzOvu
         sIxUyiyZVSejMZBHp8FnvnynSMPmKj6Xi+FWwH23mK3N6TGAHiaFY/7HlH3vM+xs5ULD
         7NlpxiH24epVCitNcxKqz1jHw2AY5f8DoP/ANTJ7jvNrK3/NGkPdtbKHJUj5Of4As8HJ
         5MCeNO48chxfgHQPOgdZt8hC1jXn6dXKwhZAlUTxlgZIVLuOJ143/MWfvw1wc1uR8Ykm
         t1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+dsqTkzTJBtaBaYlMrpHs+UYakU2Kxh1Vy/CPpBUaeIoXGEX3cFwEmkPMj8U0ZsbVVBEjT8p7c+23TKCU@lists.linux.dev
X-Gm-Message-State: AOJu0YxzF8LgmD+nqDEHNKQ+oO11sAtOls9Br3sjUZFa+gbmkktdHVWn
	Y8gXs9Ty4u7YJ7kVSzB3LPl+GDd+z2uJoLctNjFfrbnFHAf7dVpFFuUTe7mC1dhCfJpObWyzL4C
	PV7o66UN+3Otdq3Py+cVr0FvfaMUsV7EFAHSu
X-Gm-Gg: AZuq6aL2IYAauWVuSqWkYv18MnEl2ilHJcF/NWrlfK/JmaeTvJT/Q/4oC4VHU6es7ul
	+i4o485zMASH9mHhUbu/zEr/7jZTEgtNhv2RniD18tfNFtovGfIHhvXzRNANffElt/xEPS1NXXz
	EB4t/0gvojXe8NnyfkFdiL5VQesXvin+4yV+ODWhkxl53pR96ThhxiQkcSX84i6GgItN+g3wfac
	eFzD8kDJk3J5VelXyTw6nF3ZDcuOJvHZ0230x4mh9xAfRIcJAWvsEZ2IEtujJxQjZZIY7fydeNj
	J2Uv760lze4=
X-Received: by 2002:a05:690c:6013:b0:796:3079:ac1 with SMTP id
 00721157ae682-79803af716cmr42124667b3.4.1771571048108; Thu, 19 Feb 2026
 23:04:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216161733.7704-1-mariyam.shahid135@gmail.com> <aZbGoaG30SE6Cv3F@stanley.mountain>
In-Reply-To: <aZbGoaG30SE6Cv3F@stanley.mountain>
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
Date: Fri, 20 Feb 2026 12:03:56 +0500
X-Gm-Features: AaiRm524BF0NSUDj1zC0L-3RFD5Ry6nHb-Me0hSIybkyCa8N_Q7tFD1TR1XiUTk
Message-ID: <CANhxO_hHUBi+Cs_mq7x0h-RVLdmujX1aDzatfap_9ExP1LCcPw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: use kzalloc_obj() instead of kzalloc()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 1:15=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Mon, Feb 16, 2026 at 09:17:33PM +0500, Mariyam Shahid wrote:
> > Replace kzalloc() using sizeof(*ptr) with kzalloc_obj() to improve
> > type safety. kzalloc_obj() ensures that the size allocated matches
> > the type of the pointer automatically, which prevents potential
> > mismatches if the pointer type is ever refactored.
> >
> > This change cleans up a checkpatch.pl warning:
> > "Prefer kzalloc_obj over kzalloc with sizeof"
> >
> > Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/stagin=
g/rtl8723bs/core/rtw_mlme.c
> > index 22dc36e8e38a..8cb9a760f763 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> > @@ -1954,7 +1954,7 @@ signed int rtw_set_key(struct adapter *adapter, s=
truct security_priv *psecurityp
> >       }
> >
> >       if (enqueue) {
> > -             pcmd =3D kzalloc(sizeof(*pcmd), GFP_KERNEL);
> > +             pcmd =3D kzalloc_obj(pcmd, GFP_KERNEL);
>
> This introduces a bug.  It should be kzalloc_obj(*pcmd with an asterisk.
> Also there are several other conversions which are possible in this
> file...
>
> regards,
> dan carpenter
>
Thank you for catching that! You're absolutely right. I=E2=80=99ll also go
through the rest of the file to address the other possible conversions
you mentioned and will send an updated patch (v3). Thanks for your
patience as I'm still getting the hang of the process!
regards,
Mariyam
