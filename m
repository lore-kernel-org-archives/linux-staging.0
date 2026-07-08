Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D537FF50
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511169; cv=pass; b=WerHPE/w9hZP8sSVWQW1b+YCXySox9h2fAoSLpWz1VWaBMU6sdN/hBenRoyRf+UfrQVIrdKD3dabGb4sTu2wTB0+sqrv/qmgrhyfLnrpN5dkZIatdVidUa3C4o+wOwmpKq72C9+CnnPMoVEy9OdK5fBra7+eKSxcbkiRQ0QuL0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511169; c=relaxed/simple;
	bh=eTRFwjAgZ55uKTIXvptBO84lO1AIWMqO2VsrHs7pnSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDLhw76v2E4pcCq+6+xX6QF3dF9STcKn9vl9r49TZbcaxTY49tC/kLEMMuddt5KBsvEG02u6jmpf88C1jBcj0Shpl2XxmcEAYejbSFuu/CleBQAGd5qliLrshBAnO55Jy6JbsOoZRKd9Gmiv7LopZQaNyqgX5CuHlsynAEoZGnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqrvqH+D; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqrvqH+D"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4961446bee6so28523b6e.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 04:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783511167; cv=none;
        d=google.com; s=arc-20260327;
        b=e2H2XEmOmvetJLLAzQmzNtyHjgc5avACbrMIyL6qdfZNzDsI4t/n6JHHTjtfJlU8zJ
         SUFmYvhidHlA4qNvzointrdptuT5V647Yr0AxQxiAVAymrNQ7X0fqtQwdtnhfL30s/MR
         SkEAEs8i1wJnQK2H8BEl+qk9UHcZQ1yGic2X9f62JEpJKwSTBAFsj/u36NVORshQ8Y5P
         Y16PLSuYgAmcUz8d5YFpntjKoshkziWR9x6nUtd535OJlAt+ix95hHwrPYyBHR41mc9A
         Y/tUc8ildTKozrBBdsaXqL/YfFZ+d6mwdpvlzTp/5h/Pl3h5EYt+TNFguZamfUgEtq6+
         wHQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7muqRZWvUhz8t2t+SrhjjnRNlJjEmMaTZhcgbwUwW78=;
        fh=iF+upiwN0S8JobbSYdu9o9IXABfya9LQIy+B/hGKxYo=;
        b=ArJlIcBmv53/2qmTLAnKmd5M874R6Jx6QBhlbTuMmEYHh5d34Llj6hQhmo6aIrdlaj
         mO1NX1gbvGdkV4iSAS/SFQHxc13dYQpw3wJQOoPsn/56PLTkAlLHguxcIdI/rZqNEIbL
         ojFNfD11qjYRUYt3iF5+HLj9fcegl1Qy/6MWDP1GKOi1DMIepm3E1jCdRKuiO9ht62FW
         RIEK/NeLENCz3jUkFv7ueA9nYHg8G4lyUVwMQQ/yqaaJK8kyRiE8R8reGiPqKonElMQS
         ay3sO43p2PYngCKP0qRApRUrXRFU1HgBMgNvM6RshD/12Qd/qFX6MdT2Xd6E0jhdT3Ul
         4Xaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783511167; x=1784115967; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7muqRZWvUhz8t2t+SrhjjnRNlJjEmMaTZhcgbwUwW78=;
        b=aqrvqH+DU38FYsXsg4vuQCOeNgL49xBA0JlhsxRrrIEWozqBJ5nODCvnbD6fawP7iK
         EiDU9J15bDdDn+jLRQa0KzkfPmy36ejY+mjHXeZKaeJbnrIgtT1eMwcQ2VtbDacA/r0V
         0ZCWN5r/G62nXMweYWmxV9T1rNHWruBO3E4NoLsi4w7QyW1N2t2E1Sg+dguegMpAeOgL
         RQcbz46JUMjNbpmxHhIenRdhH3ZI/XU1XRDAUZFVxJzBtx9zBU3K4we8IMUh99IbytH0
         n4XLGX62j3LgrDe70L5/V8Q7Xrn/JC7RTVAxS0gs0IjC740NMgDA3+UNXzL0zts3NpV7
         Z/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511167; x=1784115967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7muqRZWvUhz8t2t+SrhjjnRNlJjEmMaTZhcgbwUwW78=;
        b=MAvrsCVDC6aJ+oprTqKnsiJC6hoCnIDEbIP7sujL3DF1B335dzf0RdddCzH6cn6zCw
         nRKnbeAdyTMRjGzdiT5EHEWf06bf/wwXO1TcnsKdrzHbKTK3YJkM8BuFGXxJdmI/LwYR
         Vl/tKYkPge6M+O05CcJyau1fUhUkNs9TcmnjdXeuricKQQdeQU+20AURcMan1iPV6I09
         vJUAJtwyelX9j4RCk7IJyaL4xpVWpGFr84YCS8q6Zu4A0/6wMAgTS1tnYziCKXRtffpq
         YcLI5DAtzYUZ2X/D/+1kuP6VyxP7H+C5o/QPOMnI52Pk3X4w3g9luNzX2WXfIgm58G9H
         HrmA==
