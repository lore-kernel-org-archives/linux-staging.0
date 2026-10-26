Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792994014;
	b=m3G5TyYjWzUoersbNGADV6gqUXWf+dxISMuCWD3wuTi6VIMfU3UrcLnXLzhlE7KYQkgj
	 0FEY0kChsqn9gn0VSH852AHsif5gYEj4VPF6lKWT5G8is5OwQ7eGw5uwElGrMl3AVMDqA
	 Z8xxvoEk2Hq4NVMFve+3WMq5Ty22s9fxE3SgEKY7clicFE1UP8y1WTZpSFA1HAmtcnGbi
	 507Mk8tcYmSxqczAlSuPJNETG4Kh3JOcS4/RAXZO7lYkWMfTcHSLvj3CQhn9YeCIaOVvZ
	 TeVgLFPdL6vN7ITaUg/drwQiCeLxwN9PqdMmntZNxSK2x8ofdejNEEAKy+1CIb4K35A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c42lkr4if04AZ8UiQQ83ZlSvwlPXm235lZQS5qXaBN4=;
	b=OlMMC0VxhMOA4qQmvusoMScYNycRBrB/IjB+BwL0JMEO4aq3GXCJLDz7GBEx4ICL/a7z
	 dnkk7VbT6o6/II+/mXfG7XDEA1Py3TqgZPsVWyuqZ29/yoetT30Ho1EQ8snUnSCt0ERQ8
	 IxaHbC8942zFEvpszaf1XG1lVZxYA2cC/PNXi1RWMtWJ5x3XeVGd9EIlkH/WAAzWu6F2s
	 uwmfPYyFrfcCkKqTqXujWHar5uZLnPbOo1Rqr7h8pPHvseCw9I3FVSGL8LQEM2fxyGRT4
	 hwYWoEGBVoF6QGOJ+mtM5sOMNwVmOEYOo22YhBAVxpWDAFR/9Or0cBhXNpKYuQvhvxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TGV6ZWPU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8190B606A31E
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 05:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8190B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TGV6ZWPU
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6aa9606ddadso1826719eaf.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 22:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792994013; cv=none;
        d=google.com; s=arc-20260327;
        b=O7iP354cF4IYMtc4JcgaxPQBE5IIGlLQYpvpjNvQMEPuhZlp57tTelDF2+2xMzxmDg
         0P7VOG3eVSPief/2lgpR2ZEs1CdvYl+TEYuaJClpSvWfmo3YrnOX0bXbafQzGXdSilYh
         E+ZgsuCJl55zCZU1sI+ciTn+rO6Oubg1dHOjfSLW+1heNjfB5TfpyRYrS1uZLDXpdRdr
         1M0L6U86Y1GG++yPqbiImRBhaq5X5dpMA5KsPWmKfBfEkZiMvMj5njXQyFiQwyICneCV
         UCynt7Ab+1auJHvTW4Z+64y1Fw5HXBILrL9yHJxlj66xp3uNTORL70CLMZGxLzxWhRPa
         q9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c42lkr4if04AZ8UiQQ83ZlSvwlPXm235lZQS5qXaBN4=;
        fh=dQtGW5vh9zz3DLXCUC7JM7yYr+nESXlYG1QoQ/nGsQM=;
        b=MuRTesNG3PfsgQkHu37K17dYzTEchfjQ1R9FEgpGggeG2JyGSwqLtGFk4tRiGaGGDs
         m8UOMHvih3G09Nv1qc4gsgZW0gKIBM2W9ErNoNogxkG2rHslbZdntKv4ByZ6CKuCqZii
         8hktYYKAC8dme/eP5WqFTT6tJyp8UtHLdL4zvTvgPZyCf2nDyxdHvUgZHSIWghnmaRhH
         9zJHTeTz36po5FMS1NMfDkLzAfmRawXTrCo75AVyfiwrcTEBL4mAgFYqBRFAQAHv5qYI
         I108PgCAjRN/hY3EowO+9R9poq+QnjyOzqijFQXchVgc6AqmplorLthea64haYVm31ox
         uK1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994013; x=1793598813; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c42lkr4if04AZ8UiQQ83ZlSvwlPXm235lZQS5qXaBN4=;
        b=TGV6ZWPUzJRvj1WQfXZ8MAy2vyrQOLm1VtsTBVxz4tlmhVlDdzDf0eaY9VRt1iL/Z5
         IXznSAJNO7CHXdINrWw8DHUJ7DGioo4wVBJ12tkRcYbr8pB6iUZUF+jEDe1ZXU+BXVyu
         U2jSjkAenigzbAlpvtR9lJRkx+7VDFURefQ79QR6mxKceGqwFzL3g/Qwx8KqE/uKil5/
         MHD/VrtVP57d67RzPceJfNBzhHHlLxAn2GhDrGImWsvbP+ygBE6ETFQYnUxLSumYJedB
         yZdPHYzyE55Z9vmLP74N12wWnLHt03QnVf6gvfcjKizEr3YlwjtUGv6XK32ZhU3GK+8u
         sgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994013; x=1793598813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c42lkr4if04AZ8UiQQ83ZlSvwlPXm235lZQS5qXaBN4=;
        b=ioMeIBwBBK8Y2GTNGra+SIm/uS9zFaY7/+Y9YY2ekBpWWxci/TAnr18yFCYzZV5fXE
         wBdSrUF6xfiAuZuEovMGiTAnF+1Qznvq6G0qqr82ffw1Ns1R///m4XuiEKTGvdLwGqx2
         yAjewCW2ScXtxjo+pQaOsw2hiJdwEeBBOo9tgCFlA6xlt0kC9+kj9VH4Yv2YvWLutMlB
         Oc+M14XjYwfaW7XQ/CDyPYy+vnj8JW91T/DVcsDh9Y0MWKPgqJeuUsLQ+N+xVE665OQa
         Sjh8NkZbkq6MoS3iiUuneFUMo7VVAZTvlrhsbU8/RAcjAPA4R9wHTq+dFTYplXRlrMpU
         Sd2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1XkvJOdCC9ZL9I9zDRHl3TCirIDeRpg3N4+hgj6uq510q7DT1IINfu1+mG0914dUIHuSLLxWUqn371Nn1@lists.linux.dev
