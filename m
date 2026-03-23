Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2437E308
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255659; cv=none; b=GrwWkqrcNHjvCf791cF2cQcahH70PdhrhoZ2mHp6nhtxncQTWSvdlUyiJB72YrNqF6nX/ldVmDfpRMXZF2wjpEsjdH9PYapTUvnYbfejiDuJqs5aXxezJBkj8I5cJGY3griOKw0RVH2bELioUnHAcATRy7ITRQAhgXfbmmNLa0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255659; c=relaxed/simple;
	bh=R61Nw2j4SvjypvcYUmq/X59kiP28Pp9UFLl5iFfoRCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jA1iLdK7KLr9z6ED379z8+t8RdPbPmMLS1pVmJIBU+DnZv++u2vt8x7tk1Jp5HuhqVMaPp4yvxfrhh/5TS0euphbYE0dBROfYL1RzP7Y2X+FvK+utS6p/xEvNu3Brck2pyiVK9i85R5KMZLqQO5hk96C8fAbKMrmHdg8Wjp2RY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uXLAbn2U; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uXLAbn2U"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b4121c40aso2765443f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 01:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774255655; x=1774860455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3wYxzLxYzsIq8UX8gx/UrnQDt6+9p5J6k+891+usy8=;
        b=uXLAbn2UZYxPCPewSh+tMzq3J1799sQyqiVXy2zw1hY6gSD1YXB0nmkWh1uUdpKoRr
         fpxqi6wMTMl2MPeoCIj3TzPLwImis+RwkCjZnPYrE27Gr4Gqf/Q99RfKx8eYtOq3NY+4
         2FZGEW2ktmBePMrK0lZY/tf+FbmQ/rBYbzrr1YGMb5xp/iTXLwISbJD51XYOGmYRGVyk
         g9WYQpqhUF82Pl8J83b2Il9lvmpn6ueNezrjIGqLXgOAa2x/hIJ5KEw9ZzBU90rpYrX0
         XI2VdtOsi9tJKifbag/2qP+XYFOb3N8Jr+n4GSwO7H5Ni337xlHSfzzAdx4PHREta118
         lwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255655; x=1774860455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3wYxzLxYzsIq8UX8gx/UrnQDt6+9p5J6k+891+usy8=;
        b=W4niWParQ/BkvGT+gI2tshQ3ccttYJ5O3sK25iK8fsL7JWdzNVK/425LlQ6HyJJbgu
         k4xgFocyc1T+xdjQaj4DokU7N31UvS0dsNaBHUVAJNgVyLv3JsZSTBdz1c77/P+xavDo
         M1GWdh3HCOSktmyDxZsfCeE6SV1FZhMeQjPgyuqFr0jm48v96zirGxZ0hdDKTzzBRXoz
         08RSlaMbaF1EabTQKIwDtDKpY6AmU3Zp7mCuZLZqFEHI67d40jgSvHytJj3/tcBReEB+
         hzq42G9lb0iK5Uakr6GltlI3JLzeHggtIIPukGRSsjr8fCxm9dkQ0WHUdvDK4NAbn3X2
         EbgA==
X-Forwarded-Encrypted: i=1; AJvYcCV22LaZzvffDGmMkl6EeHyKxgRWjgP6Fr8dsT6o+HFwxu10dtpAiaAf675+YgTnxw9tjqri/2UR8ufpbe8g@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt+ZweERa6VQPHsCCECHNSTt53Ey5YBv5WPGYuVk7COtkYJYWY
	mPyGKCvJv6V9Hrt87Ar0ElRMajTK3mUXJc9bFwW1Sx1ZvzPXnYSpOq7xmZ1PsqGQSkA=
X-Gm-Gg: ATEYQzwNaxnoY7dFUtbJI8i8GTjnf1KTLXVvbYn3GbaqGSjBU8Zi4XMUac7Gd6gH4ix
	Rgp3V9s+fuiqgjCLNrpTBvsOPJpdJZohfu4MibvRM6NhzdEr1ZiOxVm4PI+OuvpTsqkiqW/3hyY
	94mdT4nc9pKKbHz/GGJWXfeyWZk0oZgPgZJkywO4ISw9cTdX0iMW+PiYKlaQ6SvsbacD+npLf6C
	WkmDp7bkDtgbOSvZefiozpzAdzi2MC1NSHIUyR6C58bc4USDcpyef7w/4ltP1OTqXJzkVHCcfbd
	DYRJogR0nf59RqYxUcONSZJY8Zo+K5hMuTBEYYfzPid+toeTPeUL7wBZuY/QiIWScQxbvpxD1ez
	v7nARUrIigBSiNmF3Y7rprewuQxSJsb0rhGZC2IftNK1yN1rZ8S2MuGHwIbaBgm0Ne0kti9Og5l
	TPheRolk3cNbtORj37lSbYbB6/tXWa
X-Received: by 2002:a05:6000:2007:b0:43b:4e13:2213 with SMTP id ffacd0b85a97d-43b6428baa5mr18529961f8f.51.1774255654977;
        Mon, 23 Mar 2026 01:47:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae37dsm27744127f8f.2.2026.03.23.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:47:34 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:47:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Aadarsh Mandal <aadarshmandal9354@gmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, luka.gejak@linux.dev,
	straube.linux@gmail.com
Subject: Re: [PATCH v6] staging: rtl8723bs: remove commented-out code
Message-ID: <acD-I7QaY31233-P@stanley.mountain>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <20260322114853.11747-1-aadarshmandal9354@gmail.com>
 <DH9NEB6YPXX4.F1YBESHIB49E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH9NEB6YPXX4.F1YBESHIB49E@gmail.com>

On Sun, Mar 22, 2026 at 05:01:30PM -0500, Ethan Tidmore wrote:
> On Sun Mar 22, 2026 at 6:48 AM CDT, Aadarsh Mandal wrote:
> > - Remove code that is not used anywhere in driver.
> 
> Probably remove unused code would be better.

This doens't matter.  The other stuff is true, particularly the missing
S-o-by line.

regards,
dan carpenter

