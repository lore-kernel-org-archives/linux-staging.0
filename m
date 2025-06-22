Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7BEED7;
	Sun, 22 Jun 2025 20:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750625178; cv=none; b=s6udXvxbvMdgQWX7xGF4GI41kZWIh8T3QEd2/N8+w6FafX18eh4xdNOyPPCg7Dv/VXIOROhwOKb6oBCMgH3OTo0ubct/18IoR1RC8BSgvWv7yz6+k4zps5L70R1FHUtvs+SWLmXrBgFG2TfYD0VyAMoVtEFxNSplQPmlyCLCtV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750625178; c=relaxed/simple;
	bh=GwKR947l0oDsjvW7HGqBolLdH9hIFFWEoUtSTpR6+4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELiSpBaZkauTYiPP81szfYQJOutY6kIus7nkM94mLTFw5iKIep5jgD7jZ/P1yPSOZX5RHTqNtsvUftcRc5gDyDIsxYyZYKpWcOy3vYUjW6hye0vt2y/tVjLHexgTf9AY4yz6VvtOS0DPfv2p0zjOiO8GXuYAUiG3fzFsogWmuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRlL/+xT; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRlL/+xT"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e844a781ca0so54369276.2;
        Sun, 22 Jun 2025 13:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750625175; x=1751229975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GabHvsY3bDW7rA/BLlKelKFYiDWDiaFpKx8UrlL7A0=;
        b=ZRlL/+xTq9UklnJf8AE6G2VY2SQbCpkKszbNviOdeOCFAWtVHwRHpQdZqj3SxqAGZj
         oGMfdTTuWEOz27SK8XH2Qoo1imw8OOUOl3zDyOpvMD8KQQOcWYLAKfqL3MiFHTDMQ/kc
         Ls0JAYNzkwjlX8AcL/1QMMwkmXVa58NYnrcgZxzTbeM+YqJzSSsKUIL0ukNV0vKDBzzL
         kZjbq4RPxKp6/NpolUipssPDt79orw5pMTp8aT58x2R1Vj9QFsJ6MKyB3hQj9Hd+JliE
         3xpTKfhijIZYT3I9XW1g1Pw5LRPVuAYw0nwjZoa3216G3WRFwZ4cBb0I1fLb8frrLrc9
         k9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750625175; x=1751229975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GabHvsY3bDW7rA/BLlKelKFYiDWDiaFpKx8UrlL7A0=;
        b=hoEoQgxE7GH3Q6RoTTosTyClHE2qZyuQi2Q9BRwu7rXY+/M5/9TmYyBeQhcaL4bk92
         XA4Xm5wXsVyrp16sJyKd2HUfxdeZatrTAVxPugmP7qz6EP7G+8iJFZeI8Iw6qglR9dvp
         l/g4QWMzwktQcrsEC9EDt6VfXccgMWrpeMhVB8YW+zAMtRhdN+gBE0vIC9zwZkkQRMQe
         2ljjA0HaT3uKtbbcv+tBZubo/oJ0uAB0/LSFwyhbeOm8FgWuPF3jk7dral4Ftz6VKKwl
         dXXsCrePjkyl11EBgq4gZWnnAsh+uISYWqFgKWqjdLzsBDJdnZG2LoO4arinIEsWJmjz
         Frpw==
X-Forwarded-Encrypted: i=1; AJvYcCVd/AOnUA7j21PzzcbOL8YyQuBMzr8pwuzdlYDFeU6o0PwiTcKauYW8uroRdTr2YYxBPk9ODc50+HQuv4xi2w==@lists.linux.dev, AJvYcCWphaLKY4EgPvoSlTwHx1pUvbQzEGc0Yk6VZp3/mPIzAAL8I3txREZNNHy//r5kaOdDNabkCoQTqanfs6rxTJi3yFkGhw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5WthpOGsO0M+lUQTNlpDpKLWHo2qpc888NIhAlhpfeRDdtWlT
	mMuuv6IpwxzavsJSsoaKxgnKou9lWv5rSOnALfz1nqxVVej50lpRpvEzno2oqVVv4KpRn/ipYwR
	H168Az0dg1eMOxO2oll00Idvbm0T+AGcEoyExDhxH1A==
X-Gm-Gg: ASbGncsbCJR58M27T7W6vaRgM/4nR9bwYImzoSAu3xJ8svCoucIbkPfrKjdJ1DHaRvP
	RIIK+T2NiY4byEYhHG96Uo2ds5yzbv2IKPTrEMhXbpEZLiEHlNic6nTAM3h+wrxjrXhhx41TbOn
	KKSzNtiT6vEu+ORmr9dIFJ3IDBR336FvPvTLIArKy7Tssf
X-Google-Smtp-Source: AGHT+IEmVlg/KOIX1VTwQesijc92a1D2RId/mLgev7pZcFOOQiaylUYoPLlZbiWQVi5ktMhE8d91KsTNaUz4jGYnOqY=
X-Received: by 2002:a05:690c:d93:b0:712:c55c:4e61 with SMTP id
 00721157ae682-712c64e8187mr66589657b3.5.1750625175439; Sun, 22 Jun 2025
 13:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
 <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com> <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com>
In-Reply-To: <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Sun, 22 Jun 2025 23:46:04 +0300
X-Gm-Features: AX0GCFvlIHgr7FAfwpYiKvbyIOWPCmbwyRuZ8_Mzqkhx21I0MX5OTBJ3q9AxdAM
Message-ID: <CAGn2d8M4vZzJSczv72AFS_ngPiCc=Hg5=U3wQFCtHp9EZvqDoQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:39=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 22, 2025 at 11:37=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
> > <abdelrahmanfekry375@gmail.com> wrote:
>
> ...
>
> > > +       /* Changing to sysfs_emit changes the behaviour if failed*/
> >
> > This comment, besides missing the space, is useless here. You need to
> > use the comment block for the proposed change.
>
> Also the text of the comment is a noise. You need to explain better
> what's going on here.
>
Sorry for the mess, so the comment is enough if well written or i
should do something else?
Thanks!
> --
> With Best Regards,
> Andy Shevchenko
