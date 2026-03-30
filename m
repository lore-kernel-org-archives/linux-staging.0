Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E5C3AD53F
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860155; cv=pass; b=EdQhSYM2fFeHIwE0l8JpeDd/rdrSBeUb1SatoNq02fLlkM5nzJqv8P64DGfzD93lV5+CE/W+17aB+Tj5xAzkxvrnxUGRf24fsXQqHXZCfOr29ac4W/fBW1nFazCqYFa6DUkITl0EUH5U/mjSqwiF+3BuXHMgH9eSrqsjeTPy6n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860155; c=relaxed/simple;
	bh=YIRjCWc9+zimOVIdBop3+yOVVSeWmSfJySGMibr2kkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCS4bqIa/jCn/OJ1wv0oxIC59TUoKq/Z0ryz3tQsuBzOqBnoRH3kRMCYNIlrdLjgJ5MvFhzn53ToJNLjIxgGzvTSxZnEIWvKQolYk2rgyippF08PqfY74v9Tes7HuaL2NjK0eXJH2+ZaViendjCw9jzMqOqoVfYRRTO3GTIsBSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgAbnEKt; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgAbnEKt"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso1874037a12.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 01:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860152; cv=none;
        d=google.com; s=arc-20240605;
        b=IsHtDgGYQSxMNCI4z6qXjijooPbrrj/yuNOkDqIH2jlrOVaW/X4ziB5RZDdc7vNckO
         ie0i2s7NW9HSDa/xpt/MLlKROrn5C/89Stv86AjKVLlY2pcQp27jq7qU7r6SIDtSIviy
         PXfC9FneNsrJMzPAkYdghOwHyzv/n6Hrlr+fQGC1t+/r+d5TSwYODz4AujdW18yF5T6q
         ysEENJ8SXrIMV2CPOgxlaGMictt5c9IN2EKK9nxQfJClvcSahkFGUCTqMjretb6VaVxg
         bwbGwRjkOKU9oVQIz1GqVJJaUdcNhNKlW12LkK4BrPpg2B/dz8rZ9G9PaM27P+Trr3Fn
         aoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dp+X6QjsQegWPW5de56+Z5CUDZgn200iC580ARwQp8I=;
        fh=fDB+1RIinAl3bdt6iUJgNlUGlO6SREsiHjnGnJNhPH0=;
        b=iJ0uWSxvSmCePnDGInckQdpUTjI7J1mtC6zm+/CG4+nh/SdF54Q0oWx0TzwMk255Jg
         MY4Tj7mCenQiWGRebE5JhuF+mPZuLP4h/CbDwGd/FgBRh6BM08z+9gfXBGB6Nfv1G4aK
         sn2a5UjaVqkg+xUMNyM0Vt7c661cCnYSxQfVmPxZH5Fo3qgCz0wG8VJFXHHWno8j3w4a
         hL4YQynIlkBCF5TAiwrHxR2yuioRPhZdkvyij6MchWCD72aWH9jrH/CIadJ627bly6Oa
         tnclIN3sqmnabNkKibGTFpd11CAfo6rRI9ctMh56RYCJpWylGq1JJrYFCCcNmkHTOcqk
         R+nQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860152; x=1775464952; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dp+X6QjsQegWPW5de56+Z5CUDZgn200iC580ARwQp8I=;
        b=WgAbnEKt1fEuUATThHmH+vBqOhkiV/IaYPVNi1FFD0KQ0x87W1mbxNNzB7zYNuIJor
         qGo5AooCpBvtQF1iJXu1l6dcRv7XDycCvCsU8yNiwQzD2xLr+cvGhwg6Ppv/J9QAMEhS
         As8ZPD/+e4JuVKy5pFz6ez2bRYtozJqZgeHARPvIuu4mBYNtMETvm2H9Y6wKj9m1XVB1
         twj/oFI2EbG2v/BkJ5gSUe4XMFAZOevyNmCyujrOnKokbYsM/ZJIhVReF3acZj+BDbHS
         hxczFlP7rVViNruGoICT5UkoUTwNGTaUYNVXAOvfAjwGbWlJ0TEX4zXkPo4XpYeUwXEx
         vITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860152; x=1775464952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dp+X6QjsQegWPW5de56+Z5CUDZgn200iC580ARwQp8I=;
        b=F2UJbOcq7AsU+rxpunkNk6zyjc4/w5yMmyAIxH865mw91nGEd6sQhED2XsQ1nr4XT4
         bPRJOLDOWm/pkPddlqltVDPCFMpzRqyjR5afUgZPOOVyPRVyUb17ccT4djric7F8+jKY
         QzbT5NfC1TLVwcEYN2sHZk8jDtsqBjBAhakyhuMoOqa+njPzVdQEzSkVTks4nFTHEDPo
         w4BVxvmSQ9aN23SZ7UK1oEoO5W1GwkiwU07Nz5JG7Pv4L5+DaJQtTsFkkwRdHC42ti5z
         i1p48yRq7n1LkOViEBRx386WRwpGyaXc2VrUmtQ4mJicfhodm4DXGePqgJLuAmgjgyyf
         TjIA==
