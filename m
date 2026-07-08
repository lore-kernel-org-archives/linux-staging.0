Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE3B246770
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516163; cv=pass; b=gqOzTiJkvdJe0lRNu3fvSDR1liUgmtdf8dsSdmYlfM0CNjAJDyOWUrf6/L85JagbFEAnAf7Zu6tcSwubiqadZZ4rppw4gj+WzhBCIzXXtkskmybp2rugJGqNLJechjTNod0DYlvvi+F3xC1QoIFUpG4jT6nr2T/JSbYJl8wHqnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516163; c=relaxed/simple;
	bh=Bep79+Nm0KT5E0hNBAXvimuSZeTsW1P8+5T9xVwMzYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ly2zpBSSRt/ypnCJC9NaC/UQ1XgXeSz1NuNboLxXzrkLmPas3HO5ZFpIlSjhzyJYFp8Q/YOpWN3FiJqa9EgR4Ce9S6X1fQYSYjTsViy2Zs8IXGDaAFHrveXE0cj3a1DAbYDF6dM6OUWAAmjpYuFWhX27leQOpJM8fX38xH3tgrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGLZjDGI; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGLZjDGI"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-735f73287e2so473456137.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 06:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783516161; cv=none;
        d=google.com; s=arc-20260327;
        b=Zki3vqi1VNJozwUk3UgogW1y6rDwp8XGV7cSUwSLcJzOxynSuXobTin1sHXjqASikB
         8lAlYXZ8M//37NHbczPd0usGHWFxAWy0DglD1NzYFGDoP0S49xQYWrDrHFSjMq6pytNk
         8pN/VFCvaU6m3jgkgD8SOfPrLE2VIqJxQQBViR9BquckH2v7y4pJwB36VF4/A1d7qz90
         pZnBsauAKvo6AO/87xm9RAcebGDUzgihQA3LBemyVOo+QYbJxDNKjzrUXr55ipuoO3Hs
         +u7jdpFBh/xqk7CFsai4VgUq7Dejpkk6ZohVlilu/Dj7AmdeecVYp/c9cczJsRKhx9/J
         TF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsBQU5mcTVdYUucmcqEpkwbojCtOIWzKkEYP8GQ9mQ4=;
        fh=jcYikrzeFzMOXeWf7Ocjh5JKjpWtmubv8e7oeRoPdjc=;
        b=cJlRQtElGJ5cvr9P48dk4adAKxYbsh1oZeHBWf7JbH/OAIPZ6cP6L+YeWenbnrGb2r
         84k17YiBE2yCOAht1xfdYDJh9RVqbuKSjHakDl/cw+Sm3w5wL4ziwiXLolEbdBX+vh/c
         It1TsBlI7tBDdPy9mZKs5OFipwdyex6XH8L8AxJciXliPg9ypsyImz+01xklA6ofKe0d
         Sffz+o2FqVylejO/5+PsxK6vG7xDRxSTY9uIAbn+5Fl/XpSVSJUvBa+sFXt2US8Ld32N
         9+cBzkCqE9/JqMmb8YnecBrhn8NRu/21zgRoRnxpdVk5ISDJ8O5N4yc6jyUQf3fom0HV
         EOMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783516161; x=1784120961; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsBQU5mcTVdYUucmcqEpkwbojCtOIWzKkEYP8GQ9mQ4=;
        b=RGLZjDGIWGX2MPO265T7Mw/25sxTsmm0WXH0+fcde7TEW6arvYZn2rIYs+M++A05Ql
         Vnb1Bk8WddoXqb5I8lNqR7+5weyKZdwbyA2Pug/NyFTPOn8t5wtKJYOFzxUMsU882xIJ
         PXGkxVu9KzPrGPbrmF7yjomY0Mkf6gnJaeiVVBZ/72P7rp8duwVhcdlC45QH1nG9SUYc
         9qoeQy0q55iHe+nRt12jCSIiI3xblYOrZYpAXF74qikU+dmnvNr1LX51HVwXQKm7Lioo
         dg0tYxEw8WR7FdScdIYKf01o0+GwnzbuRXdnv5/Lwk1+l7eAAfUj10eNi7hCFjBiVqD0
         FHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516161; x=1784120961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsBQU5mcTVdYUucmcqEpkwbojCtOIWzKkEYP8GQ9mQ4=;
        b=dBN+ShePPTtco1c0627u2bu6/mIIAR5pkTowS5YPxCTEDjGiRQret8DQUXqrWqFx7X
         ot274DA2YgTi2BQI5bLMLW4CT6hQctxzqeP9Ktcl4w/U9tIOyD02zPCcQelm26MpItDJ
         1tbGbxE1cA5H0OCi8VTOJKya7x4eHHy6nH2YZAIeXXyRfwPVMrC+AvUf64qSWtbLCyON
         Ab7TxEp/BG8+KpArbHSskVFdHI9fDl8Q3D+a5L3J6S93T3xHZ96rSi6Duo+vC8uUU6vB
         uQZvAe3SpKdT07KxLyYDj6gNQZJspJXOhaJUANChVSBHk0BJF7tNSeHhB6kCi7voyWwb
         cLQg==
