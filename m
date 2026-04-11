Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1926ED3A
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918550; cv=none; b=LBXgfOGrTr/s+w+EJEuFl8k+T/i5lc2Ahzu9sUFK9ev7DBK0NYmmyDRFtRWsF26Ico+4MytYRsJFc+BxSoSdVdQV1IiST/0tf2RrmFHkH/zMciLISfSleknHE6xUF26Oi0gg8Wy9slz5JSuD6uFvP/jX3J+61BSj4BGDy+OFgFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918550; c=relaxed/simple;
	bh=2ICVKZ3NpG3PCtlyO0uDpJGbGb04mqRHQYElJUW5dw0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXbSvJ1YbM+ec6nu31z4M/HeQ6NFNGKXgFmXBXzNNC9s5j0sP1IMPw/kceXRzk40pBN13pXT5FoOViS2Y+guLte6aFVCCuIJO0XQHf5lmwe8AcxOWne+L2BEebSZYd44X6hqWbbpJBGd4G6MaFyjz8Ae9bFFGuKFazxau4N4h2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFAixd82; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFAixd82"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so1861640f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 07:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775918546; x=1776523346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwDHubDvF2ta0bIvciw+Il/NoP/+nau6OfQepCZXqzI=;
        b=JFAixd82jxVJ7O0+AKd4skKv5QRyGeG+776BRHSJ1d4SLks9CHPFrQKTUF0ibICs1s
         qoE86HrVpfmrGBxc5HmbWzjG776KxAvcugS1R4dCIFecE5IuXrbeOdm6WsuuvDGO2s/O
         mvhgXo/aykl8zK9vS/rcplzNDSVR+SXiwpYEHtxAFnguVYLDa7D+Bb8T8uH2ipXlFgOX
         jkxUPY7X8Z8X8siz7bVxhaLKHoINEa85+WCA9Aoca0lljAuuGoLsMxbL+R9PS+TFj9Yb
         MI88f8wAJITO4zlCTdFPrly41S8wbSXMrvV18EEhlT/l6vUiUMhwolKgrispaNSVJuB7
         N5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775918546; x=1776523346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wwDHubDvF2ta0bIvciw+Il/NoP/+nau6OfQepCZXqzI=;
        b=j27VK3ssaI+7Fp7HsytEb3+aHycvxAN9JDTaKrXdBWWe2Ot89ISBqArk/pmzpLAmhN
         RVd3iZAMAnfG0UB7dwgHApiYo/ODLZzRMxQ3eFLW8AUA72owblbI42/XxdCRvmo9Ld/6
         dF9MyuiKn6pIkAMqFhcMdWvBtPeSfU4SiQhq4UifNz5eJ7/dtcFOEYzPbY4IN1FLr+x1
         T5dX1z8leBFLEn/Wxdo9qmXlBDXai+7Z32eU840TCUJyjBasj8hEFMVsN4/sUNnXdB6z
         fJFELazvCsKi3lLJijzw7swPk3ykVNzu/icVnKEe6rzuvxydoSfSb4tVHB52GYblH89/
         nb5g==
X-Forwarded-Encrypted: i=1; AJvYcCXGSb2eks2Rw8oKDLP9DI76QuaWZDUbxK8+4KRT8uN09TnRJjm9yvYoKgZ8AhM+CT39uJm6O4ESJhuOUZ2r@lists.linux.dev
X-Gm-Message-State: AOJu0YyIUqQilLqXdTp/Cr8fT1qq3VGrf1/3jWBBd5+3/YbFZ5QIhz+V
	xWqKkxFMqOZbGSHNc2KXQ1DAy2lrNwKssKB3RJvoE1/Wb66vya2lu8Or
X-Gm-Gg: AeBDiet50joEkl/vF03RH8nYXXSRii47bbeUmXYQjDrMXvvRk6rVTus6wHSStE498Q+
	idZPoJUnRO87CIdFJBmJ+0MOMzCbfwnxXAKpVuNI1AQVXGF2JyNY8EOaxyKTpTl5dtkiIz935Tm
	MoySvZ+KoNsrJAG7DQYhpC3kQB0Q2wXdBqqjVdkahN625shE4nU+gyeMHXk1KZ0srLpL9k+gWtU
	FMX8efAA3ylmF13wosGby/sve91IpjTzTVLBlp0RWRpYtudqXNZ6mOhlm3XoaD5p4QDIa77IvTD
	ZDa6emg1OgGaqXkwAjrRXDXszVP9OJzl8xS8CxPNA/cu9yOEzLa1vSlj2/zuipAXVaKB2oEWgLJ
	2U+sdrHOCJUQxLoyiFkHU2zPgdMJ3lvayjmA1WraaynUXSx9gF26O93n6xyNaEgVCTUk74B4z2I
	6CqFuT1XaHQSCtPAosMhlKjJpmN7sDZYjTCrX4ibAA37M4/vXoh5fW0NOaUcZb3542
X-Received: by 2002:a05:6000:4284:b0:43b:9aaa:52db with SMTP id ffacd0b85a97d-43d6497b463mr11027497f8f.19.1775918545737;
        Sat, 11 Apr 2026 07:42:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6ffd3880sm648412f8f.7.2026.04.11.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:42:25 -0700 (PDT)
Date: Sat, 11 Apr 2026 15:42:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Michael Ugrin <mugrinphoto@gmail.com>, hansg@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
 gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs
 instead of spaces
Message-ID: <20260411154223.3091eb45@pumpkin>
In-Reply-To: <adont11Sr92pi0_N@stanley.mountain>
References: <20260411005512.46142-1-mugrinphoto@gmail.com>
	<adont11Sr92pi0_N@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Apr 2026 13:51:35 +0300
Dan Carpenter <error27@gmail.com> wrote:

> On Fri, Apr 10, 2026 at 05:55:12PM -0700, Michael Ugrin wrote:
> > Fix whitespace issue where a continuation line used spaces
> > instead of tabs for indentation.
> >=20
> > Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
> > ---
> >  .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css=
_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug=
.c
> > index b411ca2f415e0..966d4efb200c5 100644
> > --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> > +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> > @@ -1257,7 +1257,7 @@ ia_css_debug_pipe_graph_dump_stage(
> >  					p--;
> >  				/* Last comma found, copy till that comma */
> >  				strscpy(enable_info1, ei,
> > -                                        p > sizeof(enable_info1) ? siz=
eof(enable_info1) : p);
> > +					p > sizeof(enable_info1) ? sizeof(enable_info1) : p); =20
>=20
> Better to use:
>=20
> 	strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));
>=20
> Same for the other strscpy() calls as well.

Or refactor that code so it doesn't use 600+ bytes of stack and
lots of scanning of long strings.

=46rom a quick scan it seems to be generating a string of xxx,yyy, with the '=
,'
replaced by '\n' to avoid anything longer than 25 characters and at most th=
ree lines.
I'm sure you could write and use a function that lets you have a lot of lin=
es like:
	offset =3D add_flag(info, offset, bi->enable.reduced_pipe, "rp");

Oh, and none of your char_enable_info[] arrays are guaranteed to
be aligned either.
So all the snprint and strscpy calls into different buffers are pointless.

	David

>=20
> regards,
> dan carpenter
>=20
>=20

