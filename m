Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4CC2FC890
	for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771319580; cv=pass; b=uqp/LF/p5GToNaQpN0VZbdFSeNORhFtvJJKbSWk2FQkpCzZzr05VoMx/qizuzQEpxngZfQn9YVLSG9SNSjaFkgBWAlBsj0Els1oSr3SjzGti+5OnMMc6lReR0CfEpGcbs8QEWTi5kxFV6XNTxmUfdI6VqosK9trsFHyGDSq8fpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771319580; c=relaxed/simple;
	bh=fkfapQKOOz0T0SlwxZVg9aWNfrMJSPjtvhbxW//6/34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZc1pT7z3GXccnhatUJaCdKkzwlgWheUx9epPyq+JHXDyJhztBLUcoDch680D5rZqCpqvAIeqfPdgmIBMFmAbK+LKnuUWBsRLCRK2+XYlF7g1cN7T82HByy8lv20efBMk7S0at7oD9GOz0ZHcp2/AhS+Ygg36JMPQ5GGYWhGlOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdvfPJOn; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdvfPJOn"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-794719afcd4so36469417b3.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 01:12:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771319578; cv=none;
        d=google.com; s=arc-20240605;
        b=QV/1YjCNi57XRmY0/qc1Wy05J0GaICh96zb4j/p7943qBkttc85FEO7cz2PglJJSNZ
         qTGu6fCvCq0e34/3ha5dLssAEPn5HHpiTDKbioSgY8NQFlr2XbR2YIXtxmUej8k55gLi
         KIQXOguPYZxGq28yS5pW84/2TUQfxflYe4vIH+eTH6Yr838X0v6vSgdy31xdGHAHDu6S
         vTiHLsGTb+5ZDmycF9jXvmbvWA4hxKmdeNDDDOdVF4zywwAayKHafEYjEJojZQXfUeIQ
         xaxnEoiJtkT5xunifmOtLDJgfl9z3+ByCISsPRmt96qrOCps+RhC+cnY/X6JfqTVRHuQ
         fn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fkfapQKOOz0T0SlwxZVg9aWNfrMJSPjtvhbxW//6/34=;
        fh=pW3398YCDDI12NT56rpKr9/3mMrK+RZFQ6I92sKFaU0=;
        b=VzlKYZdK44BoUURyRtuitTv4b05z/JND0mrHn+pxUzK80oCxwr70F2KRF+eSFzjY56
         +razXSLCfdqfq1hkC6F048YqavZ7jepZQFGUmNUOft6sYkfLl8PyPHqxqH5oCV9aXv0D
         ypPlWuJt5rd5CC9bbELqYpU1lmYOgfOmnD27S2bP+qZ1Lur0gj+xZtnglSvCZLUpfUBB
         Fl+SdMFRjhAc1M3/z5dVnAaRsKt5lkqbWngfWNOfwneqnN/xS6Skefwx15uPeJR4ofT+
         xY9CspEEEv47Cokc6D7l43SFVI72BIf6jTrGr1doegykmfggeLKph8oPaMSD85Op4fIJ
         cjpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771319578; x=1771924378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkfapQKOOz0T0SlwxZVg9aWNfrMJSPjtvhbxW//6/34=;
        b=KdvfPJOnho36MA/7c5VolwbosjNwnwt3VDCg4jbo+xkgFKPygcdL70zqh9h1PACAnd
         5WhtsLINq/kg3xdjcR+O+6ay/UxoLvrzEU78hd+WzXVtLkxOU0DwuNwtBjSjH/HgoRpx
         +vVSnZPaKJnk1YB9oRQwnLo1FDqEEbRL9DtMW6tD/RaEK3DPhWHyG+5SL76ldmijTzyP
         /faWpjPkq5H8DS7Hp7zqf1hfWu3+48RYd7WHik/6a4WQb8Yw6/jlzI3QVpAPK32nIcCr
         AkksX3Y0PLVBS/Ab/qp3gB85dY34msLIDQlasLrrvi+GhNPfIGQmSRyA075lYi+PFpkC
         Ej0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319578; x=1771924378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fkfapQKOOz0T0SlwxZVg9aWNfrMJSPjtvhbxW//6/34=;
        b=NBBYZGc4r/pKJ8YIouJH9v4MX4TSyu1kdVZ3AnEIrXv+6iBWcbbiFe8n49RjVGa9Rx
         wB/X+HxXb9gbRC4kAOGodEV+ry9VFnHBEgGzKsC3I5SK21qlBUyqAQeVNAklZTEoiYPz
         tXUaAWn2LPoo0DS15ngL/hLof23sKWQUfzf2YERdYa7DlDGrjdsthqVyYd0t/Meae4b7
         53K1QGkUIx6OTrReXsCc5joKWfIuTWgdhnOufw9Tj0pDc2ZABXZLDYRm6eLRJmuHT774
         0cmWiFUUmd5SzK+AmU5STHuQ4PTmmLHcL7Rp7uvdJV9Am9jLZrSgQVIM4qiGssNhBhfI
         e/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUXqGxvaPViHnUz/V77i1/8ej0TAtKf9BSYkw9j41eMFzIkrk1dbNCa6m9nSp0jLfeEtTFyWB/YZgJMdvj/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5RBX1B3pFFyCqOukz5PMX02r/XrhpdWQuhpFc83Ps8ZfNgYdx
	S/t5e2tX4lUrSbOO5fM3g5dJM2raFicDtKNg1/RCF+kgHoIxRnvm300Kej6DigbkUBfQ63HAJfa
	R4Rjbs6f8k8ybQ6OlUGrf1F4b26PZYew=
