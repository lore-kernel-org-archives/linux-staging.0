Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166662C08DC
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256158; cv=none; b=g3Ta7H3XGbMLcaHxa/vfoPBjTVgQ9cZIekUmb3fB4+0MQLi4bpqt9zYBxvDi1yAnOtM3HmyVYsU25HMnLGDQ97Vvgejz/m+qYUjdzw1Oee9wGi3RdcstFsbLiVHwQBv2VwzlFzJFRK8Tco3cAGd9vle8jlJbX8jpQqjgkI3IpuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256158; c=relaxed/simple;
	bh=VwSycxcMvzv0AC7JXHVYs4iVgHpyetPvOhSnM1Rqphk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWPzt0q/oyIflTGWrvSQ0sfKS6Xjin1/MOPPuO/vCC3pOhmDMrhBB9qEkOz/nEH7RMFs7am0ewVQjKENG9f7v17B3HoA+bW/zQX0t8Z3M6LAak3H6FhrUSft0lksVmLeNHBAbsVzn9jw+SpcsugKwORHlpSsCuM9OWRXqhydLNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1/lTkYz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1/lTkYz"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d72875729so2409854f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 05:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776256155; x=1776860955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xImlqYNPeJpJPui59NA6HzPPHUbHf/Rvw0mGCXMcsz8=;
        b=b1/lTkYzWEb51xMWyn968DLpiEb9p9tAylorZQqijubXZD7VyYNw9pQEizPwYDSQIW
         wVONS0/VjqOtTCUS47sfxw19WMH520EnR4/1e38n7yVw9dLoSsHFyN8EGAnQD00hIFK4
         tIlq7G0FN4PZaXTtyHWr7yvCJDB7CJdp0hhZhxnEbLD0+JxYgUc0MPOJHPfbKt5iqy8k
         AplZUd5QQO446D5xf707StFTk1aDTSBV5txl/PXJadh6YSJVb0xMGUeOQctTH1yFkFH1
         zjCtrpLadMrhlK5taP0+TR1xKvCwNN0/FCfZq9xIyd0vn5nEUyLTlAFUy7n4ARJwlcH4
         o5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256155; x=1776860955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xImlqYNPeJpJPui59NA6HzPPHUbHf/Rvw0mGCXMcsz8=;
        b=W/P7G8xmkzE1k53VWUbXDYXEkm3LsUhtTb7Ep+YWnHgkr0ultTTPxZoj6D/pZYngkN
         jvJMr4L6efR6iuVZF8N57qDgqxzCdSOqYdNgeSJgVI9SPLnj8l7H8YxArFSu/CmhOpsZ
         ZEuqHdSSldps6gSA3ev4rK1KS1d4ERxgO3pI0p8GLectwoUEyDXoGSmrdwdsykv+23uu
         myz8ZAsyqJD/ulZ60Hq7t77qjj6uz574PLbJasOzba0foSl4Q2pmhP5MSwqqj34zrzAD
         n42YBs7SSpXJOP7U5w3996E9UJNeVrxtkQ3NMYCWItxl5ZZrtE9y+ad9HbmZW0EX2C1X
         btdg==
X-Forwarded-Encrypted: i=1; AFNElJ+arCLP9tKyLz5nWk5oN+mvsHjcUZB5YxCZXeUEtLTlnwXgbRrA9iTKqhqjYhnOyz1PmVJyxqKfSd1wEIYf@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8TuXiOWk5xeWPBablunGTmQod8rkl5tB/jfEg3tmJaq1xiJV8
	nTz4t8lwGg6qE7EIV6C49rsCR86nAAHCgEv37kENnjJ2vbJJ9GZmWDDi
