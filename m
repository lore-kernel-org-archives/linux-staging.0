Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF24C350A0F
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075916; cv=none; b=Ojsb2MdxSVwXVvB4mnysUkIefPHn1IpHlJYuY/Jwk6MiKQJsSLZy5m3ZKSNgk5FDwKEiUddZKIeYxxf3yS3Qn4AvzmZLmWmg0osFfxvsv9pCWcsWaG+gFYyoP3EhCdGMbxPZu6aASMlzmaJTshoQ4pBly6NgqaJQDLRlXXRl/RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075916; c=relaxed/simple;
	bh=tirnI60t2LsfBYva0tZOm3rtvSohyY6FmeFwIA3hr7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWdx3U2NZcQkfKimkel1q7rMsbnkl4Hb+lEkZUsW0+J3jAtFha8qmI/IH9jXNWawsJCWNmAEN9lMWs7gBzYi1zaNZkolusTy56pzBBIp4hO2c6XyW03r63A4qHezv5T+5dQdvtXkungnGtk2T4logcVVs5nYqfby1DSyvzZXjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYHJld8Q; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYHJld8Q"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so916584f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776075913; x=1776680713; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFl65q515usiQqNs+3hHpKzGMqiV4DMQZG4ZKRqr8MY=;
        b=oYHJld8QUAxxqFTGcZmXFyGEMgTaj7H0pa12KehfwggwUMLd7RzOiJ1nyR6KJq0l4r
         LR+zy+PUr8c7RA7qcQs2KC/fXfoJRpY1qQVbalOmM02NYvkzFx8mBERpfpzhLC5ztnzY
         LFizOZAyYkUGLXZHdblAWr/ifA1x1KxAeK3btljI0eR/3nweg0N/mr6F2tAmQimat1wv
         cvh/AgoUypeYCvl9ycfE5lrItT8S5kxlBcbrIa1cuGXVyiC8Xe0acwEDb2Rmt5NfWskM
         f8q07lHcnmY+v8SGG65TiNNA7YOCNn6bFTAuygySeYFn37B7C/AlSKfeJtOzwbWgmqWo
         qi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075913; x=1776680713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFl65q515usiQqNs+3hHpKzGMqiV4DMQZG4ZKRqr8MY=;
        b=nQfmxuI3oX73y1jzZPRg4zYzAgfcAkMP9gXiKJe4BvKMjrPgqienz5Esw1Vi6wgAn7
         fiLRZCshjWq6jjSjCEpHO68l6m/ROJebJXrPJygCWtvLLvy/cWRlpNKKeiyTRacY4UnI
         E4umqIRc2Dho5Q6ab44HoR869Tk1rM1KNkbnR2OglRq/BWK9lPg0RLqGqjdNtI0XS08t
         EbOpwuxGS1cMaBB/1dRH4Mv6IfNk9icCZZluMIJyUdOyry8G1SipWoAVJhTeG7fvM/jt
         44xrNzxWzjqxXGvLSeY+h82pHlyCh1aNCD63KwDqf0XGfv/NGnxoSrCfHt13txnOX2lb
         Hx0w==
X-Forwarded-Encrypted: i=1; AFNElJ/Zc50dMbHqOnaY6xHTzOt+WRzA8m0WxC50TleEraWf6km6SF29i4z6gRu1YtPlfpOM/kZ54SXhbiTk+x3l@lists.linux.dev
X-Gm-Message-State: AOJu0YwVb6fWJK/MHjjXQ+P585IIHdiYvYBllYFhX+BwybLBjtuwExEr
	wTDnKeIlyP2Zg9LgaH+PB1jAnGawd2ePnimvvwVgh+/ErtiMpZiiqD1k
X-Gm-Gg: AeBDietGZ71KRFmg7cpd5liBKvf2i4AJPlyjb9FKIrcb2L37TmCfTXCR3lq0EMd0CIQ
	gOXszvpnHIID8LdXb9tWtGd2GjXzo+jKmqdmnvmpgXnyFO7IgwwKtB+SNjGV6oxARJsPzvK6LLT
	x11jl43V7a/W96vpJF/ni98JnzD5ArsySbkoxIbe+j7/ooHKA+YtVveaWcOVOaK/VoKeFeXJs2Y
	n74cRCqp9zCgDWfNBvDzhsF7HGJoC9iAgmqAhCbNUajOUuFMl/rFuIdlyt87ZKZsQQxOzxTXaKj
	e37jKf0zxM1LvWJ+f5odIuxJoXKBqtFgENfsKqbwdnfJpwNqg23JERESw3bfxBg63pn9N/zeafI
	F3ATyA7TAiRf4m2NbTT1nfjJ1oAmmQY3XRbXryCCeOZnEP4pjHikcScH9qTqSnJKmR4BCs+d3Wx
	l8UsQK6ocQRzw4fMVYAnc=
X-Received: by 2002:a05:6000:18a8:b0:43d:71b:204b with SMTP id ffacd0b85a97d-43d642cd3a0mr17848829f8f.39.1776075911391;
        Mon, 13 Apr 2026 03:25:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm33173904f8f.33.2026.04.13.03.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:25:10 -0700 (PDT)
Date: Mon, 13 Apr 2026 13:25:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in
 tegra_nvec_remove()
Message-ID: <adzEgwPBTTFVKBdS@stanley.mountain>
References: <20260412205057.386856-4-hossu.alexandru@gmail.com>
 <69dcbf4a.050a0220.1d6d81.c4df@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69dcbf4a.050a0220.1d6d81.c4df@mx.google.com>

On Mon, Apr 13, 2026 at 03:02:50AM -0700, Alexandru Hossu wrote:
> On Mon, Apr 13, 2026, Dan Carpenter wrote:
> > At this point, we're unloading the driver so nvec_power_handle is
> > about to be freed. Is there any benefit to setting it to NULL?
> 
> nvec_power_off() dereferences nvec_power_handle to send the power-off
> command to the EC. If pm_power_off somehow gets reassigned to
> nvec_power_off after our driver unloads (e.g. by a re-probe), the stale
> nvec_power_handle would point to freed memory.

I like to believe it's impossible to reprobe a driver before the
rmmod has completed.  I'm not going to check on this, I'm just going
to take it on faith.  :P

> 
> Setting it to NULL makes the potential failure mode explicit rather than
> a silent use-after-free. Since we are already inside the if() guard,
> the cost is a single pointer store.

So the bug here is that we're racing an rmmod against a poweroff and we
trigger a bug.  And the fix is to change the use after free bug into a
NULL dereference.  Both of rmmod and poweroff are privileged operations
so you kind of get what you deserve if you do that.

I understand that it costs nothing to do the nvec_power_handle = NULL;
and if this were a new driver, I wouldn't comment on it.  (Although I
know other people who would).  But for a new patch, I'm just not sold
on this.  It makes the patch more confusing for no benefit.

regards,
dan carpenter

