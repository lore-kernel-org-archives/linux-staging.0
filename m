Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E446A5F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 11:12:46 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c8so5225310wrq.11
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ayZF+r0b23wrtO9csco3tVZwSgnXFBof0wM4XBNzSeY=;
        b=Q6P3d9Nssxdq0W6ZzQ+wBSG6cCt3phfWqjg+a1wnooDpDBk9V2Y6vtzhc7Mswq7Oa4
         86LN7+vvcaccPuLTYyhtOykF671k9jme2L7xtAdJMWtuLqO3YSTMAIQRRXpZtBSA1fZM
         YwGtR4vUOGJYIAcfJZF/+PL9hQwHZsRuAXOszcRe7mzYNL9yR9C/KhcahivYftl1biC6
         dx/tCHZ2jDe4M4RbYe76/kSY9sYRakFXpwcR6gMZuBqc4FWRn0Gmu6Usbl9y5Ks5hyaO
         eXc+XqjUm0O24RFK8ihLmL1SmrFYmItCps6dttIh/lOO3qL+Hot939nGXUK+7zYJ3T0l
         ebTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ayZF+r0b23wrtO9csco3tVZwSgnXFBof0wM4XBNzSeY=;
        b=KM074UqxtdpYmfPVWiBn3n8E1jtLE0VdnKiApQf3EzPbNXPDERQxYhda+8lNpMlpVs
         y+jnEZQUdwJWsmX6fOkNWMSb/aD6bO6Eodlc7VPQAlpII3Vg9yHBZkzg4DebExjeulmV
         eGIbs8mYA1qv03J2ma425A3F9bqMwNyrW6G1ae7Gm+5XCtjot1LIEF6nmIswWa7h6C2M
         AgVLjH2du/Fb3w26rgDqQtIyb03CNlPVry4cUp6fWvZK0n6xuegOrTCG9NKNXb345m7y
         iJNXPNXselzPxExkFzs72OjB7ot24kTdeNEInXY+dSvEXMwYDkFafiKcoq1atyBRpxt0
         CioA==
X-Gm-Message-State: AOAM531ZT6nePfUKFnmpQ3VYgUwBco2gDzf9I5teihHv6LDsGXdEzJft
	Fx0mSQKqRNEMB9htazXQytE=
X-Google-Smtp-Source: ABdhPJwznLZx5Bx6+2GrBnlYTkUGcLrsIXno08NsxbhiZdxiU5vV/Bn/9P+rxdwK4XWTyDupt0/+Dw==
X-Received: by 2002:a05:6000:1868:: with SMTP id d8mr14061223wri.301.1616757165461;
        Fri, 26 Mar 2021 04:12:45 -0700 (PDT)
Received: from agape.jhs ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id i26sm11065917wmb.18.2021.03.26.04.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 04:12:45 -0700 (PDT)
Date: Fri, 26 Mar 2021 12:12:42 +0100
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/15] staging: rtl8723bs: put parentheses on macros with
 complex values in include/basic_types.h
Message-ID: <20210326111241.GD1452@agape.jhs>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
 <2c7c198ccef194b06921bc476eda7d5102ab70dc.1616748885.git.fabioaiuto83@gmail.com>
 <20210326100408.GE1717@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326100408.GE1717@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 26, 2021 at 01:04:08PM +0300, Dan Carpenter wrote:
> On Fri, Mar 26, 2021 at 10:09:11AM +0100, Fabio Aiuto wrote:
> > fix the following checkpatch warnings:
> > 
> > ERROR: Macros with complex values should be enclosed in parentheses
> > 154: FILE: drivers/staging/rtl8723bs/include/basic_types.h:154:
> > +#define SET_BITS_TO_LE_4BYTE(__pstart, __bitoffset, __bitlen, __val) \
> > --
> > ERROR: Macros with multiple statements should be enclosed in
> > a do - while loop
> > 161: FILE: drivers/staging/rtl8723bs/include/basic_types.h:161:
> > +#define SET_BITS_TO_LE_2BYTE(__pstart, __bitoffset, __bitlen, __val) \
> > --
> > ERROR: Macros with complex values should be enclosed in parentheses
> > 168: FILE: drivers/staging/rtl8723bs/include/basic_types.h:168:
> > +#define SET_BITS_TO_LE_1BYTE(__pstart, __bitoffset, __bitlen, __val) \
> > 
> > parentheses solution preferred for all fixes and made macros more
> > readables
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  .../staging/rtl8723bs/include/basic_types.h   | 30 +++++++++++--------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
> > index 76304086107a..5054c2e3384c 100644
> > --- a/drivers/staging/rtl8723bs/include/basic_types.h
> > +++ b/drivers/staging/rtl8723bs/include/basic_types.h
> > @@ -152,24 +152,30 @@
> >  /* 		Set subfield of little-endian 4-byte value to specified value. */
> >  /*  */
> >  #define SET_BITS_TO_LE_4BYTE(__pstart, __bitoffset, __bitlen, __val) \
> > -		*((u32 *)(__pstart)) =				\
> > -		(						\
> > -		LE_BITS_CLEARED_TO_4BYTE(__pstart, __bitoffset, __bitlen) | \
> > -		((((u32)__val) & BIT_LEN_MASK_32(__bitlen)) << (__bitoffset)) \
> > +		(\
> > +			*((u32 *)(__pstart)) =				\
> > +			(						\
> > +				LE_BITS_CLEARED_TO_4BYTE(__pstart, __bitoffset, __bitlen) | \
> > +				((((u32)__val) & BIT_LEN_MASK_32(__bitlen)) << (__bitoffset)) \
> > +			)\
> >  		)
> >  
> 
> These macros are terrible and this makes it uglier.  Better to just
> ignore checkpatch until we can figure out a way to re-write this
> properly.
> 
> regards,
> dan carpenter
> 

I see, will drop the patch for now.

thanks,

fabio
