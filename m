Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EEC23749
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708334573; cv=none; b=KJOoQ/wRgZ30f63CxAISbBFnyoAA8E3/rdcvnZN5gqD/E+0P8NBHDQFaFl/DVVNvMShmaoJvEGQ0XIO6grGNIMsO/55v/UahVZw9jvbwfJHZR0/Jg9RO8qQn867/bnr58agcPl6PCjd7TPpIGi23+S+osYG6iKk0av00iRJwbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708334573; c=relaxed/simple;
	bh=pF0TR3qOdDZ2bsasfoojepgW2ZMQCvSykRkSSHZmDLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yz152NgeZXNxw5wm7CeDatHBgGfef9GYLZvaDgQwIzS+hpYwUOrLqjUb4TyupUl+8L3dL/AkG/1dqjcUeoX6ikBstA2YJx5z7T7WF7WTifpKQZ5S08QX1G4T/IwTBAGniEMFbZbsnlFRtDhioo1RB2zabfGAWbGBvtOKrNhByiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fka81TAf; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fka81TAf"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42c7bbf638bso17195721cf.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 01:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708334571; x=1708939371; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhTvSxJ/x2znzcmUqwk3cNw7/IqA0HFzE48+6BdqiDY=;
        b=fka81TAfY6okUwqGrBsOaDLhmibd/Y4mNMHA7rXb6Lj0a4TGgL93t5Go/ImfTCWpvg
         Tp1dsT+8tftP6cppIRiJEIde2E8pZgzWxxoN01fblRkghI5yHJBXjpsOp8qEWOzMaKu6
         im+zrV6hvV6XEO+8bxrvyGx3rXIYj3KWC+wDMUbezGrAc9c9TWGVpq/62ceuuW46Oyd2
         Ovk6O0kKGK4b7RPGQeWqp2j7ohqLTo7rrVo4NHGkKlWSytp4jUMIpsT1x5pKHvKqIF33
         kVzvE4zVmyTZpEWFLvtgiEF/8lYx0iUFUEAOfH6wv3dDYb4ZFMN/YFk1hwfMlLYJmKNy
         +VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708334571; x=1708939371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhTvSxJ/x2znzcmUqwk3cNw7/IqA0HFzE48+6BdqiDY=;
        b=m3oKFI20RDnqR4HogNXVs7MAoZriH1jOheEsZoV2pZ1m+W3zfsnzOI5XnjG+bm3qI1
         eYSNseo/ixL5tQNohPHV8vxoET7NgLCumzy3uA3IrO4c9XHtfZJ9qxCoeOl5qCOUEQwI
         DKuWD/H+s2+CBhyBL8G9GWAsA4oM1UvuWBICynl1Bnh79rEbT+oGGxPyx9SKOscdhOi7
         uOsBfDOlQ9IzpJHSWgdbbf+QoT9X3sS0FHDtkBkeeD+DE3rRdmIDP/WXDEfmdHJ+jJzM
         QMLxONuybFXxLcmjtUAjsBPWHEJd+Rk6xqyh3SXWiBuaJePnV4aX5ROAPnSYjRWgK751
         jBqw==
X-Forwarded-Encrypted: i=1; AJvYcCUoDohIh2UQ5aGfcFau2kPAXfxgNMPv4IEPWC0N108Q4B3En7BvwEWVMGCRaaGp6wZSBe+gFUwEpMLqmOOLJd0muJLpDQZXczCINDkbzQ==
X-Gm-Message-State: AOJu0Yw1BMQmW1htE8wTMbwtq+orrhSz7eU0mGAo6+W5h79XYgqdWeoo
	b1x7ZUtrFoNlgoPgdl4jA9tTqmcoLFo2RRuaVc4B3sZKNWO5N71w3oHNBfjwV9GxdLfZ+Q2VW4Y
	tAXAFqk2KgTp7/WwoDca6oG4KoDI=
X-Google-Smtp-Source: AGHT+IFuIiX9Klg05+nDcgu9WHG5wGy+trNSqxBYHJHIbn5D7zNfdvsCP6yfkUy9j83LXocbUhqEr10z9ldP/Mh3fmg=
X-Received: by 2002:ac8:6ec6:0:b0:42d:d010:edb7 with SMTP id
 f6-20020ac86ec6000000b0042dd010edb7mr10996685qtv.28.1708334571040; Mon, 19
 Feb 2024 01:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240217211246.28882-1-mo.c.weber@gmail.com> <510574c4-ad26-4fc2-93c4-7b67737f8eb1@moroto.mountain>
 <236d985c-1835-410f-b0b5-cacbd5fbf930@moroto.mountain>
In-Reply-To: <236d985c-1835-410f-b0b5-cacbd5fbf930@moroto.mountain>
From: Moritz Christian Weber <mo.c.weber@gmail.com>
Date: Mon, 19 Feb 2024 10:22:40 +0100
Message-ID: <CAMn1LHB2H6hqMZLOWrQEN-hRQf3LTRU_q-6ggu4=qRDiU5=inw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Staging: vc04_services: bcm2835-camera: Fix code
 style checks
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: florian.fainelli@broadcom.com, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok.. thanks for the explanation. Did not want to ask back stupidly
what the script was actually complaining about without providing a
suggestion on what I understood what it was asking for. I will submit
a version 3 patch for the braces and a separate blank line patch with
both good cover letters.

Best regards,
Moritz

On Mon, Feb 19, 2024 at 9:17=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Mon, Feb 19, 2024 at 10:38:30AM +0300, Dan Carpenter wrote:
> > On Sat, Feb 17, 2024 at 10:12:38PM +0100, Moritz C. Weber wrote:
> > > Resubmit these patches to fix multiple code style checks for better r=
eadability, consistency, and to address errors indicated by Gregs patch bot
> > >
> > > Moritz C. Weber (8):
> > >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> > >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> > >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> > >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> > >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> > >   Staging: vc04_services: bcm2835-camera: fix blank line style check
>
> This blank line patch would be still separate of course.
>
> > >   Staging: vc04_services: bcm2835-camera: fix brace code style check
> > >   Staging: vc04_services: bcm2835-camera: fix brace code style check
>
> regards,
> dan carpenter
>
