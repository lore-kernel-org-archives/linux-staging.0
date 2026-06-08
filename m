Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6F382F0D
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 06:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898879; cv=pass; b=itCMBwZymaND6S65OKutR19X/LcOlqpyq2Ah7lzfYXwZMWERnUAt9hLPwOOX8YbL7remZRmLhcb3n4bSGXNokZuiNKT0vL5VzU/BiHM6vFVKZmfI5laHGza6V3c+Mq3O+g1/fSat//UYV/179hZHABGaPuNimX+mIEfgu6hqI/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898879; c=relaxed/simple;
	bh=aQx1aBx3pJAjf7b+AK6aN2nd9CeKmSYl8X/XBRVssB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxm7jp6JqX6gH7HFovcAhmub8oRyRCOFfG4coKJ+BUsK/uoI5wSG/g/syvHAkH6vAHeoiaSRNHfxvNyLIYPyU55lAPZoeYjQ2/rF9pr4XNF/qPARYkO9NXYPGkYVjvMSbsLs4zziIRjbvSJZ9BGAeWJYfsY+5QKdiej4/CxM+7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOIqi5ux; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOIqi5ux"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bf0170c80f7so629631866b.3
        for <linux-staging@lists.linux.dev>; Sun, 07 Jun 2026 23:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780898876; cv=none;
        d=google.com; s=arc-20240605;
        b=JHopbJC3HamnN3mXLmA31mqXZ5aryLM4QXujj0d5YKhfzJTTsm0SNLdFSAhNAn0D/Y
         VhqViVr51HO1NaAvVpD8v7i0Yl8xBtPz42QSXtN0ztqdbbNRibMLdq78uZWp5RQRWYgZ
         44HNrLqH3dObTfk/QikqGQNh2Pj6ouG5ME4a5irR7Mt8lc31B2CtZ7Zsk5Edjpxc7lw9
         FUcs4WNB09ZwfJynmUhBU05JDP6H9XYpMmDreFZa0j7gaAtxmjB0qzmVsrPCY0iXvvFv
         kV6RSaxm2QcICbaNfgoptyoo6COzL7wSPF0RTAvBWigf4EdFJEeTmckhtzCHcA2RdA3v
         Wcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aQx1aBx3pJAjf7b+AK6aN2nd9CeKmSYl8X/XBRVssB8=;
        fh=QX/YIfuo1YdRumFMDXjp9flsGupoNobk28qxEA9LuDM=;
        b=J+9gRX5SLSt9aUL9t5heDY6P/PQVotd2QHN1AnxE9MPB7OSklQ0IaTZ1nITPNkg32U
         8SPw58HQQFGOZBe1f4fpcPqkJb+MljNG9cC9Cw3/kfFRZwLT8jisa7KUR3QTVYtCg1qd
         RW2+sxYprVbwoNI1OeSoCmoiMdqUKGB+Q1b95RdFxPjPrxJxhzBsoGaKYWh7s2A7IegU
         /HCgv2rPfpc2bRXvXELOhDGvTB/Hw5Q2oQOB9Xw/3PCwVI94Hl2HjPRuZdEY+cFb+eN1
         R+wK+8qT2pfmh4jDyiNvNN/nvUVsLkyidxvvh7aEGxDbGaqvDfwqwwWXTkIUzCakoYfb
         hnCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780898876; x=1781503676; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQx1aBx3pJAjf7b+AK6aN2nd9CeKmSYl8X/XBRVssB8=;
        b=oOIqi5uxGdWJNwkQZVxNe7OL0tQ18OYBPL0clowi/vpg0sY8/qZEUV+5RkUrUoGb5i
         P0XxVJrNFR774YBF1paLmClDXuGtCKRjMhG4l6KqYZ0HHjmVspicaAPG9PlfDKdLV5wk
         Yf6NpSMuUEckZmnCNXudMGjMjoziFZpXJBCDwigXOUDWGT45fS2Woz43XRIB9ulu6ImT
         0Xj7vw5F3JPn6VxEGjrRu9EH16Rwgc+dAUGS/Y+zAwBq1ET6Gt1hAUYCZTjhQCwO8TBk
         CO+t+DVlh9qeHPfK4fExZZ4V8QPGsh3fTqJ8hi+1pz7zsF+bz+yrmJcEZA1PgIYrwXlF
         zfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898876; x=1781503676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aQx1aBx3pJAjf7b+AK6aN2nd9CeKmSYl8X/XBRVssB8=;
        b=TFebW2/zacDaT2J9oOg9qbx+Cu/bETc+bHoGYiNV+S9WniMjJgt8jEdv7/m5WGrQ+A
         8FqXW0/wnOdp5nfHLb5p08l3JG6muCEedxgMHnyrkeaAbXn6TZLYkEFtB+sMDlu9n5UT
         ixmkuSJvZ9TdjWObQ2hUCOUUOC8/JMzW72NBTdVV+KGu6AvKbUnigiQH007JS+7WTiIY
         e1+XY5UiCOaJFH76Wsep7JYszN81FndjUNdnA/MLILdj2N1lvrUNM+5L1iwQ8RJULtEU
         l2+tD4/ZZnYX+eqf5xmFJCZ+GgsBxtG+TUWVsYfDRYt3Mb7rPqfYabYK/VmPFQ44KjcU
         9muQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZTazaXo0FM40RC3p5gzjV3B15gktImP2+gY3KBUkeblogsaXrdoGzosbWAv/YJc6+EOpRUlmCpBCSm7RI@lists.linux.dev
