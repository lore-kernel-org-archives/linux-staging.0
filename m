Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109972
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 15:23:41 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id w17so8959102edd.10
        for <linux-staging@lists.linux.dev>; Thu, 01 Jul 2021 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U8l3UJ00DYREIgfMYEIV38usOd6cfglDWNE3/CPQAi4=;
        b=lKxu0Alt2UFIJsZh1Hp+rwuwy0C7TLdSxNL3e+ysOhnJQTzv3Kxxa2IvQD+NRerLcy
         eUdr/lqrX5Q+cp6mxy/QaHorDRQWa2+LUq8TtaJkSZY1W4s2anXdhQsVX6RH0qwU2/ow
         qES/RgK+RMPQXzHMCcDsTLAREk+/bK0hw6uFuxExhtUL0EIar+7OIgDANIO5zfL5YlUZ
         jQIZBweYuT/j/NQnGMkRUj0Zb6/8Ir7U1vk+QwH4BoK9ccLKaT/S2c8ri6jTuLCsNNRW
         bMVN9BJB6X3OjIuDN4I4kNF4Vz8FEUFIP6xiKvmYZ8crkHgPYEj9YHmAN9GiYHvbcnVm
         94Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U8l3UJ00DYREIgfMYEIV38usOd6cfglDWNE3/CPQAi4=;
        b=XiAIKGqesbxL8SiOUpjjiBmLFJ1i2DY4kfDR0bMeSa02JI7qw7UzeI8BDN0iip02d/
         UdUwo53VZl6mczr2VZIIWmUGKscHAFw5cWjIfsKuCgO6MFAW3Swv03scEjVBCo0QfmNP
         mvJS7l3IYUIeWcT7739C8RVr294HkR/GTksI5CHqIa+T1dag/rkjVO3pMe5HzB5jr2Ub
         nSkindHawg++6Zh1I+LwmpumpLmahKzlxGvU8KsIEQHonGs+zdC/wSyFMx6tFreqrdXj
         5FZ3pjfMZ6ubrlJlYg+SEXUm40VsJ9atLz3hGWlZKeatXF2o4+djV/g1zFfb71FOSeDT
         vBEQ==
X-Gm-Message-State: AOAM530VygMthtIc3uPN7gyCeiiD3QON24KZMDLzIiOY3xGNizr1dC6i
	uR+ytY4SdP7OQMFV6pA7IEQ=
X-Google-Smtp-Source: ABdhPJzgXTm35YtDnk1Us2icqpU2MUxp1PmvFuU7uKJ7/8zaPGmt8LzprGFzmnj6oVyaXTMctrSWZw==
X-Received: by 2002:a05:6402:4408:: with SMTP id y8mr487282eda.55.1625153020035;
        Thu, 01 Jul 2021 08:23:40 -0700 (PDT)
Received: from linux.local (host-80-181-152-252.pool80181.interbusiness.it. [80.181.152.252])
        by smtp.gmail.com with ESMTPSA id x2sm80342edv.61.2021.07.01.08.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 08:23:39 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] staging: rtl8188eu: Replace a custom function with crc32_le()
Date: Thu, 01 Jul 2021 17:23:38 +0200
Message-ID: <2058378.BL2Rai63ie@linux.local>
In-Reply-To: <2fac9d8813374e95bcc04134a0f40f45@AcuMS.aculab.com>
References: <20210701133809.26534-1-fmdefrancesco@gmail.com> <2fac9d8813374e95bcc04134a0f40f45@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Thursday, July 1, 2021 4:52:08 PM CEST David Laight wrote:
> From: Fabio M. De Francesco
> 
> > Sent: 01 July 2021 14:38
> > 
> > Use crc32_le in place of the custom getcrc32. This change makes GCC
> > to warn about incorrect castings to the restricted type __le32, but
> > they can be safely ignored because crc32_le calculates bitwise
> > little-endian Ethernet AUTODIN II CRC32.
> 
> ...
> 
> > -					*((__le32 *)crc) = 
getcrc32(payload, length);/* modified by Amy*/
> > +					*((__le32 *)crc) = 
~crc32_le(~0, payload, length);
> 
> Haven't we been round this before?
>
No, I don't think so. At least, not you and I.

Unfortunately, I don't get paid to read every conversation sent to the Linux 
related mailing lists.

However, since you pointed out that somewhere, in an unspecified time, this 
topic had already been discussed I've just found an email of yours: https://
lore.kernel.org/lkml/bdc0c31a7d28426995d229eb9014cd2b@AcuMS.aculab.com/

I think that there you are talking of something else.

Perhaps, in the same thread there's an email from Al Viro that seems to be 
more pertinent: https://lore.kernel.org/lkml/YMz0DH0+v39xsCYU@zeniv-ca.linux.org.uk/

In particular, Al Viro writes "[...] Either make crc __le32 (and turn 
assignment into crc = cpu_to_le32(...)), or
make that *(__le32 *)crc = ...".

> You need to get rid of these crappy casts.

So, what am I missing?

Thanks,

Fabio
>
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 
1PT, UK
> Registration No: 1397386 (Wales)




