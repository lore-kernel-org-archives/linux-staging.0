Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968CF7E0FF
	for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774167573; cv=none; b=JBQqAORJLjuTuhh1RjFnsbJ0R9jZp+SHW5GDppFdVdaDgl5VDOBwavNcKFKsuFVvWE7bFJbJerUBQCY7XafF9b1bkR1wBur9toB4USJvnl2yLQVfUK7O+kemHFBPJx9Vfz8NNsM7QJnxVm7tSR1LL899OArhpUlOWsCD3j2+CXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774167573; c=relaxed/simple;
	bh=Duli/A/Q4I0FIXf9QSopf6dwEMxRI2eY7JqKZNlaV28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uT9mTEguQyzy/rH9ShC/aRbh7TUnbf1FVJS21oHc2VZY+NzmA+ki9af2HPIipK6I4MQCZYMKFyett/YELzf7rhNrh8rvEwv+9mzD5Njl4hap+cDvqaAMk7V22+/SuDGrApQJQQntcyWu17trDhhN2OEOQt+cw4CheTyFVEivOkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLaND3H+; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLaND3H+"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79801df3e42so41340527b3.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774167572; x=1774772372; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1zKZqbnHO5R10F5lkL9optLWNBnqVSZF6G8waqAKbc=;
        b=VLaND3H+1OL9a8Oef1y0a1JPtBXeVe78dshvvPz0EBLAcwQRx10fVN/LDdtjuiP+nE
         M7eLSD/iCv6BOEChkperaBdj71SR+rhEOrh3FTQl3K64gEdHJT65/n27xPKXshcQ+AQD
         KAFePCAFnZ52anZ84KvnuQgqs4BgUdvzIq87K9lVt+CcoPK/M5jSGzJ+rpiT8MFsweOU
         dMb8d4AcVfwU00lRxNL2cfPMN622fCmr+oAzN183r17hAHz5ZaKJHRruP/m2ety3pIaU
         uvZBP46hlOAdHv/vb2puuNobP4OnedsAxCi/k6dxVZkhSNl1fW8Ecy1MJ+dco6Vd1AvA
         Ky9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774167572; x=1774772372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1zKZqbnHO5R10F5lkL9optLWNBnqVSZF6G8waqAKbc=;
        b=Al0tH0ZfTGdO5craQSlbhnF3acQhT4ew7/F+74FbdzzyPYZS9qRnRK7j+GSfagQAfU
         YHbt6bORkBDsTOVdcY9lBIcdYh8N6FgZtewJegjSknWYWMjvSEIMntxi1gRrzXOaPFGh
         QbdbKfqRhZnyBXHxbPy37UX0Pqj3qkb0H3H4CCZacfqWRcALzKxtVWi7oXGFPmu0mWao
         suDau6/2rjZj74JdL6WdQGHeOEJezc1Ft3HcBhQc8IvYcZJO8aztOoE7KyzciX67siQv
         OW0RusCBkb4BVBmJTe7jZXBLzWhTwyFdeAcUnRC3FFUeynqWE5JtFL1Q6P+O7G2K+4Nz
         ph0A==
X-Forwarded-Encrypted: i=1; AJvYcCUGGSBHohoOZ+YqNu4Zxqng8GyZDBhEvNljKf68ZdjJH1Hllz9rYqxi6bF0mOpeA4m80Y6wZm7K9TNCfCh+@lists.linux.dev
X-Gm-Message-State: AOJu0YwfG54KSoeN7CEqUR07iPR5WDN9BmvW9l1X2llemTXiO0efvLqW
	ARfjNqy0Fx0FNXvQAz1QR7pwem9W+8T2jc3k5SR6/HgyXjOUFrLyCHZv
