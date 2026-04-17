Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04C23AD53E
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437170; cv=pass; b=OT4ZFp/JmpCknffPstBJNyf5XgIrOGG2PM4+6mQAJ9vBpL4Y1ezoEPYzWLrZVT12Ic+VJnWzuh1luA+84zYqYiBOv8V01AOOyYBtq7TYrUkdp5ItGqvWrR+bJPA8Ji8dOUmpCBplgMRgWaF0dvzTz8Gp/YMsUbHX0LKNnp4yep4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437170; c=relaxed/simple;
	bh=nqmFv4kJsR3J2aeOVpvpDPnV1MGIn0Sla0J0a4RiMvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/dU37nQu0H2DSnLjfRMZaOqBf+VZFtUgRapaJqR+pTyGYiRv8oFHCnShGMdfCmEsgEkgWeA4mO5dRUvdIvwpMe5E8ZByDQXaeIfxlvZK96HR/xMQRbXseZ/lTZHYVHPL/jmfxUY+hYlOkLGgxTV/5ourQQI8IN6X/zlStzWLCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIDJx4HM; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIDJx4HM"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65005a8840dso754646d50.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 07:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776437169; cv=none;
        d=google.com; s=arc-20240605;
        b=Q1iHVjiNZw4xen/2sVRVCyIutzjQSI05AzgZgbXeeaS+rr1RKZyn8ZWCv7vhzhhc8C
         ct7D+QFg3ELAhgJMIDC0r4lXtlau5FDo+kOYf3dKENl9H5kuwqpkOfCc3YjkRsH5Qts8
         ShEyM52Yxohy4flsqXkjnbsYLCUvSDoNtoxd6Of7N/Q1L4gRFzro8aFw1D9ATQRc2Z4j
         nl2MB41VRDcOi/UvmTMdsDmntuXdg4YyRVUYeEorG9HWiBrdF3gwejkaj0IstBxhT0gv
         ksTS/yJB4lyD2syhg6aCqWGe0cscBBOOU7rFU0zAOIUZivDBUekK/xSlhgGeEgOZBn0e
         n+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cNahY4MiwxVqosOPD1r6Ht6ChWD1OybSoX+8ojWb8eU=;
        fh=6edoyVrr6Vg9+wteV76J+Tr0rPuLNcOTvmGxr8MGN6I=;
        b=bT+pdSgkyOhP6gnhquXsl2v2/AakIVETb6qi6PbUCGStc0CGHV3KAkWORDXDXQaR/X
         q/ZTBHcbSJBFMLLD1GeUHcwqv5im+PA9H26IU1TZW8X/mw0E8kHtzVOg7nVmsfo8ofsB
         oWj/jleHmiDWEd4h+cbl6dvU7wtejO4hgvg0gzvQvDcX786OnBm/1s0N3ch6JHl2+AV/
         oj1MuAnSNRfm8cHv3/9HMdYDpfUrSam+eeqtuMpUE2Va7AuK/kEZc8q7oiO1cfhu44Xv
         Gmr9+NGjUBLJnWYFHdHup49bmtGz2cZP5jn8iyS3kKCNPb/rnD47mJT06UlIyKvBfLci
         /e9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776437169; x=1777041969; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNahY4MiwxVqosOPD1r6Ht6ChWD1OybSoX+8ojWb8eU=;
        b=nIDJx4HM+mIpDcObmnU2NU23cY3QmlUOM23IVl149NpUdz4eREFNijD8eq06GbMrm2
         BkwQzvTq0j7eJ0+tAw7uipvTIjao27C6QCjI4HLUJcUGue+XvksOnwsbGb2UtWbyPAB6
         T40YPYcZVAqSQyTqTmOmWJQ5++KMjC7PDZqJ8P7kIMiZvSH80RT6dQ5FcB5EIbgfZSLZ
         DBvsa+xLpR7BERwxP/rg5iY20giNpMHkIZgc1pZGSHLo4o/Err0mYC1joxsA/UVe+WXf
         bmZiqIfcL1QfECjCk5BWc0nhhO250xhSwZ+6S+G/gmrxHaADSbpAR0nILhDZfdrHedBR
         BoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776437169; x=1777041969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNahY4MiwxVqosOPD1r6Ht6ChWD1OybSoX+8ojWb8eU=;
        b=H7JGBg7dKwwuAlJVhGO9O9+TVld6e01RH9go/JZLmwPz+jj/iuOETfvOj97WrxwVdd
         7DzH2dAZHYjta2CLznjpb/ahUyMy5gJhQWgph2CI1zU/KPMpwo/pU1n0I1wDhihwlH1U
         oimjKJCFfl7MC0X5Odlzds3T2LFLUpMFPzg5LWMvCYdWlCVxy/sQU4TVRVBOH8JHvj8f
         jn2Azl0XND6491FOLc9IovO3iTkX/fnQPUrsniBK1aQi5E5+LB0oAP1HrxCPkld11c9G
         yVPoDGTXuekqTdG8FMpgcz8EAept9nkqz69GBeuHWO42oZ2SyhN8poLccDrISMRR2mYN
         fkVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lDsLTYOGj7gVGXKgWuEw055IPWKrQ/t/dM/EQux77eUbbYV99+WUEQp1nq4tcFvI7M6RGqzW17d7Wh392@lists.linux.dev
