Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9449637CD2E
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066852; cv=pass; b=UNffYAKW7YWzYHRGEI0Rsu2ME7hTPHgcSYrHg+2h/09RKXtnG7uEK2EEJHlDEmTUPZiQWtBHk7O65EHny9C0zbmbN+AA3e/xLDpvB8uyKjgZWSIWIjuHCUgiQwAjpj3u6wiY88N1bxKiiid/8XWpaBIF/3MbkmjHKvkvsgi4D9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066852; c=relaxed/simple;
	bh=BwLGd857a8/Gr8I9fhUqP7Q69S/w4GejNer6yC2hMY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ol0TuUgSPNxMJY649ABMezj0/+Eii24J6O3GZ599UbCKlGRNV3wAstARjX5oV8XnSm0K7cfJ/WBOQYDEIS2IY1hbEFH3HKw91k4amCoYE6QqT9groJ1RzY8AUnprjAp7F9jB3sdnOyL4N3Ptnbg22nL3xG1IpWkkGSp4FQ+t0pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPVfzOMt; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPVfzOMt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8d7f22d405so611603566b.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776066850; cv=none;
        d=google.com; s=arc-20240605;
        b=UlLvYHDoi8E2jQBMOx2Y2kptRVbTC6rfo1ZeRGGhM01MELGx5o0+KTK++Cb1LltyOt
         vWZc/0ZX4tdPXFUZgGNP0kSH3S/rjRncUSLLFIUA8sugMoPlmXODHc/aJ85VmNenB2OD
         CTAOf1+wTqMZNqkZmIjGCwBQvWVPuh0Lf5gkCvChcW1SdfiA1u9AvSG5yUOP1dackses
         DEVPFVaXqq8+KQp+JbV+hIJibour3b1vOADFj4a8izmLRqUmFxIvjjDwr3HnBvFTzf15
         MtI7msTQd8G3n2M2jOwhUuApBvWV6f9o002F+OIxzXDwA62EGmgAQxD2QEgy1oUhkA4l
         flvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WF2eIKkja7dyHhJJwMsSuEwqCgvKiY7IvupflJtjz2Y=;
        fh=GTQkL5o8MrBYS53DG8cFsXiyEWvpaFC8bsywRj7hcdE=;
        b=E6sqq0WdFNZ3NaPwum5GAAjMg+z7qMO0+VBja4JII+xz3XsBYeJzjUWQ5td7Qf0F6V
         K3buLacvgOFKr80oJZRq0up9s/Ua0qX2uBmOW3CjWmRuGOwkX1b0n1fhxapkk4jsw9yM
         THgwTIjytfcvXsfL3nj7OOxrDT1rnMT0dUUnRE1ZWgBm+io0auQwg/HpOuboDY9JasGj
         7udu47D3sU2epTRHJgumB1ENuWAhBSgAe2lM+ZRYHdRf+cpOywSlkeBGTApkOtBkdkYG
         uAmGGJNHYqp04oGu8sYHQ+BI7HiLbHwSvsEw4L+rjbGq9z23HYBCNOp09cIjXRTwiAxf
         fARQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066850; x=1776671650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WF2eIKkja7dyHhJJwMsSuEwqCgvKiY7IvupflJtjz2Y=;
        b=SPVfzOMtFciDeZULB3gR9vW+0yzb7LtmDj8tGUi++Sp+1mrERfxjqBnxdPKbCp0MMk
         1N7CS8NMGfN4gMq+SlL19qEobyXnPARJuzEIs3r7SmveEuOfn/26UtN7L8oiCCdfXSwI
         xjsMRUxRYetgTIQy53+yiT+96iYlfSGKF0zyQEXSh9ROuveYIi0H61K8mXi9nrbJMRSR
         EtmBINNJ7B193VF/zCn9W0xNrI7R4eX2QHj/NTN1Hc89CqYNspVMZr+Y8+JyKqOxUTfi
         UAd2e0lhmrP2moBchUl7mfRm6vRVkfSxQBcANbWRSqI2vImn9+FQA9fOZPvyoIl8i6PN
         o94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066850; x=1776671650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WF2eIKkja7dyHhJJwMsSuEwqCgvKiY7IvupflJtjz2Y=;
        b=aog3QVgJtFGDasQxI+07THPSH52vHXqRcBgzU3Q5/EPmtwMIiDJF34p/0DUmEXCN2K
         zFxuQuCgEzq4Rx1PeWh6GTAkrjKHhW5jWu0YgeWXyXkq2KADEv3h3F7MlG09XQinfcjh
         t91Iz3O7rc4kMiB0ihGpkSjVS3gpnhj0ekDBxm6XWd52TeiakkU4l8vP8vW4ZUTKk82P
         tNUcGwEUY1PQX7tMBnY38LyT63XCkpuz/3jdsGuqiuB/8p1VQZ0G4SemI1tGIbl8Z873
         V2dr+2uoGphz4WphlcnujIlQZnZoHDn4UjQMgLGGyVNnsLnbERxTBA2rGxKjnXw3qo0J
         gcKA==
