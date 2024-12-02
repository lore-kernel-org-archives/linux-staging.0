Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74F1FA857
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733142332; cv=none; b=jq1uqZVKeaZ8qCM+d81rkDsJKGigC1rZkfJJWqwaTnNbJUmskj+cJNVyvjlCbOLVxH0314zWYzGM8DanoE9aZ4njrjUPRcEYvtJD7MEkszatFhbl4rPAKgFkKjZh+ie94CG0x3xnNUMb7IR34WW6rl9r8zHMNNH05mpGIlnrxcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733142332; c=relaxed/simple;
	bh=MH3PpIEAJXYHjbdbUJifQIPoYamck30BgsO8TkxHof8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YK5uEG9He57zoRUHGVHoYyJsE2DS2MbZ4Mp2RcAePFd5VUmWM6fDLPHgZ3N/CSYUnzaNpiZGrpKl8DpfjXxERPEewjsm2kwD4q297YSZ5WBXYqmLG5j44t2/zLVcG80UKEQSYSeUehV1Z6bMS24krTn3gtKgZIO6sARtN272vrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-29e71d653fbso178968fac.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 04:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733142329; x=1733747129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHVQETbyFyjqaJ8sBP7gubM1/yZ2n+R3JRCiOlETrzk=;
        b=oP15GPOk11Hdeq+AI6kgJUx2FzOLEE/8Yln6sETm+gwUJljQAf0gCD52nBkpunTS0H
         hK4HpHCHEukyR5okDaHXIE9aQAm5x0KiXwbl5Fu6RGMIHrzVB4++0AWUj9lfDw8ofujG
         ZdpJJM+lyr+m4yYIuhpkPkNdp4vzS5O36R43GIEMXFejj/0kGBYutZCuBUPjljbf6eih
         6zGnw4i9UgUM3oquui3gHhh6bf8XsaKKN7iejGR2pg7vRzC+Q5VbdZBGyTi6tIbD9gfn
         VQXRUdaPi7wtvB0alhNFxR+KT1tsvxneLLapWDzoMkIOIqVgFrz9wteMB38mZnyWz1xf
         qfFg==
X-Forwarded-Encrypted: i=1; AJvYcCWHwHQEZTN0FbMtIVV1VGuqesYZwgDnbJbFS07g+geO6byMLKERocRUwydCt4JCLAzgYIN3EkZaZMoVSTCu@lists.linux.dev
X-Gm-Message-State: AOJu0YwS/mJhErgnjWfcNeJdW0SJN31/3WsbLgUJA+WQMJs8f48cOCS0
	ZRUfiFir8tMCeFjB3wy0ZeL4JLZt6XdSYHW6WnC28A3bwyshhcw9Xl9K5dvc
X-Gm-Gg: ASbGncuhCtl61KreaH01SvWgDjtgdeKXIzHwd5141IlCiIowXoeMRbgcRFiVVtMvn6Z
	76z91k6DAn4YEfPycXIAslHpJ5tPcxXUAMY3e8X9ogkiA7VL5cvYsq5DXDQIVMBPyalZM4/zON0
	Wo2JVn1zn5X2I9xdGpJpDLlCWK7SYT1BerTEFpzdbcYaLHm7a8AWJx3QyFygpJeSov8fOXf4Bwh
	taIVKiJDIOnWpPdjkHIVVOVnrTPRVh7O8gT4mecMqa8M8QgztcFo3vACZ5TOFc4MTzpTpomghRA
	ij687esHq+5/
X-Google-Smtp-Source: AGHT+IFpzqgZ4C4h5k2fBY/rF1w1UPPj9wLcSTBlquaY+XvE7ZzgX7HTW9FxfZF2NmWs2UKJpbhGVQ==
X-Received: by 2002:a05:6871:8918:b0:29e:7606:7e72 with SMTP id 586e51a60fabf-29e7606a54fmr1031542fac.13.1733142329236;
        Mon, 02 Dec 2024 04:25:29 -0800 (PST)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29e42d02017sm1521150fac.5.2024.12.02.04.25.27
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 04:25:28 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-29e3721ded9so996305fac.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 04:25:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVT1NGnxRtXknprt0E/LyNgFFSl39z+Nxp+Q+x2rnAhKdiKA4wFCcbN0xWYMbNQS/nHKlGQrqQCYff5Zuh0@lists.linux.dev
X-Received: by 2002:a05:6359:4584:b0:1ca:967a:3103 with SMTP id
 e5c5f4694b2df-1cab16a8e20mr743731555d.23.1733142326680; Mon, 02 Dec 2024
 04:25:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241123-gpib-tnt4882-depends-on-has_ioport-v1-1-033c58b64751@kernel.org>
In-Reply-To: <20241123-gpib-tnt4882-depends-on-has_ioport-v1-1-033c58b64751@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Dec 2024 13:25:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOib-1DGZ=1wtNkMXocK1vtTN=s41J+Vh3uD56_MSEEw@mail.gmail.com>
Message-ID: <CAMuHMdXOib-1DGZ=1wtNkMXocK1vtTN=s41J+Vh3uD56_MSEEw@mail.gmail.com>
Subject: Re: [PATCH] staging: gpib: Make GPIB_NI_PCI_ISA depend on HAS_IOPORT
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dave Penkler <dpenkler@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 9:03=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
> After commit 78ecb0375685 ("staging: gpib: make port I/O code
> conditional"), building tnt4882.ko on platforms without HAS_IOPORT (such
> as hexagon and s390) fails with:
>
>   ERROR: modpost: "inb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko]=
 undefined!
>   ERROR: modpost: "inw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko]=
 undefined!
>   ERROR: modpost: "nec7210_locking_ioport_write_byte" [drivers/staging/gp=
ib/tnt4882/tnt4882.ko] undefined!
>   ERROR: modpost: "nec7210_locking_ioport_read_byte" [drivers/staging/gpi=
b/tnt4882/tnt4882.ko] undefined!
>   ERROR: modpost: "outb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko=
] undefined!
>   ERROR: modpost: "outw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko=
] undefined!
>
> Only allow tnt4882.ko to be built when CONFIG_HAS_IOPORT is set to avoid
> this build failure, as this driver unconditionally needs it.
>
> Fixes: 78ecb0375685 ("staging: gpib: make port I/O code conditional")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks, this fixes my Sun3+allmodconfig build.

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
