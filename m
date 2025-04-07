Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C252080D9;
	Mon,  7 Apr 2025 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042640; cv=none; b=dDzQitxN6wgWvelR8t8VJq5wgRGAJLZ4mwS/AohqfkvNXpMZat4DCZCxKXW2Yc8N5FNeSlPvqrbO1LfOrqsrVz994/gps5hLsphVVz+qp8fh22nmnG9PBNmfQbwaLqPrrAy2YNyMZTW0zZjOzxw6CKgKlkRg6aJ1jtGY8SAs5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042640; c=relaxed/simple;
	bh=M1Ww5unhqTe1EyqMmMPiP4uQRre5NADcj59S0PG9HlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBtlCE/wZpXsIGowTQuyIjMSxgd/53rJQRyUXUJ6Cp4YYBvIMOETLOXi/tSYnpGqDW8ggeQB/IZnEvZwT1eXuFj1/Q0U8+FOJTNyUJjO6db34t2L8bqy7BXM/zLOKZZ8WoUDg24gJozZ2WyINiFgdL6QJxqXBk9D0ybUk6v0368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnl5KOTJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnl5KOTJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac25520a289so799865266b.3;
        Mon, 07 Apr 2025 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744042637; x=1744647437; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5dWdjDoB7tV16wie4HuXtECtARsTapeiDBOI2mjVMA=;
        b=jnl5KOTJD4wWAZgXANKbyBbYTVTemNP+5gGv9gOIvoc3s7ygOKeFcP7oPRrYrp4FIW
         LSrs6ybiq4sABYhVfpsgbcN7bzb72abi+sxU9roYTER69HYsdHKz+3TXp4LeqA0jrsFJ
         c5ahfanJhJxjKn3p++S2Zwx6QpXS6N/k9TS0MXsG3fREQnpLx4pBLZgEYuIlv31Nrprr
         DF5oYJJb7lEQhJ7VT2yWLEV3zY1Rbea7/b2JaT67lRvbsSmivtC31LvuR1hzAVnAkYXe
         JGlKGaaTxpafXoiE3pd4TTtuh2efroS9QwcUquJelXXqivg5slNwA69YjVUKam9hGn4I
         9MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042637; x=1744647437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5dWdjDoB7tV16wie4HuXtECtARsTapeiDBOI2mjVMA=;
        b=GbD+GlzZzMiBp2fclG9g/vgFMXnWNyJZG+ZIBIGwEDK7j5lIFi+UAQXmPPPBgxDugt
         hklIO44LFPqFflHA0hkwUSnxwjkgKuOkl2oDcbiDqVL5MBf/dAZlkDrS0NUwuKTxNNS/
         PosYEQ26nfcGNeFLfs1nt1yx5ff7ddk7bGr7Bgtbybya4LD8VMBgzDnVYZ0sV9y68Lgo
         OC0yJH+JQCJcUP0kVnxtaozPKt76xZyZpeJWg/1LcDACoLtAb7S6p/C/Cm9b+IJvG20s
         PD89RBmvChZl5vtA3fHD1AfJwBQLdEeTNPsl/KP7XGi8Uzfk8D8mpjm2ookRI+T+zxdD
         vnBw==
X-Forwarded-Encrypted: i=1; AJvYcCVRjow+XW2Ux1Jc5htFP5uHzeol2di7wbdTRPWnUzc/kxXhmJf5AwwL5Huhpr0P+ZLlcoj+fZEbnbfd0MZh@lists.linux.dev, AJvYcCWV9KIZyc4EStkmqkj94HUY3d82ySgqSILBythBCxG4ijih48PjqngtRITJJFv84GkXO+y1MYVPULt0@lists.linux.dev
X-Gm-Message-State: AOJu0YwOztE/F/yEmISK9YHbtwy9czt9EQMJpBtOcdFkcp9Psk4761gn
	Dgur1GEeCdsAZFZggHCU/vhS9GGkFexfujXA6BI/mhVKqiMjD+ApGk2rOeLUH8Q9q2KGxONNmgJ
	sdKNqxpoUgJs+iWuCgbHv9iRjJUo=
X-Gm-Gg: ASbGncv50pEcbvoQyrj2tlSYAA5Gv2QniIK9/FWVbn5eou+ORIrBG98lV7GLiDERPT7
	YHGYmw30BBXWPdMCSc2UlQ/q5Uqa+t//gwceTnv63tE9jazmTiImfFYH9N3i+eCJ07Ke40JSbaR
	qPT/eVsG4L3ii22v/U9Uxn7/LA1rJx
X-Google-Smtp-Source: AGHT+IGNu05igSzsB9qr+safVkgEWAEilmeq1LaVE8+q905EG7rWD56u1oRjMkrKzXWg1zJRa313vmHYEdMtarh8ilM=
X-Received: by 2002:a17:907:72c3:b0:ac7:9acf:4ef with SMTP id
 a640c23a62f3a-ac7d6e9fe06mr1100759766b.56.1744042636891; Mon, 07 Apr 2025
 09:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/PyMXTjCHduOhKX@HP-650>
In-Reply-To: <Z/PyMXTjCHduOhKX@HP-650>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Apr 2025 19:16:39 +0300
X-Gm-Features: ATxdqUGyZhHukxzKPlEcZ8ruaP7I5jVWDX33j5hs0O4jvIHR1fBTUQZaL_QgaYs
Message-ID: <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
Subject: Re: [PATCH v5] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 6:54=E2=80=AFPM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `& 0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
>
> Using a modulo operation `% 4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the
> sequence number cycles through a range of 4096 values.
> It also makes the code robust against potential changes of the 4096
> upper limit, especially when it becomes a non power of 2 value while
> the AND(&) works solely for power of 2 values.
>
> The use of `% 4096u` also guarantees that the modulo operation is
> performed with unsigned arithmetic, preventing potential issues with
> the signed types.

...

> -                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> +                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)%4096u;

> -                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> +                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)%4096u;

To reduce churn, it would be nice to have another patch _before_ this
one that makes above clearer (by adding spaces) as we already new in
practice that it's hard to read:
So, this will become two lines in each of the cases, and in this patch
only one of those line will be touched.

...

Besides that I haven't found in the changelog if you have looked at
the entire driver code and checked that all usages of this field is
done in the same / similar way and no need to convert anything more
that these.

--=20
With Best Regards,
Andy Shevchenko
