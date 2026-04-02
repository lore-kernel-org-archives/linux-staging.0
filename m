Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70A82848A0
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114198; cv=pass; b=Yz3GP5l70k2CbP1MN5FtJ79P5QuoFojyxhbdI9aXf445ctb96FzsrQsJ4IJ1UzRKR8be2moObaXeyQ3QOJ788kKwI0ZYA3z60IX9gK8asPZ98f5rLKLTaoju1NNQuOArGTrGmEsUGzp4v4C8Y10xP918aDf9N0bEHojP0PfPpVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114198; c=relaxed/simple;
	bh=UlmRQzZoSkVk6B9A8vC3x5DBXeEaSQAOKOfjWHeXQwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YHHrntq7APKRBL5EzQxfj+tO8Ayp7TBX4XqWDdUJV0rbbf3MXMcHwcsagNxFHiGvY+Hthy011tjXyB5KfF2HSCMcxY3NKz7oL7htu5+bobrh0oauervdSTZYuVWj887IkMBmxUXPByHg+rrjvBdgBRE+vPZw6YAv8YkjqmX3DyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0VooMBU; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0VooMBU"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b980b35534eso289129366b.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 00:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775114194; cv=none;
        d=google.com; s=arc-20240605;
        b=Yi3AYAGfD48PuA4TVrGzy1JJMzpBn/wMSE7ZJkm4xVCRpLIrjZ3eCMalr2nqkWwNNW
         1VGThbJ66rJKRT5uI5JylGHQWyWHejzfz0SPmru8jiLuIgXIJ9S6ojgJvpJ309SNeR91
         Wg0FM2G9lHbijpXk/78PF0HaVBwrFaXmBoRv7rqoty/P9YaNMRVEDQPXMVoVqTVAQgnl
         rSsl+J/FFeANnxVGBSRMhT96cA5RsJJQ4zxZsuWkU341H6m7aO/vr5C6APVuryMufAXU
         1fjJs+cYvnUFGm1DdnOVFPHnCNBAA69873Lopg0tAzzWyfQh9TZaQw0DUcxhcAM+K+qr
         adRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UlmRQzZoSkVk6B9A8vC3x5DBXeEaSQAOKOfjWHeXQwI=;
        fh=mp1ouDzcs91y22cUfTzNN2MbY34KDwV7e5iDT+zQ+ME=;
        b=BaaCjVMQAKgqLTiD9RRSjNEyd6S3UA/frwplCf+sjyQRIIvtNyObY01DlveEOV5Z4y
         lo3mTz3FPst7d7o6dsAa2QdgUD8E6grpz6oCv5VXAwsFcNHw5SnEyYsW1U5XS2heRVeQ
         rKhgWEGwp1OF4kjJpengwkKUIkfA8ggWalElNTyFkXtpcFLm8Zn0dAP1EciLB93RJ71H
         1GLQF1Fv2rigr/tVJHk3cWPIAZGBnyIXKMyVhK085HuC2YhvJ6pBAVLPHthKlNVnQIQE
         R+pGqIXc0ce7RV4VY7/EpiBW5T4w7ioyZ4gpjQR9hWPcEn/odpYVyhcqlGsZNe6IIwPU
         tGPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775114194; x=1775718994; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlmRQzZoSkVk6B9A8vC3x5DBXeEaSQAOKOfjWHeXQwI=;
        b=s0VooMBUPBYgcvpQVa7+Rf1hEdrRJyw6UQKKDUlRYwjVtjOdqpNQJe6iqX3Ru+ymVK
         Kdy2s5F9ZyZwFWryPenIv8+dHJFLHjlBMppe4SRfB8f9ZZnB0ORBbjMNWEuZo6GTOVmz
         YwQEDCrm6ONWbRIeg7cl9zrTfBReIHABuQJr89Y7Hu4A0RNbUeXTKQ8kX66eukgSmtO/
         o2NjcpBIKWzHPqlfXPgYXpmAcIDhjq97npqvxL8xjV0nYzvOB7TYyFSOZ++OymQZ2EeR
         NDBEazmDf4duLD5HQvB1MnJnUStc63rC9uVDosLAtgEUwxGLHdazYOWgEPToVBnWOLWY
         kAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775114194; x=1775718994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UlmRQzZoSkVk6B9A8vC3x5DBXeEaSQAOKOfjWHeXQwI=;
        b=H4fRKW57wpw7bnTKAxOGBM9TcXhzbDrDyeBuJzbRJeHL3OuF7bZXKmLLjQkb491xhg
         J8UYalP1b4+lTiFPtwSfGTQPGGeGZsKUBqS6QxO/Y2oT/UM2i5yG0KOq0aTc9bkeQxOR
         zTX+8NvjqmPY/CPpE8mvClw/oAxJo4wrkPaeY9tIYlOvtGnVLa2itGAyqtZO4gG7SZAh
         eG1Bz1VAtRmxXVdWI8O2UO5gyQIyqe5XDiQt4TKy77QAGN/ut4DJB+usBoPHq7x8lyeL
         UFv4hzua5sHgbTByxYBcdBUGKQlC7c3ZXn5ib4/6LyegqoT2dDBB7t6BZ/OBkqet4JVN
         ewAA==
