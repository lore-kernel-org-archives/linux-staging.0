Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA1B1990CD;
	Tue,  8 Apr 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104175; cv=none; b=Ms+s9On8hRBm/k+I18q7AyIiIid8vkJCe8luBrykH80NfVTvA3i8yNlRFJ/M9zOekuKu3oZNxjHF6o6u2abfQRFg9bGPS3IypAfrjBNvMz4B+GorgORGl9HoFtlggEV372/fgDU4yG4rGCotTZIiTE2QudK2hZRDcRLnMNz9+8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104175; c=relaxed/simple;
	bh=/M7kO/AN0DirQE8MCvfxa2LHwD+GEtyiWtNwq5y8tYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G54P++DR7+iXebSfnWhCvqypd+pq10DtZ6dyTBKj4TfztvQQV/eJo/Vz7Xz2SV/qqSsSd04t3Tb3F1lBjMvlb16BG2aDUPSpDbnX+Tj1POY2K8c88wPcgeQwJHvsWHgvjaD73J6CkPGvPZmWnQ6v1A+/ETvd4EhFmPPsJ0f0pv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuG4OCrL; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuG4OCrL"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51eb18130f9so2848232e0c.3;
        Tue, 08 Apr 2025 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744104173; x=1744708973; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQJxu0CgY3ztGh+KGz1XEllD5aCbm4Ec5wR9oKzfzj8=;
        b=NuG4OCrLRAJ1x9JCDY7cHUydnxK3yTmo8Yibr7pguLv8/UBfaUPoPpBo+lxQRrvXG0
         QX6NoHtTkCAHfsQPewOSMisDm7ROQ4uxTZ9Qffwe24lkhGR/6biUy7XR/6p0aAdcbfJS
         zo4rpZFVXL3HBoUVDCjZm/G4/xwNvBPGb8US/7em8uW/zFbdUoaksj9/4Vzj6IXyr5cd
         cohHBqwI319FkgPROIJQsCr/+IjHvt49KyOfv85tkn776JO4tkv0BODxFWZbvYYb5w0b
         tXxV2zYevvSOf6Yliy6XDST9kn7uQOfkk6RoMSHOhBpVJf4z5h/JM5qYzlfPTMQCWYCr
         pS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104173; x=1744708973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQJxu0CgY3ztGh+KGz1XEllD5aCbm4Ec5wR9oKzfzj8=;
        b=GRG6LXyU1zNFIeCPgES4nQpHkalfwXFy6SBIgALtDNVlOUD77wsC14U3haxSLcFzaO
         QVnFBPeumJhTNCOuDb+7UGP1RoyhZEXDT6dN0cOd2U4zSoUkFVVlpY+TPPAgIVjhENfE
         xQ4jYjXASLhzKjIVgNimOhJRxsQoAhm9f3nY0OC9lGoDIr39pqdOb5+UdxVMDO3ia7za
         ENphl7T0qBudFpjQm9ZSeBVpQ/DeTFgATiyB1vi6WX2uzjolomnpd3kDyFWM63IcnEqz
         t05246JMjg7v2ujpC+yr1woZepyyNq6eJ2KYuQ92t5CPTWyEP3mGmk7E4SqO4gwOA2Bl
         +c5g==
X-Forwarded-Encrypted: i=1; AJvYcCXr3aP7Mbiv7CJXE277DCISj/0euKIvzHN5uV6ZWzkKRHVsQ2nzfnXsQ2BahTdnogGrgqgtpd0QG3ofuyZ4@lists.linux.dev
X-Gm-Message-State: AOJu0YyPZm4XsW2QIrJ7SpVKK0YMsQMWPh3erPshrtgpafLW1HNM+KC0
	t3L9+igvlmEUSTGWx05LPnik9kfEmSNVv+p4TXSo86Vp/oPSm3f+v9TI+p8yJutOHPDG9qFNG+o
	o2IoSx813bggH1VLvgRNiHWHbjvN6Zk3S
X-Gm-Gg: ASbGncswCF7/8vXZjIFRbj5eP3S5+mLomEGip5eyFJZip/NGCbPCnYp6NJeJFcC48k6
	yUgei+ExJ4drjS+q4aOW0CrnabInEha4D8TLXxeEDbSnzfCxbVlY8bT4z5xXqrd3PB3dXGWn86q
	nK7VZvwcDCTDB3PR7RSzRnBykalyA=
X-Google-Smtp-Source: AGHT+IFqm7trkHxsW9aThI6ptC3yUFdyXutxAMPMGPBTlY31LBfZp0Y12C6f0vwYqJkOnUOQsHoXmwZRHrcKeAih2cI=
X-Received: by 2002:a05:6122:6585:b0:520:51a4:b84f with SMTP id
 71dfb90a1353d-5276444fe9cmr12081257e0c.4.1744104173131; Tue, 08 Apr 2025
 02:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
In-Reply-To: <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 10:22:44 +0100
X-Gm-Features: ATxdqUHWCJobI7lIeUJ-4_4hJAPdZTYS5oHhQSwcsK_KLFX4CDP6067roMe28Hs
Message-ID: <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around binary operators
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:20=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > The code contains no spaces around binary operators making it
> > hard to read. This also doesn't adhere to Linux kernel coding
> > style.
> >
> > Add white spaces around the binary operators to increase readability
> > and endure adherence to Linux kernel coding styles.
>
> ...
>
> > -                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > +                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (tx_seq + 1) & 0xfff;
>
> > -                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> > +                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (pattrib->seqnum + 1) & 0xfff;
>
> You mentioned Linux coding style, which also requires lines not to be
> so long. These lines are. That's why a few versions ago I suggested
> you to change these to be two lines each. I don't know how many times
> to repeat this (it's third one).

Okay, sorry
I will add a third patch for a line break before the patch for %
operations since each patch should handle a single thing.

Thanks.
