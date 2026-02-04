Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3422D35D603
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198394; cv=none; b=VntDX0MrrOZpb0AcaBKKezxIihmB2qdfEHsT0NaA2cxqwia2KVasF9po0VY7qrpU7+zAd4uNMcBufYljGHKmZmglu2gRLCIGswqG1uVAAjYGrQJReFANHdlgozOg9R/4ksT644EWc5UHea8YEFlqk8AvtHny/wk5uDhDwC5YK50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198394; c=relaxed/simple;
	bh=RUc+3G7+FL3pRf/tUQlP2vjiVuLDLcmKvA7SsedJM5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhVR08fycYTDV62XDekKM3k0fm0pPmabkWj3jDUL4b6OWkqB6J1Q5U99FTtFv3TtULsFFwt1mx5DZTglJGCY4XwjIhVxl/h5vlwHrrxs/gXvg6nuVckoNCDBNg/MYQqV30T72qvURg0eUuzhx0MNVgTUx6aClSyde+bAWFP9Suc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aw8cI8Wl; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aw8cI8Wl"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d2c96215so6182127f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 01:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770198393; x=1770803193; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/s7GqwS0RYtq25/D0ZyCexH8s1Q1mK/+ZBZIJKp9rYc=;
        b=aw8cI8WlD6aWzOlfB5LS/VPsOXTM+QC/ISeiR69jBKQzmtTgAfR2AnfZ1qTfDHwHF9
         UDfLdn6gttNsXAEYH1etY17IPURJ3iCcR4tUxgJe7rsibN2V+rKP4J1Ln+C5u6IHuQ62
         66c6Jwy/YFQp1lPSJMKV02n0u3V3ToTRwfLuodxYQace9ng7f71t/rHF27uv7LfYrrUc
         Sr80bAc6ScUxckWd/kNkw+qtFfXYfc+YjWXlmECUb9ZQLBtn+I9Rv8F8JcHuB94B/jLD
         /XveNXiABt2UK/oEPe8NqQT0zxw60cva1U48ELaR5cbAfj04YGhUO5GjfOYfX7743p2a
         wJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198393; x=1770803193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/s7GqwS0RYtq25/D0ZyCexH8s1Q1mK/+ZBZIJKp9rYc=;
        b=usBZfgrU5TBH7PAZQsCZ1RxMsZg2RtVAszWw67PF2w0qf6oK7vUAS0hyQ6y3CNPUMT
         xCuf3myHPnbybVDbkPKJvg2zSw1ED/SkGAeSIhHuLEa4f/xBuFIfbKS8qeNMtXt+wPJU
         XFLdllJWt2KjnwW+UX02j71C+oacZuIgcMYJmckOKqSDZTaJsHhR6vudC9pubp/hIKjc
         2wlJIGKn0YJ9rRcZn/BIYRhPgxgjVFQqzd9TcS5KJWhXb194SnAwzPYQdcEe3PNM8bys
         f75yYUiNS2U0c5mdziFC4MNnQ0t7WpGgTydfjDH/9DsjkhMuLXy6oI+W8s/ShBcK61Xa
         uhWw==
X-Forwarded-Encrypted: i=1; AJvYcCX6XgXTO2E36wRXFDEsqIGLjEkLPZppCBSxDSVQwOUDsxV+5RUynPmne3yJarOSvHFx8P/G781Pg9cIsBCY@lists.linux.dev
X-Gm-Message-State: AOJu0YzUQCOtiUmuZEhm68Oq5O06apTAAA1ZPsh2Kg7ZkyV8DnQuc/LA
	nc5UThX1tzWy19QPn8iZHUpE6FdYkS4qxwcH/EJ2HUM6b7+kbcrInyuoDw1h5FhK8Zs=
X-Gm-Gg: AZuq6aLAutAVP4wFiwxCdPjHL5eTIdTC8PiBjvWW4STcLynVXM0mQr0lE5OLE+s0VeW
	4m4+Vx7mw+Ut3jAyv5typ3GMR6mQ+ffFD1CkMu6KXl0FU/SORlyluDcoRpi7uULn/Buz//S9QJ4
	vjWSJy/N8gXhXRXc+yZ3c6pxsnOjlH14arEP9z/1m1fgpZSiknKgr1G7PKpfd+BarzU/EPKCRGr
	Hk9CvwAyl9DMrKzlSWMnvoW70QdhDD9rvlxzm7f4nD+/RO7ZIzsxtWJJGa3cXJEB5uwK0adzE88
	keZhJuanTRNl5QvzVvROclFbhpriBbyjUpFYUBymvgNruUYqXh6mmjy2YngX/dErYQveyidq8t7
	hkFNSflbc4VbbzkUUrYNa0ryalOC4UlnD8lm/xz9W/UsjQ6yQulRAysqXIklfEAKBp5oLpvMM65
	dSt8xi6bHcgIaFPLg6
X-Received: by 2002:a5d:5f88:0:b0:435:a4a9:6f67 with SMTP id ffacd0b85a97d-43618059bbdmr3236589f8f.42.1770198392548;
        Wed, 04 Feb 2026 01:46:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e38ec5sm5689345f8f.14.2026.02.04.01.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:46:32 -0800 (PST)
Date: Wed, 4 Feb 2026 12:46:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Neel Bullywon <neelb2403@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: gbphy: replaced sprintf() with
 sysfs_emit()
Message-ID: <aYMVdePjEkJ7gTE2@stanley.mountain>
References: <20260203212254.90855-1-neelb2403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203212254.90855-1-neelb2403@gmail.com>

On Tue, Feb 03, 2026 at 04:22:54PM -0500, Neel Bullywon wrote:
> Replaced sprintf() with sysfs_emit in the protocol_id_show() sysfs
> attribute func to prevent any potential buffer overflows

There are no buffer overflows here.  buf is PAGE_SIZE so it's more
than large enough.  I like this change, but the commit message
implies there is a potential buffer overflow and that's wrong.

Say something like:  "This code is safe, but replace sprintf()
with sysfs_emit() because we are trying to get rid of calls to
sprintf() as part of kernel hardenning and sysfs_emit() is more
appropriate in this context".

> 
> This is to ensure a kernel-wide migration to safer string formatting
> functions for sysfs handlers
> 
> This was compile-tested only (no VM/hardware used)

Don't put this sort of comment in the commit message.  Put it under the
--- cut off line.

> 
> Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
> ---
  ^^^
Here.

regards,
dan carpenter
