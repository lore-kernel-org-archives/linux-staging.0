Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793480417;
	b=pBirKdha31fUKnG0fmyLzzv904jC//oFoNIXzrbMMABrjbrwaoSGwbA+X/3pUGX+JMAD
	 p++TUHk3/Uj4lrrXkoFNgPhKTI2Or7d49bSEFcDvqJhfr9BIoRQ0uLd/ksq4sZQv+jbNw
	 wEoAcjMELdmBCBez7cWD7/sB1sAkTAWp4YJWARemHwYMIylEoD1EYzHt3g5AYFuQUnLNz
	 yEpuYtJb8uLL/CUqAu5zZjAzsJIR3KsOca92YGOjo836sNxSjjW0208HrVKZc4pg4i5FT
	 XXANtGgosYSCaKoRAv/Q2dSf257HEggL6PVe6HgudwROPCXQBn/I/opP04dv2rItbeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=y6zIttahEIdYZS9kXDinaAVVA8SQ2nKlICPEN84ZtGw=;
	b=K/8VpbIalxYHorbAAa5Htcp61g4wJ3m4qWx8TJLtYTaXBUy3sXb1IfiNs3VdgXYQ7h12
	 G1SAXCBq8W1tNEmhSxONcp1sq2i5kYPhEQlyUHUbRpdvaEub7exosgrVrFxmuHgTVorn2
	 obWAYpGj4qms07sgt5xKf8ifMmxkH6FHY2lP0Gr21Ks1we6uezdbw37oihUim2aFNtNHj
	 TyH4lIprDgUwzfrEJzLpU3PGKHe2Qu1nmz0UGq1a5bxIMomy8oK7lx4CS/3DMeQ48h8bp
	 fVNoVxIcwFNTbXl7GOpL3qcMMV/FoMOmEyHoGGepktHF7SKeCiGLCwuyIDSy7/gWOIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVuyGLyi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E7606A326
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 21:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVuyGLyi
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3fd91337baso304776366b.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 14:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793480415; cv=none;
        d=google.com; s=arc-20260327;
        b=rJwvNm9VqvNK/kwbm4VqzJXTtajFrmtVfnjyK/j3JHi1fD/P7dFElHvtL9cGx6oPsr
         ndykt2wrihaC/XtXY8yqcD24fhsMjuZG5qn+rsQs796JmuJFKcBN+XrucVI0QzgLbvsf
         VqLO+//YAsY/Edb6As7pE4wMrRmaW9ubMO28IUnOJFCNUZfKqeHptK0v1r9LxRXZIUQL
         Yo2p/nlPTTTsEDDk6QOxAUKNTaeyvGxqV5Y/yn6F3PQOUecZvUHtWtzJ98j28WGJyZDK
         5F9KZLe4r9pGpZs9HLNHQRHviRbAmYZJiBJ7WGced3WnBkBAIqpiQvODkX9W7GRbEG7p
         7orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y6zIttahEIdYZS9kXDinaAVVA8SQ2nKlICPEN84ZtGw=;
        fh=iF+upiwN0S8JobbSYdu9o9IXABfya9LQIy+B/hGKxYo=;
        b=aCATDXJ2Zus1uVjny09mIfCxgrZA+Y9SRILkyQFNB8pr4Kh5OOVFO8Dmbk0ufHYJCB
         uWqL6SWbgJdYvg+hVYJbdTpE95GrJVfsqQVqwUlY61oFanvHep5lOL4t4ZygErtrCOar
         nmV1csmBEd8pRdub9Fizdz3k76XdsrSvTwpDhCSIv27Hui8MgiOkiHDh7Af6o+hqspbX
         F7KWgn0tXra7oOofnm6+GFezITRZs9dQi/X7lVLybcvNBnyal35xeqJMT8KErP9cfvM+
         olFxYzan1ILcBuuWrqhdW643W2+zxtPMMUAZ+1tkky/My59u4V+2PZTg8BvpHzczs9kW
         6h8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793480415; x=1794085215; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6zIttahEIdYZS9kXDinaAVVA8SQ2nKlICPEN84ZtGw=;
        b=RVuyGLyi9UpACESR2tx0q5BpOblW5pBgotdpxzbXV9o666H5aLF88NwgWpypC/QKfw
         XsN6cjz37fYeJy7TNLCSHOZMTkRxndRlNVjNz4sbeXkb9tHaELRu+r2RKMNpBthqmosl
         2bdp3z+V2l9AqQh1S3NPfmBxvf7ldpQn5Zob8Ef6dM/xjwt77Y9DKeRcfQGORmW4nEiO
         Tc9wqVx+vdnBuPsTZJ/db3qpbnZvDonU1iM3Zf2O1g1HsLdaW0yH7SStvCkpdD3OPESD
         UCpfKMpRmDsavBGAHKr0JrjQizqETYFSVqoyO4JA5k0kDFHM204TwSaWEVmlYQh05fNe
         eT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793480415; x=1794085215;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6zIttahEIdYZS9kXDinaAVVA8SQ2nKlICPEN84ZtGw=;
        b=dCrKOhVlDNSn6zIoKvBMBioUYJFapJvqitvYyqvEp0jaj74bd2oDBTXB5kaJfLLVas
         q0/OjMnFZgrx/yTrKPBQTDCJAx82AkrRt7Zd9+h8BpOj38DVaygRMGrrEJ0wNikOkWQr
         GUSVTuTjK5xh+81fBixU0V4tOFz431Ekpr2Va2Ktj/Kzs6JQuSnSAJt3DFGP0cOMb9en
         g+md17wE2/WANplP5vAzaCApUuBrXWTEYSxKgt1a9UHcP8dl/wJVlBSqS+VKNft1oS7n
         OYGtiOdKFXmO+W3nc/clOHkmV2Yife43HeGjSh5HTX6oCGvEzMV2F/Je01BWlZq64PUZ
         oHaw==