X-Gm-Gg: AZuq6aJzk4T0uNIaq4RBbZ82QIDIY7weUuQq13gaR1FQuekaByJnv1A/DmDZq6fnqgC
	LaB+v1rGhijt31Aa2SpSU8X18pSFu4fgTLSPgRvbnWr7t6ab/GEgZzygpoF5MFS8zqSZD5dLduo
	Rgp7M0fHtA8OPsoOv8c1bqEya/cxBfAUbsRm9gPdd+JrIcjEoqAjBhLsJKjUD/qCa6CeHaSryaO
	1syOYiDCBOFcXIby15oUI/jHwvX7oy+lsVUvZkeN5hzPJYa9TH1hVz+5ufCxqaoV5e7qwHGQPQv
	3vaAPZirEq4=
X-Received: by 2002:a05:690c:3343:b0:796:6c4b:294c with SMTP id
 00721157ae682-797a0cfe20emr99595897b3.56.1771319578021; Tue, 17 Feb 2026
 01:12:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216161733.7704-1-mariyam.shahid135@gmail.com> <DGGU27CBNB16.1JYT2P1QGHQP7@gmail.com>
In-Reply-To: <DGGU27CBNB16.1JYT2P1QGHQP7@gmail.com>
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
Date: Tue, 17 Feb 2026 14:12:45 +0500
X-Gm-Features: AaiRm505A5yVKx4B7l9wca6KzM30CFrmFt-xZ97F-D7srcMIrRz0WueEGrEyGsA
Message-ID: <CANhxO_jFKT5uNJ7mDkqTr8pBC8roVgvoR+9miPKKpuC7ZOzh6Q@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: use kzalloc_obj() instead of kzalloc()
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 6:07=E2=80=AFAM Ethan Tidmore <ethantidmore06@gmail=
.com> wrote:
>
> On Mon Feb 16, 2026 at 10:17 AM CST, Mariyam Shahid wrote:
> > Replace kzalloc() using sizeof(*ptr) with kzalloc_obj() to improve
> > type safety. kzalloc_obj() ensures that the size allocated matches
> > the type of the pointer automatically, which prevents potential
> > mismatches if the pointer type is ever refactored.
> >
> > This change cleans up a checkpatch.pl warning:
> > "Prefer kzalloc_obj over kzalloc with sizeof"
> >
> > Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> > ---
>
> Hi,
>
> The macro kzalloc_obj() is not in staging-next yet, so you'll likely get
> a kernel test robot email. So, wait until this macro is in this branch
> and then send this patch.
>
> Thanks,
>
> ET

Hi,

Thank you for the heads-up. I will keep an eye on the branch and
resend this patch once kzalloc_obj() has been merged into
staging-next.

Best regards, Mariyam
