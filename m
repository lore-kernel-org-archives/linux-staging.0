Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FC818DB10
	for <linux-staging@lists.linux.dev>; Thu,  3 Apr 2025 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682417; cv=none; b=ZHMEh31o9K0R41YMD4BNp669Wfv6qWuZROseui84wZhCbjYjqb3xviAP3NAa84RIU8LNgKjfU5rYivLrV7Wxq8MFGUKmwIWp/ePpqIolUor8vLoF3E91fRpQwogWbUKKU0Gqx9wbJiuObl3es2XOqyfqcwgpYo/vVJlLXjK0DDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682417; c=relaxed/simple;
	bh=6HBSXgVJQpnXZ2wUeUNsTHZDwNlVPaiPU5s4ReCzWvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoKRQjfCLFEq9UwEBP9gOfW4Yw2RGkZ4RpPONxJr3CYejPsHBEflEl+ESbCl0/+K7VHe/jUgXht/unwM+bFdPRdBwwJgvv8J0yzRkExwA8ZkDl7OcRmsPdwdnYBlvw58df5yy34VoG5Lvn+fy4sLx7Qn9LH4Z6nX6nwS9zJkYY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUYyKpaq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUYyKpaq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so5215865e9.3
        for <linux-staging@lists.linux.dev>; Thu, 03 Apr 2025 05:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743682413; x=1744287213; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YoPotb8pXLLdqy0ZKPd2+Zf9wmiJLFly+WdaF3/DU0A=;
        b=PUYyKpaq0sHCSgNtRFidX2hnT+EE3RgIJjs5Ouelkbjih6ZgXQE2D5yZcr6bQP2LT5
         M3/LQ6SeArWOrJHEfpDpdtNoqxxGN5f9bjuvr7MIpwmuQIKtdbr8sCnDxcCqD/hPcF6b
         ZxSsqN33qVrElpujZkm51yL0WpKokeC0WzvOQRIkz79+5IsiTlcIzWkQbLAnp9nXTu0d
         EFGWJIZ4/pFMMNcuRzKXbNI8idOXNEn7a86im03hZn6ZX9EimFwazuHcaZNFxWiAfBuh
         Jmm23ZjpIAY/nCj341SgR/UkkJUvQfXthJ+ltADF25S2rSyvO3ZsOGeYXUqmmqJapUGh
         OjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682413; x=1744287213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoPotb8pXLLdqy0ZKPd2+Zf9wmiJLFly+WdaF3/DU0A=;
        b=dy99qprMxlXpEeXc3A4vaZwpQ85B8L5T8IoqS8KocN0g9+CQ8HiIaufim73W0eTRWp
         sDogXSKph6n0D/TdmZvYwzQqq8toRSv4i79/J3d5fFIlKHxCRjtFe3Awj1ypnfVcBoml
         IQWM+z2gwdQvcrutdPOhgPzGkZv+ymFnA1bI4RV3mXpVPaUnNrGW50YPqjZB4+UVb3un
         cM1FIYTaVnsAAoSZ8wwyFa8eOJ3Z81wgB5ylKAsCffX9DjGxJC+lZk+6TvE1RLYVGIhH
         MXt6KbL1Gsksc0/x/EV3kzQ4EBHhiU17Wg2Iowm6B2joLfYU14QwcK3NMMySF+z4inYb
         uO2A==
X-Forwarded-Encrypted: i=1; AJvYcCVMqDz77k+Xc8u0BccxMJwcrziQaNkcjslljBwhWU0oSanjc3qpm4X2kCrjQpEpjZJWQZep9b/nEw4OXWRj@lists.linux.dev
X-Gm-Message-State: AOJu0YynW/miqIJys11yAJEkOJEs7I6ZLP+zDlt0ut2p1Gm9SA6ENtz5
	C9v5cEpGD+Hx7wB+hl8XEF6iVRNe75sZwmYbcU7m4jPudWyt2IC2b/l/9RmDG6U=
X-Gm-Gg: ASbGncuxgWYXWAD3n81/3jSz8wPK7uEDCanuWjc6L0cRhmGlnkDra608F/Wd7nLkw9y
	0rDm6r22wWRsId2rwrBl+fcCOa6wOF7jzNY2kgLFrE49a81qRZAOTngqVyuraLEM3209OPB0SBi
	hHd+ZhdfntnZfkhTKOJHPrwGKtzzbFk3VHyXvUZs407lOHnNFTI/cSUfiTPogCMjInF5vDBDgiE
	NGA77UUWQEB/H0YrTGiw5/9KI6PEJgJpWOKiCHtpjo4aJr3u95JVr4SZlxQL6qDi172qeEqn1Kq
	+BpjE2XxQ3xi+TBs4pf+69P/MvHW+GLwVl6V2qVhK6IwTiq2FA==
X-Google-Smtp-Source: AGHT+IGBvPoR+oe6zc3Bkj+MZpGdnpSz1Fof/p26ip33prZb/K4xDmqMovA0IJ8E/rXDyTM9UmrROw==
X-Received: by 2002:a05:600c:5117:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43ec42a00b0mr23581235e9.13.1743682413384;
        Thu, 03 Apr 2025 05:13:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec1663060sm20483615e9.14.2025.04.03.05.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:13:32 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:13:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
Message-ID: <Z-57aR3JYrdpHafs@stanley.mountain>
References: <cover.1743613025.git.karanja99erick@gmail.com>
 <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
 <2025040215-confusing-sibling-f99f@gregkh>
 <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>
 <2025040246-series-tusk-bec1@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025040246-series-tusk-bec1@gregkh>

On Wed, Apr 02, 2025 at 09:41:57PM +0100, Greg KH wrote:
> On Wed, Apr 02, 2025 at 10:34:22PM +0200, Julia Lawall wrote:
> > 
> > 
> > On Wed, 2 Apr 2025, Greg KH wrote:
> > 
> > > On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja wrote:
> > > > Standardize boolean representation by ensuring consistency,
> > > > replace instances of 1/0 with true/false where boolean logic is implied,
> > > > as some definitions already use true/false.
> > > > This improves code clarity and aligns with the kernel’s bool type usage.
> > > >
> > > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > > ---
> > > >  drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > index a389ba5ecc6f..fd04dbacb50f 100644
> > > > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > @@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
> > > >  			u8 *mgmt_DATA;
> > > >  			u32 data_len = 0;
> > > >
> > > > -			pattrib->bdecrypted = 0;
> > > > +			pattrib->bdecrypted = false;
> > >
> > > but bdecrypted is a u8, not a boolean type.  So setting it to "false"
> > > does not seem correct here, right?
> > 
> > Is false different than 0?
> 
> Does C guarantee that?  I can never remember.  I don't think it
> guarantees that a 'bool' will only be 8 bits, or am I mistaken there
> too?
> 

These patches are fine.  This does come from the hardware but the
patches don't change the layout of the struct, just the right
hand side of the assignment.

The C standard doesn't specify the size of _Bool.  It just has to
be unsigned and at least one bit large.  The surprising thing about
_Bool type is that it doesn't truncate anything.  So you can do:
"_Bool x = y & BIT(20);" and it works, but if we use unsigned char
then we would have to add a !!.  "unsigned char x = !!(y & BIT(20));"

Btw, true/false are not keywords in C.  They're defined in
include/linux/stddef.h.

The main review here is if there is a typo where we accidentally type
true instead of false.

regards,
dan carpenter

