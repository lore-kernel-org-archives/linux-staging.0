Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47B1373
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 01:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770428405; cv=none; b=MuWzIc2MuTcESkjouFd3Vx761Vkff/6XWYCirHVhebttvqJD7NQfkycL5sUbwwlEftU1/s9VLVE9b+TlL7zXyaz8prvjVK/daffsmCmstW1KzV6df98Uv8lvhK1memeUjH3wevZsnJBr42zfU0a0WMUutig6e109RIqG0ZC9O9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770428405; c=relaxed/simple;
	bh=M62afnOjhdKd2LSJmpCe4t3odjQlhnPvpxSTbSqb0cQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZgLSMjaYggayBOF9Gib1oItta4taF6Vw9pwMPtqC9OT4fiqcQp5tdMDchluSASxvEBSCWpDsToTc2fa4ZZ1RYZRl8SeIONHUOm7CRUV/1zUAgl6IP/Rrbn9++n3LqtNiUz/UHuXiwHIQzb25ahDMhfiM1xMi3vzw2lKfOrSBb/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5arQMUe; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5arQMUe"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d18d02af68so1891712a34.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 17:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770428404; x=1771033204; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M62afnOjhdKd2LSJmpCe4t3odjQlhnPvpxSTbSqb0cQ=;
        b=F5arQMUe/v3L5k0INCoMN5cAnUZaFFMzjbGo/MjFSjLJB+680b1nJzALD6I2dTXq6v
         PE69RK5wIW76yNnrKreQunM1+FKa5U6XRBYwnfyvQthObQJCpWLW4wvtE8UUJLOADJ0R
         389C7X60/h/7f0kZI4ZW2nyxjfTYbClNxciWt0BBAJwf7yCvpUx81kCW1gbIvvp4gy9X
         neMzmoWKQJuh5ap6EZvheel59YzwKfe2DTebyB3nZ/2Lj7apKdi0/PIAxWCS13LPWYKR
         Sr/6uGVeyk3WPDDKsTvxMOwMZ+XIQRZzgUNgDWK5WxJi0S5rOQ3deFkHP444DEPsVkkS
         r5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770428404; x=1771033204;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M62afnOjhdKd2LSJmpCe4t3odjQlhnPvpxSTbSqb0cQ=;
        b=AcrZtadI3qlXPx4jrhZY0miRE8d5kxFxnTeySeOcYWu4KYkctQQ49X/Xms7Y+91+UO
         DCpXzZ41UohyqDIxpcV1DrmzQE/J8IhABdM1xhdJEBaKEmicctKUhyDNH8T9q8ZRa43Q
         5jIQEKop/zCw8ZluVI5V+Wo6cYdM1MA8h4zgsOEEkwLgscD8IbIqIN8kqanwkZvZCDD4
         OtCecfPIqZaSB+5puBm66hyOGxyNFjfHeG1oflFeyZkg29O2P2VO/3vvGgkJGdUoXvyJ
         ld1NqWIX8HWnOiKjAaHNu6MzOYdrGrPNbM+MYNMyEAXUXpkPr0HmWESZPZkEDVQVtzHr
         7dKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuFo0zCi3cTyIT9MEyXujhc57W/qyspRT86pfzB3Wtsz3jZvs2e7ACAlepJAxqMU6zrlUHD6WIccGUMvgK@lists.linux.dev
X-Gm-Message-State: AOJu0YzckxFNOsUBmJXoXnhZn98Nw8pCCB6VGMv8CQJU34RHFKrOQREG
	iI9PLrEhEE8wGCORNDCO+H1mgMt1mA1no1g7X+5n0JfKYOMWJ++ycOkX
X-Gm-Gg: AZuq6aL1r8yzidI+hjPZJZIFgHC1Dv0QKMfx3ONqww7/SPNI59gd3AWESADkU/K4BnE
	RUPt1iBI9s0bFZqKhSzWgP6HbMdiOX1Yap6/UsIkYKPZSgoow9/6yu0s7rMbtOLZYB/pQ8fDRSV
	OGBYbMcO3gQnTYpOi5EHHOgV92qrP14xRjiVGDQhiTV0liZtwGyBaQtCvsEydWCOHOYqOk9PchR
	siNzv2ASbe97X3AeyaEjuod1Pbl1rOUc8Addw+okRLLjYzIoxfkRvEKIFe62Gz0rYPpMNmlBvbi
	e6ROByrsGb5NTnun0FmR1gDuCMbfLxB9jjBYDqMtq/Jiy222SLXOY6tsBco+7LFfxnUjlK5Nman
	A+oJz6+abfGZ8m9YTcCnhNyrGXHvObDaSAXoq46Qrdq/ujAgA0dtPLd9nEu5IVNSE2GDqrxFCXf
	x5fzjTTwFtm3PMICY0WHMtS7kKcXPTTRT/QICDCGpjC7I3dyPDCaxPt25jyEYhps733xaAyAvxT
	WOPMPQvQElXwXHq0rTo6S+aAhB0rTvupXHqb4pBOYyzyLxxjtDMfIinCQ==
X-Received: by 2002:a05:6830:82e6:b0:7c6:cf19:1df1 with SMTP id 46e09a7af769-7d4646a15admr2050206a34.30.1770428404415;
        Fri, 06 Feb 2026 17:40:04 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:8cad:1966:30a2:c669])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d46479964fsm2725883a34.22.2026.02.06.17.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 17:40:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 19:40:02 -0600
Message-Id: <DG8CHO8ROFOW.2SZIY8A9ABY13@gmail.com>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [PATCH] staging-next: most: dim2: convert
 pr_info/err/warn to dev_info/err/warn
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Zeeshan Ahmad" <zeeshanahmad022019@gmail.com>, "Parthiban Veerasooran"
 <parthiban.veerasooran@microchip.com>, "Christian Gromm"
 <christian.gromm@microchip.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260206233501.5682-1-zeeshanahmad022019@gmail.com>
In-Reply-To: <20260206233501.5682-1-zeeshanahmad022019@gmail.com>

On Fri Feb 6, 2026 at 5:35 PM CST, Zeeshan Ahmad wrote:
> Note: This is a re-submission of a previous patch sent with an incorrect =
CC.
> Please consider this the correct submission.

This line is over 75 characters which breaks linux kernel coding style.
Use "$ ./scripts/checkpatch.pl --strict <patch>" from now on before
sending your patch off to catch things like this. Also, this note
belongs in your v2 changes below the "---".

>
> The dim2 driver currently uses generic pr_* logging macros. Hardware
> drivers should use the device-specific dev_* logging macros to provide
> better context in the system logs, especially in systems with multiple
> controller instances.
>
> This patch converts all applicable logging calls in dim2.c to use the
> proper device-specific APIs.
>
> Note: This patch is rebased on the current staging-next branch.
> It was previously submitted against master.

This should also be below the "---" in v2 changes.

>
> Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
> ---

Your header begins with "[PATCH] [PATCH]" [PATCH] should only happen
once and since it appears this is your v2 it should have been [PATCH
v2]. Also, you used "staging-next:" I guess you were using the branch
name but, the correct way to do it is just "staging:".

Please visit Dan Carpenter's guide on submitting a v2: (but this next
one will be your v3)
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks,

ET
