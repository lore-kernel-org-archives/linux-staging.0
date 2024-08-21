Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6EC1B2ED1
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262508; cv=none; b=LljrjpUpsfOPtTjwk9I81oZC8ifnAGebnT8rD8O1ScD4XSG5dn0xf1ctV+PDsTTAoQKRo4ShsktXtRJSpKEFDbuyCC00lOgELxxVzzlmeOsMIVz/W3ubIo+44IL7H6TACjE/e9uCucDNGKKUBIqmNFxP5SMNggZPtLmqz2fUvnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262508; c=relaxed/simple;
	bh=vwmaLh4zcZU9ysYQatGWVZMCBVdhOOp8fnW9VPNyhBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKtwitfJsjoDa6Db/rZABUMjo82A6RwGGIeiu0F5pDm1WAOwrIfrRa0B3Y+Ed15iidxGRgwddVz62CNBr3/V0tCMsuqbFmsd9fIi9bF4+7q5m5gxKyGxkuPzxO0ej5bOFmP+nfwSQmpelBCOtNF1yHUqvYq3MQmhpQSA2QyD974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir1SRHd4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir1SRHd4"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d28023accso5181461b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 10:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724262506; x=1724867306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2QitwiEuNNARUtd2MSbapEJMilFbV4RH639T4iAGcQ=;
        b=ir1SRHd4p8Z1mbCIXnfGH8lq/WESPyATa33dK/8x+xnXeKYMM9h+W97qjyWREXT/kr
         2zAbHYFP5XDHNlRTaFGNFcuQOzF1Xe6fcYICJjIn5UCU1u+KaR7FrfK4qExeGk4e4VBc
         2x+LeE5ZNUftNl5WGCJ1bLjQBpzE6dJslgW67YsI3Lb2stDDMELWixX5O3/FYCyyfYkL
         6LkOhkQ4FmRcEUCPs4QIUs45NP8O+wGHQc8ppShoGVvALjSzn3BP2TUqEU3Kbr3m/n16
         TlZJ/Hrmo+K7InzqU4yYAMjilCaBPVAsQN3/A97rJ6eQXSWZ0/eRWIz4yiVGaYl4ECgS
         oYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724262506; x=1724867306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2QitwiEuNNARUtd2MSbapEJMilFbV4RH639T4iAGcQ=;
        b=ZVVOw42QrLiYh7W/yeE/elOFwSWCKfocarGjPfP28Z/WgWBg+MOzKL7CoN4+JhHp93
         UrwDnoHy102zWYTrTj8rplYB2WguDhSxZjb7CoLdGwk9UnJNxwuaAlhcPuhV9g8ATOGr
         ziWE881bXBbzAcOLiD2DDsXSfzgZgUu6z6iQeHCOLPNEMWI/S+rtsbEyILypEc5Eg/Va
         Mvxat6stQYifMb02NuxOqS9a1+O+GeGBlK92ZVcK36o/wa8b6/yeAUbulb3tWPwQznzm
         vN37m0o/964j+tSUUUaN5DAbB/0MlP6VoxTNaWgcZbLGaZ03a6dJ0X+GR2xfsEBjby9r
         Q3zg==
X-Forwarded-Encrypted: i=1; AJvYcCWKy5oNZBJUxtUQFjFs1PNRLpsVVuHzz9uTIJZA1NScsW4+CnTPePvkFqyznkAzNoNNzKDZ6MYUKF41pLIX@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp4OCah+y4q+/i+ETgiPBszGkzDXpX6SoagazuTHpvOHflUBqu
	7Z1zSTWvDrPQE6Kd3/NMZVF5Xg7lW6mv10UFPivE1i7lUIW6Ym5Q
X-Google-Smtp-Source: AGHT+IHA3fTEXfdi31zERq05Tq9B7V+Rlr4+hXgnN3j/g16WdRD+7L3ipGO6qiUlAiZ/IvKdrYyzxg==
X-Received: by 2002:a05:6a21:178a:b0:1be:c262:9c0d with SMTP id adf61e73a8af0-1cad81a4224mr3879325637.44.1724262506432;
        Wed, 21 Aug 2024 10:48:26 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.234.36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71422afda7csm1734551b3a.27.2024.08.21.10.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 10:48:26 -0700 (PDT)
Date: Wed, 21 Aug 2024 23:18:17 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <ZsYoYe+8k0YEyS2U@embed-PC.myguest.virtualbox.org>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <b2efc687-07bd-462a-b0a5-58e09bde32a7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2efc687-07bd-462a-b0a5-58e09bde32a7@stanley.mountain>

On Tue, Aug 20, 2024 at 10:29:47PM +0300, Dan Carpenter wrote:
> On Wed, Aug 21, 2024 at 12:12:16AM +0530, Abhishek Tamboli wrote:
> > Replace strcpy() with strscpy() in rtl819x_translate_scan() 
> > function to ensure buffer safety.
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >  drivers/staging/rtl8192e/rtllib_wx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> > index fbd4ec824084..970b7fcb3f7e 100644
> > --- a/drivers/staging/rtl8192e/rtllib_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> > @@ -61,7 +61,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  	iwe.cmd = SIOCGIWNAME;
> >  	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
> >  		if (network->mode & BIT(i)) {
> > -			strcpy(pname, rtllib_modes[i]);
> > +			strscpy(pname, rtllib_modes[i], sizeof(pname));
>                                                                ^^^^^
> pname is a pointer, not an array, so this doesn't work.
Thanks for pointing out the issue with strscpy.
> >  			pname += strlen(rtllib_modes[i]);
>                         ^^^^^^^^
> pname is incremented here.
> 
> What this loop is doing is that it's going through all the network modes and
> adding to the string.  You should look at the rtllib_modes[] array and ensure
> that if we printed every string it would fit into pname.  (Currently that is not
> the case.  Probably not all network modes are possible.  But I have looked at
> this code and I'm saying that we should just ensure that we could handle it if
> they were all possible).
I understand that the size of proto_name is insufficient if all network modes 
from rtllib_modes[] are copied, so I need to increase its size.

Given this, would it be better to use strcat?
This would eliminate the need for the pname pointer and align with 
the current code's method of concatenating the rtllib_modes.

Regards,
Abhishek
