Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1E3A9DAB
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 18:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776794997; cv=pass; b=c3IAlACkXpND1z31Pj0orKwtkzcAmONoh2jSfSV6NRQb342F8Sbj0+/EoYfFdXj67550c/02HHCfyWAWCWt1APbfG0RAyVLUiha1V8QT0bRFnqxUHKnGUBjtawrzi5Unaik3MjJBYhW/9nu6rznYlCJDLymSdMug6Dxahpfm5lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776794997; c=relaxed/simple;
	bh=7w5S79RaygAdpJnFfT/iKhfG77R5Id0eXx4J/AKxDN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EidI7FV6T8iI/Haw6N32lW8aJ55SzNRAPFtJX4fGn39lwZOsgFjUHIv6W0JV0g1KZVtnw6cwmesTicrEID9N8DmoNBDfsRzIxcP81HiubA5rN6+EV/xlf855xbIkSR3FI0ox9N7esl9LD+6WoBmOzKjv9RHbZuOWihQ+TP/nUh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUcF1NYp; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUcF1NYp"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-674a44b84fcso5124599a12.1
        for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 11:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776794994; cv=none;
        d=google.com; s=arc-20240605;
        b=F7YyU266XdqCHWnProNDhhvUZQ7W1vX/hQBWHyxkaEtX1DgBO5u4JoHjqK0W6oExVs
         JyYesxrxehAVRZG5jVV5LUw9rOoBQLQkpt4qeovxPHAm+6nZYvUq18dwPXdL84Y7PXFW
         igzeBDKNs1kwszROoxFlJexFZ9AZI2zgBCl58pZqPvk+7Aq0TVWzfHRo10BgE5u9c09h
         PvrExP/8y3bG27bKwl3GCdSSuPRILiWR6B/NysLoc0kzCM6+1oxwJBJ6TrOp2WDB0v5P
         8R/Uobavj9mbK3Yn+j4WMTa310QrwdgTvpRjOwX5srMO2vD6G7SBbI9AJQb0c15BNSOl
         L4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7w5S79RaygAdpJnFfT/iKhfG77R5Id0eXx4J/AKxDN0=;
        fh=pTsKO34B+STQLpDzzCmzIz7XIVGs0fJW6CeHv8RFtQY=;
        b=Z7cEmD4uUuSJzGh2MPyAbG87pyuXL+HOCGAtgtx2F7dybGnyiFVqwoBrA52T9zF9ZY
         K/j3WprR/hfghz7eABiSnuzCU9EwbTjR+ztLvoM9lbML65pMCJgvGKhjngIPSUtkIASi
         l/cjD+LxfnQ65y0sx2j/3lre4Jo6acIyTfTbM+3uKhyXAEi0tws/RSzqo40o54zQG+4B
         nE/ALxLbL90P9rILlJUa95dW6EG8fh0qgwcgfvGqBJ9B7tk6yOzbVbJiCEjRummoCTfs
         DWP7IGdm1MkWOinsCUnEGx8hNYJzDN7Vlr7r0QPJtmvR3tHmwFnpv47O863lny/bp5yr
         ygbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776794994; x=1777399794; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w5S79RaygAdpJnFfT/iKhfG77R5Id0eXx4J/AKxDN0=;
        b=lUcF1NYpHMfdRIVZKUWiZqoGISvYIEoqZzG707Zk64/zCiDKUIX3fafybXcf1g9kgx
         qRvRsmFzESEc+JI8sqIqxXDOnExhV1vIxJMad8LC8SHZsJugTvVxNz2UIy2+O3tFJgR4
         JiZVGVG+FbyqiYp7DZ16oxm9if/PhRL1fDfuthHMtsKMa5rlKU/RH3wBcwhi7v8rrOhU
         Zeu07hvooc1CCf/pCvJWGG1v1qbCRpWRZNEvjOEC9/isRx2Yd318UQwHyWDA0oa+9yYO
         HT9no7hkvv5dfj7Gbjevnh6+usUlnJZrUtBMYvXIzpKxVj6VwQyH/cxZaXcUIErh+4vL
         xaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776794994; x=1777399794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7w5S79RaygAdpJnFfT/iKhfG77R5Id0eXx4J/AKxDN0=;
        b=muGXg/jgw+ifuYn9TxvIZOUWAYePUgG2VeRG2Z64GGYWZaZ0SnU2UuiZHNxElnP0Uk
         w3lS/VrZ7+VN3YeHvXguI0ybAukLr2KBzrLvJTMjA5+cTQTMGQTJ13toJo1v9uYr/buc
         0Oj8SfEs7+22EPcOeBx1jqeu6et+3oHSBQXi4o9d73WKBuox5Zt7n5wCiLoFB1ur9Mpb
         PMUbH+akk65swqZkAgjoEfQjln4jH8tS0IvP2CG6I7MFbQAC4u2D0G5ijBtuQiLjme+Y
         6dEhhv32qxoaFqu3K2sJxeL8ibDlnV4kP1+qohAy9UmyzPgIo0lCve+78ckJteAZVW/r
         1Urg==
