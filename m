Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1214E21ADC7;
	Tue,  8 Apr 2025 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096895; cv=none; b=OaEvmbjVCg96EAr2FuO7XGBTblUwwzmVzXYcx3GKtjDmolEANQcfY1Fp1cwdBAX8oqiPLcKgngUoDcSPZ1U8FqXw5tRFVqUIdYoUvimTNFXrK0cF2Cm1wnBAOzNVbXFLCjl6UVEYwbnxwLt3zb1tpFcOUVo6ULjvaxWpHJbVWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096895; c=relaxed/simple;
	bh=GAYhAibCXnT2iIMaWhc53SkhgEeh2oob6G0EF+LtTIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0CZIZj4aIJ03zI2En+NHf8QJWQiNWGcKa7xTTLjvF84X8Fehg9XBTBh/50NS0yBDvrBAmMpbRfC+4GlWEG3US/jM6sb95y7T+jziuTi3SYT7m70g4LUFhfBEOtgR2B4ZF4bDw86yPDQyNJV842+YVMvI1F2eUayT5zXLrCUUq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmpE4vEo; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmpE4vEo"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so939589766b.1;
        Tue, 08 Apr 2025 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744096892; x=1744701692; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/9wBcdi+1ChLSfZxD60WKrjeGjQc/e4DMdb0/Izcq8=;
        b=RmpE4vEotVGsemT6gAizMTmvR4XJK4nWfqWPy8OnBb3AAvvnb7EvyLwW8ogRA8sJdg
         8CKkEoi4mLVtrnCW5t3Z6HGPejQrmLpetyk0S/0enwLaMQDyY5McJVJjOWgnBjnYAfvz
         Yg7uOscptW+XkGxCCFqg7su4njewndaAb3vG5is/zgQVIIGL9L5vaep62HhLHuAMmukl
         90EBobPEEqbG18yDHnrLxXIt+VyGLf7v40KKzTXZo48Fchk0NRg2s9uziCnQB3OjTwDE
         ux4Ki/dVy7hmg/tPGkcmJH1kunoeODGUHPHTWyT5mRNj6zTJB5uvQzF5gQB7mNsQqu80
         HPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096892; x=1744701692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/9wBcdi+1ChLSfZxD60WKrjeGjQc/e4DMdb0/Izcq8=;
        b=d1iX040sbaG5v18Ro0V51a2jhUZTCOYkTcXyXOnS+8FnrJ8mS6VDNXTrRSbB/qQCbs
         CkmhvoZ0t2JQONTxVQ/fjJvIMrHj9IACBghg2DAIcimnJ2pM/GhXOuqld98KKFrlVWf/
         45INWhXlBlDsR36BuNOHcUF/uWXFCBH77AxhpZguQekl5Jbf3RU47ngs/2j5AqPqgNVK
         FMKVOuc6pSjcYK8zh/8mQ0P5OpBbwc2BDjqbC2Ol3aMu/RVX/GKFt8o5Tqw8Q2UfmDh9
         LhzBEPzHhQbjml4cKa7iD3s9IWYGDgcOjn2hzG9RZdFTJ4sTjhAEEYhShyOMqVjS5Uby
         7TEg==
X-Forwarded-Encrypted: i=1; AJvYcCVIOctSRzkfNGko3NuCr1cxWzKzBKT6WFo8dGZwo0XUrHqufBtwbb3ZOKDZNyAPb5WAdovJVTP/B3h2hIIh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx20b2hjpTaA3TKcTfzu+V6B9xMhOcYNArD3yBVFCsL8JCy23lx
	MDqtxFcUqjF85yM3mVT4s+sy2Z3ugbQIcu9ENry6PBPDt+jnvjdgs62mVn4NBwpZNIDIOiKVuE6
	S9yjpYMQJTlifbw3beuSGr2iDg9k=
X-Gm-Gg: ASbGncuwbzjYxsE3vOhKa0Cs324nYMB5OohOdXVxF6pRw41IpxRy5ZbFy7HztHZdhhj
	tFphg4VN1grZy4lardi7PKmLZJH8WdGfzPs5HlRTX90JG6ibctZ1tqYhA4sH8P+oTxUc88RB+oS
	yAbBRNzuo1LCkNcMOXhdaW3Bkm4A==
X-Google-Smtp-Source: AGHT+IGSP+aFSQIOdfdECZNfP2qZ3tPc3LXJOlFI/NIKtemYfrFu6w7o4mQVVgOhgKfBQfD7PKtLQjGVQAodmYu7FlM=
X-Received: by 2002:a17:907:2d11:b0:ac3:413b:69c7 with SMTP id
 a640c23a62f3a-ac7e76232e7mr757236566b.39.1744096892130; Tue, 08 Apr 2025
 00:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
In-Reply-To: <cover.1744061673.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 8 Apr 2025 10:20:55 +0300
X-Gm-Features: ATxdqUHFeb-mGDJkzsYgq3knAo3STMDoWq9TflHo97hzR-vPrqFymzz6p1lSzGA
Message-ID: <CAHp75VcCdS30LHPMwk3HO1o6db_0p+LDQoASx-7oCVw__MpMdw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> Tha patchset adds spaces around binary operators and also
> provides clarity on sequence number wrapping by using a modulo operation
> % 4096u, in place of the bitwise AND(&) operation & 0xfff.
> The patches are required to be applied in sequence.

...

> Changes in v5:

This is v6. Are there any changes in comparison to v5?

>         - Converted the patch with the subject "Use % 4096 instead of & 0=
xfff"
>           patch to a patchset.
>         - Added a patch to add spaces around binary operator.

--=20
With Best Regards,
Andy Shevchenko