X-Gm-Message-State: AOJu0YzNl3G1jxLf0+qtnyMgcYd7/7aNQ5FZxEvqZ+2NT3JIVUEe2cAP
	crxTxkJIdwEke+/3m5aXWJC7z7e3yfh33PW652n+LPSigneel2D84Rl3j1sNWnR3UyHaMrEgMwz
	pmFNTLhSZ4z0WCaoLjnJPuRh6RKegJ6g=
X-Gm-Gg: AeBDietZMafpt4+9w5NoDnt25+M80lqcEQicaFQaSzSXvMktOwhQFNyAwThsS7n3r1D
	roBvOvZM5HcnZbk9x5U7Tg3MsHMSzvkS4p1GMniUr/YaSi/sTJ/8V/kSo7AfVbWD1iCigGL1Ffw
	HbgX9vFKl6/GTD/Zjd5Q0GZ310o/HTEV2qiJHKbOUe3JtHaEnfI0aZZBixqZFYi+AXXU2J1WA6j
	zATpqIZWVAS7oUzLSYcVSKpCQZyy7DauTYZ/Qvc3GAmDYkPk9Zzf/hknJPg1uEAew8u4mpHVwSm
	rSymxogjWYhBr8sguoUs
X-Received: by 2002:a05:690e:4802:b0:651:c39b:b497 with SMTP id
 956f58d0204a3-653107f6464mr2123646d50.4.1776437168363; Fri, 17 Apr 2026
 07:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260417023602.112359-1-m32285159@gmail.com> <aeI9ZDPoP0apY92N@stanley.mountain>
In-Reply-To: <aeI9ZDPoP0apY92N@stanley.mountain>
From: Maxwell Doose <m32285159@gmail.com>
Date: Fri, 17 Apr 2026 09:45:56 -0500
X-Gm-Features: AQROBzD39EPbUfww4XoeUzc48s7f2OZh1t5AB_xmMPma3dfpJGLEo5d5iY1VXS8
Message-ID: <CAKqfh0Egdye9BTi=DyUMEGHjGdCxh+rpry4++U3PPVu+LF=Tyw@mail.gmail.com>
Subject: Re: [PATCH] mips: cavium-octeon: remove cmd queue state and related typedefs
To: Dan Carpenter <error27@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 9:02=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> Generally, outside of staging, you just go along with whatever the
> original author wanted.  They did the work after all, so they get to
> decide.

Sorry about that, still figuring out the workflow. I agree, the way they
did this is...interesting, to say the least, but if I try this again I'll d=
rop
the extern move.

> This patch removes the declaration in __cvmx_cmd_queue_state_ptr() but
> leaves it in __cvmx_cmd_queue_get_state().  We definitely can't do that.
> And we can't mix this in with a remove typedefs patch.

Thanks for pointing that out, I must've missed it. If I try again I'll
fix it but given that this is mips and this stuff is usually for staging,
it's going to be unlikely unless a maintainer wants it.

thanks,
maxwell