X-Forwarded-Encrypted: i=1; AJvYcCWijpsc+BQz2SAgSU6wVF9gQwSTiZaM3n2paj4lCOsnMPJ5n7P5Pdwc0LxuElC5xeV1hy1SvuOxYUudNi1U@lists.linux.dev
X-Gm-Message-State: AOJu0Yw544A1/DYJin4JxJ4V1C0eswg2Ss9IdNThHOpI+3+KKX7xcKkf
	nzHWgwyQnGLj5T89kmTD5CIUfTicwH3+sI4CE5y7Re4qOjyBJUSEf6YFLyuwwYvm2NBNziUMTzy
	DgGir9/5g91/J0MzSWT6l8SxlnlvLX2Y=
X-Gm-Gg: ATEYQzzx3ay8W3uSVKh95sqYXXZKb3/RuxF1SwWujqtKdygIrKP2sd1mOKdwKCj2Wng
	RRPawc8gq5pBacKKsDrlnXKex+cPac7sv5CAGE/BZ/Ke+hlEDPuj2gt7a3pu47p27oZLdep1WFQ
	Altzlheiq41zGbxeOp2Ln1sVdCrsImRSigWIIqP307Xv1mxZQOzs98euHwyklbR6i5r9cudDDtX
	LRQnbcRVyBHDtfAzR5j9Moh8gHABfd2lNqlo83byTdJrdN/ehDQDZBsfRj+ZaNVaAiJC6B4r/4a
	heYWtZgdBpyEzTtqq9BYdSCjBSG6mKmNDWta5YAitnv3t6tKryBgZYPIUk2gRRzN9OegaN3nk7H
	wW2YAU/I=
X-Received: by 2002:a17:907:961e:b0:b9c:cb1:a61b with SMTP id
 a640c23a62f3a-b9c46f7ba51mr69096566b.16.1775114193903; Thu, 02 Apr 2026
 00:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401170218.40504-1-sairambandikanti@gmail.com>
In-Reply-To: <20260401170218.40504-1-sairambandikanti@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Apr 2026 10:15:57 +0300
X-Gm-Features: AQROBzC-XNOFeskRa4RPmwY0bcIlMBT69RJ-HZe62QqlWjCQ57aJUzS1RQ2vFrk
Message-ID: <CAHp75VdwT7tRPhzyHdsR+WyS7-9NS9bme2cGrGfc+p4X6wykgQ@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: fix memory leak in sh_css_load_firmware
 on error path
To: Sairam Bandikanti <sairambandikanti@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Claude <noreply@anthropic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 8:02=E2=80=AFPM Sairam Bandikanti
<sairambandikanti@gmail.com> wrote:
>
> sh_css_load_firmware() allocates sh_css_blob_info and fw_minibuffer but
> all error paths inside the firmware parsing loop use bare 'return'
> statements, leaking both allocations. Additionally, when the
> fw_minibuffer allocation itself fails, sh_css_blob_info is leaked.
>
> Replace all bare returns with goto to a common err_alloc cleanup label
> that frees both allocations before returning.

NAK.

> Signed-off-by: Sairam Bandikanti <sairambandikanti@gmail.com>
> Assisted-by: Claude <noreply@anthropic.com>

Please, use your skills to investigate what the code is doing and not
blindly follow some stupid AI.

--=20
With Best Regards,
Andy Shevchenko
