Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42433438D
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874930; cv=none; b=LGExDsXr+5g6/qY7on+2Pk7OhFhW5/YYYEktL1VLrb2DRsFvJGKHczxYV0RoHa6q/vNKvsal4Koj4lddZC9+c/jal9qK8/qhiJIZnRALWRaJqRLlyZsfhnB2kvGtpgbUjqFrHjegDFtIjvRq6KPbRETRbgZPMapCKmnIKCKMSzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874930; c=relaxed/simple;
	bh=ZWej01u1Hf3SzaB0iOrbBcMuPcKg9g5dTe8m5aCWtDw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ulgl71wg+5wYwy9ZwaxqEbhgqxOTJZX2wXO2hdrQzLYci2OTwF2P2umf17S/xRzesjDf7nup5q1+ERe1gWn30RM51H8SIZAgN/SbS45bJkWCUpBPZ6sGcKQjcP90nV6EoyefU6iHZ83QMX2fpIKDRR7tDT/mMw0HKfVfZcGF2Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N20PAG5P; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N20PAG5P"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4807068eacbso25660305e9.2
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 07:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769874927; x=1770479727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6420eqZnmN5qhlr+s4u4L6GkZFEZpB8lEtq4Lv7b8uI=;
        b=N20PAG5PjCr1HF4+rFxbbaK+vdPoGza10Wo1R2IFCv1YWek1SEDgiUlUtlevffckpK
         XGo5Fkzz8XP1YEF4irGvRBwKF3wtAYdl0HyPEHzYE3360+dWg1L+FJREjSn+d0bqcc9D
         IEvcIjQE/4MR/t4bMYJhhjt7iRJ3Qyf7PugmyjXa8nJCBILY/7Wgu68P3gGUxuWwQxhQ
         IQmgjexIKEADAzJGfMbTP6ofhDUDpss6dEFPwAOZJwvebExO7sBCOFgg6rbmXvigMt2h
         bsCCkB4gAZQrzVN+2iRhsbGDaBVNFPgNNmFWRowNBeO3ZCN9RgduMoohCfeShWgqEPuo
         MDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874927; x=1770479727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6420eqZnmN5qhlr+s4u4L6GkZFEZpB8lEtq4Lv7b8uI=;
        b=qfdiiD0zaskIH49Z9mf6Mv+4ytaUYkFf+ef0QNi+WMF8yCw6jnG1iQ7Ii5f/VHD0x0
         hg0g3c2Zzd46vfm7yaRSo7C0hQLxYTXe6AtBoDOSOOtoZVi8VvVsNvKg5hHL5NvYFwLf
         Xj7CjG8pLWY3sHO8cYseGQsdRWIZMm49Z933X6DFJLYNffQ8W5HyH8ZPtL6yAUH7x8uq
         TWkRytKpurGY6ma9POoKlOH6e9x4jCLEM2uaFSTKPXq2iHCKlhf5gn6nuE+2MJEqqWV+
         CzlEcinII+k2pkWtCCSNwaHg3qHwJiNVzZsqcDhKY1fTPneHB6V5IpIYglYZP2/kCgs2
         bjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaheezSjJ18MMbALUm/HEM8QQQsqcJbPpUhSFkseByDbPOk5ERQc6doDDPs/wazsxfli2luI7MFjNmjUFz@lists.linux.dev
X-Gm-Message-State: AOJu0YzpRzmXstLUdCHk7E7yB4gtJw1W/sgSUvT7uSEcRk4wylhRlLP6
	6dmfouyv/LUL8ST4dp/J2sxXK3MKke03aHP8B+ZnIjNv90Ob5/vsdfpRqVY+Kg==
X-Gm-Gg: AZuq6aIUtKO82ovMLRRJEX90b76V8HJuhmeeWB1dn2TMcNxfVn+g1+Yl6Le6CNHLS1N
	Y9EnsdRBXDujVe/uehBc+mAx+h/pefQTTXrFykf5aOeiBBW71hhI3f09MWh3nthwEHVJx5Gl8yb
	2hnDvL1nwwr3Kp5Q0yl3BBwtMRUt66T10USMSCV/5X5yJYF/u8hq3wLszJd8AjnQ5zOpr0gl19x
	pbO+DBEHEpSPPEm16yrXuKO5dmyWKTSnWnu/lTHDk18m7Z/yYgzdanLpswPStpK+Rr5KLzLBehy
	FfeTB/qgn7wl2g2AadrMJSSb/WS81QRgbFnEoGs4i7grrRcKlRSg3ZjikxQ58DSkuw1Ap9k0CIH
	Qu+iTtcMGc8vkyM5Xw2vSkai9JwdwymexXAbst6qCzNyhkWwVn1xq3q7ZmtZSNC5g3Sr5Hb7uV+
	D3OGfRowBKoNqa3EG2XHmU/7P0BLeEAz80M3SQIu4boOqGSETf2m49
X-Received: by 2002:a05:600c:4590:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-482db014bddmr84144735e9.0.1769874927157;
        Sat, 31 Jan 2026 07:55:27 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm502294255e9.5.2026.01.31.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 07:55:26 -0800 (PST)
Date: Sat, 31 Jan 2026 15:55:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: William Hansen-Baird <william.hansen.baird@gmail.com>,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace ternary comparison with
 min_t()
Message-ID: <20260131155525.05e1645e@pumpkin>
In-Reply-To: <aX4U_vhLXX0B12DS@stanley.mountain>
References: <20260131133146.8174-1-william.hansen.baird@gmail.com>
	<aX4U_vhLXX0B12DS@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 31 Jan 2026 17:43:10 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Sat, Jan 31, 2026 at 08:31:46AM -0500, William Hansen-Baird wrote:
> > Replace ternary comparison for setting copy_len with the min_t() function
> > from linux/minmax.h.
> > Change is purely cosmetic, however makes the line
> > easier to read without having to reason about logic.
> > 
> > ---
> > v2:
> > Drop unrelated style changes and fix style issues by running checkpatch.
> > Keep min_t() to make the signedness of the comparison explicit.
> > (copy_len is an integer, wpa_ie_len is an integer but sizeof yields
> > size_t)
> >   
> 
> This stuff is supposed to got after the --- cut off line.
> 
> > Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
> > ---  
>   ^^^
> 
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > index 8e41eb61448f..d36f6c3bc9b4 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > @@ -4,6 +4,7 @@
> >   * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
> >   *
> >   ******************************************************************************/
> > +#include <linux/minmax.h>
> >  #include <drv_types.h>
> >  #include <rtw_wifi_regd.h>
> >  #include <hal_btcoex.h>  
> 
> These are supposed to go in alphabetical order, kind of.

I'd always put system/global headers first, but that doesn't seem to be the standard here.

> 
> > @@ -1024,7 +1025,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
> >  			pstat->flags |= WLAN_STA_WPS;
> >  			copy_len = 0;
> >  		} else {
> > -			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
> > +			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len + 2);  
> 
> Use umin().  "int" is wrong because we don't want negative values
> stored in copy_len.

And the correct way to fix min() bleating is to change the type of the variables.
Using min_t() ought to be frowned up and only used as a last resort.

In this case I think all the variables declared with wpa_ie_len can/should be
unsigned int.

	David

> 
> regards,
> dan carpenter
> 
> 