X-Forwarded-Encrypted: i=1; AFNElJ+OHo6ugBL4rKQBZ5Hf2RM7mrVAXlxZXxhfEt0dhYkrCsMtCaJI7AidJZDs1qh2KP7XlaRY32yPDTc/9Kuv@lists.linux.dev
X-Gm-Message-State: AOJu0YwVdwHpFSyDyZ8iE7mhFDwozqoqW6ldOF082Lynsu2L5aVVw8d2
	/4amvjQFLNXefUxpW0BHvFcMgQYus3tXZlLOShJKjzyLdFgdz/KBd3frV1Zd2hS/vTuFOJMsrpn
	c5C71GwxnvM8HBl1LN7Cx/gspdOKLCM8=
X-Gm-Gg: AeBDietwyOBiauimr2zJ2qr5Hkjq00lS8zrAo/zqYCgsl34eEtrez8JMTsHzvWSaCTF
	FgcZoe1uM9Cy7/ZIMt42mJjpEiQb5mpJ+CIYc35gXaA7hI5oHQjTZ0kSQ1AP2y/0WDeoJOVuDiP
	O1SahS/DSE9NVTEAH9/iP4CmbNN8TvX80ABx7pXaGTkHybADbHSHZtBeraun1sF4IiLGvd8NAVq
	WwgvsbkYNqYz/OTxEkRoRlV5XyWxD7J45lNu3iOTf2EF18Hpx1yRlzequr/X3E9PB6+D6Mr+sDA
	abJGx0EhDXE2vxmvoTjI/Cv7os5VLKrnt1CSzmtOKuzXmmf9TaHSFjvzLu1GAVAibDj50o+9qwP
	+Zt6r+2ics5eMoiixcg==
X-Received: by 2002:a17:907:948f:b0:ba5:8976:5527 with SMTP id
 a640c23a62f3a-ba5897667fcmr684300566b.36.1776794993658; Tue, 21 Apr 2026
 11:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416134214.130665-2-pontescpedro@gmail.com>
 <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
 <aeerOursgkNeoMQo@kekkonen.localdomain> <CAHp75VfVXGeKcuEewuRC0E7tXj5AokWHQLmzsSF+mVQjQ16KwQ@mail.gmail.com>
In-Reply-To: <CAHp75VfVXGeKcuEewuRC0E7tXj5AokWHQLmzsSF+mVQjQ16KwQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Apr 2026 21:09:17 +0300
X-Gm-Features: AQROBzD-fvIDyqY6Xu4_kxACyosvNflqVCM7PA5MW-50oYI7D8HgNx9_t1b9pAQ
Message-ID: <CAHp75VeLDwbcc5Q7Ec7tGkXg5VZtNxbQCVjFo-hM_JNGu3tZtQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pedro Pontes <pontescpedro@gmail.com>, hansg@kernel.org, gregkh@linuxfoundation.org, 
	mchehab@kernel.org, andy@kernel.org, kees@kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 9:07=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Apr 21, 2026 at 7:52=E2=80=AFPM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Thu, Apr 16, 2026 at 09:26:47PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 16, 2026 at 4:46=E2=80=AFPM Pedro Pontes <pontescpedro@gm=
ail.com> wrote:
> > > >
> > > > Convert manual kmalloc() multiplications to the modern kmalloc_objs=
()
> > > > interface to improve type safety and prevent potential integer
> > > > overflows.
> > >
> > > There is already a patch doing it in a slightly better way. Have you
> > > followed the mailing list?
> >
> > I must have missed it, too. :-\
>
> https://lore.kernel.org/all/CAHp75VcoNkEQs7QQLDg8xZjdouNc8Yc6Vjg+Pdqb7LVi=
qSKysg@mail.gmail.com/

Hmm... Now re-reading that it seems they address semantically the same
issue, but for different APIs.

> > > Please, better to help with this driver is to subscribe to the mailin=
g
> > > list and review already
> > > submitted ones.


--=20
With Best Regards,
Andy Shevchenko
