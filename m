Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD4389E06
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 22:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769900326; cv=none; b=TTBf/TXWvtj3EDbPJqbXpgrACO8Hw4AU8Kv+IBWtc4mGBJJ9hYlh9ukxzoFKQaI49V9Xd/LSqxQ3ttsKgUy7vmkkTBc88z2bvhdtloGDpzFSIbyrvGJA1tysDQznu9RFtBYG7KevhvaLz5z46JasQOmBmRSRzAkg2PFcvFuOFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769900326; c=relaxed/simple;
	bh=qvLXj3C0ln4Ro9ot8vq6rkQafH04GAkmaEXUNJbE/e4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdH9xv742qst+lw40tp+aE0UaNYntgw+KIBfmIBCay3vYSoaz3falEUuKvP9p33XmX9flR0OSH+tCUMFj6rjCiD+Z1RHX0OFOF/wBFU2Shim45UuT165vjEFI4BCKsJIe3zcmw5+GrtfZ2abHUeG5/AD4LE4K/n2NomV43N4kGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRsLqSJc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRsLqSJc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so25117325e9.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 14:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769900324; x=1770505124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNAeH9OugmIY6Mp3nXkb+OeX3PyAHH7b09rhZzLav6E=;
        b=FRsLqSJcYxrYk1HohCXc2cPoL84w6Kjwv/ZZx6y2z1AwQaXxdUkWdR31GHFzWX3ILX
         vUKaWfT0abIXbPUu8TdgnUb447mXcijs/yzzwGHCw6x9xYqLI0BOhvj4A4SglBkl3atk
         hSeemI4uJxE47cTZ966K99NHWy4BwBzO23O2jm/t4ROxLcwNgyPS2gc9dUMlSRdjKPVu
         yJ67BV2YzR5xNSjrsQSGQDYLiTw6gR/fk84ayZ1L4QMBcypI5xkTtiOC6elUuigSvu3F
         1Fz2uXvznUHVFvL8JYBQ3SenqLNLxlCp9bkOvVOkVE1upPyjSC5u0BJ8wyA5RFqpvqhX
         wUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769900324; x=1770505124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNAeH9OugmIY6Mp3nXkb+OeX3PyAHH7b09rhZzLav6E=;
        b=qVJoTKWfGjisjb/3IhGVbc4DgQymvbStOxNtt74kYBMXNcsn0lF06Z0lYHRllSJnT4
         8dxu0BxZPG7PpXek8JzpACYuI9NPR0K/qxk4sUnBSheTHdD4GqqlieSUxj13HOcey1BD
         Ef75wvzX/6bkphd/eR+xLlUnlJzoSQlrudESt/lGdNumnzAevxrRsyaHc7ze0E9EB56c
         nfB/S6lK2+X4XLQkA9an5+mIU4yC7jdMtui8yB85HLOEZQ9+FiwujERaeaYKYX5xml+l
         /FVyK26V03WBfVLCg/TkktbF9v4ue6FbxAEE5ZaH0Z28I9Odg07YMzQiptqQ8YJJ8Oys
         I3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRyi+kvebZWlCNhJvLlVSKs0ESofpjIfhfCre2ObIVh4Hp8wXwibrRj2sETshY2sAnBmcTFIy607AH6lAP@lists.linux.dev
X-Gm-Message-State: AOJu0Yz63GmN54kSkYbV1cxVK1YkujO1+hvAqUmS1qLDLzXV3iw5hUUr
	sR8YnDQHjak3iTYuXxfy7FnG+Odn2/1mND+7IUq+UYoVeep2oEn/g5t4
X-Gm-Gg: AZuq6aJR4rOKfRKCLDpHySZE9EdLUwnrJ/dAddcDW/cVMB1xKHlA9p8DH5NZWIMYKJX
	t81AQQ9b9aobK0O81WyKLbcfzgYlYAvUrHakZAB5C3HKTV5U+Bgfw1mWv729S6TSkW/dove8DOX
	6aOnQWByyDrRR2KdQG/LfN3HHX9TqrwMWrWA7Mygtk/MDyaBYjGzPVqahP/Dd0Z8FCug+B63tr6
	trIY0PCWzQwfmlXELYagFt+bEkFEgqaxnTU77itGZlmfQtHrxUxWJWhWYnxbm9NRZfhNQSHWsMY
	YD58DICp+P3DFrsd5BFljyrOj4xMC9+QsaN5YQCzJ4T0bFqTg2kBFtrPoDnlvasncJfOIBZJTYO
	H6rE7M8OU+LJbacGpZbvE6FzZ5sb8SzkpWKtfNurtw/hroZjM7P0aCBBQE76roIdUdRK9FsvyJ0
	pHZUgJGWJuC5D6IBHg/Zut6ym9Bv71Cah4rq1j8DcdFWRHz/xIynWU
X-Received: by 2002:a05:600c:4fc7:b0:480:68ed:1e73 with SMTP id 5b1f17b1804b1-482db4f39fcmr85146115e9.36.1769900323417;
        Sat, 31 Jan 2026 14:58:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm35694247f8f.15.2026.01.31.14.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 14:58:43 -0800 (PST)
Date: Sat, 31 Jan 2026 22:58:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: William Hansen-Baird <william.hansen.baird@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, gregkh@linuxfoundation.org,
 straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace ternary comparison with
 min_t()
Message-ID: <20260131225841.6ec19c9d@pumpkin>
In-Reply-To: <aX53mt0cFlcz_2VB@william-fedora>
References: <20260131133146.8174-1-william.hansen.baird@gmail.com>
	<aX4U_vhLXX0B12DS@stanley.mountain>
	<20260131155525.05e1645e@pumpkin>
	<aX49e37jGXj674bq@stanley.mountain>
	<aX53mt0cFlcz_2VB@william-fedora>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 31 Jan 2026 16:43:54 -0500
William Hansen-Baird <william.hansen.baird@gmail.com> wrote:

> On Sat, Jan 31, 2026 at 08:35:55PM +0300, Dan Carpenter wrote:
> > On Sat, Jan 31, 2026 at 03:55:25PM +0000, David Laight wrote:  
> > > > > @@ -1024,7 +1025,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
> > > > >  			pstat->flags |= WLAN_STA_WPS;
> > > > >  			copy_len = 0;
> > > > >  		} else {
> > > > > -			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
> > > > > +			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len + 2);    
> > > > 
> > > > Use umin().  "int" is wrong because we don't want negative values
> > > > stored in copy_len.  
> > > 
> > > And the correct way to fix min() bleating is to change the type of the variables.
> > > Using min_t() ought to be frowned up and only used as a last resort.
> > > 
> > > In this case I think all the variables declared with wpa_ie_len can/should be
> > > unsigned int.
> > >   
> > 
> > That also works.
> >   
> Hi Dan and David,
> 
> Thanks for your help. After reviewing the code, I do see a few checks 
> ensuring wpa_ie_len is never negative.
> Therefore umin() is safe in this case, and for v3 I'll update the patch accordingly.

umin() is a bit better than min_t().

A subtle change is doing 'wpa_ie_len + 2u'.

> Would you prefer I leave it at that, or is a broader change to 
> make wpa_ie_len unsigned worth doing in a separate patch?

I scanned the code some of the variables seem to be different signedness 
in different functions.

But a 'false error' from min() is really an indication you should be looking
at changing the types of the variables themselves.

My main thought looking at that code is that functions are far too long
and have far too many local variables.
You also pretty much don't want to use u8/u16 for locals just because the
values are small, it doesn't (really) save space and can increase code size.

	David

> 
> Thanks,
> William