X-Forwarded-Encrypted: i=1; AJvYcCXeKh+iadpzEkB6lnAssr3UeBpNg2UfTy0UP+CAYIHqQAyhrckwWlsFpfZaV4P+xwThFiSz2CDqZSXb2laS@lists.linux.dev
X-Gm-Message-State: AOJu0YxYhFVRLQCW65Hdl4106qSRdXMGPRxnAjWupEYs0EmrhtT5nzm9
	WnopTv5/5SCjmkRwl4OX1BkBdnWxKKfPuAVrdL373ca3flrv/4gXU6lVacQ6wIp78VHtgRw8Yrp
	D07TfbN5y1HixjMlfUULVW24zzhxudFE=
X-Gm-Gg: ATEYQzzGNb4aR/QOcdVnsGCzOXUKC1L3S244jI/7h8L9M+ywyXdik0jpT4nJvj1s0oT
	mJA/5CWS8Unj8DecZo3GU1pqXxu98oERBavp8IzktJZqtAX99t3Nf3Q5xsTn7YylCNag12w+Pcj
	w2BuOo6+PrMqV9sZcAl91XPpK4nA/cCKUyvmk6I1BFQ6YjV5uABUzfFncRuKKgnxy2ZoxgXlsxy
	1i9PMcnP+/2poKMo5W6Uwxb1Vxcfbxp6FZi7WpinTPWitguecpr8F1M6VCuCcLFOZ1B4iXIlLwv
	lMF8u56Ft17o2G+LC0/RIRGZWIbNUb5mbrWktytBoqMsY1oh8rSm1DLhgI8Iec03vlYCkgCyfnK
	dAWmFdP8D6ucRvVuo6A==
X-Received: by 2002:a17:907:c248:b0:b9b:3bc6:9af6 with SMTP id
 a640c23a62f3a-b9b507a667amr690688166b.33.1774860151956; Mon, 30 Mar 2026
 01:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260329163541.21423-1-khomenkov@mailbox.org>
In-Reply-To: <20260329163541.21423-1-khomenkov@mailbox.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:41:55 +0300
X-Gm-Features: AQROBzAbx_94yhY22iqHorqgaTdTvWS1sEMsqxt_ZJvvpH_Q1XNcgb4osTeV30Q
Message-ID: <CAHp75Ve8NLQUOLCYUeGf_6xAyTP8b4OuNwoPGowxCpTOfK2rEw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: remove unnecessary parentheses and fix alignment
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 7:36=E2=80=AFPM Andrei Khomenkov <khomenkov@mailbox=
.org> wrote:

> Fixed several checkpatch.pl CHECKs regarding unnecessary parentheses
> and alignment to improve code readability. These are coding style
> changes only.


NAK.

...

>         write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -                      0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +                 0x00, 0x35, 0x33, 0x00, 0x00, 0x00);

You should always use common sense.

...

Besides that, please read:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/dri=
vers/staging/fbtft/README?h=3Dstaging-next
and act accordingly.

--=20
With Best Regards,
Andy Shevchenko
