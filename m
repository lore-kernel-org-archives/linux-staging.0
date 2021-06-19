Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05DF72
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 09:20:28 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id p13so9717795pfw.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 02:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h6U+ip6SC6pAZmxuTxatgMsO1k4mn3H80WDAN7mFMJs=;
        b=crcjxWRSpdvPpetfG0nkbWH+v91CS1lUwNKLPPEwAdAGd2dtrYT95d5SQ513CnPgHp
         Rvo21FuClNdZjUQPLdmqm0iGyh7SSfXnsKx7hSxOwu0vfrDXOuci2eQZGHhGDakR/az9
         8WdSod8wdu6MhVFqojuhkgOqIIwpCiINkOsGf8RNQwETMkpXA7Cp3AoZEYr5ZF0UQGC9
         ZIBLY3xQKqWw3FRLT/lNgTLxXhHxA0iEzh6dt4Yq8CSSuNqv+x9Dmzl3qOl8fG2xnCZ6
         0uCp56ttlWvUTE3xMQSZ0i5zFdnTnZiL+X/BKxBQfODrky79HHm74WDwU2EN/7GrfABK
         ZncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h6U+ip6SC6pAZmxuTxatgMsO1k4mn3H80WDAN7mFMJs=;
        b=paot0CBBIzeLfzgbbTDcVVlvWLp0PrwxHw5vc4ROrGwb5NSgblNDQtP48WfOPMxwXC
         cA9insbvwT9v1NbJXr1J1ayMkcsh51hPoO6VK87qYtLHqy2SG1oTJWLZzc5vvFVSj/+L
         Xsi4/GU14/uFOMtdL4RKRRD0TnNUGVNp8r286fa9del44LcTrcZyJ8m+wy3vFMRhFj4N
         eo1Sclb8rdXpIxIysg1MYBNJdnFIk0/W8reBZJqkf40cjX+UFKgyCQbDjWCcUceWx6Vp
         g/h0V7KDITIVR+AXVX77pK2bBPBQ0Nr9B/REJgEtKn+By9rfNfBohrRKoyiwPQ2XgIYt
         kzQg==
X-Gm-Message-State: AOAM530FrWkeGuv7TXKilEdHAsrtST6/h7/2VazCCXebRE/au04215Ar
	JkjDsc1iRsFyPDrod5fEris=
X-Google-Smtp-Source: ABdhPJxQlvy+JcPrTtU6zHgtBPggP9b+H+ilYSKFGCdlfjIR/HGkWFssR1ZJuuYJf0N8m5PMCHQ7vw==
X-Received: by 2002:a63:5005:: with SMTP id e5mr14257769pgb.340.1624094428284;
        Sat, 19 Jun 2021 02:20:28 -0700 (PDT)
Received: from gmail.com (1-171-85-235.dynamic-ip.hinet.net. [1.171.85.235])
        by smtp.gmail.com with ESMTPSA id 35sm9564939pjo.16.2021.06.19.02.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 02:20:27 -0700 (PDT)
Date: Sat, 19 Jun 2021 17:20:24 +0800
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, maqianga@uniontech.com,
	marcocesati@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rtw_security: fix cast to restricted __le32
Message-ID: <20210619092024.i6aunzyd24cmr5cs@gmail.com>
References: <YMeL7PjstV601pbN@zeniv-ca.linux.org.uk>
 <20210618181751.95967-1-fbihjmeric@gmail.com>
 <YMz0DH0+v39xsCYU@zeniv-ca.linux.org.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMz0DH0+v39xsCYU@zeniv-ca.linux.org.uk>

On Fri, Jun 18, 2021 at 07:29:16PM +0000, Al Viro wrote:
> On Sat, Jun 19, 2021 at 02:17:51AM +0800, Jhih-Ming Huang wrote:
> > This patch fixes the sparse warning of fix cast to restricted __le32.
> > 
> > There was a change for replacing private CRC-32 routines with in kernel
> > ones.
> > However, the author used le32_to_cpu to convert crc32_le(), and we
> > should cpu_to_le32.
> > 
> > Ths commit also fixes the payload checking by memcmp instead of checking element
> > by element.
> > 
> > Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_security.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> > index a99f439328f1..97a7485f8f58 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> > @@ -121,7 +121,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
> >  		arc4_crypt(ctx, payload, payload,  length);
> >  
> >  		/* calculate icv and compare the icv */
> > -		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
> > +		*crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
> 
> Huh?  crc is u8[4]; that assignment will truncate that le32 to u8 and store it in
> the first byte of your 4-element array.  How the hell does sparse *not* complain
> on that?
facepalm... fixed in v4 PATCH.

thanks for your help.
> 
> Either make crc __le32 (and turn assignment into crc = cpu_to_le32(...)), or
> make that *(__le32 *)crc = ...
> 
> > @@ -618,10 +618,9 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
> >  			arc4_setkey(ctx, rc4key, 16);
> >  			arc4_crypt(ctx, payload, payload, length);
> >  
> > -			*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
> > +			*crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
> 
> Ditto.  Declare crc as __le32 and use
> 			crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
> here.
