Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6406C201004;
	Fri, 27 Jun 2025 07:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009832; cv=none; b=ent7r9kplEh/QdomYAiifTHAnWy53lN4GZaNVwYKUwYssu2oQyFBPKiPHUZlhk74IR4ZuWx9DV3+wxIXSJiydotMUbGsPK9J+1VXdkvkgXAgHVJvWSnIYOPEgpACyC9xjqQKrNQbjOodlXvBBUh1vvibFsa3c37Q8WCKD1R+uHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009832; c=relaxed/simple;
	bh=iNtT7Ig4gUsAWw009qIB0VjlU9S39cJ9P4Au0J+rgaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeiCXrn8s6K98uOAK2dktjj9x5x0GQvBa8nJIw1xBzpb4D1kq8N/A0AX/A1sksxxPhJw7A7Cev4cpyYiZ47N8ehxRiDtVGlHKX+ymMatewuup85QzOZtqQUxMUFlerDBvPRHKQaGM69cdI0e9VFWzTHbSe6dOUsbTxXikldqKxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBRBrq0a; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBRBrq0a"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e80ba7039so1877917b3.3;
        Fri, 27 Jun 2025 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009830; x=1751614630; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sA0r3f6XV4xU1B5CfRo9ELlQCW7Ef8m5W1FCGlyqw8=;
        b=gBRBrq0ab1M20ha49nBWgx8443Q5dK7hvK964nyaEzrSqhI6xhASoVrPgBzWr4csl3
         1gdnUq0xVadmQ5MQFHzWW/vKIB81xL2asbTWmpm/ODx3V0c+v7jpskUOaKGGrn7MWdRQ
         1pWWsXXGR+v7ZKLRG4tLjJ3FEGc6hKOD+NshihZOB5HXC8XAhwfIjLuiohNTV0mUMuBe
         QnsZ1JyUUsqw4MyesVKHbTVR5isXYcyWCZjgwO8hzr0wRbAW030RTRySMUhJXnMyQ21y
         rMtffd2mUDezqPdRDcsqzmVVEFPOh1Zz048zzQzW9uiJwOZl9kYALMZsRwfsNvwGcRCg
         SV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009830; x=1751614630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sA0r3f6XV4xU1B5CfRo9ELlQCW7Ef8m5W1FCGlyqw8=;
        b=NcoIiJ0600nr3XmMwgIWWcDgvHkNDoLZtWDmM0PpZ7UxngBK/hcfdMIFD0nQc3F66P
         ulxtXNIwIz8QuLtJcOQWHU/NAK2Q3PgneOwCObuYg3SxU0oNzXQTJdFui1qLRs3Bjc1i
         aQ/taJ7qN49yFHeJhgDMZTRnyfNKPmHDsWGpdsBtzX4YkRSIcjyi3TMyahtu+cOfIgT+
         T4z8w1twg0XOCzHtp0Pswsvk6LW8DnGWHcHGg+hH090OgdAL/1oRTHBOa0B5VgJb3IW/
         hTROKEIeqn6sy0N4ma2Nsl6+EbJzSoQ/+awaua372wqBsaF9QtQdNKL0RvxCL408Jy+e
         RCmA==
X-Forwarded-Encrypted: i=1; AJvYcCUBiTgkxmNPok/7F0Hp/dFbcTP9k0K2ydQbw3faMtmi8GEFrdgjhn0zYYv4vYRZG79jLgGvvda6B8jZPdzUgA==@lists.linux.dev, AJvYcCVaoTMAjb+mYkJDKoWksqqYPHHzKGiarOt7BdDr9W4w+xXF0vGbBH2pJV5NtRd+MV/8iXHow2fgHGxdacTwEU9HylEXsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfmgqMlf62clJNBerzQL/CJV7B2Z10PGQ2DDAP5bGhEWLhydvp
	fK7CVquQQJphka17xOEMAXiZcMASZ+ZINHFD4cYeGEhGqGIoG1NL8f3F0wigkq/+pNotGmoQ3VP
	AXrZiltE3VLe8xOu+1QA6xywcnwJbiyA=
X-Gm-Gg: ASbGncuBr6/s9zbLKbCja8Azjy86HduWHySNXWDK+JeUo39WxyaEadKy6sWmDiOEI8u
	sRY3vlw8VgTGUiOGn44Ewxgb1QFH5QDWNIUlja/v149odsZm23ATgvYJHrv6E05dA14xzU56YqB
	xjBWDyQrn/VGWiS+o15qq/RA71FAOsj1jf9Q8m79+78RTOjQ==
X-Google-Smtp-Source: AGHT+IGXrRbXdekGAxcLwEUiLasd+6MZyxZ2iVrP0RGSn67kPXOVJQQMOGBlvg/6NdE2FE2/MYbSnknHoEAJHioHdas=
X-Received: by 2002:a05:690c:dc8:b0:711:457a:401f with SMTP id
 00721157ae682-7151717952fmr15019877b3.4.1751009830383; Fri, 27 Jun 2025
 00:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
 <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain> <CAGn2d8ND8Gm8E=CwyNbejmOeuqwk32zNCV-EW-k_N6GTOn7aZw@mail.gmail.com>
 <CAHp75VfQ9geeSOjSq8GoBuk_8ZrrCrkgpLxn1nXWgHU0dLnavg@mail.gmail.com>
In-Reply-To: <CAHp75VfQ9geeSOjSq8GoBuk_8ZrrCrkgpLxn1nXWgHU0dLnavg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Fri, 27 Jun 2025 10:36:59 +0300
X-Gm-Features: Ac12FXybXbhduWlOSQ9Z9m0DIJUDxuKrI5GJg7A1TRboqkqKYi0C3Vv7Qc3bI3c
Message-ID: <CAGn2d8MVQx_bkC8_TtcV4-WyO--kFs2Sm4ho5Mg-uFW+15_93g@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 9:59=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Jun 27, 2025 at 9:39=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> > On Fri, Jun 27, 2025 at 12:32=E2=80=AFAM Dan Carpenter <dan.carpenter@l=
inaro.org> wrote:
>
> ...
>
> > > The other things we discussed can be done separately.  It's also fine
> > > to never do them.  I'm not your boss.  ;)
> > >
> > I think I will continue working on it. I'm very excited to contribute
> > to something as big as this .
>
> This driver is a rabbit hole. You've been warned! :-)
haha, well, i guess there is only one way to find out .

> With Best Regards,
> Andy Shevchenko
Best Regards,
Abdelrahman Fekry
