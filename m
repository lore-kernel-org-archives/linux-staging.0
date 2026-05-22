Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0758283CBF
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 06:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430503; cv=pass; b=tVf7I4FUATEXuUvupoWMqpDarJjCLwf/OIiHkeVXAUnF4o5ht71t971Ly8ImJKy7K7QP85hjclppH3Yrtvt9owoM1AA27ADLMK9jtlMzCFy35Mzqs/E0P7LqCGEoO59gID90mWGuKXO2EY5QmaDbaVVpxH7nqhPGjh3y4YUObUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430503; c=relaxed/simple;
	bh=X1YsCCjb36Nw302TGXZsPybEwjPAbczgMYajk07edqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pL35I93rKn9cXR0qd1c3UCrdCUPf5IKxWIDhzAG0B8INMRTmyM8GWKzysmSdyFVdtytzTrZadIEuu2mG0HAnk2TE/KuY4xyeV6cOHoYD2eFtbI5PsU7X9jVqWC/ybzHmWu9zt9+ucw1m3f5dnN8JkXo1kh2j0NSsogAMBYOwjf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga/Iu/9r; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga/Iu/9r"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so3230423f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 23:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779430500; cv=none;
        d=google.com; s=arc-20240605;
        b=GONlMza9O9m7T+DcaMWn+nOLw7jPtFeltsRs5ps6izHSMYObbNeApnw+jYbyOerN8e
         MzU7Dci8J8/Il4z5Vv/cOgijOY1dgdxHLzR0EMGu70b2dfQ18zE+YANehzCQ1CNd178U
         x79xFMFzKWViXwxgYLDZ5gtvp1GuRzr2IUSDfh9fX+xETrDh4Yymh7J6YFQytRP+NS9s
         sA/B1aRcdPvv0Ru/EycFUT+II5IliiSzBpVlWlqf2nUVJxAF9WnQh+PVOd4U54yfuocQ
         uWGczbKGOpZcJk71cWORw7xFDMUH7cwgjnsUyDQKte1ZyT4W6vsZSwfVohu8LVyntQQs
         IUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1YsCCjb36Nw302TGXZsPybEwjPAbczgMYajk07edqE=;
        fh=aiRgke59QYld/DSa/j8l1wlchb1kvrkKH6Buc13EUOw=;
        b=L0ig9G/qRyo+VXbeVR/dJdIIPHuufPwvc0/OZSp1CyqRR1/DXAM6Ma4qHRhEtcnT74
         XamvF3qBzhbaBlx1decM+ZofRWk4UhBbhLdQfxKnEDQXhfk/F59QUiFIwUK/abQ1Jiut
         XFD9Ps05/S+6JOryhr+xukmX83uG9wKZvwD1JuQE7QPUWxGyYO/2yD1r3Iuub6JgN4N+
         XgngRSic872PHeYw8PT0yT3GiRU1p26A0qFp7Ixkuz8ePBZdnBHpCjH/Ps34fJbXEany
         rzb87RWTIBR5zRSQdviW0PH04h7K/2GPkfn4mfo5gPbVCrlI0ZTkMueym3qigqmbZUdk
         lylw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430500; x=1780035300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1YsCCjb36Nw302TGXZsPybEwjPAbczgMYajk07edqE=;
        b=ga/Iu/9rOkqkJjP56+r3PHMkSyg23HRyPFEUV+2VYY4XXMsd+zjip2ivstAhjq0CZR
         Ji4CKuAkvYVzf0ds0ZXopV07wQxWSzyid9b07Y3KxfbO4vA61STRmHNOC3DF3Zo7sOfA
         IbVMEyPSeu2e7vPnDwVywcd9IUvE1AXgHSfqwlR4QjOzRlieDoiNB+0tkKffe3Jn3Lmf
         SavaEycxeuxxnu+e3Gnx7aFCAj4Hu1PTF+iTt07hctLdhtQO8BPu9t9DpOawNnicysk8
         IWMa6TmOLjnomOMf/b43vJINwlhXPLM7FyfPNJ6rEbIAXx4LyIPdUpzS9LyITA8uo6vE
         3yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430500; x=1780035300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1YsCCjb36Nw302TGXZsPybEwjPAbczgMYajk07edqE=;
        b=NA1WXqTYxvqg10AWz7+2jvpY+jRUqOF3haVHqiroAiz3fnCUiRzkFf4sWTZEtqmCFE
         eOTuJQMSEAZoYHQSQg2keJpRVoDlNBgChUsj8ED9YqgrVBUa77eYL+8QbB+N96wDr+NZ
         qnxH5mxbOK8tCjArTNDEMfgHFrIKGOJx6pG+McfyVYsquIHCZ5a4nMrNKOtm2dJXZPUt
         JdNSyMKt8eA4PzHtF+JXBUIyz/sAo7FgjRjee7P8zWGNupJeXRpnfdSHmCEJ29ON2Ol5
         bJmwAdOAEWAHOyq6ZOCnBF/FZuP2xwFslcBBRHpHA2xFD1c/m+28F9LOLO6tZE5Opk/B
         C/og==
