Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794208632;
	b=3IVW+y6E5usrKLe2Wh1BEmSGea1NycKRAGg/pVjS5L884BKOSz+wxF9AJ2NfwHeQgCup
	 E4tMVtu3QeYhtDEmDZVR2UehVxgQ/WM7q300643sBY5Q0bRJfeNLLZlq/wRL1SkvqSqzS
	 MnfCN1i/2nVLLP8Xm5drxkh++eNL0tUxDaXBfcmmZPMmEiFG/rzgnVcP4IYM5/tMLAAMh
	 bO246uIkx4NKL10WMDW3pkYogRI22oZWl6mArz9h8vKH/hYWYMkmFBALk7p4DYQSjynZG
	 jfFBp8ABywwnXSrekR6hFtDjsql8CkhEyGS6ZvIxZ9JAS5eyI/a71hQZLCZEn9jrX+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
	b=kq+IJzUjFbJzLvw/XTIe4Z/CTEVYo1ADYLkfqg17tbE5qep3b4aU8rPwSYHjPptmzzvm
	 wy+ElVsdXgR1DurDhak9cSsTlXsfV6DQXIYhP+MtK7dxh3CyA87ho3O6fRfyro00xCfPZ
	 sR1KppRjs/CsMblZtRUorZ5hLFFzFHw6eOfues5dmyoug0kXiAH5nldVSOpaQAbpA2bld
	 mg+ctipFBES/B/Vq5Wv4Sp1vW5sgQpUHEQ0mSYNUkMWsmR9LdqAysEzsamy2QGA/4+d3Q
	 nHSpxTrCfJQDga8Ncztjix5SZvchwDRPaXbpkYE74DiB/wvAla/8UxJs49vUlwJDpWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oU46kfyR;
	arc=fail smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC0D606A323
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 07:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BC0D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oU46kfyR
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0cf2c0785so4288627b3.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 23:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208631; cv=none;
        d=google.com; s=arc-20260327;
        b=UvdD7Jhq4NygM9IW+ujhw0XaHT3UY0nyvJ7my1dOfKMFQ9h7XYJ83hugHCFYeFeaew
         Z5nj+iXQX7ecNfy4Fh4LU/P8s7efOII+Px/HVGW08qOrHI/RXtNYQ6dV55VnbjQqXd0F
         BxnoR9gW3Pc6hz6xVsiaRm2C9szKZnN/u1p9rhgRk+JOEc8rk+DuuKgWXUXLzeRX6wQs
         02s/1uFeMrRmcJ4y3qRrDrjMWsSa+G4uIMPd38+U3Q1arPxunBvnGAELnX05kIBFbIiA
         c9LjeW0ilwP4kDq2lR+jd8pKzEIyctYl2HgKjvi7gnB/Z3dsN9HpeR/vveLBAI1fQSmk
         UUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
        fh=WCRMmdVZwoNDjT5wepFIOfAEt4vu7vh9dEuTFyz8ATc=;
        b=LnGUWBbBYnXcIQhJs0GZwsIE/WXLV2Nqm92xQuNlOvj1NckHJ0ItNsl2wAW0K4yuQ3
         jkizOBo+NJ/R4HGowKaq7s9yVH6N3/gmuFEuOCuy8ZANmF40xbxPzJvEiJZZZjPFyYYi
         HaOiJqRPxI9hHd7aCaZsABQQtdjtImStxXV0rwk+f4IBnHZjEcfhnEaNrs/JGdzIvTVi
         QReEbr7L0pf/dlwg9niirW8wTQkS6mkatZDQYh7aREOp8nFi4t8Gi8pZlRpx8fVNVBBi
         LuQDzfNTMR8RJpPCK7+q3AINmqxy8E1b9ises0mkjFui2tbf705FiCXCIDG+5ei7iGo2
         m+OQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208631; x=1794813431; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
        b=oU46kfyRw/3dw7lvNSR5ThbCy7Y2046Q/0jcUqaTjqqh+0uLJYzgHiUcDXPiewXcKL
         0ovhQRX9pjcobobn1HrC/abC2htNysv/CZPWDYOfwpeBb2zS6D3q+MbVqJU8i/P8py2D
         Hua6xcZFwjCuuheMg4NvvGz/5zC95jIi9AR1h7fCzRo4UPO5dZrrMB6r23bSMqo6OMFN
         itD6Z8sxdkRTXWSdvKdkzhxCrAEc6uIJ1Ar8+sD7krjZBzmYfsyKJxlzVLV+/aVpoLMa
         Bt0vAQOphHPWrdW/v5MERTr2yN7vobLfQZdPdc6RSOAF8Miv8W5T21Bt3WoKllVvLamf
         uvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208631; x=1794813431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
        b=Xd4y9+miB59QXRXrnFaoPCFkyi45sVpgtZmIiw4S5YEzHojbAXnAH7n4+24E3eVrBs
         W0EJrMgpEgE4hQcwx4aztWW8Fn9WGTGtCz3dvuKNJ976UKeV3UdSf7+ELDe41ZydtOPz
         0Xd6YzsQfMejnnWnRw7Zcy8WOxUhjwytrhFq2fww9NOum392Kxnzi2V1x15xHhHO5SLE
         PkoQ02zl9P4mVDoTHCZWL1QuExgtK67gWFtyj1MbO3iOlYGtc06qJoXQgiF56kwW8wes
         Y8kdFOXRYzkxVlRDB2ZDZFQLnRKlY8r0TQKPLaOwk+5gV0JNfgz1yCa8MFjrmUh1zmcs
         vSMw==
