Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66772BE034
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346455; cv=none; b=NcoZXEBCXbC2v7hIw2mx6B8tGrFGH8WVtrCnGy2bXN91c3ZNI4Yh+Bf2PZJfPkIxsCSKCDY0xLFkUXbtmt4S8CUjOsWoQyx7ud3pxu/G/SBRzbLPHpvBxQfJ9emCPRcF1UP6hoNjYIQGYqE0SnOHZv4mBWqBmBty1I+jxnE6Utk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346455; c=relaxed/simple;
	bh=ENZMN0F0S/q+7hBabwGP7IO9QU9nIDp5hjaqJyHNdrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkcuHlh2rP1rA4JZLHuXK653gtfglJ0/VmAFyI6n38YeRYc2e8j7IWCanXmVdhVkipAbliv9WC1LOpJst74sKn6XBeoROSaQMIE0TUFi6NDmopCfFNgAAxplGOLXyo4HDJmcfFZ8uOn1M59tdSM5nRh+37NxQR4xnGw4R3O3q3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeZnFnZn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeZnFnZn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso1708895e9.0
        for <linux-staging@lists.linux.dev>; Wed, 20 May 2026 23:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779346452; x=1779951252; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NSF1GUVlvZGTr4iqkhEsfoXjgVT0N+GUEtO1y/6GRKM=;
        b=HeZnFnZnhyaunjMop2EBjjPdGCyNT5jnJmEzY8gBiyugqUtq4Lo/tdOJ5zgw+XPO7h
         ZBzqrXUEQ+RCsaQJvaneRwGFMLWGBPkw/NyLTzyHx4JaREr44ss0SzbsoMjsXiCFQWPl
         YF0kn7zigNurH8ru25tARInm9YVCe2/W4h9AvSvsMDmEuTNO1yvWcvvgXbthRYS7eYRP
         +w5S0TxIaDfK5LfedASvCpMbLtvaqLhN0PuZa7nqLIodPC8mjlXK6OEMtg+6Oa1sUt8b
         OCiBXhMScsgToTIPna1PV+KiDpjHAKncsI7eldd9ISkcLwVaTztTeDkr/ggZDBeTRFz0
         3khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779346452; x=1779951252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSF1GUVlvZGTr4iqkhEsfoXjgVT0N+GUEtO1y/6GRKM=;
        b=Pm5DKcKQVnwfthdlS6DC5rqUCyrJCgIKDcxwIAP2Dlu9d94J8kXOoxt8qCxrg2MJAj
         HkPsn27Arw8tweeTChkATDNX9JZyip5PS4pXcNM1eEuSdfRjn17L3KrJfV9hUSgI5XAD
         5iHndE0rR1JgBVlGfhmiRW7tZQ9Ae4i3NDweQdm2eCZmSxZf18tgu/U6NXRKOzCtGpX/
         y850JRK52/hufZ4It2Xj7E8JQODmYauUoFbH5Z+cupXWLFxijxJcihtxo1qUn8rKN71q
         6UyBjm572QAaD505CjPpLZXvCARwD7NCLxAd1NyK3TwTv5mssdYhNR+7arsZ3sBhNOLz
         xbvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8df2x0lN1xr4Y+00mkU/PTfg5iWr2MpqPSbk6ycjSg2k0o+5KeMIESIC40dbn8t9pb1mgQcZwJQElUs5DB@lists.linux.dev
X-Gm-Message-State: AOJu0YyLEzy70NCmwRXZ8VH+XHT5gjC5Z7TXISyJKxgijkC7X8Ihuv/Y
	bq1Q2FzQsIoAyrpmlK+esM1zLkDojCkK3drcGrKbFhOaItGVVX1DnRco
X-Gm-Gg: Acq92OFfVlvGyVi8/aYZj0hVP1LQKWZ1qM5+iDRH3657flRm/IqakDzouE46p41w4za
	jag8oNlpOvh9aqZceWFs69Voqpv1Tp5MDZGYwnffUn35uYa5YLw/M2Xq6FzuRObgqy+VdsOkNMY
	975Z0kjE+tb2kXqv+DOiI2q2jKX8Rmc+AK96yM65lDiDRoRcgMAL7heTvMXhcm4umlsig9vRCIi
	WYlSAgNX45uBxOOtHpq665nnHFwem+mQB1ZnZehzCGBuW4CC9y38ZKimws2UMuobjxAofC0ynFg
	d/9RmdzBZvcNDXJFYhhXK40imJBSbat+TA37SLXfCWt447FNDuvt3DXOVWn8U3ZZ4S7Nu/RQIVf
	g19S7UxhOErKJi1bV1BHwQNhntFQ/W5E4N1Uf9tYpQGJczVI+BoP0P5XLrO4D6S1KB3hvXtQwhn
	C27VJJfIHsrAQ9yaDOLqYYiR6uj27svbElSw==
X-Received: by 2002:a05:600c:3147:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-49036033406mr18868075e9.1.1779346452217;
        Wed, 20 May 2026 23:54:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035eef87bsm9642805e9.34.2026.05.20.23.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 23:54:11 -0700 (PDT)
Date: Thu, 21 May 2026 09:54:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: gregkh <gregkh@linuxfoundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v11] staging: rtl8723bs: remove extra blank line in
 rtw_mlme.c
Message-ID: <ag6sEGZtp0C9dKg5@stanley.mountain>
References: <19e494a92e3.67a0e83072082.6269846394596840299@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e494a92e3.67a0e83072082.6269846394596840299@zohomail.in>

On Thu, May 21, 2026 at 12:18:04PM +0530, Ashwin Gundarapu wrote:
> 
> Remove an extra blank line between statements to maintain consistent
> spacing of one blank line between blocks.
> 
> Found by checkpatch.pl --strict
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---

Please, wait a day between resends.  I don't think you're working against
the correct tree because linux-next doesn't have a blank line here.

regards,
dan carpenter

