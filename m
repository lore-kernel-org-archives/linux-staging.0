Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD4A8F49
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182900; cv=pass; b=CiUlsDrEAerCapuoSFOD8Uz/w6bW3xvIQo0r5pNSKcB2e0GEAgTFpsSn98UhBxs5vUF3oat2FaP9xZEpkNJdbTK0HfA+IIE3vibWJhvQka+iA1QECgJMhBYOjJULSA2x4GzX+Li2RZAveNnNZpnH5JyOj7ht7KXA4B4r1yva1q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182900; c=relaxed/simple;
	bh=MKEPSKp31UJJn9LIpxBDy8i8UoGzEv3xE4+G5rOt/BQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aO6Z9G4w6F4r1LJ79wAPYFoxpykYQL5wmOjVBAipM+0ndaMIKNI+GJgaaLVeaAQSVYJmj+1T2spWtzuKPzmuStQl34hyWICWV8lO5azqgpTTP1PoV5TPUW6lYEpxfKIRo6wW9bSQUgMuSqb8RhWKO0rdv5SbK3RJs+rkEf7PMe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUyF5vU9; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUyF5vU9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9910707d82so720967666b.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776182897; cv=none;
        d=google.com; s=arc-20240605;
        b=G3vlo0/n3/VIYTy4A35Be+r/e3L2CuWS52lKeuy+im4qRwtgKlLVnB0T4OJeHi0Gf9
         KMFZt1wZfgBFSXAgmbgnUSvqz5fFoIFUKtWr5TH33WI/rFWliexzpchuKP+IKMyVdwU0
         YB7k5JIxH+vUquIW1mRLw62edJR+tsnBHuK7I94sndXnL2G3CPptbIolVczEvw21jPXy
         A3jl8K0FmuUfkQV35LkLyjxPfGS6BUlIGFOjJSePN58Lezsg2S0zvf4B0w3R+hHkhnmV
         8B7eyTTSG4/wmsYBZ1KcuvrMTpIgEl3cONL9IsN4JYtfqknvlnSqeWcpt6FyHA4W67sD
         DMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DSyaa7otznLDC6136fJbs2gWSsqGiiFRwjaXk2ydzGA=;
        fh=NxqRJ/xzohjqYkxbWXK5yACXZTqN8O7jS5+tmTceVY0=;
        b=YsjKabzeReubtn6d0RQma0zNm9N6gn9y0E72N0qolH2G/I34FXVaFL/BAqE8rmJKUO
         +SIRn2HSGiL2fsR4mJyW0jO/LGnI8vA9NbPIR3KymNSIECp4uE2xZEyZELS1/8amIa14
         mDbsTuqmfSNjXTD2MUSIKJ5kfv0AG1eqcGSSSv4GqFCpn+wqWNJyp9SLvrwlOWx0Lb4k
         ySIU7fBhn+lcs6cW5YvwE7WaNLoR7znBXQ50hxqfmg5j87LjOiCsxhTAoMhosYlHTQxl
         y5oP9VXJz/DpVlTDmbYsSa1dGcHlatst5e49g0YkZLt73va1f2QpxRdEUTr4ovCFlJaA
         JpmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776182897; x=1776787697; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSyaa7otznLDC6136fJbs2gWSsqGiiFRwjaXk2ydzGA=;
        b=aUyF5vU9+lWOA2GGlY05GXQWqGqwGcdegKKS0IIebspaz5RK/k/BUfY/+S/JdofJo6
         rxF5YDyLDzNdN13EsCsg4j/H4DVmJv/94o2a4IvY927I9VR3tzRJO2gg4G0gAA529K5p
         1hA3ZYdjfORXpIQPLQlhcDyyUUeB/R3qgPmswWd16kVtjkGhc8uuuLeOJBQXScHDeSZO
         RsZeokk3WhEVIaImUuDL/QixCmsuRgrtywWRpiimx+596CRARrOKXM/kXgn1IxdVbj7T
         GSXMfHyz5UwdVloWK55eYUhjeksmE+cOWWheKf1CKE/lRGIPJ0qXZkU5j5sluMRbe2m1
         mONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182897; x=1776787697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DSyaa7otznLDC6136fJbs2gWSsqGiiFRwjaXk2ydzGA=;
        b=sNl3Ay52NSSdgLOsaXCuMeGcyHPGO3fCf0UHKmQ3JZi800Tqra3MA8KlF6PG52GDVk
         PREI3VH7y0FErWUHcoIP/co6vOodbSPDWtmQ0ZLnBAGTokwBC/sdEr9w9EhTGuMW/uNV
         731rilFa0mINZacKLnuNUF35Qs8c/MEk5kg5+gUSwLmLmrf1BqpjgQo4I1cyQKygpaMy
         JMq4G6Gf8xoUT2AGfM2eL+Ha6txS8XbqX4v+HwR+NcfhhAazhFTmZhpfVNhEFKURazBb
         bZqXgOlV9ZBL/Snk3OdfVSwdxWNlB+BcTROTEr0jVNy8erBpcH2nh/GRdz4bccPMd9Ze
         THbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NDY4k15KIndasJoCkHpeS+KUECBcgoJP93qykymj30IVqL9xLtjD39NZ5dS2i38TIp22z/POaS73G8riv@lists.linux.dev