X-Forwarded-Encrypted: i=1; AL+hErGYROZJSUbITqk2IAFo5OHzPOXkBCSDljLZAoRxTAunUTmxjkbSx1pqXDjF37vBRA/Fk7VuCQIPIU4Zm1VF@lists.linux.dev
X-Gm-Message-State: APuU4Z++u0xWSG1ZmtgyKLwlyet6wYCIJLVt87+23pK+CBbRJNaKPow5
	rtLBh3Kta5CE5u3PmehG1gME1vBrxMzID73geHRkracuiQfGj7aQHM/NBmmJ4Gz8AhJYWwg/ZMZ
	fwSu4WvnpU1j7UXF2QKtQa2r6e6mNpwA=
X-Gm-Gg: AYBFou25YBDMFWoy74yDtnU5xgTAy6yUw9s20yYg7thFeSvShLhKlySTKpuhEo+u8ES
	19eqVnh/kKowTyEVdXS2pKkEwDP0jmyoXV4u7kx3yiq3xYWmCQiNB3YmcvUkU4auFeMS5fsNEQp
	nzDLp1yw6bGXKo5URri0cp+5/hiNba8LECq/6DrFe6Xf2MMXlwzyIZrYwMqIwY86KBbeIUov9n1
	ktXaqw0fjTGjTfdYFBJMbhZUxN2+BvqjOS4058H7vBQ8fOM9woQlF/HDED+xY9mpakLIzk4/0vf
	BMzlfj0BbqxW9fWb4gUBy/P0mxNbKqzTlt82SAvOcEN9GqhbRgJZiS1hTVD0oZ64MgV3IEjRTLZ
	Fh3/5Wb4MzjzcRCtn6AZD+vHhYlkmxPynXwXF3u9nAIf0lNUcr/gFWOwtxIp435iZlgC+Xt5kVf
	gqSpJQSjkXIbLa9q/Xo+n+MoKM7X+bcQ9LEwBl4RSySZTEPyZFoNRDaw90HHgU03q5YJzgMzplL
	Nhe9YjZXWbsY6/UWe5DoUfgUYGJDMG5gTY5wRNj5YT4qu/hHbMpxrW/nidxNA==
X-Received: by 2002:a05:690c:e1c2:10b0:8b3:5b88:a200 with SMTP id
 00721157ae682-8b36cc11208mr12210177b3.109.1794208631674; Sun, 08 Nov 2026
 23:17:11 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108122840.85622-1-lamemorupisi12@gmail.com> <20261109061223.17144-1-lamemorupisi12@gmail.com>
In-Reply-To: <20261109061223.17144-1-lamemorupisi12@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:16:35 +0200
X-Gm-Features: AclHuK-khSe0RY2oOjw5lfhiP__nKv0BAQPXQtNw1CLUbmOomaA01kYuN2YE9Zs
Message-ID: <CAHp75VdiqcjyDaF89s1MSs_Wrs0QomWdsm1fTcLmhEJWspoH9Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Clarify MIPI frame layout comment
To: Lame Morupisi <lamemorupisi12@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:12=E2=80=AFAM Lame Morupisi <lamemorupisi12@gmail.=
com> wrote:
>
> Clarify the description of the MIPI frame memory layout by
> explaining the meaning of optional fields and payload words.
>
> Leave the frame layout diagram unchanged to preserve its
> existing representation.

...

> -       /*  a frame represented in memory:  ()- optional; data - payload =
words.
> +       /* Frame representation in memory: () denotes optional fields;
> +        * data denotes payload words.

This uses the wrong multi-line comment style.

...

And as Dan said, you missed changelog to explain. (But in any case
neither v1 nor v2 is good to go.)

--=20
With Best Regards,
Andy Shevchenko
