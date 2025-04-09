Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27725B66B
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207630; cv=none; b=AHUTmPQ54ImVw3sFsnzb7kAWgcObAIZ/cxFKC71c80MLr/BpIncbkLNagqcaTv1Y5oYw8E7Eg0saw/qQ3xLN8RyisG/270ioAqm3usomu8WUDgtKtpxcQFJlvNIzyxc8KG7EYD58HUpso1vY4m5AAcHLJXlPYyv7dmTcH+lXS8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207630; c=relaxed/simple;
	bh=PqduoJbYDtzqUC58ESv/YEoJVbnqv595vRc7J7Cqtps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=b6gFz0oqPL6iQCiNAOezrrA8StLvZI7D+gj91b9nUVHo50AqrXtyRo+fPjTmvsPw03DWMe9cLUb/XsZskDkX403Eo8OMKd5WL7bqb/i3MJcwvxFeAC0yo84scttI/GANSB9ZMrk9mu/F8HkfSWloxCOX3XaGcFDHzqbWKLGcAEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJnVRaF+; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJnVRaF+"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523de5611a3so3063224e0c.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744207627; x=1744812427; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqduoJbYDtzqUC58ESv/YEoJVbnqv595vRc7J7Cqtps=;
        b=SJnVRaF+QJv1dLunkr5kNBC2MT4+DeashoDRHqtEhjnqoK+vQelPbEvrxzZnJW1k1O
         tg+Z5lBbp/txZyJd3D0nAnA1utHmx7HJN4JTxFzvWCQL/F9ocs+BnKO+kK4L3LZd5ZzQ
         vI9mxL/bL/17gnlQZPlXjSxSGXEOvGtbs5CyI2n3CRZqL6iixO0craLJ+aXRKNsXKF6W
         nbBgSyf5EqlyMJzxULVDwzQxAvNG5wblbuq0LsQCswBMQo96SxUSUdu71olPPgJlMPOA
         8yWc0ar3vkzet9RTX2N4cj2EadbueLEkxlM4N9PJdttHXEX3C938IVrn9K1wrCi89r3A
         YA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207627; x=1744812427;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqduoJbYDtzqUC58ESv/YEoJVbnqv595vRc7J7Cqtps=;
        b=PLWJv9gyYKu6O5VbcSNtOtozBDkG8UTJ2oYbeeSGTTFnkzIfM1BPc+N61qR41iC7fX
         1CQapZm7cBS4A8aAyDiU7WnOMFzslGcLqw9FdShgt1AwSYilMOS7nAQWAFM2TLiCIorK
         CYkXwSfk2YTPNp7QEJMlHiGhIDC9D8PiG64Uc8J2HDi1B/qtYFYzlr8p19OemG7292VK
         aHO56eqt+JLIX4w9IiDm5ANLA9/pxYt9R+E3xeKVTKfAz+n7ga4wUOmBakXu2usNgkj3
         uJRqpWaZ9mStOXx97DOeB9HSh7KidOJo/ZIrsioueeMvYVmar5vw93PibmciXD85Nas9
         /bYw==
X-Forwarded-Encrypted: i=1; AJvYcCWQGmjZi79GBgoV5FgULzgHs0jhA1zjazf2nS078vQuF0Fblf0am2zow0s8Vgbr3C37ny9GH+gkXjIuZm2M@lists.linux.dev
X-Gm-Message-State: AOJu0YxJWq652mjr0kAXjEURlT337ODEmDbk6Bnra/8ycwC2127kTcU5
	SZUqhXUqK2BxlH3keowg1oifjiNUturp0o3MfT3jUDiIfUMP+qu8kaE/nYkMN1tBmVpSpI7UZd+
	SMODTeyw1FFUsicRg2lkqMNRKDUs=
X-Gm-Gg: ASbGncs8oZv/pyIpCIeSjQnAEMTy4+pSqjlEQsIAmqaZVRxASqCAUqhLSWVlBRctwW7
	2FlWFTLab0OU0RVp4IsTsHtC3uNW1D+kNQHbInBWP3yOoA3v9/a5TZ/W0+dFfnldLrRz7qXt0w0
	x6nSZ4OIygvSfjLWOXVaHp6Zty
X-Received: by 2002:a05:6122:6588:b0:51f:4154:c1b2 with SMTP id
 71dfb90a1353d-527a9cc8fc0mt1747772e0c.2.1744207627185; Wed, 09 Apr 2025
 07:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/PyMXTjCHduOhKX@HP-650> <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
In-Reply-To: <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Wed, 9 Apr 2025 15:06:58 +0100
X-Gm-Features: ATxdqUHsbnK795wVxw9QVhafe2Y6kUO7YKAlKUo58tUZnSRiPWCXFv7dunVORH4
Message-ID: <CADYq+fbbA+K6qsPSa73s94+Whe-_gZ0-ZquYjyx0S4RXFq1W-A@mail.gmail.com>
Subject: Re: [PATCH v5] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 5:17=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 7, 2025 at 6:54=E2=80=AFPM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation `% 4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the
> > sequence number cycles through a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power of 2 value while
> > the AND(&) works solely for power of 2 values.
> >
> ...
>
> Besides that I haven't found in the changelog if you have looked at
> the entire driver code and checked that all usages of this field is
> done in the same / similar way and no need to convert anything more
> that these.

I have found more cases using a small Coccinelle semantic patch.
There were also cases in the media driver, but I did not touch those since =
it is
not allowed for an outreachy applicant.
I will send a patchset soon.

Thanks
Adekunle