X-Gm-Message-State: AOJu0YzH85bOXHhECNfwGWsp2FXtE21gJavHm4MFtekuT0nDQ5YU3tNd
	5k52cf1Ye/mxkbV9KBQa/DY+vwDkN4EVq8d11RXTHY4C73O8D4gIO833uKQdiUBshKc4RuE1XMW
	Gnr2r4rkGn6ekn8tG8kkela+KKcpNms0ULlaBtSk=
X-Gm-Gg: Acq92OETMrAJm2AbGJcwdAUoK3M8F9c/9defU3pP1YbgsB+TMHLuOv+QRXZp+3F+eb4
	QkpT33hN/oMJuXKZSRrXcT0OIQD2wEOXoUVC9QPS6x5Lv0EC87eR8r/3bG38TKXF40MF0mJNwqF
	rvzU9APYWN44as9dnuJh4r8k+qsUdtV2B1XTR8HRfjHsu2XADlEKdvqSLbAqld0WVNWwBUaBkiP
	HTqnbhi8X579zKaCm4I9jayeiw79RhOFrLeonRlhNKVw57zvaqc6AbKYdtcHG7WySKX9Vbqd9T4
	5xV1VF117KC5yuiU
X-Received: by 2002:a05:6000:4606:b0:43d:68dc:9ca6 with SMTP id
 ffacd0b85a97d-45eb36aa21cmr2834461f8f.18.1779430500178; Thu, 21 May 2026
 23:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511174124.5345-1-guojy.bj@gmail.com> <20260511174124.5345-2-guojy.bj@gmail.com>
 <2026052129-sudoku-stimulate-756d@gregkh>
In-Reply-To: <2026052129-sudoku-stimulate-756d@gregkh>
From: Jinyuan Guo <guojy.bj@gmail.com>
Date: Thu, 21 May 2026 23:14:45 -0700
X-Gm-Features: AVHnY4KULgRQ676wVy95KDwQRFD5jJ0iYxxoMRX4MIJA_FoyExLIqdmDuPWEnCI
Message-ID: <CAGRbmwj0=ybZSyV+xPzHo3T=5b+cpCvyt0du=4dhw_Tuv_6n0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: sm750fb: rename CamelCase variable pvReg and
 drop prefix
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 2:11=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, May 11, 2026 at 10:41:23AM -0700, Jennifer Guo wrote:
> > Renames the CamelCase variable 'pvReg' in struct sm750_dev to 'vreg'.
> > Dropping the pointer prefix 'p'.
>
> Why are you keeping the prefix "v"?
>
> Please don't keep the "hungarian" notation at all.

Thanks for the feedback!

Based on reading the surrounding code in the header - specifically
vidmem_size and vidreg_size - I assumed the 'v' stood for video
(and not void) and should thus be kept.

One related note, I have another committed patch: f50b4602fea6
(staging: sm750fb: rename CamelCase variable and drop prefix)
where I renamed 'pvMem' to 'vmem', so depending on what the conclusion
here is, should I then also update 'vmem' ?

Best,
Jennifer

P.S: First reply here, hope I got the email formatting correct...
