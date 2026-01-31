Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF3D36E496
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 21:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769896709; cv=none; b=KOWX+prs3dWCVxJQSKvjbmvu8s5Pn3XCUFiesm01iTKZgHs4Mjbjh2W2zzros3a86DIsATu/vTt+3il3AzOlHvsHXKusatnCt+yZJZPjLdn5EdkxBKTTWL2UAb5DlAydpuyNVjKCA1aCcfTYSYFvDSUgzSPleZtTE3sKJpEI9J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769896709; c=relaxed/simple;
	bh=QJmLp51KcB+x99VwYbdLH3Ndd3qc/94L1Cd5ZLMcHAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnZoVaCOefbDq5024+SjVh3dk80ViweKu/nEJSNIWGEwjeA+Z1T5jhM3ITTEf7XD88DLu3n+h6cD8st7Jg14jwcONbCKS4RufsB31eQbGCLzul8c7HiTRDwUgfLaPaDp21+V5dWXFdd2ngX73Kx6csRcBS1x1ihv+TSeXKffx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiI1eu58; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiI1eu58"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-894638da330so33472596d6.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 13:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769896707; x=1770501507; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghu8Xkyf8Bk1JmGjY6SchpUGRiu+knucGjSEGdnBgkM=;
        b=MiI1eu58MIdZmh63sLRBRfxzyWK+z/vlR1yHG6wgPK28Th5Gvu1EoOOj0Xg+mAkGAF
         OaeHALbpcpnYcqezYDuEBNwjFdFKCCYJBGDae/clvzPUaTEOkVlivTw7OUSXgpZMI6Ya
         K+r/7EcWhofAvh+oZ7HokqYlwFiwkJc23k8LUI3MUsG7E/P9WbDslPa80UMddFSF+Pt5
         EV173+n5Ug2uE7zOkmE/MVh4I/x1X8fOHIOAB2if2MmgotSW/eB1NW2HvlUq2ZhPwN11
         eAN+x+YC8dCu1HyNF/BhBrqMNen8LUqHcw0VYUUXgghzxCViFZkYM+PggRMyBV6RsD0f
         PcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769896707; x=1770501507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ghu8Xkyf8Bk1JmGjY6SchpUGRiu+knucGjSEGdnBgkM=;
        b=L5SPOb4+iXl5mMU7RzrfiBJ9UWA0FwbowpsljqcFSvaKDl73GQb5yIWmXlMJRzkgzo
         fwIPHtCqoBRqSELksGn05uC9r91lWLl5nI/qD6YvgPkzDk63DUBNPck7Ld33GUZ3gzIj
         e7AeFN8IjvodGsu3LA2fWRVJNRBbSgBxSM53bUtGmp9P/aVsNbikHSlL5XjT8YI+To5m
         UEcG/sh03u1Xvj52agIhQCgOJWu4reVD1ZpvHFTsei0oP2ESTuLnTOUnB4lLuJI7MOdi
         eIIWfq1T8ceszv028Wzcna6uAkcjb43O/oMuGPSXrxbUmP3YXj8YyicsLdL2+3lxpY5k
         QpQg==
X-Gm-Message-State: AOJu0YyLkOkzS8fBBkWgoAkxKIzuTp/jp9KdKhndlyF2o/ZyOov5mA0u
	siXVti8tS8cmmRUUecfhiQy4Xo7dyZ1RShHQIJdFkPNBRxMv4255xc4a
X-Gm-Gg: AZuq6aIcMa0Ew5uGeIX0oKTjNdZTty1KYet3nUwOA0MVWrzGutPkt6OHXXzcx/n8ND5
	tb7AeElFrZl3UlPJMNhoFynPGF4MuXAXYdFbNGBoKQgfb3udYpG5JNUcInNofV9KyQJE/cw6fAW
	Q5GXcP+oGQrDgUDUB4ffDJ+44wbWrNAgAKt83WNBJJZRz00ceJ1hQADRK5AhYbUA5A03QwS0yaT
	2e6VZWZC3CAfB1bzBaHkoquWZmEtN5fy1zJ8btJXgrvOHqDAjSVGIAFLaCDnS5aE1d172gVU4/B
	mIQzqkYAefoxpwDX5+JStj47NDvTJnRjnBGeG/S7GwKK+gskZcisgoiRAfx3bLy7oTHXrTL5nmt
	6L5SPlioanFq1KCCWawobkFWgBv5yryqaeZ26ht4DAhPd+/8BGGOFwBTG6zH5ey13x5SGT7Mfud
	XBlB+F76zc8tIMIgJZX+pClUBr
X-Received: by 2002:a05:620a:1791:b0:8c5:36be:41ea with SMTP id af79cd13be357-8c9eb32c3cdmr928641585a.64.1769896706832;
        Sat, 31 Jan 2026 13:58:26 -0800 (PST)
Received: from localhost ([132.216.195.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d29dc4sm909620685a.29.2026.01.31.13.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 13:58:26 -0800 (PST)
Date: Sat, 31 Jan 2026 16:58:25 -0500
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: rtl8723bs: core/rtw_mlme_ext.c: refactor
 security IE parsing in OnAssocReq
Message-ID: <aX57AZmBhzbKqQoc@william-fedora>
References: <20260116160914.88069-1-william.hansen.baird@gmail.com>
 <2026012714-discount-wavy-ba95@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026012714-discount-wavy-ba95@gregkh>

On Tue, Jan 27, 2026 at 03:39:44PM +0100, Greg KH wrote:
> On Fri, Jan 16, 2026 at 11:08:47AM -0500, William Hansen-Baird wrote:
> > +	parse_status = rtw_parse_assoc_security_ies(padapter, &elems, pstat);
> > +	if (parse_status != WLAN_STATUS_SUCCESS)
> > +		status = parse_status;
> >  
> >  	if (status != WLAN_STATUS_SUCCESS)
> >  		goto OnAssocReqFail;
> 
> This logic makes no sense.  Did you do this by hand or have a tool do it
> for you?
> 

I did it by hand. The original code checked the status after parsing
security IEs, only overwriting 'status' on parsing errors. 

To preserve the original logic, I only overwrite 'status' if the parsing 
of the security IEs was not successful.

Thanks,
William
