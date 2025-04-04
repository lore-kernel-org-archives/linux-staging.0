Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E6D195B1A;
	Fri,  4 Apr 2025 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753242; cv=none; b=VCssCKdmxkUbaF299EnDo6k0N4UEDHOhcHa4Ll1XNVayy0i10KzVi+0hGtZ/9WCiycNiKQG44b27J9zPkusxJpOqOQgo/7W2e+SQ+wey1S3IiYC7HiEuZYDM46TvLbI/J2AuhpWwPPQRkoVqbHehMEThKPQrI8U/VV7Px4YeJ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753242; c=relaxed/simple;
	bh=eMOboR1OF7sgHodBKX1sm5CBlNgK4lAffdjRbbeWCqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfEM1/BWe/Dpw8BdQwawf9csbu97qzipw8Qkp5Z4Gxucb8XrJkeqlN6AietB7aBsLl+7Asu5SXMXHpeKJ4eqvEezj0/g4Ymo06ZJ3KE7ig9FVqGJwK15lv3nlKGGHnmHnxOKX1/AE59f7raceU61zOuYBS0HVvmayUhSZkO6c84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYwjJoR/; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYwjJoR/"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab78e6edb99so254599866b.2;
        Fri, 04 Apr 2025 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743753239; x=1744358039; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaGTQLiNqEVn6hoJZLsfuhUQi5LJ3xyfMo/qxpq0bPs=;
        b=RYwjJoR/Moy3PxDL7SU+wJckCajNa6QbVy5u4Mm42+QtzDJvjGsWaXcnc9lLBM3nSa
         mWUvHwgFpXZCaeknRINqdhWGBgpZAYtmQbw6gIXd2coaEqy81OugmH14Vxq7iKd+2+WM
         husuYaB/zJt3uA4yuK5oWZg2ELwRDSoXAZPg1xtLhnJ+Zo15OXqD3BrLAie1DkNAQJOf
         R8S552khHIMjO0UtIdUsnUyY5WWYEU8elbaIP/H/06eqVwWzhFYoutXcsUWvcpBgw2n6
         aOrQseJQj1oKiBRHJjSQK7CJq9XbalMHSD+SCLvsla3MlEIcyjIspdnA1BCN27K7FDat
         2PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753239; x=1744358039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaGTQLiNqEVn6hoJZLsfuhUQi5LJ3xyfMo/qxpq0bPs=;
        b=XVGoVODofmZFbQPZpquBWyCsCrrU9pih0w8QpdM8t1zpndEBOwMzn/4yKMFl3LytwN
         OX/ZRquzkti7qxgUEw31xQynEfUo1WsDzEUr5JQFOcbFzStdzH8At6SV8cCKo++abCak
         w/47X/F6IrBOewHvTGRGdI9P6H46gGjsG/QOJVA46YQmZM34/3E66djLrjPkQlT15u0U
         AYP3eJcpBk4yMYI/e96RXgopxnWwKXCeKmmV/1hD5NJF31CLykqYzTIGxrCd8dPZ3EMC
         BZR45eZlNvieOccJvgfPmqCJ3K7V8FgNWLvURhnBqw1VlJR52+xlbSD6VqD8oqBIYiP/
         kLnw==
X-Forwarded-Encrypted: i=1; AJvYcCVw54Dr03v1t5juR2emD8XweuBV7zn2BYO0vrE7zPQ0LjsyBbhiqiGgcs1tUFRzNcRR9K+6hTIf3JUjI6rP@lists.linux.dev
X-Gm-Message-State: AOJu0YxFjDaEL3PjE/HgfzcIJmJMxrs0e/lJsfKaGX3YTKtUHuFpYirk
	mQ7fReFH5N7oItxNfneyhAfScUc6Yll11ACNh4vOqtdpeJjYMSSDxvLZifKicfE4Ne/1lFE0N3B
	GTzM48zuqKFRHTceaTPKKrzqbOxg=
X-Gm-Gg: ASbGnctWjGOZ6no4o2I8QeV99BZBqYwsyCuvK1wmIbZj2fMV0LfhKCNw80GM3uQce+T
	vyC+mRVmlUNYttAYxKyJmn1HYW9Q04CYLmsjeenjkHiz9CYiMbe6w1xk4jJuoCqFcYQmhaPAIug
	Yq7NAVIuoLuKBRC0zwXQrGsmykOA==
X-Google-Smtp-Source: AGHT+IF6civQrpcsNGh3qPt0iFr0ZsF9o9HE36peO/Ap6sGq0saiZ3ABHJ4gFSQo6erdYgpt1gMsmjYQr107nKWDgTQ=
X-Received: by 2002:a17:907:3686:b0:ac7:31d5:20de with SMTP id
 a640c23a62f3a-ac7d6e93527mr121032066b.50.1743753239033; Fri, 04 Apr 2025
 00:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com> <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
In-Reply-To: <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Apr 2025 10:53:22 +0300
X-Gm-Features: AQ5f1JrSo785G3atwbFfwkCZQrH7Nn1tO8h4kPi_a_CCxGgfg4kfie2vKhwpsQw
Message-ID: <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 3:03=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
>
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
>
> Found by Coccinelle.

...

> +                       psta->sta_xmitpriv.txseq_tid[pattrib->priority] &=
=3D 0xFFF;

> +                                       psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D
> +                                               (tx_seq + 1) & 0xfff;

> +                                       psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D
> +                                               (pattrib->seqnum + 1) % 4=
096;

Logically it's obvious that you need to align all cases to have
consistent approach.
Besides that the commit message should mention this change. Something like =
this
"While at it, convert '& 0xfff' cases to use modulo operator and
decimal number to make the upper limit visible and clear what the
semantic of it is."

--=20
With Best Regards,
Andy Shevchenko
