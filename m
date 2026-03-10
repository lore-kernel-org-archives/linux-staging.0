Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932E175A80
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 01:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106370; cv=pass; b=kYe4qxHh5LDMJadjRXaL5EN/TVfsfVX+an3ycfV16hhMj4YUfxoulTZAjqbqyIFGPm2BoVudDc0LmLjptOEnO5SB3RaEG7gu/5eNwgV3dby515Pz/npx1RmCtT6LAtGUq7bmUksQIbYrMtDJYeCQgLxCE0bKP+uRqZ4KJgMpcDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106370; c=relaxed/simple;
	bh=ON5/T8Ii4NJdSEK/vjaegTpOtQ1dmcLfA0pVGwnv5VI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUucN++cKdGtQDZGhGBCIaQ6wQhJRgYN88hx5plPFbpl0wXWToIB8ffr8dgsrlCGsnnMgqDwklMpE9fVwCpUZIMdvZaL3fukKYZdn4wIZFElZiuRbQ52sOrm8nt2mUZXVH//U4CZU+ENxI7SvG6o+SEdCAbF1NgEOvNrHb6O0ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWcmZytc; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWcmZytc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9358bc9c50so1374535366b.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 18:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773106368; cv=none;
        d=google.com; s=arc-20240605;
        b=EZ1o/ZFjNETb6l7u2NaXNxKRLDisiw2jn2kvQZdwgJTcgPH/vqWrAWL0y6XC9QCWBl
         6ZwPR2/6re/0mcf3D125IRygUfW5qWBE7e2KKkriszSleiDSeilJjvkjyQkC+y/UxD9q
         /QOGsUcDfAHr3MMAPEN6mVEBWJRWc5hWSoUKgL5S8jgzyklLJ2FAvLhUjpIa2eeV/NbF
         0w8QxvUBxP8LaM/xZQQxF6+bKQSoXGtGBqu1MdJ8M01wlmzlMLfpo9zk2PyI0Y6q7FmT
         cHKD5Uh5gkMCfwl6yPKuIO8YAybU0NWBvpJ/uu9hBT3sL0AwyvSOLH4fPsEmhM6pZZcm
         ZI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=86TLssPRzWRl2oB9l4EvY/Oyf71N3N06GZEWrMqMOHk=;
        fh=kjsrOgopO9ZNcmSVIoMqgOCufVPLUPSwJKhVNVogDxE=;
        b=a2jIRvW+hlvrvS8+11d6SBT+snKcrX6fCS1VW9Gbmcw/bQXi7QYKXaw8RnJ5oCO/JC
         1SjPyUvC7V4Mw4PRCTCzRy0FqRkN/sSZpBE5bOy95I5PO9Up+2tQhukT6BBdl/uDFZv6
         7smZcQwsVYS8patf5gBameyQiEAZSuABUvDbyAZaNQ1TO08099gE8qcNTDvIZihwG27Q
         nBQf27/J1iqjq2hUda76PRcGPuNnbmn324WG+oYQcOxF2Oa/qYFY+jKfu8+AedTMgICT
         7N6BgQT4i5WyXmwIjcG7wegG58TTC0XtBHAfksfzSSxPVGLLpNlf5Ydy2ReJC9RfV9f/
         2Arw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773106368; x=1773711168; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=86TLssPRzWRl2oB9l4EvY/Oyf71N3N06GZEWrMqMOHk=;
        b=JWcmZytcT9Vl/vJ1ZMUuXjpTNtrnOeUlJhERoL//iqF3guQzou+voRfaMd2+UCWCv0
         y4P6LNauBxltvQ5krGcHrD5tXS5AXpH8SNTOGAKga/DViaXvYQK08gJU++5H3o1eDNdt
         brsiYEybcGmRXXQpoewePT9dGJRSqxdQV42m0W9OLpeLeAj1iy3ZAQTUg/cKwt1MoFm1
         4rqr5g8ie877p9uH9vNTLSVcoLT3pX8WDZs7mp4YZM43jiY3kn+hVxdWxgXM1xPUXKYd
         SuoKpy+CN/nJX2M1d+RR4FbTsihllS4ffQdS74P70CkCtM5nwtyRxLms0bucGvAhkCKH
         7P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773106368; x=1773711168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86TLssPRzWRl2oB9l4EvY/Oyf71N3N06GZEWrMqMOHk=;
        b=mduYlR1rgoXiMjgJYQRWfEu6Xom3Tfp3Wdx+ep+TQit8kjQXcqpf2CoXLn5avZ2DZP
         k3f70ZaLfsPdNZWZ9ehbLCobdiTBN3Tb+2AtEIXqFCB0Zxb+BdfXtGLpW0WhnUAosYvd
         m5ypXBtOgiTp/ROdJKj2+Mot6jvo8Zpu6vb/sEpPIOyTSGetxPpXSLQ+lmnoGpsklRvb
         IOAmzGE7sNgj0tgJB7N0AB4T2yiYYUchZ2BnROhKx/VM/TRWUI/hHJVs+tAuT/EyLM7J
         R4tBkwisfzmh1vZiCphmYPDvkqNJNYmsSezZtcupxjsEg4qGASJNkxHMiY04lXPd6F30
         EMDw==
