Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794207816;
	b=s69mdsnih8P6t2wNeqIUeB2UbRpkf4dpcAyz3CstgOds+k1NcYjR69cFLfp5qCZoan26
	 59mxIfo0yhVvorLEMn/E+MiJP3vo3Sy5dCF11W7QscExbwd9zPKZkZbUzpvm2fr6aRC7o
	 E2cv3VbL57Q7M4XmmWRzB9ixCveOfCJQzFeyvzACMwkhOc5NDXRuR1ouBXHeuMS+YwIsJ
	 TcR0qMGOrMo3mttcH/uwzbZPzv3YkUUsieoOXBilpLUcv01f5yCUqarnIoKWVliNolj5F
	 uiWkK8xOXtOaYEa3hZLi2EQoVl88CkDt8C1yOnTqZ1d85WLiboC7LoRQcyfHQ9ctK5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
	b=VVhngQBjn1+9gKlXM18Ed6giOCqNzwxOiHTQbaJ+aQkFxiIdgj4kQ+F1InimPSiNo/nW
	 LPj0WtCMVeGy1xxHsDii6R7hQiTCEvo6u1KRXtUgwO7/YevmmfK8w7ChIMsrVwZakVSYh
	 3v7wySur+6TAjnyNYQ+oKa/I9Lediy1d/cZomc+npwOg8ICn5k9TxhkgOcL3wqy1QB31h
	 IM3/LkL22xdgl429IVDYgxJgoP/L5dZhr4lHDjloHqtQZaPsHbQSrG6i9+D2A4DrgJ56Y
	 zn9tfcVO2yJrczLuVfW/cuyYCrYYQZGVCTd/AXg3iZOqyaOiX94V0jheadoUEvGHXjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPKIebCn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6CF606A322
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 07:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6CF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPKIebCn
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b305e10ac7so4083437b3.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 23:03:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794207815; cv=none;
        d=google.com; s=arc-20260327;
        b=nU0dhnDniXIp9a+GD2fcn7mzfFwQihKiF7gIiypBB6WWVoutIKiXFH78VG2kNuF0g6
         PVjv9MveC0GeUqxM0xkKoNDsib+VOTfXhFiobO5Rmh8dXafByiD2n0b/NVA9Rn8c6SMV
         npcBb2xwBhL19Y1JWZ18mCAbg5YWoBlSodiPIX2NXBqO2Kqkwh+uGvSlgRi4wNGOwYs/
         yCPTJciQjVZGAWKOVs422Is42fgmtNadKg/sVXVdSTa7XX52dOoefqL4ROWFn/25f09y
         4NE+75UcFyas/KAFgikTM9G9Rp1uW/mX9rj9eUefZOYH4lNs4X57lse73+VTAGRQzKu7
         kLIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
        fh=+CEn89q7aoJSuYIgvP95tD2gvEwrYJu9BEcbG+XVDrE=;
        b=dDeX1F/mv8hl1ZsetJJKEhupPlVvY2hh+zeFRKx91+1EVb9GEVuZQgGhrUku17TUQG
         TOhpAj8OzO+t7vwBCrF910FSGHFV6J+LiGVpBRO2BhTk9EEm2uFkpY45Dxc89ZPgvF0X
         IPSEhkOUgbr5cOCeXaHRupS7X9efvkEhYDq1qcytADWmz68rNUT5jiwlPwiFBqlP4gWt
         OHgqQTzwIogsz+lMFDhdztdZqSbXeCpAEfoEygm66Mamcw6j6aaWwPdWyK5XNw7sKwdY
         pMGo2gX9wC9pOoUIMvx9ZBRYrGKRlFxwImJ2Cxwq1ys9soeCrtUD4pExvJsi39R9WbrY
         emVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207815; x=1794812615; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
        b=RPKIebCn/9CubBl8BD+EJ3apnNFNZFgwSD1qBJjZt/+Q9L4y3XdTf7Tr7E1+gifBEW
         QyoKH+aERZrT/s5oPkmkXedGgkk0pD1ILR9/s3+JyR9dmx7NieR1uQLmh/9DQv2YEWDW
         2lcwnj8zTH7JCHsB44nYaejInM3CU3sngrf47yv0gaVuYkH+JlOHTWyCgHSztrxC+iTY
         nZNNSkj1am3qceqGBQGt5Rfgn33UhGGk0zdXgMAJOBDrhbIx5FUXcRqCNA0KT2zrHvvO
         91nkH9Z7JChJjXiMzJYiglVRP1I68/UJz9EtZdBq8O6sl2G55359glPdRqgw3VBact4t
         YCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207815; x=1794812615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
        b=VZSgsbj4QpOy7/g/OcJ2NQQr/OizwIRs/tfWEdboxKcKoxp0q+2rxoo1wpJOi8Bnm4
         mbPadzO5CQLH19eRkeWfk5iAyA+ezk5egMo7gTGZGj2kQbQIu+5hLCds8ZVBKtQn1fgy
         b4XfRrJdWzjexZB9Vs1lH0aiJDeN/rqep+U3WmP+PXWC/zDH4I4y6HNraV/h9M+p2cYv
         ML02lhPWPXSLHJxZxFMEaDDncNwQGgcAtAsGTCGyBFtNxDWHCr7WoU588Sh0U+24kB+f
         v5XR/inLczVWhpFrKkX0G0Pod4NQ9tn+ZbTYyhtf3WbYbK+0VfZS5Lh4TmYi82QN+vyX
         F7hw==
