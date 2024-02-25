Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B3FC8C4
	for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708854602; cv=none; b=hIq6mgzU4Sckv5+vwW3g4zZULE4bWx5ZfHLbSddILjQsUXq+NEjSlMfENrzI9O7n3If+NEHPNTcjoWyeWq1f0bYrncB/+RS7j8Bn46sunnrmPwQDWxDKt4UfaF1U2KWFh/zDlBnK3M7TalVM9od5MCJNV4HfGMvvnAQeTqbqZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708854602; c=relaxed/simple;
	bh=PjhNiUkoD3+h2lHi+yUUNRpw9+3krebCCi9rOPTdNfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4BxuB7sxptkpN0IAHivw338Tlpq63pNJmUvv6+wrJykOst2BYjo6cTWT2X6R0frjumWTl7V+cxNmmTiZo3J49WV4Qw/XOLHwt9KIpCRuJ2EBYbt/yQKxAAXPQce5SwR6Rtsnc6A3lyPp6Jg1Nns7q6SNTENCNrRcS51jI2O/WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDGw3x8J; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDGw3x8J"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-608e3cc70e7so3651097b3.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 01:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708854600; x=1709459400; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4MwmdceTTW6yTK6dn3O1uN2xQAdcjCnqlQIDQJMZQo=;
        b=ZDGw3x8JnIfXNNrYOlmvqOTmkd14PUWpRnBTu6m87NcYi+pR3fdkVvRcKzsyxQmm0q
         TN7oGg5nUnjdg+nVEQgwDpQ43BL9NpLVNfakFhgVZTb9aOLffdSGcdWS3R941N9Bq6TQ
         S9MS0FNWnvjh24+q7dmIJj3iSR6rAdcgQaDy80mZA6BVqLO7dh6egNc7Yt8PZ3JyNOUj
         z7XITPV1BPTotRJHTud2Vyw4BvguEDfJjZxfI92aRxwreM4NUjW4h9GbEojCQWi77CDc
         UATFjfbJTFhpBF8lxu6UPrAfoDPC5TrbpUsMnRZ/HAo9nZY4jAQc7UJTRmoiGdOBPaAL
         NIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708854600; x=1709459400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4MwmdceTTW6yTK6dn3O1uN2xQAdcjCnqlQIDQJMZQo=;
        b=GPAzI0NsGSMYYk6LdijIRS5x5fGwWuYe8orfbNnOTn7RJJ5PojMcIRSe/SUvZU+AzL
         LymQRGR9F8JJATRgipK6h7lIueIpKC4G5qvF5smfOZxI5tsSb/z45GCUYb01Rcen0Ocm
         2f2axbhLCQ3McI4rHwhcWnSwfUOFeosJshWtc7BxFDDzlqBO8zkAFqZeyAWoj0NAH810
         OjgDNGZOVA2a0NE5wUhYO6U5WM4GIedUZvidg0q/eCQupNiVyYmWHhNS+iWDJfhd99YV
         xvfOqlfVnH025ag6ge0k5CalEOlroDeOnsRgJzkNLO1P9bB9ci2hSw0NOdCEiSDMAtNt
         cG4w==
X-Forwarded-Encrypted: i=1; AJvYcCXcPk3oe/uuF2jhsu7Am/YNbXvAlpmLAyTEdh3avbKa0AvDXRdhN0bgr1BiB1xDUg4Vbs3WHxlQFU0pCuWaRKNS92FtM1dQbn+ElBGpFg==
X-Gm-Message-State: AOJu0Yym7ikN+wuH+B7NaLRg2uKAZsz/DvjPzjGnJOSTwmA+6nbLhAS1
	/JyKQDaQri1mikLgbzvdLaMPre33g9Q8YFH3Fdi4Kn5huuTBsmm79e0cbcG3+qMMEZpxqytp3QZ
	QUhZYqte+yF65osLcfahu2zPJjck=
X-Google-Smtp-Source: AGHT+IGliUFzZzSMB8+3Z2QJ9rdqkRgFL0iBBELGWFni7I8zkucsPnyVtOLt5vCl0HnYHKO9ztyFFZNjBPCDyrJR8WM=
X-Received: by 2002:a81:be0e:0:b0:607:87cd:9395 with SMTP id
 i14-20020a81be0e000000b0060787cd9395mr3610315ywn.17.1708854600306; Sun, 25
 Feb 2024 01:50:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240225084017.418773-1-dileepsankhla.ds@gmail.com> <2024022538-buffoon-praising-f748@gregkh>
In-Reply-To: <2024022538-buffoon-praising-f748@gregkh>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Sun, 25 Feb 2024 15:19:49 +0530
Message-ID: <CAHxc4bsFj1=VFVDWbdwo3W3CmSyPG1585p2zBePpsD9qy6VKdA@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: put macro in a do - while loop
To: Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, pure.logic@nexus-software.ie, johan@kernel.org, 
	elder@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 2:26=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> Did you test build this?

Hello Greg,

Yes. No new warning/error was encountered on building the kernel.

> >  #define gb_loopback_attr(field, type)                                 =
       \
> >  static ssize_t field##_show(struct device *dev,                       =
       \
>
> Why did you only change one if you thought this was a valid change?

1. As per my C background, I think no other macros in the above source
code file need to be enclosed in a do - while loop.
2. I am writing the patch because of the Eudyptula Challenge, and I
have to fix "one coding style problem" in any of the files in
drivers/staging/. The above one was one of them.

Regards,
Dileep
