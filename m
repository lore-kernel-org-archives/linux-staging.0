Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFF16F8E9
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 21:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754085503; cv=none; b=EjX0Kdl+5uuVjrvUkquJNee77/SS+1x8X6gMEN3KZmG+cKp/o4KtqqxR44Vrk1P4p0sP9qx/SgUqs0zZb04s45tewYzLXyq5YFBtesiEq4RsaIUx3pi26Y0YaRzWy5lLKPF72LXHWaYVN7hkzjnhzM8yJfbD66yD4PpbtMFzU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754085503; c=relaxed/simple;
	bh=9W9aLRKcskQT2G+1SL74xY98V8kvoY+yZ4RYwLfO4lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rpq0iSgCwL1eVQrX1c9TbFHBwECkKYfTOGnJt93exnB4T4gpBQ4IFYvUQtNR0YC+ozyODkIwz5/Udg2vcb5aP1XU4zRpww0p5fkJkrWRGLNkINMhCt9kjuDwdMlxQoFrsYwkWggQo74Ey4EVbqNvDs0yAxnPsvXpWNeL2HSYl08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyccCTdt; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyccCTdt"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-615d0b11621so1933812a12.1
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 14:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754085500; x=1754690300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9W9aLRKcskQT2G+1SL74xY98V8kvoY+yZ4RYwLfO4lQ=;
        b=JyccCTdtEMrrESCHsXnrdZXFb5yBn+uH7dSmf6u2FE3BdbgBu2Wm2dJrtXwnQtKDRv
         d5w2N9GCk7CIOp2AdCyWH5oaVguphtkfTP34OAisixtpG9wfqnmfoN0GF7rloriEYiQG
         j5Hzc9vMUDVn2t2KNa82eBp8ir/JVKhuCb9o+ilUZqb27Gylv+iAmSBP0IYA8SUq2Efx
         cjgxMWnjOVqU9GVeD974e/RojrF4kteX9lcPAEwchHk8/ZBAsL7G1S+5KV/flNHgfMTx
         ZM1Ovi0Pyari2HKlnGsIUCtHpgqCy/pPUllnCxH0YzkNtVOux5I9hqyA6xtCHcCTzRAS
         w56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754085500; x=1754690300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9W9aLRKcskQT2G+1SL74xY98V8kvoY+yZ4RYwLfO4lQ=;
        b=ES5xN3v4VOI8UX3RaJcsbtRHiAYaCul/yLnSWEmGeqE1j7g3jbKfajPzexmIrUUgwV
         SpJ3Ub5a8hF4WscvufKeXw4KHJhDyHXFlmDseeWoJ7pHR0AgNHBNTZ+lf+lRtYog3x7n
         kk0y+Nm9V/uJEsn2DBLo3IOGoHNdUSJb20R2aWjF8y+np3g89qYCxNM1KbQZKdWVKXz+
         dEVJglT3GR8eanvw5yzkkUKRU3Uiyl2H3klhXviSGYIZDv4ETnpb8XW3tETo5X0VEUq4
         /51KX98263DnnhVCdh4kaNRKnQ0RFD3sjDWasRP700gfwv1Ja24wDrh9rfORTTyPOm5K
         SRWg==
X-Forwarded-Encrypted: i=1; AJvYcCUF2HNLKEgC7ELOuoq+5fehsqJRbW3b3SjmQx+5IK0KfEJzzzdE35sS87w2JBbhn/IlSrIznHLsOcyzSb0k@lists.linux.dev
X-Gm-Message-State: AOJu0YxMlxQBykjLqwvo6GyYqpyxVnge39UXMn0ZCsm+gvs1Bbu/L6cD
	BOG7eXg8tIa5lxuyEyIrBfPAlz1pzJ4XrIjlgyIxtL01Ny6zKQ474jjYISPCE/jw9siMYZo4/aJ
	vNhOLeVOvQRIV+sLQBdJkBmJM63HBr+JhNBBST98=
X-Gm-Gg: ASbGncug3aLenQHgDuPDWtJEYRSmQluXDsjPRAn5760N6Hf4yrE7Oj/BrLu0zjRsBZ7
	S2G6JlZCuCp1pNyCXP62tRcfI5y9lGa0jWlrCoURyGKBCLIQaBNMFCBeUal+4J9BPAgTcTyMfWu
	QnNly7BbloRbdR89sNjTwLieBcMJKEfSL34WrCffVAMY/0DKXjCeNCFSBGlxLn0oq+okCXczBxX
	neIAew6jLcS57pVFSJM
X-Google-Smtp-Source: AGHT+IGRVGVyVuPJT5g+alark4GxiU9Zv8r0lEr7ASyTvdvyElIxZVu7IYlNYR9NTTG/h/hIC6BKUMEQv7AJTLW61rY=
X-Received: by 2002:a17:906:6a10:b0:af2:4690:9df3 with SMTP id
 a640c23a62f3a-af91beb7837mr862906366b.14.1754085499840; Fri, 01 Aug 2025
 14:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
In-Reply-To: <20250801160023.2434130-1-colin.i.king@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 1 Aug 2025 23:57:43 +0200
X-Gm-Features: Ac12FXymuCoCTkN9AJAJa7gXREI0nQIfvbT-NIqpDvHhaI6WuM_cL9u36xBUzHw
Message-ID: <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 6:01=E2=80=AFPM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> There are incorrect %u format specifiers being used to for signed integer=
s,
> fix this by using %d instead.

Both of them sound to me like the fix of the symptom and not the
cause. Can we simply make types of the iterators to be unsigned
instead?

--=20
With Best Regards,
Andy Shevchenko