X-Gm-Message-State: AFq9FYKKvtBT13oUEeOtKa66WdNbeebilDy/yxPg+OX8u/stHivid/CF
	SAHjXV2lvebnUJXsMJ0dw850C6nnLlbWGmRFeM/W4Pl27G0Ra7FVb+tTnoCJ+Vz7OFGbJrbJbEn
	hgLUD7aRoTEpJz3FxhkK1lTaFKRdjiHE=
X-Gm-Gg: AYBFou3P//LvzJb8JobdK5Z7zQZGvJhXBz2dGCnc07I5N3exuP6p8MUKvEMuy5dQybU
	o1jq8YSUYencHu1QMl1ZwKnSek4+EITs7gt22H3yiWnMFGAZ3BKfGybcHi95MmnR+rINrX9UKDQ
	fOXydi1SpBHzXPCnC6SZwlzAhC4Md0WkHCun0sq2pi/HL6UwZpto8Y5PnjlCGKSmWLfqZPNNMD8
	m7W3wCAdUNYcopPJiHKe29U9NLdKWcpgL5TYbkXJk0NNw8gb4zYwcUNEEOBv9gHXV2xjgaMveui
	Xmoh/winOa6TVbA0SgWGQCGdJPvl4MVQtlDeky6JZUO18bW18koY2AvXCLXjDS33radG4PEwX3q
	FGmnpklaa1oGOH/QneNBKEo8Zs8SVqZmMlAhOcNjQ3rtxzEhb5F3dvP5uNjtSl8YElvj7bgwfi/
	rsKOu34O8WYK3VET2FKGLvTjWQQr8=
X-Received: by 2002:a17:907:3da3:b0:c44:3006:5c3 with SMTP id
 a640c23a62f3a-c4ca7aa6b0amr512955766b.28.1793480415077; Sat, 31 Oct 2026
 14:00:15 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261031160902.2540710-1-vladurares@gmail.com> <2026103151-sliced-showoff-9b0b@gregkh>
In-Reply-To: <2026103151-sliced-showoff-9b0b@gregkh>
From: Vladu Rares <vladurares@gmail.com>
Date: Sat, 31 Oct 2026 23:00:04 +0200
X-Gm-Features: AclHuK-cNkd1s3D8PvPfBGonO1MU2Kycb-9kxlB_CZJ_P-vkS65HoDyWknbq4Bo
Message-ID: <CALr6u6KKcprf6W+MsnPwZu+HOoHfTS3HQs=iMfG1ZVEwkypHoQ@mail.gmail.com>
Subject: Re: [PATCH] staging: octeon: remove unused cvmx_pko_get_base_queue_per_core()
 stub
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 31 Oct 2026 at 22:31, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 31, 2026 at 04:09:02PM +0000, Rare=C8=99-Mihai Vladu wrote:
> > cvmx_pko_get_base_queue_per_core() is not used by the driver, so its
> > stub for COMPILE_TEST builds is never called. Remove it.
> >
> > Signed-off-by: Rare=C8=99-Mihai Vladu <vladurares@gmail.com>
>
> How was this found and tested?

I found it by checking every function and macro defined in
octeon-stubs.h against the rest of the driver with grep. This was the
only stub with no user. The real cvmx_pko_get_base_queue_per_core() in
arch/mips is still used there and is not touched.

octeon-stubs.h is only included from octeon-ethernet.h when
CONFIG_CAVIUM_OCTEON_SOC is not set, so the change only affects
COMPILE_TEST builds. I built the driver with COMPILE_TEST on x86_64
and it builds without warnings.

I can send a v2 with this in the changelog if you want.

Thanks,
Rare=C8=99
