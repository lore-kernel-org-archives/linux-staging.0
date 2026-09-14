Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1EA3D567F
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383492; cv=pass; b=FBWzZnLtxwZOer5ivnaM+JjfPCiYd80L6ESCbunIsZM7TU7J3H9BqhejphNnp3Lwbuhmq4ABB7QCp+Hn+P1mSETWxw8lsc6sGU4kRcMWfi/YmsgOY/Ik8Mj/Bslva+Gu7D6DDF3AyPjZEXgEMKns22ec1qBijIG5k9/yHUjLLAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383492; c=relaxed/simple;
	bh=ctSjyms5FYhlDQXWXqeD511TmiPd3o+lZbaQdu4ST1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=laVLmnIniy77ovfOYgVi6aJp7tr6O40YYF0lQLo9BFBdQzweL1HTWMuygncFsIjpdYrhKxRf0jolGbm9SPZ0+u6v37q/i3Q+K9MGVdUB+1QOCPD4LYm/NgUDujBeDxW9qTgXhOlYa3EkFMMeWBbhxvK2Gaexvf2CpjHQi2MIgCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9d72e93; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9d72e93"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a7ea0046deso4474297a12.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 03:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789383487; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+tV5dI//j3zFJpx8MuHbfZxtbosBF2pyMB6Afs4M8rhmcFT2V1EPrsDtaky6v+uMw
         UfILypzZrUIE7Q9hhxWF6pFS2ybO+ELAkx+IroQ1oHhZJDnqSX4NPzoS+32KGIA+cLNq
         hkBWTPsi+1vvb27JNXQ9bawsh/OKNlxKFUScE8xj8Bm0UWtM3I8IVLvJZJPDejWJNjGf
         kbmEa/uNH8ZYLmTQzWK7Wgqnj58eINADOXEHYD5hR2oAOd0etuNfcMyH4BWB1vyMEQIE
         /56SnG1o4Jap4eBtQfRPeuuJFlf9XOOLzrocNY5Eub2+rzORyINcZZjp1FrM0pkw9Ox0
         J4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7HbvJ559effrX1oZMhom9NMAuGQzZm3TFV5OOXNcnto=;
        fh=UlCdxdtjH/cRrbafArzxt8USZ1X10bYK4TL4tE3yozw=;
        b=rMP87zaCzyclMtzNskO/iRgJD8YE284tGz4VSEwKLii5Eg8Ym5wx9gi8KG5qZFMoz9
         5qaWPL4/nDVEvooRTcYsoGqWejNvcvc/dtC8dSBC/+kEBjBufhwt2wY2+qdmp3nf1O8f
         IiTubNCyDpeXaqoyI696y9/B/npXeMClPeid8LowO/SXcg/VVmea2SrIa+irC9YnrmOb
         gbPyQvC9B0M9bITGM3dm67LirYJkng84wD2qYsi/jwonw38o9ZdcoW9VSXy6D6h+HYBD
         puE7djCd7Atv1zTFrWovsrRANrPioBywrmhN4Oh8uSmVwP+7K3b+nYfjd2Y5Ra9P2X8u
         9ZAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789383487; x=1789988287; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7HbvJ559effrX1oZMhom9NMAuGQzZm3TFV5OOXNcnto=;
        b=c9d72e93AfEteLxHd5C0kvj55FyAUJ2thLElG802TqEnYHi8L4JNy2eFFR5mUzdT1/
         OYgKXzxf3urNZ0+cgZAJRVgNV/mcFt6GZ4ddRZyvgmXbp7ON9t1Nbk8MwV8xeeHbNfHN
         42ek1CXq88HPofKhOUaN+zs+uN5qtfkhYN2bKXjLsGhtMbHen89vpCIyOhM9cMYErBRZ
         IfZG7Hn+72zKTOMefXDHG46icPhEddhbb5d2bwSW5pxHucalB+gkUr/Lz60uDMWWN8+H
         p0qf0lty5r2s5inmUQIbRS5274t3Fj4vrw2/Owd7i9ZRstu+NTPJUQ7RKBcIwXwLeJzT
         LpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383487; x=1789988287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HbvJ559effrX1oZMhom9NMAuGQzZm3TFV5OOXNcnto=;
        b=IksepxqEkS6mNmuHYt/5bllT7ZWyZuNTTSElXrwnZEgd+9WiziFRRuIjWYsA5/TLOM
         LKjWMatcBk1RmNoec/nKH6RkY2mu8FUEtE40VTNzjMM5SmDouTDjfV9NP86/qgYSdAqY
         w7wBYSCPb9hNrHyZEC6+zrB3jLyxhfM8v6ENlmk/65+fAoeFAsHHGihxeLOr+mPsTrgT
         MyJpVmSovzGroR5BC6XG+PUwkx1CmPcKlzwa5HW8vI4Rs0v+Ie3xy6Vg3gn3RDxkb/EV
         5VLRd2AbpWuynY63CL8ihaRzX7gRUNotbp1FPJX3V8d3wWtcrHG4NN6dcBokXTwiQKoK
         JVTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgbhZacvW5NWqtG1mhvZlp9q0GZehW5n0mgF6z+Jt/TxB9eQr4WOe7PJ7qzo7frZ1bvc5tlUb9dQz8+qbQ@lists.linux.dev
