Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74EA70
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 17:40:38 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id df26so2681845edb.9
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PAX1zJX4eU8wCCP9NG6c0YI3K4Bs99PZZpIIM4LoJbk=;
        b=ZoBfqaHXNwqE9npkUPy5emJF3uyke4MTQw6REPfA5TW6Tav4nWW/SrqIkGPfbNAaFn
         jjdKnJpjzvc33dfzppUokmIoGDYUQlG7oK5sHLNL1VMVbgMaqezGvaL9CIyXbLRP5UId
         I3AgE0i8vfeTEMRcFvIAQpv3tJcQcp0ndC85ZgprB1alJnaM1DeVBpOrsM4oz+2mgXWm
         uTLgTsWHzpdkSXgdRccVDnOTg0ms1jFGV47mBh5W59YvzTcOBZok2+M52cpFY9om3EHx
         W0xzZnXGxqcaxHlTm1p5j2E1qwjWrnh9uJwfDADOups2f65MLGL/q69eCjACKvJKg7J6
         V9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PAX1zJX4eU8wCCP9NG6c0YI3K4Bs99PZZpIIM4LoJbk=;
        b=oJTgu4qNL+b7STHUrRwK2QVtD1c2LzVNdgv5KUe7XYFcbrUJ4CTbTQdDdiYkS09rKF
         2YvFGwo0x+EX3SUCWtP1mTVVisehjxTt2jJ4KDU+Cok08zNTF/ctFwizAt5cWKAmdzy/
         lDdng3fmwHdQFdM75jyZ4CR85E0hedtVuksaiQ3yPSm/fIGF/7Z4vwMTfuqVhA4+mmiY
         ZGjLaAOQRFzT98R19AmCml29fsES73q+grQzWGpLzx/pjLZj/CCk6qvY71QicKiDS9bh
         hWEaitzAPYh+r+qRZNu3y3yWm4ks9lFizZjPKVJO7Q+xkewwzYi4yJszgWUCTv9A+zZY
         ip5g==
X-Gm-Message-State: AOAM530cergc6mgCqGcnceIKsp63tStN1Odu6U7WLTyLDtsizCV4nJ4S
	U9x0EbWJaARYZmcQqbbFwmA=
X-Google-Smtp-Source: ABdhPJy28r7nArmOuSjCbwH9H+trCRBvbsWWsubAyvGXZRTo5LxFtuE92P3ucGutr64n5tqVyaT15w==
X-Received: by 2002:a05:6402:d7:: with SMTP id i23mr6839478edu.291.1627062037076;
        Fri, 23 Jul 2021 10:40:37 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id g8sm14805659eds.25.2021.07.23.10.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 10:40:36 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v3 1/2] staging: rtl8188eu: Replace a custom function with crc32_le()
Date: Fri, 23 Jul 2021 19:40:35 +0200
Message-ID: <3650881.QlJdx9khu8@localhost.localdomain>
In-Reply-To: <f396ffee4a414ee092625ee486b871fe@AcuMS.aculab.com>
References: <20210721110052.26376-1-fmdefrancesco@gmail.com> <20210721110052.26376-2-fmdefrancesco@gmail.com> <f396ffee4a414ee092625ee486b871fe@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

Hi David,

This driver is going to be replaced by a "better" version, so I'm not sure 
whether or not this patch is still needed.

However, I see that we have similar problems in rtl8723bs and perhaps also in 
other drivers. Therefore, I'd like to solve this problem, whatever will happen 
to the "worse" rti8188eu, and change the code where else it needs to be 
changed.

Now I have a few questions... 

On Thursday, July 22, 2021 5:30:08 PM CEST David Laight wrote:
> From: Fabio M. De Francesco
> 
> > Sent: 21 July 2021 12:01
> > 
> > Use crc32_le() in place of the custom getcrc32().
> 
> ...
> 
> > @@ -609,14 +595,15 @@ u32	rtw_tkip_encrypt(struct adapter *padapter, 
struct xmit_frame
> > *pxmitframe)
> > 
> >  				if ((curfragnum + 1) == pattrib-
>nr_frags) {	/* 4 the last fragment */
> >  				
> >  					length = pattrib-
>last_txcmdsz - pattrib->hdrlen - pattrib->iv_len -
> > 
> > pattrib->icv_len;
> > -					*((__le32 *)crc) = 
getcrc32(payload, length);/* modified by Amy*/
> > +					*((__le32 *)crc) = 
cpu_to_le32(~crc32_le(~0, payload, length));
> > 
> >  					
arcfour_init(&mycontext, rc4key, 16);
> >  					
arcfour_encrypt(&mycontext, payload, payload, length);
> >  					
arcfour_encrypt(&mycontext, payload + length, crc, 4);
> >  				
> >  				} else {
> >  				
> >  					length = pxmitpriv-
>frag_len - pattrib->hdrlen - pattrib->iv_len -
> > 
> > pattrib->icv_len;
> > -					*((__le32 *)crc) = 
getcrc32(payload, length);/* modified by Amy*/
> > +					*((__le32 *)crc) = 
cpu_to_le32(~crc32_le(~0, payload, length));
> > +
> > 
> >  					
arcfour_init(&mycontext, rc4key, 16);
> >  					
arcfour_encrypt(&mycontext, payload, payload, length);
> >  					
arcfour_encrypt(&mycontext, payload + length, crc, 4);
> 
> Change crc to be __le32, kill the casts and pass &crc in the last call.
> 

I could do it, but the last call (that to arcfour_encrypt() takes a pointer to 
u8 type as the third parameter. How can I use a __le32 for that?

I think that one possible solution is to change crc to be an union and use two 
fields in the following lines:

union {
	__le32 f0; /* More descriptive name? */
	u8 f1[4]; /* More descriptive name? */
} crc;

[...]

crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length - 4));

[...]

arcfour_encrypt(&mycontext, payload + length, crc.f1, 4);

Please, tell me... What about the solution above?

> > @@ -682,7 +669,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, struct 
recv_frame
> > *precvframe)> 
> >  			arcfour_init(&mycontext, rc4key, 16);
> >  			arcfour_encrypt(&mycontext, payload, 
payload, length);
> > 
> > -			*((__le32 *)crc) = getcrc32(payload, length 
- 4);
> > +			*((__le32 *)crc) = cpu_to_le32(~crc32_le(~0, 
payload, length - 4));
> > 
> >  			if (crc[3] != payload[length - 1] ||
> >  			
> >  			    crc[2] != payload[length - 2] ||
> 
> You could to the same here, or make crc u32, remove the cpu_to_le32()
> and use get_unaligned_u32(payload + length - 4) (or whatever it is called).
> 

Sorry, I can't understand this line. Can you please elaborate it a bit more?

> But it is much better to do:
> 	crc = crc32_le(~0, payload, length);
> 	if (crc != VALID_CRC32)
> 		res = _FAIL;
>

Why "crc = crc32_le(~0, payload, length);"? Shouldn't it be "crc = 
cpu_to_le32(~crc32_le(~0, patload, length);"? 

Why did you drop both the cpu_to_le32() call and the '~' operator?

Thanks in advance,

Fabio

> You can lookup VALID_CRC32, but it is crc32_le(0, "\xff\xff\xff\xff", 4);
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 
1PT, UK
> Registration No: 1397386 (Wales)




