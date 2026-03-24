Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F1F38A734
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342404; cv=none; b=VxPiGoAq0likrV1MaytLT1EXADZ1t6jLYJpr9OXTMG00lCeKv86ym+7CTXogeCWyF272XxwIfryfJD3N4CLqa2ioZYTN19Y2+NtlEj0LaRbCwEC5IoAs1iw69hUB2HLk9PQbST2zo9WVcoLyJcIFDiucG2PqGz5I8Q2awd7BImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342404; c=relaxed/simple;
	bh=D9kosfCA0AD8zwths95NBMjLr/RkFyTJJXNe4XFjqZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhTeBfsHrSe1SqXdsq+GtqjPSC2xC+DyHczGMK00y+/XVKnxZP11UMV48mdER80HKjQ9Wi/Bpclidmy6J8+6eoz+R/B831eolE6OqCbNJnFO8KCa6nFdqeJO/bAOXLk94YQ36VGkU0V6NMJEtWC3TOVqMEvVW6kphelgx100pb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LbhChTgt; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LbhChTgt"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439af7d77f0so3750615f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774342402; x=1774947202; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VW8/lt0x7IELhLac+kV9FEKZOn/DjjEwj5y9UaVZg6c=;
        b=LbhChTgtS/hRGcEiYHzHsl8g65yd4D6pjGwOEwyEkGXsJJGHK8dwfrFgTusZeHE5ZI
         1YwPZXr6wGBhBcGwMoX6FNMDR3R572756lw+s1IpOR79dWKIo/uXeG/u6nYnxlpBl8UI
         DXxHtwbTKgTJCZ9wLRei12qcrWkeyMdKykWr6uRG+tkyZKr4M7zYMrpFO2f3N5X2nl57
         kMhMdTYHWlYzL3iLNkVnUkCI+4QDPLgTne5ZQCQatm3eJwALnIr9gKSObv4eH/sMGpRm
         jd+t/xn9uMyl+ZDp4fKxohZFAPyDGy434a47HcA9Jx/ZeX0oysrQjXunetOiAMSs92rT
         AdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774342402; x=1774947202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW8/lt0x7IELhLac+kV9FEKZOn/DjjEwj5y9UaVZg6c=;
        b=NUlIQXDVQg5BH6Mv2HjL2SGlFSA7mAtebjFDgh6TgD63H8VGX5qKzHqAq5fY2XvgCk
         OdMMQi5VBTAVrxJRo/PnT0e7g3sTdBJ1ZxQgu/Q93jZ9TCJuUwCYC5uvGNK7gQFfLM6V
         LRD/yqnTooVCkTK6DCgGYcSj+dE2wuhOKDRh+Ybc2hr39e4yYSiRyPLwRZJ5ZTvfMUB6
         0SxJxfFI5E+Xm3h0WPI1Gx1a6ANemXqL3jRTNtqr+hZ4N1Kr2so4tzEsqPXIhpmzPw++
         QT8VTc5IiOs8yZ+PdOKcx9bwRNkvgLVAaBhYTG2LNnMhJzZLFMhGD4uZnXZwr2n+bi+E
         QmLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrx9VJV7gTsLESec5NFcHrF5zOOidrSzWtgabHrdix7/ZDHnpfXvdrje1s9PiGNxsBjPx8JBvGBgB1CGTj@lists.linux.dev
X-Gm-Message-State: AOJu0YydTKo8huML3YlHupM8/Qv1XfkeJ9Jd/6ZY9OyU8T4bNTuUXeyE
	UrkRTM7iq5hO32v7p879sg8/oBiy2fiNMix0UrpW3z8p7uAgp8ksRsTb9kkpZH29gv4=
X-Gm-Gg: ATEYQzxbNEWnIN9+P3jxw/fU3QXlHGqIcs9RaHRBey7Ij8ctdzFlramxQBeR7Ih/IWN
	E59Z8lVoTQ40oQFmclglOdBvKPqMv1Rzax1uAPWjcB4+/9Sb3fOYi3Qk8+Dw93vaezSydGFoeUi
	hKKgD9TJpT7zgKNPnqdBQf0USCKxpIAy0nbEaZJGiwYfPwJ6V3Ec+qnDzRz8m8Kpx2gkIAzf4+o
	ep+f4D3kVmaEGoaJQGz9aMQ8dJNDMdiVEy1JndjlZOmUYbPykuTNBd7HWYCDE33IXxkVLz+PwK8
	OB/4UsTO+9WV2/Le0waw5CywsvJ+Q8mzmrrnBX/l91xK6Fmtl+2dmqHBrOlHfRgtV4gW08ar8Wm
	FVz5j/Ebz56SO8yPF816SP80EhfgNeXaWFAjV2A5R9wjY9GjbOzfhqKAKEjJSk3P8GJ7pOCDXz2
	Eu+5bpU8obOmHFKyBXg+kt6qqyKACX
X-Received: by 2002:a05:600c:4705:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-486fee0983dmr215760955e9.17.1774342401838;
        Tue, 24 Mar 2026 01:53:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871105d38csm14830205e9.17.2026.03.24.01.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:53:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 11:53:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Aadarsh Mandal <aadarshmandal9354@gmail.com>,
	gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	straube.linux@gmail.com
Subject: Re: [PATCH v7] staging: rtl8723bs: remove commented-out code
Message-ID: <acJQ_opyN2fQysyS@stanley.mountain>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <20260324040718.7777-1-aadarshmandal9354@gmail.com>
 <acI1M_djkY5NRe0p@stanley.mountain>
 <7B1A6199-F3D5-40C8-B63A-421888A173D7@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7B1A6199-F3D5-40C8-B63A-421888A173D7@linux.dev>

On Tue, Mar 24, 2026 at 09:12:20AM +0100, Luka Gejak wrote:
> On March 24, 2026 7:54:43 AM GMT+01:00, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >On Tue, Mar 24, 2026 at 09:37:18AM +0530, Aadarsh Mandal wrote:
> >> Remove code that is not used anywhere in driver.
> >> 
> >> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
> >> ---
> >> v6:
> >>  - No change.
> >> v5:
> >>  - No change.
> >
> >Why are you resending with no change?
> >
> >Also you're not working against staging-next.
> >
> >regards,
> >dan carpenter
> >
> 
> He probably means no code changes as the last 
> two versions were related to commit messages 
> and Signed-off-by field.

Thanks, Luka.  Changes to the commit message count as a change.

regards,
dan carpenter