X-Gm-Message-State: AOJu0YywJVJjq/x7b/xcH756u1YHePXfXPZ97kmNZUnA0U9qFHIWyl8V
	mgoT2W/IATyrl4ViFb5Ju7mBDijklERUmtoJgpu6mW22o7y32a1PH1GnsCr+iUVL7PUYEdPmK2P
	VCS9QIgU6RN846XHVwA+WdwS8gwfDr4s=
X-Gm-Gg: Acq92OFVD4hIXilaTdeXdLDM0ubLI5b9cokY3Ig7ufIgv4igqly+vJ0ChsBexGra1jv
	smSDNUje/TtB7x6NfjGJTRoej73MvWwJpgyNk3PxNBeeZ2QX37LnfabLYOKyYFKoKX4+Lml2UcF
	iueKyqkWTu62xWwJ5hkZmDPyPIYEDpk8n4f/WQs/HSGvNjbufhosAyMLkEE1nkYw2S8Zw1N+wV5
	zaNow2RHZtTtvvRCNBG0VCHeOAyDztuxmVDhWHEiBmSmL0i4wm6PRGpOOSlUO4aGvlXfQNrrNOK
	oiwhuQhJqD425n29lOKPDW2JOtu8STANthYJTuXxtwVZr64sokQ0nmxUqTvxg/glOKsWNDO6xpJ
	tQTGHIUAoj4zlYs/IjOylEi0pH1JnMg12Z47Jl6Sgvf2Ga12G96Ks1ahycdwhdq5GIZMqLKUTOJ
	bAswM=
X-Received: by 2002:a17:906:8a62:b0:bea:a8c2:3d02 with SMTP id
 a640c23a62f3a-bf36fba1b5dmr514497466b.4.1780898875739; Sun, 07 Jun 2026
 23:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260607201708.88644-1-ilovelinuxgames@gmail.com>
In-Reply-To: <20260607201708.88644-1-ilovelinuxgames@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 8 Jun 2026 09:07:19 +0300
X-Gm-Features: AVVi8CdSZ41x6EBhGrW-maqYqFvmYxaB5rlMq92vcxyr-Rwo3G25Posh805oQgQ
Message-ID: <CAHp75VfcrHn5R47PCDOoNnmLNbKA8sX3Jz9T-AoMSnbmqqyP1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: fbtft: fb_ra8875: prefer usleep_range over udelay
To: Georgii Druzhinin <ilovelinuxgames@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 11:17=E2=80=AFPM Georgii Druzhinin
<ilovelinuxgames@gmail.com> wrote:
>
> Replace udelay(100) with usleep_range(100, 120) to avoid busy-waiting
> and allow the scheduler to utilize the CPU during the delay.

Nice, now go to the lore.kernel.org mailing list archives and check
what was done previously on this and why none of the similar patches
have been applied so far. Also read README in the driver's folder.

--=20
With Best Regards,
Andy Shevchenko
