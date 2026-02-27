Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE741C2ED
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 20:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772223981; cv=none; b=EJ5/GHL9mviPkQY6fwGcSFOe9xg1OaWPDEKzN56ndlEnr2o3IWtwB1jQznBt5iuuQVx6NmvBZ57mwI3B2/yC9mmM6uSCvo7oIDFuzvuaGXW7kCj/j5E5YQodmqrHDe/SiWDyEruePJXyTZvb0EVFPUhHyV3iMrikuzHtnRsu5Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772223981; c=relaxed/simple;
	bh=sGaunxUe3XPNNPCiHWu8aIkyoCVEDkofydlmiZs8/i4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Yd2h9mxco07pr9XtAfp+ms9QNeN5rW8p5unlJ1XAp+lh7y4WG7KDdZQJxRN0i7u0mUpF2fo6mA+LJVNqUrgFrIj87HbY2LUw38JyqUZLvxI/29haOSVe7KR1j8wvTrlApD/Z+TjFAt+ZuZesZcgp0RiwdpfzWdmJONCOL45+gSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfPa+kWk; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfPa+kWk"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79854193a54so23695667b3.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 12:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772223980; x=1772828780; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INl6nZytF/9MLgyQkWE0s0UVORZdhSYEFdlkksXo0PM=;
        b=IfPa+kWkdn4fnkbty31xjluBK2HLtLWDVCIwVXnRnrP7dHGUWXd4C7D8g+Aw8114vL
         3EkkWxwjpnlpmNwgfjbkfUQCLkk9j3n3Uc6zHeixv1xCOQSaBLOTjA0OUKb+09CEHeB6
         mTseeh2ICBnp29e6XQZc6ktZQlRioTtQqhOAeOemLI/529j0zfqBxuZCGsbDSdZy4aGT
         3pZvJg/2Ra/fCq97bGnPPUVAhPED892T8RZOJ+WaNt2YYW4vVYaBr7gBuWgjiQd0Bess
         qYdSH/UVQ9mjGxs3qh3Xg6PgaVjOfHirSytVH1DgKCtV2jJ7PZeMLXJodMvOIEuYJZnC
         ybiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772223980; x=1772828780;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INl6nZytF/9MLgyQkWE0s0UVORZdhSYEFdlkksXo0PM=;
        b=thk+e6nTFL1oSFAzTmchl8m+3IF5X5O8ntF2dQw+lTeUPC8i01avB2MVIs0Q+9eQgD
         7HIDGMRUARllGg55IkIHNCwf4bOzwUPrMykrpzWqDCCqBAJClcM24l4qVAhDY87Xu2+1
         V+8dV59IP6SNtgYY0Q3xyBtf4QLwjiguJWYbD+UNLS+HPI1Dgip4hpXtOIpoxbM9lSC6
         rDiMCJAOAtqHYpGL5GhuiKyVnYjL4c2izTzzahFV2XXhVEcG1DPA9KUTdklITfIKE31b
         SakNXajZaSYrOr157YbkkkZMD4RbVZgB/Dp83ju3DA5H+TwuWsPH9zfasFsQKrh6AYUv
         5A/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqmKg25AplliTl41OXffz7bAfrRHRgk8sy4lZhX3ao5PRwj7kn47AgEfEg1H5x4+9L1lgf20oKbrdICtdp@lists.linux.dev
X-Gm-Message-State: AOJu0YxkuO1rXvxnm4SVIcogN4QxWfxyAO37ZZkTu4Ti+dhvTxM7n8R7
	2p/Yw7IEcQkk2YwI6Y+Szzepaf0cPddTcSrsJSvD628NBLQ0dqlyROyJ
X-Gm-Gg: ATEYQzyCMXkhramhUST3lvDY8tnAagDocoPpHdpt9j5PfeUEp/blFTTIrWxTfRr6L2R
	htKWq+JW9WRNOt0w7YascxaTRui91xYAxYGQ0fDXtHCYSNcwnH4ICJTbd+GV0+MyO3wS1rO7LWx
	x/lJmtFwndDARL0ndgn8mGqsNGSyvn07DoIYb3Fu1qYR8kB2de9LQWhfHBfvamBKqpL3sssCwYZ
	3h3JeM2C8BXM4VTXh/9k3T8OEfyxTkz8ziGhgW3OZnqjbTcsJYZvcGjanMqKwX69KaCSFiU7JbX
	hrZBPKw/SeCp6Z35e0yiavZGgcRGHS3fwzYSqbMzzVOVrqcoDEVpUN1hSFVd/1AOjIL0OKiEK9/
	XT4NcRdTKKvn+O8Xi3VywDsd2X8inkBxRMc8xvfFK1reE2bo7l4GLwDg9Ndi/XhZtuMIoO6vUrh
	jiIYVkvkLShsEbBUlRNHpO28MSHqqb+GSurHVdCNxyvZOMwTlxT/ikhHsU5eJN5qsS5nkWq5Vey
	xVZy2MaSLXGzaBeDn7GBI7Ftu9qvWRd
X-Received: by 2002:a05:690c:1e:b0:798:1e2:cd3f with SMTP id 00721157ae682-798855e5c5emr41722467b3.59.1772223979605;
        Fri, 27 Feb 2026 12:26:19 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ad0de6sm25619657b3.15.2026.02.27.12.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 12:26:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 14:26:01 -0600
Message-Id: <DGQ0YOFC29AF.17V9X3YWRSORD@gmail.com>
Cc: <gregkh@linuxfoundation.org>, <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused 'ratelen' parameter
 from rtw_check_network_type()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Nikolay Kulikov"
 <nikolayof23@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226141333.9909-1-nikolayof23@gmail.com>
 <DGP0F87MHPIS.1IE1IQAR5Z8QB@gmail.com> <aaG3mJqfNxZui8lw@archlinux>
 <DGPXE9UVQNON.YKGOJU2LYQX9@gmail.com>
In-Reply-To: <DGPXE9UVQNON.YKGOJU2LYQX9@gmail.com>

On Fri Feb 27, 2026 at 11:38 AM CST, Ethan Tidmore wrote:
> On Fri Feb 27, 2026 at 9:26 AM CST, Nikolay Kulikov wrote:
>> On Thu, Feb 26, 2026 at 09:47:57AM -0600, Ethan Tidmore wrote:
>>> On Thu Feb 26, 2026 at 8:10 AM CST, Nikolay Kulikov wrote:
>>> > The rtw_check_network_type() function takes a 'ratelen' parameter, bu=
t
>>> > does not use it in any way. Also remove the local variable in rtw_ap.=
c
>>> > created just to pass a value to this unused parameter.
>>> >
>>> > Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
>>> > ---
>>>=20
>>> ...
>>>=20
>>>=20
>>> > @@ -890,7 +887,7 @@ int rtw_check_beacon_data(struct adapter *padapte=
r, u8 *pbuf,  int len)
>>> >  		support_rate_num +=3D ie_len;
>>> >  	}
>>> > =20
>>> > -	network_type =3D rtw_check_network_type(support_rate, support_rate_=
num, channel);
>>> > +	network_type =3D rtw_check_network_type(support_rate, channel);
>>>=20
>>> I think you can delete support_rate_num in this function too.
>>
>> Is it possible to remove it completely? It's used as a temporary buffer
>> for 'ie_len', so perhaps just the last line that increments
>> 'support_rate_num' can be removed:
>>
>>> >  		support_rate_num +=3D ie_len;
>>
>> since this value is not used anywhere below.
>
> You are right, we can remove support_rate_num entirely, but removing
> this would be nice.

can't*

>
> Thanks,
>
> ET

