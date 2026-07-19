Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2336B2DEA74
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784480610; cv=pass; b=AHx3896XQimfq7PkS9/okwACNT90OC6AMrIFxeQ8uJJY7BiTLu96y4UWQ45xsnz+dO43MfQU7MOQb6CjWAyKwiBWyqNps18WvCv9UD/hHF3aOQEfMGzC/pOm7t82Lq9uH9YClKsp/RrHlGj665B1mSQ+xO5K4Dt2PcAOjNnpX8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784480610; c=relaxed/simple;
	bh=ANp7PPmMRrR0l2lXvT6AtGIpPbJaupD5ByxcvvFolwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHJwLVqi8S/NGGF01i0TuoFj1N4/tc8Gf65jx8Y8Je0U2qmp4c8r7630WAcZpyOFGBT4bTIPYQh2RgzCcV5ThYF0daefEkUjdGwXkCdYheerJPplI7f9U2qJrq1t6h4D6K8Z2XCKaj2LLeSGFsvd8RIrzpYtU/qbeYHaVBZoJmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGe0V05/; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGe0V05/"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so1086412266b.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 10:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784480607; cv=none;
        d=google.com; s=arc-20260327;
        b=U3hOVFbwfff81Cm8BOw7xvZfIcYJtaEAMsDKWfW3HHwhOzwIIk0wmJ+BanX6bYoiNy
         EUTZ+Q8xpcz8w+/z/HuCMDSN2LIhhdvjnKvajaeh5JQDL+Y1ek3PPsWlqRUBxKNZ9l/Z
         3ZvySZY7cGYCb0bmqTYEAAsdHB+s6QNFKhO3Pmeu73LnRqRcsRnYZypd90n8XeZ7Cfsb
         cMwSoyuA0EQlaIdoHlU5+DEgw/XD46eKnpc7iM0fOb2lCRQoPeiz/m1KZuZYPH5NOFd3
         Pbt4mk472lBmvVUtYAbOGlcz1hkpcn85HCQxQcgIw6QX0C0LKxLggeMvPDR91d5CzxvB
         0Dcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ANp7PPmMRrR0l2lXvT6AtGIpPbJaupD5ByxcvvFolwo=;
        fh=dygd4O2dw6V70a6fRI5lZwKJ6F5pxdylUh/a5qgjnWI=;
        b=OwviP2PnYArJqqnq4UFgNo2WqIvPPiQZVVdpQiMbUHPu14M1xwp4Q5asBYYI/m4DAC
         RmEwiJroFwcjdF6w+QFz2Sjp4Y4C5CccCw9RdU4kkT/PSdsdMC+JiWGFbVj2Wd+bAm0j
         OGeYvFEY0OQdB2NW7Ht9hzkMxFTiy3PJRGT/cqYt0cAgARo5CwGk/Go7LWnbssNKugN3
         uZbmMlfpI2eAMch0igmy1gciWQhhUnCOALgx6XkZfnLFG+pR9pie77VmsoihkBr3M7u1
         yqxIxT8qAQwxpq/lTfDZ0k5Ar51i4HY47LFuVRiCjSQjdrRk4jvddOkGz73Rpm21BXDC
         Ze0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784480607; x=1785085407; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ANp7PPmMRrR0l2lXvT6AtGIpPbJaupD5ByxcvvFolwo=;
        b=LGe0V05/ybdif5a+UKhvJNMNP+/DGjZKuAwXCPtrLSIQ9yTkCBLU3IkIJTatrFfbLV
         i9ClR5NGBAx8p6x/l1gvCNfHS/K8cX4KBUi2rFsPI5WbxSFYLCDx8tMUfBykrwV/WJjU
         FzGmPresHHTzERiO7tzNgrTbMErqqvbkO1P4sTt1pMfDl2Zk0ymEcv7sxDB6YD42oIMG
         HtZ2eEJ/hKIPFHyZm65yrjiNoAscPYa55KPKiGb9E5qPd4OPMc57BR++KiTezcTkipYo
         bQnpuLVKZc0/p/hRsoYd4oAkQNxHbu3E6/EVL29ZVvnOE7CqhBuy0R9A76v9NrlRJ8kJ
         yPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784480607; x=1785085407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANp7PPmMRrR0l2lXvT6AtGIpPbJaupD5ByxcvvFolwo=;
        b=DD17GJBWP2bsvrizd9V4vFi+WW28CUXB0AaFR4Od4NsTZavPNjAyCEmLGLsyvChUPs
         vuMUF9l6y6Vz5G7VtVMqIovmFUBGbujKH0co+DrEMkhjxNZi6IpLLcNpjJoJdLiNeGto
         /EBGO4V9O6ktT3CjHIQVFt5quPA8iHByMBxmUqjD4V3IzDGHZdnUyy6xJcktNamttUJ9
         oIflt2BCfNPZPRIMjJfOzNdY90435Ur9GdmargaY+FvndrdTTiG7VYF7yL6B/+gZLhad
         ZRZXO1I4KZg7i3lW60H5VZGYLt/OaXcLDpy16d/zV9CSCXSwt5cIRP71XjDcxGOZbncN
         yyKA==