X-Gm-Message-State: AFuF++kX11Oy1FwmpvUQoEYqgZEsQzuUWqi1lnEzxu9jjOMBtWMfb/m4
	ue+Wa+K/mATA7ORibNNQFpHmORsYLO9t8el0BV6Qz+TfmxF/DdHjlUxvsaKg58kDTmK8dkjV+Ke
	tAGEdVIBxG4fORdyEhwlAYtTysZD7o8w=
X-Gm-Gg: AYBFou3l/57/nRx833eQZThpAygjPtZDRX+CnC6sC6n+rT186qQ9EXnwQ2hP5FFMXI0
	/umZOgCpVlI7O7cvkq0Zk/d6tFj5G92zRanDJ2bu/U8H7xjs8grVORopK+88mjQ2Z1Ax2ZsohfH
	FHE2toxkgGtF8jMlID2I5ATj98OZ6WwxHVolJHi3mjhm4d4kad113R9g7laA/it4QZyo535wXmA
	6ah7CS6ud4Lcs559SyT3lMFXV/S4F/bumQEJBWDMz8aqpTI7II6B28CNyLwN0BCAi248Q8RrKJQ
	osENyX7PBWQCBtJvwHd7FpJNrrlJOHiikxQFy2B1iYxiv1mmaI2S7dGbpFhGuMmzGlzXq8pAHOj
	iemA9JEttrTzY59RS/SZ5lLzkD0d4FDdXc6KZyUn59zQOM7PmWHXNKzNz/k0tzwVH5+bbPFBz6m
	LfYsQHrda7P0ZGdOvFh03mYkELlJmVFuajPm2l7RdjQMOc0taUb0U=
X-Received: by 2002:a17:907:980c:b0:c29:45ad:7af7 with SMTP id
 a640c23a62f3a-c29b86ee829mr131881566b.30.1789383486731; Mon, 14 Sep 2026
 03:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914090858.9939-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260914090858.9939-2-manuelebnerli@mailbox.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Sep 2026 13:57:30 +0300
X-Gm-Features: AcwNN1UCS4c0mLENuPHDYDtqcMcsoOZID1y92p_Z79HcLzYNNZxrCUfwyzX99MA
Message-ID: <CAHp75VfApqZk6jz0TzQpm8H7qE08uqpJ44_dWdGLOcq8r+y-xQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: replace number with sizeof()
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 12:09=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbo=
x.org> wrote:
>
> Replace integer number with sizeof with the goal of prevent future trunca=
tion bugs.

preventing

>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

So far I see only a single patch, what are the "future truncation
bugs" you are talking about?

...

>  static unsigned int read_devicecode(struct fbtft_par *par)
>  {
> -       u8 rxbuf[8] =3D {0, };
> +       u8 rxbuf[sizeof(u64)] =3D {0, };

This is an unclear change. Where did u64 come from? Why do we even
need a 8-byte buffer when we only do 4-byte operations?

>         write_reg(par, 0x0000);
>         par->fbtftops.read(par, rxbuf, 4);

Perhaps you need to read a datasheet for this panel and come up with a
better understanding?

--=20
With Best Regards,
Andy Shevchenko