X-Forwarded-Encrypted: i=1; AL+hErEeqC0ZIiPOiNMjIfCUgX0czBeCfX14QJsCf+mjHdp5O8t9FnbaQHfYBWwQJQSkw1QS2j0ZQ0Hy9I0qJEx5@lists.linux.dev
X-Gm-Message-State: APuU4Z+in+JXJwxdKRKTpfl11Ig17v6fwpifWiOIf7O7SEtkU9SYKe8S
	O9eKH6yLajzeHOgE71jHe7yAr6HSqXkkCGghkRqBOtiPkkDI8lBEJTodZQzYuKFnVuJftCp8YWx
	Fh/VELLHs30CLxZUH0EjSMxrrUYN86/M=
X-Gm-Gg: AYBFou11OgcZVPaTct/CXEDCWz8ckZlqNvKGUa4x/hgLki7p3kYlqokqg7hSuzPMe9B
	7B1yadekTh+p1ctKjaFbVFGdjQ5EU6mFQspm9I512rewvQJV9vpM97EJOpUkPnuIKapZLy3HuAL
	/fXfeLuENAyMG7Ri//Zttp4qSAH/hUw+JTETKz1dXgGLVeMkw834/pL0k1j669VdbEecVBkbfTR
	GhIbWbAIe+qzgWjVWKK3M2SEYq4OTrr68WqMq2xnM+pgp1zRWvgx3a+mzxcWeJNQuw31sVBxU0q
	p+VYB1+QarmpQZye+KRXMiliUi5aD4yEm/DzatLZiyIGFP999zcO+bNtOaxisX58Jm5CvczTE3E
	QBoZr0mlMEDb1VRBVVv8sJh5ChoGMG4KEId77ydNnl4dzK5aRAW9WuHRKvMVpdGcUBGQs40VPT3
	s/EzdQVdiZIYS/JqnH3vf6Dm0r3S3yDiFQQM7Vg424Qe8uGrsCXjYzGvE3sW+G9bWUPpio+yZtG
	fbiNvoMptqghyQfuv9+jKFBLTWPjITvwYcYrJzNFPGifepfCWZvd9jWsWwp7g==
X-Received: by 2002:a05:690c:660c:b0:8ae:87e7:9ab8 with SMTP id
 00721157ae682-8b36cc76c39mr19329247b3.67.1794207814910; Sun, 08 Nov 2026
 23:03:34 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108122840.85622-1-lamemorupisi12@gmail.com>
In-Reply-To: <20261108122840.85622-1-lamemorupisi12@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:02:58 +0200
X-Gm-Features: AclHuK8X-gGg83Rocy9patxQxAua7aQBhheDPf_NlOZbCapPhnChNHY7jAPPHQE
Message-ID: <CAHp75Vf4FFLvGCZ8PxwLXDuv9GNAC3Pw0ud=KCdgdsQnbs6AKw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix block comment formatting
To: Lame Morupisi <lamemorupisi12@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:29=E2=80=AFPM Lame Morupisi <lamemorupisi12@gmail.=
com> wrote:
>
> Align the multiline comment describing the MIPI frame memory
> layout with the kernel coding style.
>
> Move the opening comment delimiter to its own line and align
> the subsequent lines consistently. This is a formatting-only
> change and does not affect driver functionality.

It's most likely one of the very first patches to LKML by you. See my
comments below.

...

> +       /*
> +        * a frame represented in memory: () - optional; data - payload w=
ords.

While at it, make it consistent with the requirement for multi-line
comments, id est start the sentence with a capital letter.

> +        * addr         0       1       2       3       4       5       6=
       7:
> +        * first        SOF     (SOL)   PACK_H  data    data    data    d=
ata    data
> +        *              data    data    data    data    data    data    d=
ata    data
> +        *              ...
> +        *              data    data    0       0       0       0       0=
       0
> +        * second       (EOL)   (SOL)   PACK_H  data    data    data    d=
ata    data
> +        *              data    data    data    data    data    data    d=
ata    data
> +        *              ...
> +        *              data    data    0       0       0       0       0=
       0
> +        * ...
> +        * last         (EOL)   EOF     0       0       0       0       0=
       0
> +        *
> +        * Embedded lines are regular lines stored before the first and a=
fter
> +        * payload lines.
>         */


--=20
With Best Regards,
Andy Shevchenko