X-Gm-Message-State: AOJu0Yz+C0GPjK9IbzviY9TK5v1m4/CgQodNMbT7wqS+OQNvSVZsP7UJ
	F8CsnB0h2T6VZN0KFWg9wRelvH67HDMOEBB1eVADFAHoqOiOJsndJTRd/k7InA0H+8Fi1lkJJs4
	QLFL5TN4vd5R9mbkuuPAIaD86vgAfNAM=
X-Gm-Gg: AfdE7cmLj8ErHoMyX887duSDvqGDH76AC7eXSvf6KLhVrorj/DbLfW/1szY7WVwE1dg
	iMP/jn0LCzDkXqoo5EE8ztTBBImyHOTxXdhUv8Wt7hSuLI/afX2ZBvU5ZVL5vbPtp3j9ojzSy3q
	xQErgxdaU9r4vjHaLKHyZerA4x66Ycin2rHju3j0kOK/mILPiYVL4NsHycflXgVMZTQj1svj9dQ
	UffeGZ4ZqvmchR7v8WVumOphU+KXP9RopwEF4sGY1zrz4+ijcXgPviVYxuCNid09QwgvfwwRQ==
X-Received: by 2002:a05:6808:1508:b0:495:d2f0:3e1e with SMTP id
 5614622812f47-4a2043d0ab3mr1085352b6e.5.1783511166635; Wed, 08 Jul 2026
 04:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260705193340.14684-3-daniel.guihot123@gmail.com> <2026070718-charging-outsource-81a1@gregkh>
In-Reply-To: <2026070718-charging-outsource-81a1@gregkh>
From: Daniel Guihot <daniel.guihot123@gmail.com>
Date: Wed, 8 Jul 2026 21:45:55 +1000
X-Gm-Features: AVVi8CdPhSWTmP9yWxC_9-Mn6GNB1nC6T_A2pziWBSVgbXb65SI-55NSt21kql8
Message-ID: <CAPLDmXuXjV-DfaiKfd1RbiqB2Tp5nFC+8p=KYjJ5eXF8sx7aJg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces from single
 statement blocks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the confusion, my personal email host failed to deliver to
both linux-staging@lists.linux.dev and linux-kernel@vger.kernel.org,
so I resent it from a gmail address. I will resend the patch as a v2
so that everything aligns.

Thanks,
Daniel


On Tue, Jul 7, 2026 at 9:15=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 06, 2026 at 05:33:42AM +1000, Daniel Guihot wrote:
> > Remove braces around single statement blocks in rtl8723b_hal_init.c to
> > comply with the kernel code style, as reported by checkpatch.pl:
> >
> >   WARNING: braces {} are not necessary for single statement blocks
> >   WARNING: braces {} are not necessary for any arm of this statement
> >
> > No functional change.
> >
> > Signed-off-by: Daniel Guihot <daniel.guihot123@gmail.com>
> > ---
> >  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 +++++++------------
> >  1 file changed, 12 insertions(+), 20 deletions(-)
>
> You sent this twice, from two different email addresses?  Which one is
> correct?
>
> Please resend a v2 from the correct one so we know what to do here.
>
> thanks,
>
> greg k-h