X-Forwarded-Encrypted: i=1; AHgh+RofCXS7OUSOQYcClSJ0+S1VZ7143F/k8UEGtPEd0dlMvgciylxWV30573SHahT0D/dmP3IJ/oJ0TPrleDjm@lists.linux.dev
X-Gm-Message-State: AOJu0YxVaF9kiWrn6A7W35mnqVnPJ9wE3RR0i1c6OLybd/LPWYR7H2Jo
	K8/CpqjsBiE6yYRp1lOvsTKAGx1fVa+qhvc6jTzXXsW9Ukh1uY84iEAr7zR8plhY3OhenTbyD+J
	47FCwrbSZUN68AXAqHTMQVmE6x0kbTYM=
X-Gm-Gg: AfdE7clvRZ8f5MeUqlpNwszZ1q2pCED26CFs74dEWXBGhhPXIswbRRa0QlR+P5fFu6y
	9OWn9HyAUakQUQMpzYibTMyFAUa+pRv6qWUiLQUSRLe5f1P/rfY1/8hwrKvA+8t5EiM8LGdevzJ
	cklMTQfiDcfqr0354sU55vhkxXZhocw7GO+gi4nVL4+DLZRoWFMEIhJ8bHhumfl0KiOm31tjdpZ
	BfFU7w1R45PgBxMxYUGg6YF/+Ph0uijE6HSXAy5390oyWWg29a2cGNxBGZflPNPpzRtYGrF697z
	Ng5VLWsCK+++k1H9yPTl47FZRnV+uVVeiQ4ZWcvEWE/k8qnVrh6P7piE21hQnOrGX57hZmu4cuB
	Xu6ZSXikbEGyBe2Xjwb8gROYEDCm2MC/FCLVYNsR7gWi/Kg0=
X-Received: by 2002:a17:906:ee8a:b0:bfe:ed06:5a20 with SMTP id
 a640c23a62f3a-c16b4837dd2mr443400866b.53.1784480607046; Sun, 19 Jul 2026
 10:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
In-Reply-To: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jul 2026 20:02:50 +0300
X-Gm-Features: AUfX_mxeC0PSIwp9DOcNdOO_SI5VqtRiTxXWWMp7U8PMgTACrkQKKglYlh7n7FE
Message-ID: <CAHp75Vf+3pBU1Sfy7Cutp0qgTucQ+Qntnns7fAiWHM5=H+fo_Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: media: atomisp: Clean up unnecessary module parameters
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 5:09=E2=80=AFPM Prajval Chaudhary
<prajvalchaudhari733@gmail.com> wrote:
>
> This patch series addresses the 'Remove unnecessary/unwanted module
> parameters' task listed in the atomisp driver's TODO file.
>
> The first patch removes the unused debug parameters along with the
> user-facing pad_w and pad_h parameters to safeguard hardware padding
> boundaries. The second patch converts the remaining internal usages
> of pad_w and pad_h to const configurations to enable compiler
> optimizations and enforce type safety.

I understand your eagerness to achieve something with this driver.
Unfortunately this driver is not that easy. If you really want to
continue with it, please buy or lend some cheap Bay Trail or Cherry
Trail tablet with a camera connected to the SH IP.

--=20
With Best Regards,
Andy Shevchenko
