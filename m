Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6A51F37BA
	for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 07:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739864998; cv=none; b=RCp71ntmOVi8/AZo87bJ6/Nwh644sNt746C6S6kWvuNy6ZARiYLyJH1mxBZqVS+6vIzbpU3tEBUxuMn99CZSYf2dV975aZJklvrYTPP4aua6On+CldNMk+7ziwq4qN0lFgTFbixuTxjWb+FPRb1MqLqVW0K/EoXa71CWR8SifOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739864998; c=relaxed/simple;
	bh=dXkNKFL2t3D7LbTgced3sRUwEug5DyboKy/pcSKnSn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOVkGHunFG7iJ2hhcZXBPxdfuTHiBVgqMl9kRULfNhr/1piRL+3G3g7WbLXFPpAUUh5ZfACXaCAjBdAZAjwEUYU9PNoYO7x+vmeKm7VC/nI7rGA098nbA9C+C6E8gu4BKiopsS7a+Eku8oFRH8sq/ZV4mg9HpAQThMsaDn37RcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnRcwu8+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnRcwu8+"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e0505275b7so3401131a12.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 23:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739864995; x=1740469795; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gcxGUK4L7pik8UVdKola7OdfV2rqKCIeW+xAgR3m6ZY=;
        b=jnRcwu8+juO7uEtsfvHDkP74ez+4NR55mAhyY8rjznKfcvE+C/lye1ovtv1J5MgYVp
         G4NjBZaB9eNBZCV2SGcQfGQCVyk95nry+mqWZzWleWmldW1T2mLUFaQzHRiW4SWjh3KR
         COb8gWl6UZht1gv1V1kulnAyo6SGjI/5PlCSv37ewsolBdtVWlIxW3O+Z3EsANwUiKdo
         9wDgdT5mRJWDkS8OKUhwSlTisJM1M6qgiK1CR+bJraJnq6KE/O0VuR8HU/5ZccWwJVqU
         ptNrcLjCyE+cx+zA18GUzwh0b5Gd7Pc04DVRAcPka01istF4PYWakCWCxf+gFh3L75LE
         B1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739864995; x=1740469795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcxGUK4L7pik8UVdKola7OdfV2rqKCIeW+xAgR3m6ZY=;
        b=qaIyojC5yzxgfDpjVEuXj/e5Ji84REZZkC9/7/Msq6x2IJoWV7Nl/wp2OD+uod52Vl
         91YavF18EQGQHFGhh8p/KCYjPEuxYbKFuvhcP8q4xS0tU2eweiy5qMbSXmDzeOPgm/BO
         XQf/jm3TL3hqQOZbPw5z0cXjpD/HbilTvTskp7I+TJNySACYOhNqnJC6njYOZLDtn/Am
         E7zS4rHlTRIQePxRnrvOALX5KS08LeQqs3zqYbxXsTjmbAlncjsVt1HVqnvJ0qH/uMLt
         cB2YrAGXcTFsP1CNwBk5O+ux/hrkYWKt6lixmErgfV+IO+8C5/pcon6i1Ujaicu2dIx8
         Bdhw==
X-Forwarded-Encrypted: i=1; AJvYcCXUED6NaeeFzRwKxqVxZXOU0H3oOiGtmfuvTdTDomN1trfmMsGKYXguGdB0poXvVDVod4sXj0LdOt8duBXC@lists.linux.dev
X-Gm-Message-State: AOJu0YxT5TqnIA+6PZpz34M1E/0/gE6toTfoou1j0qvy6oW8lGklSiyK
	0nKxzLqKzbRX1PJJz/E7lkEAwYRp7cUPYEPqqXmvf0k+VR0OdJYv8Gnh+IIdFx9mUMH7u01vtOF
	z
X-Gm-Gg: ASbGncuCWmHehAP/erBvXPCjDGiJhUFv6jEd8k04SFsJRvzWUPIp59dwp0gPXTbuBPo
	Ij2wkLzeS/0L1QGGueASGTygSd9VRiK/CS8MRCUuNTCAm0nLvMEIUlhpzpJMdS0g6MrVeoUB+NJ
	rXwvnQ6KDhbrs71gYIX0nLPFxxUuHgm7cMatcsFIWcjEo3aJkILDffz9LnzGAegIoQNJjwK/eka
	dWSIT62USTqZzY934bz20Ttdba0VP99sLtMp1IUPqMtiyDcxLO4xixOSRxzi7dxjGnSE9kxl4OU
	L9Qw8VEaNslrkR6eDxZI
X-Google-Smtp-Source: AGHT+IHCl0HkEOMoIh22Ur0zFcTAgm0hjIJ8hJ4o2yLbH52sojw2vDpWuSJYkP7wFtU/EPB5YbzdKg==
X-Received: by 2002:a05:6402:268a:b0:5dc:c531:e5c0 with SMTP id 4fb4d7f45d1cf-5e036236f4amr13268209a12.27.1739864994722;
        Mon, 17 Feb 2025 23:49:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbb860fc11sm80523866b.124.2025.02.17.23.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 23:49:54 -0800 (PST)
Date: Tue, 18 Feb 2025 10:49:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: change return type of t1_delay
 function to report errors
Message-ID: <5ee5bdfc-1e5b-4fe5-9794-a22175bd845e@stanley.mountain>
References: <20250218021804.29016-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218021804.29016-1-rodrigo.gobbi.7@gmail.com>

On Mon, Feb 17, 2025 at 11:12:54PM -0300, Rodrigo Gobbi wrote:
> The current code returns "unsigned int" and it doesn't handle errors
> correctly if it happens during ioctl call for t1 delay configuration.
> 
> The ni_usb_t1_delay(), from NI, is the only function returning -1
> at this point. The caller, t1_delay_ioctl(), doesn't check for errors
> and sets board->t1_nano_sec to -1 and returns success.
> The board->t1_nano_sec value is also used in ni_usb_setup_t1_delay()
> besides the ioctl call and a value of -1 is treated as being above 1100ns.
> It may or may not have a noticeable effect, but it's obviously not right
> considering the content of ni_usb_setup_t1_delay().
> 
> Typical delays are in the 200-2000 range, but definitely not more
> than INT_MAX so we can fix this code by changing the return type to int
> and adding a check for errors. While we're at it, lets change the error
> code in ni_usb_t1_delay() from -1 and instead propagate the error from
> ni_usb_write_registers().
> 
> Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Changelog:
> v2: merge patchset into one commit; 
>     minor change at return statement;
> 	improve commit msg as suggested by Dan;
> v1: https://lore.kernel.org/linux-staging/20250212024247.176572-1-rodrigo.gobbi.7@gmail.com/

Thank you!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