X-Gm-Message-State: AFq9FYIQX8bNghOuabTlp24x1oDURtdkvcFirPyHNf1MVdXqIB9dwLgg
	/ho9UA+RnBWAZohfO5EKCxoZeaRYPHBoxgs6snscWDeIcYcAwTuPQVaHZyaUvt5Tg9YlwiYFl3F
	PEgG3iM9bbhmZuuN7qxfe+rfycWKFwDk=
X-Gm-Gg: AYBFou0/RDvAKIrzqKMV1QEItEprh8ViBsSkIArUKxGTAf/M0riOvvWe2yqk5TWPIzm
	OVF873Q9jU/HWagK/FNmmJhOXx3OtZdtYMPdZzpSkL5f3bFRIcKMF8gujQYC9ZTEndtYTLT+CUL
	NTaVOM5qIIU/p/WKXqW33ZZrbC9bqnUwmJuyygx77vaAUv3emuDnQCm/QU2V67pwZjrXBmFqFgK
	bQmrCs9Zhd4YLfflApVNtGRmKt3VfVPha0CybZKYj6jPiEsIvbL7S5gTPtvxTFcAXfAAmDubYuD
	1HU61vYhx01gJo73e1waNq+QcgYAeP1YXzv0zgWjh87wFwxBlo7mzVBZkdAeSYW99YklyELWCLy
	3DPX8VTFKbkN8vZxgd8zvCMC50VC5z4TOKt3JstHQ5ES/1MrvIT/iRohiU1wgn7nrpVY1osA=
X-Received: by 2002:a05:6820:f012:b0:6d9:779e:4f78 with SMTP id
 006d021491bc7-70ba0b69198mr2999266eaf.9.1792994013424; Sun, 25 Oct 2026
 22:53:33 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com> <at7pu4hldDTgZtXy@stanley.mountain>
In-Reply-To: <at7pu4hldDTgZtXy@stanley.mountain>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 11:23:21 +0530
X-Gm-Features: AclHuK9kT-5mgEdeGVApWUOJUbhIUBpwPQFl-e5bzcx7W80tdoK-Z_OClF0xJzE
Message-ID: <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan and Andy,

I have sent over the comment on the v1 message chain and
also sent over the revised patch separately as v2, I will be glad
if you will go through it.

Thanks and regards,
Himanshu Bakshi

On Mon, Oct 26, 2026 at 11:18=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Sun, Oct 25, 2026 at 10:10:03PM +0530, himanshu bakshi wrote:
> > From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> >
> > Hi Andy,
> >
>
> We don't need this in a commit message.
>
> Also I would prefer to delete these weirdo debug messages.  The
> normal dev_dbg() messages are good enough.  Plus, is this even
> used?
>
> regards,
> dan carpenter
>
