Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17635C96
	for <linux-staging@lists.linux.dev>; Sun, 21 Jul 2024 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721544263; cv=none; b=HdlbpClXmkOEvhjTpDtTk7vJ/HuVx8+8f0vHD4MIyY2GSLRdIQypDH9uhaa9WOKyqQHLYcO3ve8W9k2eODvGgMDElAJuwXUzpg9cFENYfoN8vFddVA89Gb9gJFL6mdASO9P7DNUd2iUVivI5r0kfQLTNpnlCGu2UBxGr94R+GGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721544263; c=relaxed/simple;
	bh=xBT8XUjqeEr6XSmVovuSLgaJqzpdgRHs3c+BSx9lS5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJpFHzTiPuPR/UjdE4k1W56WfXUuBMhidH1d0SvQxkRMFV+AShfnKrmZIV12aOLbsP3YD/HoE7U5oCqE6BYBtYNVCMkp8OnnyeuKWEsSF1/jzRTz48+aWmUlw9eMyvzP5DnuJPAyzyhbA4IwDsnpxCS0pI21E8akbxT9oboRypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzWk0PEW; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzWk0PEW"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6b7b28442f9so25933146d6.3
        for <linux-staging@lists.linux.dev>; Sat, 20 Jul 2024 23:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721544260; x=1722149060; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPJcdigsO1E9iKRVwK2am/ZGdwpz/JQTnClQqyES+c0=;
        b=UzWk0PEWSFUxjUAYY9bv7yNpN+bflYncHZC/72c3O586xtEE2dtIf5Naj+rM6Oq0WP
         S0R4MFO7+gvcWSETTt0+iXU+NwUe1nUDNdqOY6+FGbDSv3l6ecVIStqmA11A0L0N0PYp
         iZI61/Pehbrw2B6hXKve6tQHqBg3jWWcL9ulmLTSm44FS8scTngckEpmDO9NlUI7p3OM
         ibtBacATc1Mn4WrhBVnVCeXZCpIPA+8obxLiLIHYqw1QpCkiCwHDs4WUJG0lY6gYlI0T
         UJBGDD0QoMZBYA6yntbdinSRG90x4W+H12fovsZ/4GojDX/R5ZnWMaHChCh4g5e2EH3W
         Q9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721544260; x=1722149060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPJcdigsO1E9iKRVwK2am/ZGdwpz/JQTnClQqyES+c0=;
        b=lOTpl9zd2oDiqbiIUAsfHLVg9+VHdo9l3tUv8TnxBuM+EZwplSOfF9u4FQxPuKt9Nx
         0FmemoCrgMgktcrSZMcPQN05ifUaiT2gwd04pLtYgwvaBSqAr4HjxjA2PmpfSsyznqsx
         TB5BwBXyOd+HwDV1SouoLjL6QQtf2lnNmPIGzCGWo0sjgXyt1Jca4T0jy+kdUP1zcDmA
         I7AGXwmbUhP7DsO4p05UHk7KcUXF0sG4+05ySreWxO3680GzYOaZ3efx9OkTvo4+RUtX
         y+2bul8MXV7JolNlNdYDAUgV/DWFQMm4Lej/9MygetbFtqFdIqWAxmn6RMpg+l1V//pp
         nxXA==
X-Forwarded-Encrypted: i=1; AJvYcCXVP58a0pC15P23fxKFzC+KyyRr+YRtwmOrJfZpfJVCnI8oIxZtiqs02RpLJEnMO79g0HqORDHhIoO2dfTw6TjzxOdWaz16oIYtouV11Q==
X-Gm-Message-State: AOJu0YwVzlpSJSmK0LlBaDD5sIe6fqSQlFkyVDvTJ3Dim/26GVFS9vLn
	PqxHjFoBMDMHQIafJVqfdVEYuo3ZhaqMtKjnsu2IiLffsI82nGxPJhQwtm80QSfFD63tZFIDyw6
	GU6Lw1ZlGFmh68cOWsd11+Mcz4a4=
X-Google-Smtp-Source: AGHT+IGgyD9ti8wZmQwnF7V6YffgKuk/o7VlwLoT58lGnISXbmmswBLmXq5pxisIaB8ZG+Td13r7G+hG0Fmuvmpszws=
X-Received: by 2002:a05:6214:767:b0:6b7:4398:594c with SMTP id
 6a1803df08f44-6b9610efdecmr37501756d6.38.1721544260488; Sat, 20 Jul 2024
 23:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240721040504.1483-1-yyyynoom@gmail.com> <CAAjsZQzTMtsX4bVqadG1ZKDt+8XLUOHGt0bkoBS+M8vqw-X5Bw@mail.gmail.com>
 <20240721050717.dQ7Kwrkh@linutronix.de>
In-Reply-To: <20240721050717.dQ7Kwrkh@linutronix.de>
From: Moon Yeounsu <yyyynoom@gmail.com>
Date: Sun, 21 Jul 2024 15:44:09 +0900
Message-ID: <CAAjsZQw+QRyaUZKoRgevnL6Te_cjfFX8NBhoXR4SPmrL_RD=Pg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: rtl8712: style fix multiple line dereference
To: Nam Cao <namcao@linutronix.de>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2024 at 2:07=E2=80=AFPM Nam Cao <namcao@linutronix.de> wrot=
e:
>
> On Sun, Jul 21, 2024 at 01:43:37PM +0900, =EB=AC=B8=EC=97=B0=EC=88=98 wro=
te:
> > 2024=EB=85=84 7=EC=9B=94 21=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 1:0=
6, Moon Yeounsu <yyyynoom@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> > > From: Moon Yeounsu <yyyynoom@gmail.com>
> > >
> > > It fix the following checkpatch.pl warning:
> > > Avoid multiple line dereference - prefer %s
> > >
> > > Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Signed-off-by: Moon Yeounsu <yyyynoom@gmail.com>
> > > ---
> > > v2: Fix email address and checkpatch.pl warning
> > > v3: Fix incorrect commit index, start with new thread for new version=
 of patch,
> > >         place notes below the cutoff line, provide appropriate CC,
> > >         include 'Suggested-by' sign for those who gives good guidelin=
e.
>
> The "Suggested-by:" thingy is for patch idea, not for "guideline". Have a
> look at Documentation/process/submitting-patches.rst.

Then, I think "Suggested-by" have to be inserted.
There are some misleading by my poor english skill.
He literally gave me a "patch idea", not a "guideline".
Reference: https://lore.kernel.org/linux-staging/20240718132607.13634-1-yyy=
ynoom@gmail.com/T/#m631c138006ea7e834d6ab4c950cf00f1a0d0e3e3

>
> ...
> > Sorry and thank you to all of the reviewers and maintainers who take
> > care of my patch.
> > I make a new problem... I think I check my patch and email over and
> > over and over.
> > but, again, I sent the patch incorrectly. The body of the patch
> > contains improper content,
> > and also sends the email as my nickname, not a real name.
> >
> > Sorry for making spam and taking your invaluable time.
> > Next time, I'll send a right and valuable patch.
>
> Oh no worry, I'm sure people are happy to help. Linux's email-based
> workflow is not the easiest to get right.
>
> If you worry about "making spam", you could send the patch to yourself an=
d
> try "git am" the email. If it works then send it out for real.

Why didn't I think of that? It is a brilliant idea in order to
double-check patch and email.
Thank you for your advice! I'll do so.

>
> Good luck,
> Nam
