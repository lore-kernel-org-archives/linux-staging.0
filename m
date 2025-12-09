Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8E027A93C
	for <linux-staging@lists.linux.dev>; Tue,  9 Dec 2025 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765290349; cv=none; b=EUgm6fxGdMwct4wybjeb0LCrrogRtmyOANnF/450SMbowB0BiYwflMlhe+GDDueMFjLxwEDU8UqzOjnGU/Slmu3ckHF7bnAP2O9DtMy94zfmNH6wMQLh5txUBVdNWgbpxJ2LV7WkKnGD6lqIOK749r18eVyzR7FCPjow09Jts2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765290349; c=relaxed/simple;
	bh=p/QNLZHkkEp+08g4pHXLslu5TUvKGyb9J5Qo1iBjVxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBwIzam5KBeoBjLwePOd27GwhUJrrHRQTEbMuXk8iItvViqqv67q3eUx2sNC0KUvGeGoX7EEFdm4r8eawg3SIs2ZU3cknDL1ZZxP2Z8RIvtu1zOOmoEnMHchCTR5+OsaHbpzoTUluPRvWivKjCxhDIsU6zabW8Y2W+a3rJXH/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsvVCk6V; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsvVCk6V"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b72bf7e703fso967569166b.2
        for <linux-staging@lists.linux.dev>; Tue, 09 Dec 2025 06:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765290346; x=1765895146; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tczTAGf+NRaPH/lcY4iGZ+jG9JiJwZWejZNNrAcawA=;
        b=ZsvVCk6Vsjkk+Rnb4RDZKZ2MzoF4D2CIMpzES2j+7kDhNkay8NwST7yCzk8QJLYFpO
         FCx3PHUcHrOXlMEvJriRt8YkIsvoEOzmGs1xyBzWNqU88yA71HEktxElDx16CVP6PZFW
         4zMZBgLWZKOJ6dJVxOjSg7IedKvZCPUMokUxLFueBCK3wIPQ5L13vxjikqxiuul4PW/t
         PQtTBDXTSK6RBRAXLmdyBnOrYKiIQ8ixYmNMxlsZglhWkhBxlKz57NG3stNHrls9AqzU
         7zqEDuQV1RkLy5AqNNVCtjPOkL9czy/XVUPmGk56Qutbt0oXQaDWEDMHnWwGu4WqVMwW
         DCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765290346; x=1765895146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tczTAGf+NRaPH/lcY4iGZ+jG9JiJwZWejZNNrAcawA=;
        b=Fv3OqeELy88qgoQIFnl6A74rT6smq0LH+n0RLFVeoDjDEKd7saMbBeR+LjspgeyOhK
         ngJ3pu5QStbLaUeyQdzgCSYkJDiS5TcIiBRhUgsL7QLDXFEY6Ql0iP0C05ooJFOWUU6Y
         kV3lyjN0tVZOLVKBu7mrGYoEJXoN93VPG8eHDqyKVMPc7TbNfX2zyufl54QgRPkZ8UnC
         WEH2kQBKlF2lNDHyigJ4GsvP3Jht8OsrLaQsReLPALW4a7q164nMenBlOPc9QqNMDOpG
         61y9lMzoxPb/ZwfeoeT5islOfLs8rBSW2FgYOK6O6nLamxfeNX+D6ZfuFlWpxjM5B2Sw
         I4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWyMI1G+5Z9EZcUM5BSSgOtqcSfK8EvYwXDcnQ7iRsYHWDwOXcy0KXlYlDxgNRG/+KLJi86b0FsV76zuVXP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0nHWTcfRek+VHZj7xS/DDzyygcaep7C7ogZrmr2TeLDvxc/WE
	+ELHXarmXCYOsGc9AxPzGlibChotgZ6UeS4n9/v9NtbBHp77NT86kq0hp8yoVBqGxYdzf/xEtUF
	N/GICz6xNMeqfsXnt3HK7e18Itpaiz8A=
X-Gm-Gg: ASbGncuvd/yCFkxwdLvPVk+CJLpRcAmTHhqvu4AxJCcfmxIalbJTQlB+xhDeoNcuX0Y
	8+p2BvLvYL59aFobdCXJ7EoqIAfiXwj6DaNkUYb0zGaRTGzg2s5EA0D5hgPZWrrW+Ecste6TzgG
	dppg7lrX3p2+f7wHDPrEBv+ovAq5AvN7K4RFq7UsFTWunf43QLXsjMvzF6Gw48TBmReu+YgOqdT
	BdXpbEiz6ewiQWjDqTbR0FdVRP6/qf7hACnIQO2Q4vrImzFqpuf/8bkkoTHqNmIPAaNbPy2QHb6
	qwNDiOvALGfgVoY3Ugx6Yz2nfFFqBEvBA/IUJDMOWPHn9Wkj4AnVG6MBcAn7qSOtWXKXew8=
X-Google-Smtp-Source: AGHT+IEUDyZqURELnRBTzjTZuETiToxli9ABhMGm4/e9CoRb3wfwUJvgUlRqDbyn79ps6rpZIghHoUYB7oNXT7FULvM=
X-Received: by 2002:a17:907:720b:b0:b7a:1b3:5e5d with SMTP id
 a640c23a62f3a-b7a242be82bmr1105272266b.8.1765290346242; Tue, 09 Dec 2025
 06:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209042744.7875-1-chintanlike@gmail.com> <19e8a1b0-75e3-4c8d-911a-15fd70f60bea@suse.de>
 <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
In-Reply-To: <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:25:09 +0200
X-Gm-Features: AQt7F2oJ-HAqvTo7dPHCW2Uqr5UaQh_WR7_Bb48h-O510S-3IyA861WvQJm_2eQ
Message-ID: <CAHp75Vds8GP+daMe9WcEbOaNT91kMHUjidzGUN-1_kVDuWBtLw@mail.gmail.com>
Subject: Re: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Chintan Patel <chintanlike@gmail.com>, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andy@kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 10:23=E2=80=AFAM Helge Deller <deller@gmx.de> wrote:
> On 12/9/25 08:27, Thomas Zimmermann wrote:

...

> This whole series adds a whole lot of ifdef'ery, which I think is the
> worst approach. It makes the code less readable and leads to two code
> paths, which may trigger different build errors depending on the config.
>
> I'm sure it must be possible to do the same without adding more #ifdefs,
> e.g. by introducing a function like   dev_of_fbinfo(fbinfo)  which
> simply returns NULL for the FB_DEVICE=3Dn case.  Then, that value can be =
tested
> like
>         if (dev_of_fbinfo(fbinfo))
>                 {...do-the-things...}
> For the FB_DEVICE=3Dn case this will then be optimized out by the compile=
r,
> while you still have full compiler syntax checking.
>
> Thoughts?

I second you. I am also not a fan of ifdeffery when it can be avoided.

--=20
With Best Regards,
Andy Shevchenko
