Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F369F70
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 14:23:53 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z2so10263822wrl.5
        for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DCuTEjDe/5W2+5Tt64rnHPWnGwo6A54d3KDraPgBqbo=;
        b=Xg0f16XVCtH4FSffGtc+oVvfY/RQTzT1CUiia4OuCqkzn/ybf7NjtzE6y4zfO2XWfi
         05721sPv1S9YMeyet/sLlDflKVsz2BbW1URknSUCkqPlUBgOT0+Qdn3qpc1E3y/SjVXS
         yXSrqduDDAsv4mW/Mnoaab5m+nw1xLP+Cboe6Nh/j4J1rXN9a75DVZwvhCNGal6I5pE9
         Q1ak8zFI/nUVANh8JhYuagzyB4SfuTEaTQWTcD7h0hSbZOyTdznsOjtZVjjFrxRZJSKi
         7WvTLrhlp+XSuGvO1GoURGHYG/hk1zx8r1Oy7bUXcYTZsUN/imZ9nZXZgAmHovx6QqWC
         lzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DCuTEjDe/5W2+5Tt64rnHPWnGwo6A54d3KDraPgBqbo=;
        b=IMLDayTddyrFg7UW1xGmVhfNXcTb2raL5EwXoZxN6+nWFnkrmU0mPoFaveRBS/4xrx
         ydgBRwhI5y6wTPXQdDRR/zyMLOjVtyho7yylfir/d9PKrfc0pkVqCd1CaoRHy2IyohJK
         fvof/tYqlJ/rJ9HrZ2OLVwGOg1SfDYLUqhhGyVl3Wmy6Ng99oeVv7+mmSMQ14AJuw9VE
         9OWO+yzQc7ubS/HTaqSWb9zm1O62w/XzcV3qFvBC6oS2cZUWVCgKHFUsKkYmrx9CLOkG
         L2vuaRgOvrjFiur2Gktfgyaz5Ip1sIgBPgMVBPFNEunSn+CsgYmb3VksS48Odi7quIB6
         d4sA==
X-Gm-Message-State: AOAM530CgEb+bRMKNGHMAWI3UgwMBsTg0Jhza94kUg5B/WLo8Tz2zqT9
	gGbKXrcvk6aXgiUGtpVSlZk=
X-Google-Smtp-Source: ABdhPJwfVuGHbgAxAM1l4vYOBmHnvNDuO9vuw74HOi837D+KQU2q+eVP/A0K8g4QzL5JpC5QAwO67A==
X-Received: by 2002:a5d:6304:: with SMTP id i4mr23996904wru.155.1616941432347;
        Sun, 28 Mar 2021 07:23:52 -0700 (PDT)
Received: from agape.jhs ([151.47.29.17])
        by smtp.gmail.com with ESMTPSA id m14sm19653524wmi.27.2021.03.28.07.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 07:23:51 -0700 (PDT)
Date: Sun, 28 Mar 2021 16:23:48 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@oracle.com, david.laight@aculab.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/20] staging: rtl8723bs: include macro in a do -
 while loop in core/rtw_security.c
Message-ID: <20210328142347.GA1450@agape.jhs>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
 <0f176b08b7a49d6649ff9d5468bd912e58c1db06.1616854134.git.fabioaiuto83@gmail.com>
 <YGByG/9r6yoylXJE@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGByG/9r6yoylXJE@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Mar 28, 2021 at 02:10:03PM +0200, Greg KH wrote:
> On Sat, Mar 27, 2021 at 03:24:18PM +0100, Fabio Aiuto wrote:
> > fix the following checkpatch warning:
> > 
> > ERROR: Macros with multiple statements should be enclosed
> > in a do - while loop
> > 2014: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:2014:
> > +#define ROUND(i, d, s) \
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_security.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> > index 0ddd7667a986..8a447e149438 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> > @@ -2012,10 +2012,12 @@ static void rijndaelEncrypt(u32 rk[/*44*/], u8 pt[16], u8 ct[16])
> >  	s3 = GETU32(pt + 12) ^ rk[3];
> >  
> >  #define ROUND(i, d, s) \
> > -d##0 = TE0(s##0) ^ TE1(s##1) ^ TE2(s##2) ^ TE3(s##3) ^ rk[4 * i]; \
> > -d##1 = TE0(s##1) ^ TE1(s##2) ^ TE2(s##3) ^ TE3(s##0) ^ rk[4 * i + 1]; \
> > -d##2 = TE0(s##2) ^ TE1(s##3) ^ TE2(s##0) ^ TE3(s##1) ^ rk[4 * i + 2]; \
> > -d##3 = TE0(s##3) ^ TE1(s##0) ^ TE2(s##1) ^ TE3(s##2) ^ rk[4 * i + 3]
> > +	do { \
> > +		d##0 = TE0(s##0) ^ TE1(s##1) ^ TE2(s##2) ^ TE3(s##3) ^ rk[4 * i]; \
> > +		d##1 = TE0(s##1) ^ TE1(s##2) ^ TE2(s##3) ^ TE3(s##0) ^ rk[4 * i + 1]; \
> > +		d##2 = TE0(s##2) ^ TE1(s##3) ^ TE2(s##0) ^ TE3(s##1) ^ rk[4 * i + 2]; \
> > +		d##3 = TE0(s##3) ^ TE1(s##0) ^ TE2(s##1) ^ TE3(s##2) ^ rk[4 * i + 3]; \
> > +	} while (0)
> 
> Why is this code not using the in-kernel crypto code instead?  I'll take
> this but that should be something that is done to this code
> eventually...
> 
> thanks,
> 
> greg k-h

ok, I will indagate fo the fix.

thank you,

fabio
