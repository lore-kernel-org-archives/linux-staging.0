Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2A634B412
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214903; cv=none; b=Qx4mRAC4ttBmOnirGV/MTJrbdVyjCKflgJZUOQ4hOnmwf1KnvfPfvgs5nVDzMoJb8I5oC1P3Vm9CeQqnoc/LLpj7eHxT29VrvebiDV9ZUqRUbQjgpAVGMW7zYsb/IpkfBBrquXAur2X5XH1xLBJFIVMHM2APUMdsl+6LCmCevqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214903; c=relaxed/simple;
	bh=0gaK42RNPyk8nc1U1tzdBLxkFWQ/sK/mabRk8QagP9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0gW2IJNjKWVtLT40ZUd70RSp/cpfCmL6h8XHE9g2bNXRekm2uju9LON3biXE4hdQDc45/EuqhQqdy2klgS0tmRHSgKH6WLhMEaOQ/DAr+P+Lg6LZoYZnBi4JxLvovEhqz6nX75bnXtNLW1yKo0YrSBIFbX8L8IABpuZ4LsyBRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeHRLTE4; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeHRLTE4"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c30365ac43so595928585a.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214895; x=1768819695; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gaK42RNPyk8nc1U1tzdBLxkFWQ/sK/mabRk8QagP9o=;
        b=JeHRLTE4PTMpgwOdqf985BYzJw6ERxkVJVEEhCJsnd2qtUz4OoeLi0aLGCNgFsAgMK
         z9vL3v8jTwjcR/38m/6a97nA4d+htYB08FPsl4wJIkqIWAYexOo2mwjlJkDuJVqcStiy
         1jE/8roQzch+QgWd/kKg0LGGjiTz1waZigkwZA/59HpCseYh22XdMs7lAwfIjQVmu1Z5
         UYkKc9sS5BKppPhNsTTzAoV+k32Xey1KQJKp/2uC1aFHfgt5p6klrbhM+KCfvmOceQYQ
         k3bRyTpOqHH9AUZK9SAJXOqIJ7RUJWbANpa41xcLHJhQpUMRsOtRYiN0WwVTvv3ESk02
         JzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214895; x=1768819695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0gaK42RNPyk8nc1U1tzdBLxkFWQ/sK/mabRk8QagP9o=;
        b=DwstC68Ka4nA6WRdDIIkEaZ2VZeGVwk6/no7MwsG8HyLNQKUaHK3yfGDDUuX1CamMO
         f7XVF6qKTzYfdudZPXtEvGPr7XH9lhJm/ATq0D5A2LEqIvEiDFrOm4p2Oo01YX9GnZpD
         SXkXJ+amxnegZ/yjbci6dMyVO+aKNBKlSd2CnZxn/4He0GEsZA95jzgSieZVsgCOvAaR
         ps8sFYFSF2sEs7Yo3EUN6vzNPfIt9pGhpTz1lrqGWIvnhR0WrBt3OqDxqtAS2J/4uoY0
         oSrcKa5z/HWKBYQnac9rWvOEkjDqaHvJgJqrxqG96HVIsk4Tq+4LFVdQmMWmTO0uJTGZ
         6mVw==
X-Forwarded-Encrypted: i=1; AJvYcCV0AVMc2uECo4dh8Vkd77II2iMl6gD+8koeTigEU2U3Up86MZjLBCOsvY+YBNrzvb9cHO2W5WcS8H81gAiF@lists.linux.dev
X-Gm-Message-State: AOJu0YzpFcBBZI4KJQO2m4pcW9bhUSeS6l0GKZGStcDBZfGgnQHvb40h
	QgPM9VJw3u6xYsMq35mTZWYq4U53WYf42I4AGbg8giqD3eJpBmBSZp7x0R1a9BAW34yh6ZWWgGz
	LXqSa79rK7w1uw884toIgsMJ9rzqL/Xg=
X-Gm-Gg: AY/fxX4O1v35cHov/daigF023kYXatKq52a0x65LnRAHIXv6jE3U71mB6+JXr/iE9gv
	GvzjdKZhfYVGjGKLeOQ0oxXd6EJsLsveHAjDNqElvmpU1nDZ5N1T6ZimBP/HhGp8uVv5Undhtfm
	vFbjWvcVoEe/1zCQcSojovJVUQZHbttcwn18Voi00Wmg3dISlYUl6nPqjpKP+FNWidMVdLCnFY1
	Gu1yyXNAxjT/IoqgBSLHv2yL6MvQ6I2cQ83UFnLoowxeBSaOjdfTLfkSO5RDABEBB6PN8U=
X-Google-Smtp-Source: AGHT+IG8NfNOsx6sZuUS2gU1NVFAAFd2OjiyKHCrUSHt+xop8p9/YgJ4DqvvGMhKFXN7QxY3oWhm/BzgQBf6Y/uueV8=
X-Received: by 2002:a05:620a:29cb:b0:8c3:528b:dda5 with SMTP id
 af79cd13be357-8c38941628bmr2211322785a.79.1768214894731; Mon, 12 Jan 2026
 02:48:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112043429.42615-1-nayana.mariyappa@gmail.com> <2026011210-unstuffed-undrafted-eadf@gregkh>
In-Reply-To: <2026011210-unstuffed-undrafted-eadf@gregkh>
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Date: Mon, 12 Jan 2026 16:18:02 +0530
X-Gm-Features: AZwV_Qgu4tcoGYVExi20GvBKxvb25jfwzvHWxG7lMlYB9DLMf84g4J47ZePQ_3k
Message-ID: <CAN1kxfyr6=q_Qf1o2AvZZiodeq_5wdTfvNXjP+TYABBM7dEmAA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] staging: rtl8723bs: coding style fixes
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 3:03=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Jan 12, 2026 at 04:34:25AM +0000, Nayana Mariyappa wrote:
> > This is a series of 4 small coding style fixes for rtl8723bs. Each patc=
h is
> > self-contained and focuses on a single logical change, as requested.
> >
> > Changes since v1:
> > - Split the original patch into 4 separate patches.
> > - Each patch now fixes one coding style issue.
> >
> > Patches in this series:
> >
> > 1/4 staging: rtl8723bs: fix block comment style
> > 2/4 staging: rtl8723bs: remove extra blank lines
> > 3/4 staging: rtl8723bs: add blank lines after declarations
> > 4/4 staging: rtl8723bs: expand multiple assignment into separate statem=
ents
> >
> > Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
> >
>
> This should have been v3, right?
>
> thanks,
>
> greg k-h

Hi Greg,

You are correct, this should have been v3.

The non-kernel-doc comment was previously addressed as a separate
patch based on the kernel test robot report.
As part of this v4 series, that change has now been merged into the
0001 patch, so the separate bug-fix patch is retired.

All patches are sent together in a single series with proper threading
on LKML/lore.

Thanks,
Nayana Mariyappa
