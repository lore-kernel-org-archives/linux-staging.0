Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17DF3C8196
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926440; cv=none; b=olsNu/Oik+2ruImKJk63aD0LiubT9uwZqT6qQatWmbTDJcvSAI+ntWCIXpe5/KOn7//7ptoyTeRffm9t341aL/Tk0JY1Exx4ApVHW7gbvzj+kbHYz1t5AbppBvTROOyhjD4811PA9npDrllrtCmzQGeicOANpkywqGDPJb/6++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926440; c=relaxed/simple;
	bh=Zla/uoiEzSi/ipXbmrLVQdERvYv6TqUwnnGkb0CCgxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDZ6+rRxNlT6cx5ZrE306kTNirz3kFVttrTk1lid62E3N1KBvu3QM/YMpOCmwVq+OgwriAM5emJVmhJSeKmZr6T1PS4ldvHbsx/sPxjvr8FZ0aenzWENL2YxhDA29D3pQhAKgftuaUM1jHtLChBC54aCfTY2OE3L4ci96usnP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRyXLWJI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRyXLWJI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d102471a4so4413705e9.2
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778926437; x=1779531237; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZSCTViidu361ZnAX04ezJ7adwfGkPdJLJ1MHvkoKWY=;
        b=JRyXLWJIzftn3i2YfbV9Z+dUWGXhRCeIK/CFhjGmDLl2eyJ43GWyaRHuLqUjQ+ybal
         yi97f/Ddbt2k15YP1ke8PEex7ZmXRq8YL2hsOwCA7YqPhzwk5QGbu5MA6WaslbO1KwgW
         OqTKLHMJMo7Y5apchdkm1ISJEvFS70JnQH45F2pEXcK51NoMzLgIxOidZOcgXK+bohi6
         2uP8F8bzOsru6dinvEI7ba8rGMo6jdoZSpLiSDZBrenpVdqxM26uE2guvoWvnVozJ56Y
         yFExZdElvgwKhvDmkvZRQJ4Bh0n3xbXGAu44V0JRP3EKBvfbDZ5M3Yul/vF5yLDe+4fn
         fleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778926437; x=1779531237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZSCTViidu361ZnAX04ezJ7adwfGkPdJLJ1MHvkoKWY=;
        b=JSIDSwpQY9yDPqFSkPtxpwb2Lxr1vUvA1v2UVDRyxlQWKy4CcWHUd29H8oMliqaKhs
         RgC1uJe9zNf1IhjxAcocGfl110OVYYFn2tedwEy81JsIq8Hs4AKQ4L09ATMXs9X0w6ut
         7WlFtbAFY2f+HN4BxZ+L58VwxuHjYo6R83esaVZIqqRLd8inZ/VSGsx5rCuKXr1IUq9j
         AUtDIyWH2OCAUNnqid+8xcuHxcIQSwxpZqXsVXd5XrUXjYNUi18D/N1+ojToGhpHgaHl
         X34x1ZPI1n0xc7PXZtinktKYgjQ5+O7VclkcZHZZccICTCvX4QulQgZtRIgl3Jt03Tph
         Al5A==
X-Forwarded-Encrypted: i=1; AFNElJ+fHS0LIdLAZP3ycA1srKVPQyRJqzei/nRfFs69Cil9JlgcRNBhVVYP9DsRYAPMCCkgeFAX5oPFstWTiPxu@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2dIJPy79tLQvkbOT4Ga5eN9theLevNnYbUbq2qHFPMjDagbIW
	iWlrKgP4qkBqsna88rTO1pu9KtUAoFeKu8huZo7v1f10dpVxkJPHNgHV
X-Gm-Gg: Acq92OF9yFKiUwngTIs4AOk76SGOkebuWzU2QHWOWOX4S5kuKK97ZeS6EcLlp4IQM93
	XlRk0tPPTN3nvFcUVWz4U7dFZ1xj4E/wNjz7LKJ5mwjyXDpCoJYCAZY5KZ/ybASaJKYu4SKals8
	gxivxyyQcVBRWPfUYe+XElqlXlULuEOJmMJnJi4zCglQ3OCJ13btf9XZ66FrNQcjR9YjkNKeTTC
	1fk1oPGzBzLCo0ehuc0CkmmnkMaqx08oV5IvjJWv9yYtRb0UzKJTR3UFZZb8i2DJ6T5+hoWLM5x
	Q9BWiu246j7TQdDVRXwizWKx+ApdONMxb0svWBn90zkJT4Y40IiEVBLzyhjjcumpRZZjMCPymBE
	GcuCOSj8/4DIrd0l4Ao1ngSE/z+095RZyBxnOF6FPNVJ8tHVRtDY5D/yxKvlTwKBnpTvnMfxFSZ
	yqLXcXOEy7qlcZWvsYzZg=
X-Received: by 2002:a05:600c:1593:b0:48f:f199:79f7 with SMTP id 5b1f17b1804b1-48ff1997aaemr26285975e9.27.1778926436844;
        Sat, 16 May 2026 03:13:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm32321425e9.2.2026.05.16.03.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:13:56 -0700 (PDT)
Date: Sat, 16 May 2026 13:13:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newlines to sysfs_emit()
 output
Message-ID: <aghDYN3B53QOUMM-@stanley.mountain>
References: <20260515223342.40869-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515223342.40869-1-alhouseenyousef@gmail.com>

On Sat, May 16, 2026 at 12:33:42AM +0200, Yousef Alhouseen wrote:
> Sysfs show() callbacks should emit a trailing newline for text output.
> Several Greybus audio manager module attributes currently omit the
> newline, which triggers checkpatch warnings and makes the attributes less
> convenient to read from userspace.
> 
> Append missing newlines to the affected sysfs_emit() format strings.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---

Patches which affect the user space ABI need to be tested properly
before they can be merged.  It's just to risky to start changing things
randomly.  If it were fixing something then that would be different, but
just making checkpatch happy is not motivation enough.

regards,
dan carpenter