X-Gm-Gg: AeBDievI1+bvpoTmUMS1OwKWycsXLfFkIn1VIoebwo73f1jnV4Y29JnCsfuAvsiac98
	qFkddXolgXxym4wMY7yZx+WcTjv1MOpHtI0Zfx2t5iAEoSyjTxmkE6J+nC7h21InhIwDcfXNv+9
	qbKC1uqMxofEz72TJXQGLBfAh5VT0Y+33bXYjJ6CtxnnDagziqFypdKD/QLYeXBCqIqhzTMAthf
	MreKtbdSJNhOQ2FqM9KDTOw6mR5Gv4UUrKCIsSL0eZdlEnn9lG5Nm2/McOXWZpyAEp22cJoHoFO
	+cYBsJmnzOwi7gB/Uu5F/ZbmmFdKy0ogVh8YSsGeSYRfr6gnQ8jjy/Jo1Jc3ZmJ9F5jZPjGFzlN
	8I4yi634E7EsyHtL9zt9TaGcR5TqvCMekYMH2QwTxCYbN5sCIF5bALcLieCf3eAwjo4ykUAOyrA
	f2rTEwugmHNRlJjGwAshGOjNzwrTPieg==
X-Received: by 2002:a05:600c:628b:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-488d68603ffmr271059445e9.22.1776256155141;
        Wed, 15 Apr 2026 05:29:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d65asm4951177f8f.4.2026.04.15.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:29:13 -0700 (PDT)
Date: Wed, 15 Apr 2026 15:29:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix remote heap information
 disclosure in issue_assocreq
Message-ID: <ad-ElrLRiFsee0By@stanley.mountain>
References: <20260415050302.9934-1-luka.gejak@linux.dev>
 <ad9TKjTLxDRwDyIy@stanley.mountain>
 <DHTO9P2GULIP.2VT8AWTTKPL8W@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHTO9P2GULIP.2VT8AWTTKPL8W@linux.dev>

On Wed, Apr 15, 2026 at 12:55:48PM +0200, Luka Gejak wrote:
> On Wed Apr 15, 2026 at 10:58 AM CEST, Dan Carpenter wrote:
> > On Wed, Apr 15, 2026 at 07:03:02AM +0200, luka.gejak@linux.dev wrote:
> >> From: Luka Gejak <luka.gejak@linux.dev>
> >> 
> >> When building an association request frame, the driver copies the
> >> ht capability ie using the attacker-controlled pIE->length from the
> >> ap's beacon. If the ap provides a length greater than the size of
> >> struct HT_caps_element (26 bytes), it causes an out-of-bounds read
> >> of the adjacent heap memory (HT_info and network structures).
> >> This uninitialized or sensitive memory is then transmitted over the air,
> >> resulting in a remote heap information disclosure.
> >> 
> >> Fix this by clamping the length passed to rtw_set_ie() to the actual
> >> size of struct HT_caps_element.
> >> 
> >> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> >> ---
> >> ---
> >> Changes in v2:
> >> - Refactored rtw_set_ie() alignment to follow "open parenthesis" style.
> >> - Allowed the line length to exceed 100 characters for better readability as requested by Greg KH.
> >> 
> >>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> >> index 5f00fe282d1b..08e597bc0345 100644
> >> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> >> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> >> @@ -2954,7 +2954,9 @@ void issue_assocreq(struct adapter *padapter)
> >>  			if (padapter->mlmepriv.htpriv.ht_option) {
> >>  				if (!(is_ap_in_tkip(padapter))) {
> >>  					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_element));
> >> -					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length, (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
> >> +					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY,
> >> +							    min_t(uint, pIE->length, sizeof(struct HT_caps_element)),
> >> +							    (u8 *)&pmlmeinfo->HT_caps, &pattrib->pktlen);
> >
> > You're being conservative and trying to work around the invalid
> > pIE->length, but in the case where the original code corrupts memory,
> > we're allow to just give up and return a failure.
> >
> > There are two other cases where we trust pIE->length in this function
> > and those need to be fixed as well.
> >
> > regards,
> > dan carpenter
> 
> Hi Dan,
> should I keep my approach as is or just return failure. I will fix other
> cases as well with whatever approach you consider correct.

You should return a failure.

regards,
dan carpenter

