Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C53352024
	for <linux-staging@lists.linux.dev>; Mon,  8 Jun 2026 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902734; cv=none; b=Lh7dMns8pV6562Nq0px3pp77WNf/zDpNmbgxaFcmR5FkQv+C3lYoHlujgiA88lb87763eoyElqTaOF3rgBhb2zEzOsAYStWRvZFSNPE2vqU+87FlLu95buHSDKx385rHTVQFDWz+6fykgKwqC2r4spq7Qk5hb5UaihetzuJZNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902734; c=relaxed/simple;
	bh=iQaxjTszkEjiEZiSiUlMn1vD781sN7kupsAHg0qLIh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z++AS1HmqFZCfF2fhyMVFq57UQqNKSmpcYHiz+pkiA8N1L41nhF36SulvnTP2sUv+PK0LGhtALXceZh+Nj5KvUGcpEx4bVF+5nwyI1PMMocmHRwvW2y6bzFzSrVtS64IBNx4iCfY1r4vv3y/bt6KhK9sZ163Jl7UTEPw8h82wgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8bEp9IU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8bEp9IU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so34482865e9.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Jun 2026 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902732; x=1781507532; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5DCeU5OediV57bcWcfJYqqGuezNisQJlQN4Qb2qUp8=;
        b=k8bEp9IUqHwE5c+y0zVdzKdNLMzTUmr/AB5uvzBP6P9wXZfK0bfMYYbWUVlkISUX03
         Gfh2LumR5lqnDFayYZJLL0Zq0DhOJPkT1Eos8JKzO1KvvHPKA366iO46URAXheQAOQht
         JHWAzFBw6G7qXxr25uJwCH4s7LPqCm/D2niTyVaDVuZ9Ev1+eIDz1Sz7DmKBMJelD3ZA
         IMyd5QZT9rktGvw/mPJfropn4NY0SvtNeC3kA2XVGx4UkJ41a2RwH5e8gJQDathL+5dD
         Nii0TffPBGOL7M1Thjb64bzkTcUhhaK7eBOsBH1Lr6gu0hoqc16xxN8++5JCw0RimYRo
         bhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902732; x=1781507532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5DCeU5OediV57bcWcfJYqqGuezNisQJlQN4Qb2qUp8=;
        b=hWLvYXWGu83YtMXWZFKHvh4Hc1gQTR+fze7xry3jIiW4OXsaQ+Iy9P1iYawdbfJXXr
         hyrtDHb8QqvFbr5fAaRm+3vFeB8N7lG3zKF7QIgI7/jPCbA3oTsgGl/wZxU7bR0ui6u8
         uQlazZwaIDdp0m8nNKPyiwffYrKRB4jKF2BgzmNW4Cth6JzKybkbhk25WMJxXNvBRtsD
         Lg9SeNzocURH4qXCvJD/D/9ZG0TdEVKhoXnwhH94JkTwfFcuFZ1gB5CV09qJvXaZEad6
         2tvbKOfkwnccRbiXuimEeCY8C+BzlTsOEwNaGtK6kI2mIrmqp71U+vlzlJV2O0v+QJG+
         P4+A==
X-Forwarded-Encrypted: i=1; AFNElJ/IYT8J+TnQPchHApgOBnlxNZa/E11xQngBtSZEu0aXJC8aHIAji2Tmmfj/qe3+d/CJVppgEX625Z8s8dd4@lists.linux.dev
X-Gm-Message-State: AOJu0YxkYaQLqNsF1Bws7tNFJQyHkHcTR205PQFDquUaPpH0WgKxE51h
	U1xEsehqvubo+PNl8tA1zqb/G4LlaI7+B+hjXe8q7RVFKYINblWNzIiw
X-Gm-Gg: Acq92OGvrYAGZJmyYZAhtjXSkW5JoOQdKt1ty9BS2xETxn11VRZRKAYwfsyAsfjfTfy
	pg4qLRNS24wrxbUbO6c23ah5ruMCrQd64IN2C2cK1/zXPoTHextpNnlPlGoP70FuhY7mENh5Um8
	E3Z04ZWUznSNoYGSFClwVDwEiOMGRgFY5/P1KzQi0kS4C43xhzichyLMmfCnYkZ1NFkNz+YvYSw
	45LydyRsIt8NolfrxwX/U4eQTdICRoun2rjf+zww/EPiwvsKWTmUFl/axpV6BGYWH0QDab8ST16
	T8/NEuP3SR6xIJThoz7tlVEHzpmT7Yr+FXjDacf+nNjoqKY+qKjTwqs7h9hGh2HfNvPGBz708VD
	vzw4zXTD7Mb4qskoiJqgIXWo4lBOwirgtDqaKSYRur+pky5y4hjVNlpeyiqbc1DQ/kwzdW9A5vw
	4AlSpFdOJXQtagnhgC9yb2DmBgnEqoHBK9+iBuCGJa
X-Received: by 2002:a05:600c:6096:b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-490c2d038e8mr179174005e9.12.1780902731900;
        Mon, 08 Jun 2026 00:12:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bda4fd52sm353491175e9.0.2026.06.08.00.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:12:11 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:12:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unused macros
Message-ID: <aiZrSA_R2NxIN2Y9@stanley.mountain>
References: <20260607094130.3208513-1-rhys@tumelty.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607094130.3208513-1-rhys@tumelty.co.uk>

On Sun, Jun 07, 2026 at 10:41:30AM +0100, Rhys Tumelty wrote:
> Remove unused macros across the atomisp driver that are defined
> in .c files but never used. This was flagged as an error in a
> W=2 build due to -Werror=unused-macros.
> 
> Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
> ---
> v2: Removed some macros that are used, or should be kept for documentation, with feedback from Dan Carpenter

Thanks.  Looks okay to me now.

regards,
dan carpenter