X-Forwarded-Encrypted: i=1; AHgh+RrkalaPt6ZisTpZFM16Qsx3xx4OKjaDOze3gfhAo3dV4nsYm/TsFPvmz6q83jWvha9CUMgGwxY0dUEtSlBf@lists.linux.dev
X-Gm-Message-State: AOJu0Yyefino7eHjwUs9WGyWHX71HSVMHbRtWK1FraVF4CASDmvZ2rM0
	R8rzkfZdRBUo+fsm+197Fpw0KxFEGA1ImP3jR2XNy3qkHoFn6iXR3QWAQwnZ1hAyxdvDt+yrF1l
	DD3YXRUbtmavHjG5r3HzmQDrMP0vmyMotf6kzZeQNeRCWQAU=
X-Gm-Gg: AfdE7cmwGy5qskNSAuhA5BuoLvg03CfmH2y23QvEzW6zrV4GsNEIAyYO/ALqRkjwm/s
	36UvdTxc8eoz1RxkzDNSUvC+dLKgoApymtDbRxyK5kmxXrfuCgWwF1gIGSpatbBNFv+ghuvjcqt
	gMlmhkwZpzHIdBiCd1fNYsgLWS2Qpcsk6U7gWwIjqU9RtdLa9W8GdKa6+bB6hIJw8HCcIEBtr69
	QQZhMKe1cR2Rusg6F7cgZef2Yz8AsqvIxs/xB3bTaRfzKSb2Ll4Yg/qDMhuIO/V0xdo3wAfPQ==
X-Received: by 2002:a05:6102:3e17:b0:729:cc7c:7de2 with SMTP id
 ada2fe7eead31-744e000d349mr1220107137.10.1783516161146; Wed, 08 Jul 2026
 06:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026070710-exact-unveiling-e321@gregkh> <20260708060307.12237-1-andrem.33333@gmail.com>
 <2026070828-arrange-degrading-a2ed@gregkh>
In-Reply-To: <2026070828-arrange-degrading-a2ed@gregkh>
From: Andre Moreira <andrem.33333@gmail.com>
Date: Wed, 8 Jul 2026 10:09:09 -0300
X-Gm-Features: AUfX_my45Q2tevoGqF5EtS1St9Km9BvGWs-C4r7mC4HKR6GOpox7QrqhzNm-z54
Message-ID: <CACO0qFJhE-p1NfEo-oVfVrrmxr=QUmOy0L3OihE6yTd=CeQQiw@mail.gmail.com>
Subject: Re: [PATCH v6] staging: sm750fb: Remove unused variable 'setAllEngOff'
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Please disregard this patch. Upon rebasing against staging-testing, I
noticed that 'setAllEngOff' was recently renamed to 'set_all_eng_off'
and its value is now actually being read/used inside
drivers/staging/sm750fb/ddk750_chip.c.

Thank you for your time!

Regards,
Andr=C3=A9

Em qua., 8 de jul. de 2026 =C3=A0s 09:01, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> escreveu:
>
> On Wed, Jul 08, 2026 at 03:03:07AM -0300, Andr=C3=A9 Moreira wrote:
> > The variable 'setAllEngOff' within the 'init_status' struct is only
> > set to zero during setup but its value is never read anywhere else
> > in the driver. Remove it entirely to clean up the code.
> >
> > Signed-off-by: Andr=C3=A9 Moreira <andrem.33333@gmail.com>
> > ---
> > v6:
> >   - Change patch approach from renaming CamelCase to entirely removing
> >     the unused 'setAllEngOff' variable, based on Greg KH's feedback.
>
> This doesn't apply to my tree at all.  Can you rebase against the
> staging-testing branch and resend?
>
> thanks,
>
> greg k-h