X-Forwarded-Encrypted: i=1; AFNElJ8bx5QRXC3F7O1p7N20DJpi1fc0WrXT45A6ysdxvmJsipsPJZW/EMhbsdhIYoeYHo8bQjtnIfskdASss9wD@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9hSfz6JsSe1edLhi8bcMna3zqZxpyFZ/ro7Nsed9tU+AGJaNz
	iT7ZlLaAGbT693aDSgqmcdEQ002ZVOEqgwGiXISpm/mf+z43ofIlx5XYsNsz6oGmYymH7JzSxEO
	qCa7FNOvsxLqw6kwErrsG1rXPKy5bnus=
X-Gm-Gg: AeBDiev0EHcjUbrd8mftrsbO6epq9wfFOw4Ykbk6PkaOOxIY1R61TgztuwjbpN6qtue
	zN0jFXdW92Q+sXoKXhl7utpQmidusLwwS8si8i+MQd35gGI9qU58afE0+Hmmls616soE2VMzz5i
	Fqj4hJmYSqOizrqxJUAtIZIPZKA7coGpjNf1k2raAizQWF87fbJYL/ei3dmVAWevhriVb+7BWn7
	0nU/NW3FJ9m7P+BUT2f41VYgL58nlfSGqEl5laan4tZopym6vpdQEeavhS/sorc/oZ0fXKm/QEs
	aaXS3XbzAebl6fYckdhwjqCQk2L/e4+DYPXJzzVQKuJM4A71ONUEXeHOSPIyI5GUQFMyzKLyLpP
	tdXsnZ/w=
X-Received: by 2002:a17:907:9615:b0:b98:6984:6627 with SMTP id
 a640c23a62f3a-b9d729c0986mr635516166b.40.1776066849676; Mon, 13 Apr 2026
 00:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
 <CAHp75Vdu6pih=NqkYT0CR_oLyr3YgNKBeqYM3+naqVp52UCgVw@mail.gmail.com> <adygIkRhnsGv-LwM@stanley.mountain>
In-Reply-To: <adygIkRhnsGv-LwM@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:53:32 +0300
X-Gm-Features: AQROBzCmapfAP5XxJL0BZHSYMWhRjgPMxX-DCGpXJHZVAmXSTow49ekBVs85ec0
Message-ID: <CAHp75VcZU21syEY7rx9BsvckKq-Tic259xPghetPad-gY7kDng@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Use %pe format specifier for error pointers
To: Dan Carpenter <error27@gmail.com>
Cc: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 10:49=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
> On Mon, Apr 13, 2026 at 10:03:58AM +0300, Andy Shevchenko wrote:
> > On Sun, Apr 12, 2026 at 5:46=E2=80=AFPM Mahad Ibrahim
> > <mahad.ibrahim.dev@gmail.com> wrote:

...

> I always like these changes.  I wish that there were an equivalent
> %e which printed error codes that weren't stored in an error pointer.
>
> KTODO: introduce a %e type format thing which prints error codes

Never happens until it becomes a C standard.


--=20
With Best Regards,
Andy Shevchenko
