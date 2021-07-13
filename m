Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF76168
	for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 17:52:48 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id dj21so14476678edb.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IMp+bzn3s2kzHmq/5zGpNCwwxMAv55iPurwlPmnyCGI=;
        b=jhrlsncwu9tqEW4MDMloS+Xy1btQoKVTyzZB1enylBxtTCCDPiOz7nxS6evvfCaJUP
         MJDyxoJ3VTzp+D/ZzgE1TIaH1vMk0/pl4sIoaHBJlksMKdjNYclWOFGOh8jAvA2EY0gH
         6YH31csMHhJIyfuVKgWSz+03sOBU+WwKn7Z4WyDmndl3BC2kdtA7IMyAHEdUI/07W6q0
         +SgZK8eASw8C7KtIywVbnKneXbSC3Ejb6z624P9paXRwXNX7dAwnB40QxmMajRDdNhwA
         zZegwnujcN+9TaqTPNNATETjnd0XADkGYJDiX35vnnyb90oO1BBPlLHojvTMJx9flBTw
         2TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IMp+bzn3s2kzHmq/5zGpNCwwxMAv55iPurwlPmnyCGI=;
        b=kJvBil6X+PEhdZdFiEM448i+3I/Vl2OXxna9ecaO5RRVVJR5lzBAWhmR7KbaOhuoTP
         V9FIt5EF+bR2LB72lwgpHU+FTy5QRa6ue+W5xLfWPlZRXs4h2cTwHGMAakIHFq+9RB+x
         4k7RkKAVm2YVKwbpzLp5tHmsrswkX8cCoUZ7rE6LuXUumwFaAxF3Ww8MWhKm7+BzxW8N
         lmWcaF8+caxHKB4froFg8AL8fNpvCglK8xlxbUr1JsUse9v5/htR6ZRz/Q7HPhAjTdrS
         PkQ5MHzOeWLf5U7UmFRhtduNp8hEvwwgytXpoB3MTmYdNoWVpCrqueLwZF9grVys4nAu
         fYXA==
X-Gm-Message-State: AOAM530ds/3BSyWhG5TwPHBxhbsUyZ9lFlN4Ks5TxbHt0jOFYUyuRCQx
	Eg9duYs11UqFjZ2bN3zWCTTPOsRzouA=
X-Google-Smtp-Source: ABdhPJxNXgqr5ABw82/1iYRTeZRG6VNHNjk5AWRKfU/mEiJnF+b6jcjwLraRI9zfU8EwOnSY2Zs63g==
X-Received: by 2002:a05:6402:31a6:: with SMTP id dj6mr7485780edb.248.1626198766840;
        Tue, 13 Jul 2021 10:52:46 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id g11sm9947920edt.85.2021.07.13.10.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 10:52:46 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8188eu: Replace a custom function with crc32_le()
Date: Tue, 13 Jul 2021 19:52:45 +0200
Message-ID: <3537977.lmtE3BSfzd@localhost.localdomain>
In-Reply-To: <YO2MJ97grAbMQ1ms@kroah.com>
References: <20210701133809.26534-1-fmdefrancesco@gmail.com> <YO2MJ97grAbMQ1ms@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, July 13, 2021 2:50:47 PM CEST Greg Kroah-Hartman wrote:
> On Thu, Jul 01, 2021 at 03:38:09PM +0200, Fabio M. De Francesco wrote:
> > Use crc32_le in place of the custom getcrc32. This change makes GCC
> > to warn about incorrect castings to the restricted type __le32, but
> > they can be safely ignored because crc32_le calculates bitwise
> > little-endian Ethernet AUTODIN II CRC32.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/staging/rtl8188eu/core/rtw_security.c | 22 ++++---------------
> >  1 file changed, 4 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c
> > b/drivers/staging/rtl8188eu/core/rtw_security.c index 
1b2cb6196463..5f010cb66970
> > 100644
> > --- a/drivers/staging/rtl8188eu/core/rtw_security.c
> > +++ b/drivers/staging/rtl8188eu/core/rtw_security.c
> > @@ -111,21 +111,6 @@ static void crc32_init(void)
> > 
[...]
> 
> Why are you casting a native endian return value to a little endian
> pointer?  
>
Actually, I was not sure whether or not crc32_le() returns native or little 
endian values: 

(1) That "_le" in crc32_le() made me think it calculates little endian values 
and the documentation of the function is a little misleading where it affirms 
that "[crc32_le()] calculates *bitwise
little-endian* Ethernet AUTODIN II CRC32".

(2) Furthermore, I took commit b97fad10de387 as a model for my patch. You 
applied that commit and it makes exactly the same change that I make in my 
patch. I still cannot understand why you took that. Maybe I'm missing 
something that I can't still see. What is it?
>
> Are you _SURE_ that is correct?
> 
To summarize, I thought that crc32_le is some way returning an LE value in an 
array of four u8 (aka an unsigned integer).

Now I suppose I have to change "*((__le32 *)crc) = ~crc32_le(~0, payload, 
length);" to "*((__le32 *)crc) = cpu_to_le32(~crc32_le(~0, payload, length)".

Thanks,

Fabio
> We can not just ignore warnings, they are there for a reason.  Or if
> not, then fix the code up to not have the warnings, but I can't take
> this as-is, sorry.
> 
> thanks,
> 
> greg k-h