X-Forwarded-Encrypted: i=1; AJvYcCWc8OmgZS4ig4+tVd43hFC88Qn0GSA9DhupesppilzzLlGe9NZF33xJtAvyUA3nJ54anSe/GyXJZnqoC2QT@lists.linux.dev
X-Gm-Message-State: AOJu0YygOJJuHat0vFZOOlckU0IA9lmASlOax02EbfPwWeJPihaUFWAt
	4lXmVnFqsHaAZy3OgCE4L3BWM557m7j+eqsmtZkWfAVx8ccGFCS9UZoo6810fKwCgfQU6efs+DQ
	fBccnmfaRFyjaMPVZCTsqYrkdWJC4Z+M=
X-Gm-Gg: ATEYQzwkD/SxSHzuGETbJBO/WG4h9vd5E/Ny4hYbkhzVtdFYSGi8lx+X9KA8r9AjwvO
	ZUIxYwJzAFKrGswO1HrzY+ds3BlW5K5BZoeU2WbVyVwP9nLamYD5Xo8N1KUHDec8KGD34djpRrU
	bOpS666Vx7VPOhOmW+6T8EKAX7NnzxdTJG68h9mtwZ5128xy5Kyta4Z2cTOlYWYzbwDlNP5U6We
	Le1SA6OOnbGZvyswuLfsemA4Bf27H+nVvdmcSisVlejIG39LXDah6KHsXmOb8xvErgHxHudyaLU
	liTv84Jl
X-Received: by 2002:a17:907:847:b0:b93:5520:44e9 with SMTP id
 a640c23a62f3a-b942e0b5b14mr771191766b.35.1773106367844; Mon, 09 Mar 2026
 18:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305-adt7316-correct-macros-v2-0-3702e3841c42@gmail.com>
 <20260305-adt7316-correct-macros-v2-2-3702e3841c42@gmail.com> <aarqg9NBUYpkFKDW@ashevche-desk.local>
In-Reply-To: <aarqg9NBUYpkFKDW@ashevche-desk.local>
From: Michael Harris <michaelharriscode@gmail.com>
Date: Mon, 9 Mar 2026 18:32:36 -0700
X-Gm-Features: AaiRm521MA0nh8p08BWTyZJxvxz62iAI5V-W6U9IjOHdZPkP_2QdtbqObLlDWLM
Message-ID: <CAHXWO3TSiWeVBU-KorRFu8t0SEc-im-xJHwZ1c=Q42OTP+TmOQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] staging: iio: adt7316: remove shift/offset macros
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 3/6/26 6:53 AM, Andy Shevchenko wrote:

Hi Andy, thanks for reviewing my patch series.

>>  #include <linux/i2c.h>
>>  #include <linux/rtc.h>
>>  #include <linux/module.h>
>> +#include <linux/bitfield.h>
>
> Try to squeeze it to make a longest (but sparse AFAICS) ordered list of
> inclusions. With given context
>
>   #include <linux/bitfield.h>
>   #include <linux/i2c.h>
>   #include <linux/rtc.h>
>   #include <linux/module.h>
>
> gives 3 out of 4 in order.

Placing it there would put it right below slab.h, sysfs.h, and list.h.
The includes as a whole are fairly messy and unorganized and I don't
think there's a clean area where I could insert it. Fully reordering it
would be out of scope for this patch series. If you prefer, I can put it
at the top of the includes since it would be the highest alphabetically.

>>      dac_config = chip->dac_config & (~ADT7316_DA_EN_MODE_MASK);
>> -    dac_config |= data << ADT7316_DA_EN_MODE_SHIFT;
>> +    dac_config |= FIELD_PREP(ADT7316_DA_EN_MODE_MASK, data);
>
>FIELD_MODIFY() ?
>

I will apply this.

>
>> -            data = msb << ADT7316_T_VALUE_FLOAT_OFFSET;
>> +            data = FIELD_PREP(ADT7316_AD_MSB_MASK, msb);
>>              data |= lsb & ADT7316_LSB_IN_TEMP_MASK;
>
> Ditto and so on...
>

The main purpose of this patch was to delete the offset/shift macros,
so I only applied the bitfield macros to areas that were using those
offsets or shifts. I left that existing bitwise operation there because
it wasn't affected by the offsets or shifts. If you'd prefer, I can
update it in this case for the sake of symmetry.

Thanks,
Michael Harris
