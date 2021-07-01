Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BCB72
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 16:10:11 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id i24so9201850edx.4
        for <linux-staging@lists.linux.dev>; Thu, 01 Jul 2021 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KJHVWYvb3k7oZOehoarqx2Vy0pWj8RrFR/FEJGc4l1A=;
        b=dUncOJ8GCTdzk0LJjO/SqR55/4b3pByJWB18EPR8UlLceTqgSE01uQ5WsX/y7qUkHj
         CgG8dJ5PoxRfgcm1hG6WLhHi+sk1Z9GbtjPx+Pq+2nWEdnwADPzQspu9Ax/XDUbncdeI
         jQo5XD4rcyrWSwhxW1q3b56R7Ig7fTBY/9nmPXgDNERZ2dBZ3UWwf9mB5MKuVfgbVuYn
         znArPd2qGb54QfJ/ngXaBoEdd/PmsGGudQ5FFIYFvAoP9A9c+2TKXR7DJfYzj1NFR4Og
         FVxITFHWND/4k6Zl7qxEambeQzsUMtxfuSgImRKEFS9NjvE1KpOJK+h1nad8C8cR9pOQ
         3OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KJHVWYvb3k7oZOehoarqx2Vy0pWj8RrFR/FEJGc4l1A=;
        b=jfQ23vY/K+0hVSyYrUYTPlvBGm2Y7LeS1TJjXA4e/PaEtz29fcjOE6bQ2VfmnA1CNi
         qlBXnKsOuyyRqG3tZJX3Bjn5vV2wNbleU1hIMwN38pwbbSeyN0/hX8vadZts8fXvwtMi
         Q5YThHDY2ewllZZkB62I6Nu20MSF+6tAEwysh5P2W1RkffH+NKnboNhA1umnftn5DZqR
         KsG9DVumC6HNlBEu32BTb4Gcz3PVoFK95y/tXRM4y2jWh0gk2pPyoEdTRqc5FzQ+rAyF
         FRKMcOhUZbvwloO85Xt06sMhnIz/Hqxc/c6ndjcKkUB/AysvBJPuQ4FXZQJMjZnI+qCT
         tUmw==
X-Gm-Message-State: AOAM532d+s5MW5TBm3f4wGevnkPr0pClesRzE2S1m7s4OBr1ydWdI86G
	hPlyTKqAEo6xnrX1uWxo+ks=
X-Google-Smtp-Source: ABdhPJyafyBWNMS6rfxXY8dHPzcvOaB0CVWij73xTuOjVb2ljHBwMYB5qE1/P3i+58ibozSQ2j+i5w==
X-Received: by 2002:a05:6402:35cf:: with SMTP id z15mr817962edc.208.1625155809777;
        Thu, 01 Jul 2021 09:10:09 -0700 (PDT)
Received: from linux.local (host-80-181-152-252.retail.telecomitalia.it. [80.181.152.252])
        by smtp.gmail.com with ESMTPSA id yc11sm87424ejb.109.2021.07.01.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 09:10:09 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH] staging: rtl8188eu: Replace a custom function with crc32_le()
Date: Thu, 01 Jul 2021 18:10:08 +0200
Message-ID: <1769059.L4xhdxBWhX@linux.local>
In-Reply-To: <190cf86a4b8a40d2b672327e26cceace@AcuMS.aculab.com>
References: <20210701133809.26534-1-fmdefrancesco@gmail.com> <2058378.BL2Rai63ie@linux.local> <190cf86a4b8a40d2b672327e26cceace@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Thursday, July 1, 2021 5:54:49 PM CEST David Laight wrote:
> From: Fabio M. De Francesco
> 
> > Sent: 01 July 2021 16:24
> > 
> > On Thursday, July 1, 2021 4:52:08 PM CEST David Laight wrote:
> > 
> > > From: Fabio M. De Francesco
> > >
> > >
> > >
> > > > Sent: 01 July 2021 14:38
> > > >
> > > >
> > > >
> > > > Use crc32_le in place of the custom getcrc32. This change makes GCC
> > > > to warn about incorrect castings to the restricted type __le32, but
> > > > they can be safely ignored because crc32_le calculates bitwise
> > > > little-endian Ethernet AUTODIN II CRC32.
> > >
> > >
> > >
> > > ...
> > >
> > >
> > >
> > > > -					*((__le32 *)crc) =
> > 
> > getcrc32(payload, length);/* modified by Amy*/
> > 
> > > > +					*((__le32 *)crc) =
> > 
> > ~crc32_le(~0, payload, length);
> > 
> > >
> > >
> > > Haven't we been round this before?
> > >
> > >
> > 
> > No, I don't think so. At least, not you and I.
> > 
> 
> 
> That was rt1872 this is rtl8188 but I think it is the same crap.
>
Perhaps it is the same crap... However, the patch is in accordance to one of 
the two solution that Al Viro wrote about.

I think I'll leave the patch as is and wait for the final review by Greg K-H.

Thanks,

Fabio
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 
1PT, UK
> Registration No: 1397386 (Wales)