X-Gm-Message-State: AOJu0YwD6jbPfnsOSDA6LBsl4P9H6E7fzlpToDPWGRflq5S1ooUfXjhU
	G9Zm04M+6iSMc5UhTDsEympxLiz20rkTFNTJpCjgL1WpWb5Ct6zmDNQ41JUP6m8SuJf8WBHA+co
	s4FMfMWaN1Uu6NsbEEphsJKDGXiF01tQ=
X-Gm-Gg: AeBDietB3o/ZYEgH4UfA6g2fUh75LUIRL0h9k6WXKMAcJV1HNPNgBERDkQt3ra7Wxw5
	AMaXhyQAc7UYLVgwYoxM7F/rqQmce29ZwqUivdZULXAb71jJSn46ul+VqWKTM95cRStrFaUynzv
	mvGgVmc1g2R+0iCAkL+AkNYYnDMbHjNfe0o50Lgeza0GX8Z19R9xI6lCf3WuSABlqUw3d6ESNbK
	5wvSCe18TQ6tOOyFOCNpJydGSHQa2h59aH4zfjE9Tf2eeXBSaPXsEym1eC59cGheNjurmHdv+Qf
	9BQF
X-Received: by 2002:a17:907:788:b0:b9b:5164:906b with SMTP id
 a640c23a62f3a-b9d7277c894mr943077066b.6.1776182896920; Tue, 14 Apr 2026
 09:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260414095833.76480-1-regpacy@gmail.com>
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
From: regpac youtube <regpacy@gmail.com>
Date: Tue, 14 Apr 2026 19:08:05 +0300
X-Gm-Features: AQROBzAdC2T0BcvCX30mpWonvI8h9QMO8jqKvNRdlk7DkF0he2z9_jKXGU7gCCc
Message-ID: <CANCV364axU8F-PvcmS7gbnyQZkfWzdKeeTkuwrQnk3ypaiaHCw@mail.gmail.com>
Subject: Re: [PATCH 0/9] staging: rtl8723bs: coding style cleanup in hal_com.c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Ethan Tidmore <ethantidmore06@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please disregard this series. I'll resend a cleaner version addressing
the feedback from Andy. Thanks, Marc

=D0=B2=D1=82, 14 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 12:58, Mar=
c Finkelbaum <regpacy@gmail.com>:
>
> This series cleans up checkpatch --strict warnings in
> drivers/staging/rtl8723bs/hal/hal_com.c. All changes are purely
> cosmetic; the compiled .text section is byte-identical before
> and after the series (verified with objdump -d).
>
> Marc Finkelbaum (9):
>   staging: rtl8723bs: remove extra blank lines
>   staging: rtl8723bs: fix space-before-tab whitespace
>   staging: rtl8723bs: fix block comment alignment
>   staging: rtl8723bs: add spaces around binary operators
>   staging: rtl8723bs: add space before inline block comments
>   staging: rtl8723bs: fix Yoda conditions and =3D=3D false comparisons
>   staging: rtl8723bs: reformat multi-line function signatures
>   staging: rtl8723bs: reformat switch-case blocks with braced bodies
>   staging: rtl8723bs: wrap long lines and fix argument alignment
>
>  drivers/staging/rtl8723bs/hal/hal_com.c | 296 ++++++++++++------------
>  1 file changed, 146 insertions(+), 150 deletions(-)
>
> --
> 2.53.0