X-Gm-Gg: ATEYQzzBynOsDaC77QsBCoHRt1k4TFOqbkU0g4BPWFqJbm1j0wxQQxoNIUjPzHjNcHv
	MAUTPgSnJ1t0kUGPwoBo5BIqs87erlg/AePzfeTFXElCsR/fd/xNdgzG2BPx3lSg9hNtIorzScA
	H2t6i42N67tTaN1l9z44cvCmMZTTe2LUq2qYdsXIq37OMieDxzQbd9sjCDsg2mJA0nIMobGoZcN
	ujQ5Zbtau6fdkydi82+iOx6zjNU2eONY0/LlO7IH4hx4T7X8OPLw+xE7E9usCCwCcDqgVuFIK0/
	AWc1xMTTXfU6+3a56om7q2i9EL1R4atrmuPkbusC8Upc3J7Ppbf0bRA+5CWVgClsD2lHrS+qi6i
	fD5XX3eb5k4Lv6ftd8PE0aS+eV+0z69pKmHox4uhdZxDTxDof8D0yTTWbnyVXAz37e6dWX+T7JX
	/Z/WD7hyCfvKgRex+o1tGa/u0plrXq/p4l
X-Received: by 2002:a05:690c:18:b0:79a:7d1b:5a07 with SMTP id 00721157ae682-79a81b9a2ddmr122698467b3.20.1774167571636;
        Sun, 22 Mar 2026 01:19:31 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90425d76sm41187267b3.22.2026.03.22.01.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 01:19:30 -0700 (PDT)
Date: Sun, 22 Mar 2026 11:19:25 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/5] staging: rtl8723bs: replace deeply nested if-else
 with switch-case
Message-ID: <ab-mDRnJeoLcl5LN@archlinux>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
 <20260320122119.19563-2-nikolayof23@gmail.com>
 <DH7SDQSN6CJX.O6RII1OVBDQK@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH7SDQSN6CJX.O6RII1OVBDQK@gmail.com>

On Fri, Mar 20, 2026 at 12:30:31PM -0500, Ethan Tidmore wrote:
> On Fri Mar 20, 2026 at 7:14 AM CDT, Nikolay Kulikov wrote:
> > The main logic of the validate_recv_mgnt_frame() function is deeply
> > nested due to multiple if-else statements and additional block scope.
> > Fix this by replacing identical if-else with switch-case statements,
> > which will improve code readability and correct checkpatch.pl warnings
> > about line lengths.
> >
> > Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_recv.c | 48 +++++++++++++----------
> >  1 file changed, 28 insertions(+), 20 deletions(-)
> >
> 
> ...
> 
> 
> >  	/* struct mlme_priv *pmlmepriv = &adapter->mlmepriv; */
> 
> Maybe create a patch to delete this commented out code since you're
> already here.
> 
> > +	struct sta_info *psta = NULL;
> 
> You don't have to declare this as NULL rtw_get_stainfo() returns NULL.
> 

I will do it in v2.


> >  
> >  	precv_frame = recvframe_chk_defrag(padapter, precv_frame);
> >  	if (!precv_frame)
> >  		return _SUCCESS;
> >  
> > -	{
> > -		/* for rx pkt statistics */
> > -		struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u.hdr.rx_data));
> > -
> > -		if (psta) {
> > -			psta->sta_stats.rx_mgnt_pkts++;
> > -			if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_BEACON)
> > -				psta->sta_stats.rx_beacon_pkts++;
> > -			else if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_PROBEREQ)
> > -				psta->sta_stats.rx_probereq_pkts++;
> > -			else if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_PROBERSP) {
> > -				if (!memcmp(padapter->eeprompriv.mac_addr, GetAddr1Ptr(precv_frame->u.hdr.rx_data), ETH_ALEN))
> > -					psta->sta_stats.rx_probersp_pkts++;
> > -				else if (is_broadcast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)) ||
> > -					 is_multicast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)))
> > -					psta->sta_stats.rx_probersp_bm_pkts++;
> > -				else
> > -					psta->sta_stats.rx_probersp_uo_pkts++;
> > -			}
> > -		}
> > +	/* for rx pkt statistics */
> > +	psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u.hdr.rx_data));
> > +	if (!psta)
> > +		goto exit;
> 
> Instead of adding a goto here, it'd be easier to read if this was just
> wrapped in an if statement.

According to the Kernel Coding style (Section 1), heavy indentation
should be avoided. If we wrap all of this in:
	if (psta) {
		...
	}
then there will be four tabs before the deepest lines, leaving little
room for the actual work, and the reader will have ro remember too
much context from all the conditions.


Thanks,
Nikolay
