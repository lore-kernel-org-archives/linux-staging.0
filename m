Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816FB847B;
	Fri,  4 Apr 2025 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753536; cv=none; b=pQi8kym/lOfzKQgemuzENiWe+pgIq2DdQ/nvtJ2pFWZ/QPJ/ii2+B73sT5FOB4ndi5FdZchIuA25CJawIeJvG3QPFfw4OjEBp2gcVO8yEywb6phy2ebRV0K8DHqIhiJiMIOnysHv8wmAAXoedaMKNGt4kGZNGzmdPp6KUqghYEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753536; c=relaxed/simple;
	bh=UUjzB8EKvto6Mi+McaUUa66PIdWe5H8zn4PvcUFx5v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQEOqwP79wC0HIcLdVdK93rL6Mn1zaiHFba/dqlJrDWhK6bRLUTIfD0vFNk67WTji4kc8wnJVCZXA5weCzMqbNu/nxaWoBj771ZilOMOVRnVC14esCbFG8yhKthzAvB03voTRk8OuOEgi1WYXlvPhhaUgjR3jaV/SzzZj/mQWKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7RRtVvC; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7RRtVvC"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso2143746e0c.1;
        Fri, 04 Apr 2025 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743753533; x=1744358333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGt7mfXqnCsxJf6ymQojTs7U2r6jHdpo83KmTV6yu60=;
        b=D7RRtVvC9Z2AdOx4dNpSUCHDqD+rEOCcZL9vLN8IvybLA13u65Pm92ZxlyMxh5fJYX
         2hoOreTIL72QDTbNFkSnTqAhIXHUEsuQxE0gzaV/tcJGmyIJ+vfJSyHUXyUHxYQ2Mg9R
         FM0xPfLS9zspraMLoNABlDSuwi29RyI2NQqK9FQ1+hZaAYpO0i81op5YWov2oZx8B+6u
         34NjgTYCWSgds5+CSy6+GCdPCSouVySnjVA088EGqVuVW5jT8IQiNTvOVoAdECMvmCf4
         mW8bP+azVzmDXe55R8p+VvktHY8nDTTNiUEJf1EQHUOpwm+jVRVcc8egHWzcjpg+6yFK
         jS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753533; x=1744358333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGt7mfXqnCsxJf6ymQojTs7U2r6jHdpo83KmTV6yu60=;
        b=TMezBQUD8LBZlXHQKROc2BTc+GCtQLVUjGt5D+B0vFYEXzKXo290OrevW8TIXQfQ3N
         MRkB/LiUzoDUAilwiCKNmClrOCgQ3hSiomi2c7d9YbhTtSOUeghIMT2D0OtgjuTJWLhP
         t8cjkPIe112eu3Vyo0FWyBA/oCFRhqo2dkwJ/zLUqwi1rUlfA3XUWBsq0FyYRub1jK4n
         U/DJn9toXJjjVpvOFnowz+tfx3uxeW2i40UkIL30NOyxhJAYLg37B/v4puU+rRIYobDu
         n3gwwkhj3PuPxOvQJOoy1x+b4wUe1qVHd7HF9nUIB58TrQLvJZngMfc8KPTzOPh2Xakp
         Y2gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvbRrVOArfTOh+2iJ+qhLXF8JWMB6Jx7WQynK7j3sunUebjTV4zRqADA6YdxMl2hi4u0NXKgrR3BwcgJDt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx46J5zbxJjPn4kdTutQ06B9D0RQ6TIzKy/VVd6qK9j1uN7YOfw
	W0iuTQd13sIn3xpHwztEvK5kEbQUef5l4BzoLVLeXoz1+ZHJYXY+V5zmBWHs7AipZttk2xc8O6s
	JGsxDKMoFrhIec1hOAmPcQW6j1DA=
X-Gm-Gg: ASbGncubTxSZMaIGYBGt1AUGoznjxZvehyFPo53Cushbd5kb7QYUyzkmMU/++ROg9C2
	GaAaiRfAnKtBmIS9xXCd1LhBOiyM6YuHILMoInZmemIr85PYfA2wcvkST+WUUazvp0zMuGj9iJi
	l/y6v1zzoxKfUVclHDYpAnYlWu+pM=
X-Google-Smtp-Source: AGHT+IG18H2efN3W0ynslk7u6ZVVcWZdIvpP+NTBsn2fgurwqAFVSJxosdOjlAphvZS+agE+uFb1CvcSXL9ki1DqXqY=
X-Received: by 2002:a05:6122:8c01:b0:520:4996:7cf2 with SMTP id
 71dfb90a1353d-52765da1546mr778622e0c.10.1743753533250; Fri, 04 Apr 2025
 00:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
 <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>
In-Reply-To: <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 08:58:44 +0100
X-Gm-Features: ATxdqUHLFQnBzkVzPAsbPZ-fN4f13INUlSaGlgt92rS1o8ASalZ-kH56X9NRuu8
Message-ID: <CADYq+fYU=rb1EBgv0U87mFMFe2ct87g05GEyu8oG9=+xHjccyg@mail.gmail.com>
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 8:53=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Apr 4, 2025 at 3:03=E2=80=AFAM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value that
> > has previously been NULL tested.
> >
> > Found by Coccinelle.
>
> ...
>
> > +                       psta->sta_xmitpriv.txseq_tid[pattrib->priority]=
 &=3D 0xFFF;
>
> > +                                       psta->BA_starting_seqctrl[pattr=
ib->priority & 0x0f] =3D
> > +                                               (tx_seq + 1) & 0xfff;
>
> > +                                       psta->BA_starting_seqctrl[pattr=
ib->priority & 0x0f] =3D
> > +                                               (pattrib->seqnum + 1) %=
 4096;
>
> Logically it's obvious that you need to align all cases to have
> consistent approach.
> Besides that the commit message should mention this change. Something lik=
e this
> "While at it, convert '& 0xfff' cases to use modulo operator and
> decimal number to make the upper limit visible and clear what the
> semantic of it is."

Okay, I will do that.
Thank you for being so patient

Adekunle.
