Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4B36CE0B
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979098; cv=none; b=Qm3JHvvc+j3e18mfikBjSTY9j/BOxxdi/rL8sh8GqhHsXRea0jtk6bwbLR3hcvQjdqgjytHCjwS6ofXfdKr5rn2YxSXQbsVOdsYZzpourHENyYYzNY+4doOhDNvshWzEHO9WLGV28S1RUqKe0PemMtwPnIJqEu//rSnIsLyC5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979098; c=relaxed/simple;
	bh=ZUMYyRHHwpzXIGnH7maWjoTG87Ma+WeufIe6tbYfcgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgQapYZVVEuKNcxhZ5O0U9TolwaHrWkgaX3d0ZIPtEbRm+l0edroYBm+GHIu2p08bMrgqSJ8bjHpjmLPiew/GSOBBr9CNiWNPaLezxiowaI4AGuTOqmRYZ54VzNA/Cy1HqqGlH+l2N7GsmxR3Q8D6ZBu09XgxcH2QRvtcQcAI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POK6oRog; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POK6oRog"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5de23ddba5eso4227937137.3
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 05:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765979093; x=1766583893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Umx4qG5n1dqnWnclt/q/k1oSHgdiokqWupsdv1mCOI=;
        b=POK6oRogwlNAzocgIuPkxjRkG5QUUpTqO6vk2s/nnisrqWOToJuReftKHKuF6GIHsE
         KhwXZ7IB3IbFTc/IsxcNcdMPvJccYbioOU0UzaLQc/J3wmwdxdp8fdROjiRJjGXFWlWI
         qPCvsN+snfPNsjORFZpSajGiEIcBMoCxGBNROPtvJumkykwwUweZRfKKq4HPeq531OTx
         BBD0uywneDjgUpS7pxNiK+c/aTjXlYT7sVmDtTJl06EMUeWl/bCcpb0+KnvbMYqltqj8
         QRvBT1562jDmj0/asRJQJhvSsjLpNilWV0QIrf61EQrOIlrtExdvZYD6yskK64VdoN4P
         Hmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979093; x=1766583893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Umx4qG5n1dqnWnclt/q/k1oSHgdiokqWupsdv1mCOI=;
        b=fi+IzEf0e0JEuiY2U4bvr8IgrDTE0oeT9MAfj4VyIqiL5AUv8E+oWit6IomDW3RWFo
         6I2wUprFaynqGZm/IEJdcDdGt1Vnpk9ss2ZvUSQKElgdMIt5SXWXTSnMF1j28Ygaw3xC
         p64rrLGmMmH1+LlIzQtWC/eCTjPbKccW7QfLiYJg2fvbgh160q1RNCwFLcd/xrI5AGuL
         7FvnKSalfPb3bIHaCv1HVZ0X517trhQi6JKRbmh+UmgfGvRYDeYxlOmSsGqcgOGJ6Ncj
         mMva5imQzQjDX9i2NsLeZ67+9gJxqezFgR88b9OBibxJrHYP9bh/n3FsSPgyc0Afbfv/
         AzjQ==
X-Gm-Message-State: AOJu0YzU4GYPptIjJ6kiZIo+4FgJB/5lkF9vqN811DlbJOvAfCKPyjgf
	vYfAL/6qd+jcXP3iSl4kWs94zsNuvWbII5JE0ihtFxmK2ycH3gSc7T6MnUamWj365167oGnn921
	FMyOYnyav9GZDmfUxIjK0fZYiER0bpyPxRdIw4EwmwO4u
X-Gm-Gg: AY/fxX6eWQxTHjRnp4BBPHREk8z6w+2f07GK1kyUQR/xotXcM8kjXBrNVT4uxuSTS9K
	Psqz24QlQ+JS6RCgcu27xMAf3kunPXtTkxZ+e72Jh+HbxADlZ8IWpNtTBDtLTlhZ7t17qX6AbxP
	Gbfn0KCfe33OXMPNrA5KWEpI58+WduWS714Pc9nDaOqzsGgwwdLL8tpiDLcY8Bwe7xRZHlRdtOW
	zKjBwGSpm5+HQM3Tdxt3e/NCLKOOEjz5udPg63yftKUBzZQ1coKxM5f2LgfFytwmFvaEHgtTXKN
	wS/YFbjQRyBM5DnlrJRZp7888MDcAgo27cw82O6NQJeVNQMDb0UXSLPZcLZXFHLOQOkjOatzvV2
	UV0N68Suql168PsEOQiW7OXlxMlElJsqrTsdtlDSvNvmBLhI=
X-Google-Smtp-Source: AGHT+IFHGMUPhy6TlBsxHQ9E+jWSu8V5SD38deQ2xSwVUSL6XuekijW8j7Cz+9RKKRQ+RYD1udPl5b5brYdrc9fvL9g=
X-Received: by 2002:a05:6102:3913:b0:5db:23d4:feb1 with SMTP id
 ada2fe7eead31-5e82748f95fmr7641826137.2.1765979093492; Wed, 17 Dec 2025
 05:44:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215210901.12058-1-darshilshah7070@gmail.com>
 <2025121704-unroasted-faculty-a76f@gregkh> <CAGQ2yWkLp62n+KbA9fEhGJXxK7o_XiM8Xi0Zu==J+ko45h-QFw@mail.gmail.com>
In-Reply-To: <CAGQ2yWkLp62n+KbA9fEhGJXxK7o_XiM8Xi0Zu==J+ko45h-QFw@mail.gmail.com>
From: Darshil Shah <darshilshah7070@gmail.com>
Date: Wed, 17 Dec 2025 19:14:41 +0530
X-Gm-Features: AQt7F2q2qjLNyKlZMEPwv-Ky2ESgH2SokS_aNFMu9_ANe3lHaBMhRj42LByFeZA
Message-ID: <CAGQ2yWnj2peEqhEeZps5w7=SqSaFR6WXy2E-2DzN6Qf3U517CQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: clean up redundant parentheses in rtw_mlme.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the clarification.

This was intended as a minor style cleanup only.
Since there is no functional impact, I agree it=E2=80=99s not necessary.
I=E2=80=99ll drop this patch.

Thanks for the review.


On Wed, Dec 17, 2025 at 7:06=E2=80=AFPM Darshil Shah <darshilshah7070@gmail=
.com> wrote:
>
> Thanks for the clarification.
>
> This was intended as a minor style cleanup only.
> Since there is no functional impact, I agree it=E2=80=99s not necessary.
> I=E2=80=99ll drop this patch.
>
> Thanks for the review.
>
> On Wed, Dec 17, 2025 at 6:39=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
>>
>> On Tue, Dec 16, 2025 at 02:39:01AM +0530, Darshil Shah wrote:
>> > - Removed unnecessary parentheses around if conditions
>>
>> Only one if condition was changed.
>>
>> > - Removed redundant '=3D=3D true' and '=3D=3D false' comparisons
>>
>> Ok,I see why you removed this at the same time, but really, it was not
>> redundant, you just changed the operator to something else.
>>
>> But why?  It's not really required by anything, what is driving this
>> change?
>>
>> thanks,
>>
>> greg k-h
