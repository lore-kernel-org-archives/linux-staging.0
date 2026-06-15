Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DFF3BF685
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508910; cv=none; b=G2uxAq2ZtgUPCrOqsO5+mHLUHCE9g1XTAJCO/lE8t+j/RsGkJT3c7fSYJ7O9xjcpBgUCldwD5f9TLG25Ns1K2acgd3KePfmNdWn6MWI6/zmX9Nw0aAFeFh3KBxqgIe0EExA51Aw5PzpTNHch3JKYSYqOGAg6paIVPkmTiKIftOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508910; c=relaxed/simple;
	bh=nGnSPCnQwdzuVsfOmWrEqZnxe9yilGxaDndIXWUkAGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDWdN72ew7+vjJGZBhCSMMxE6l1/NssfN2YzvbQtLsptSxf/y9xF7hZqmlIoVUgKIJtG0VHnmJqOh+baFXoz46PX8k8H6AgIfZps8mHe/51AAzA6bv2JLQrx/c34ZPX/IRo3wrINdTrgdnOLJ8ONsMINcWOiTlvTc1Yhn+FnT1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0pPpTJt; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0pPpTJt"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ce9df31130so48520506d6.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508907; x=1782113707; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVJ2SgZJKrM5Glp+hNfPWwv4XWSIB/g6FTAAAMIWkoE=;
        b=e0pPpTJtC5qJSM5c9cJ6dHBn2YjEJNPyfgC/nJ1FxIZ+xIj6NO1/dsjG53dfNihVw+
         M7OhLuAXq8NPt40dj/wvHcKS/culaT9jdXc7k1OvT0VdBarjYGPyn3tuI0HCd9XzSGBL
         KBKiyGrzcTb7qocAbqkr3kcKIo8MPHAPBaZhTTaauMI7k0UhoQhC+FV7Vk1U30RYpYf4
         ugYXRyqx9wfTLU5au9QxCdhblbDAi4nAYy7tY/OLdZsc11TA4BDZDvAjJuyBxarJ4fmF
         DUCWhdkB7Gep5Fhh0DhdIknVrdPtY29FH2xP3wOW5YN9DcJV/xCcmTMM3lUjBeFx641N
         38Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508907; x=1782113707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVJ2SgZJKrM5Glp+hNfPWwv4XWSIB/g6FTAAAMIWkoE=;
        b=XtZAu6GaBqW2vaJx2pEM6O8jfAtYqt4OT1R5xJ6OAf/eWBTq+FsbcDbtW9lDo1ERg2
         +P0sfeZ3TFkgHJNBXUFgsm4WBRrjnB84jeQ2tn231cqqc4YC+/20+LKQyDl70tr047AY
         VWowgwYgFom7Yhy0jTWhE7ZUAY05ILmfeGYxW84FoKWuwcbt5FwNCT84y7BPZY5gRwGT
         r2Ky4okVUrfp2WgMqNwDLYDQebXBu7gOQG+smSpSyoqHBOCQGEtmZPjxTkWLp2MMQ5lK
         LCvZQ3I45NqgEGDJSKw7/lqutVQFjtYQOpwztW4TjQ/i9qD0ZWgjd8XjshXTuCQLc68H
         C5Bg==
X-Forwarded-Encrypted: i=1; AFNElJ9hJpkSMDMmm3PSN1FNH7JNqWnfrLY3j9XX1oEJl+GzkmH7GAHzqujDYeSmYUG3fbIDiv4IAwgE/dcAAP9B@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/9UjlESBlIGUGqVeLffA3w7NO4yh4Xlc8qAAPEX8Kj/GRTrrb
	XxQbnG09ZBdrE403V3QnVfAsWQstI/trnkO8k2kjo9RTumTPsfyYBtfVXnKdUp9X
X-Gm-Gg: Acq92OEvRJxXkO5AOUhmIxATcin5pFLWgxOC1rAojBcEeInG0xAD15rCDyPBK4byPRl
	ANGAVbA6MoJFVclrrs5JlS9jkD1Skef7RnPDz1xxSJF3pjJvPa/i+zSWPxOL+mH0t1kMn9qQycl
	99C4ik0ky00MAwwcN7GhWFv+D5u7/oZyvmg3wHYgm3KgGDhQFJlaNhvOuGYYEwSzWxuwzIISM3C
	PNTQ93u2CayJrOWpmV9hBmbmjEA7IMRylWiWb9WtujyI92umdmGLvxlgVPXXvsEvXIBAgKI1Gql
	eMXuxLGs0AXT91dGdiILvXDrCMJ8lT2lqL8pyzXbNjHFQVdzvaJLm3V6utXnAjWvjUvJdvwka4n
	3ygMrSd/L05JDwjoydboFWtuM/zuv9wYZSM9xKKh43vgf965X3PGKE/lY8m9EcrFs41yC2h/1gE
	arxkGTACfkGan9wvEM
X-Received: by 2002:a05:6214:2522:b0:8ce:ee76:1597 with SMTP id 6a1803df08f44-8d44fce0ffamr168956306d6.43.1781508907477;
        Mon, 15 Jun 2026 00:35:07 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30105fd9csm108145536d6.10.2026.06.15.00.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:35:06 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:35:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: gregkh@linuxfoundation.org, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 1/2] staging: greybus: audio_codec: fix sscanf return
 value check
Message-ID: <ai-rJPFgXHrJ1IEE@stanley.mountain>
References: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
 <20260614154329.5176-2-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614154329.5176-2-abdelnasserhussein11@gmail.com>

On Sun, Jun 14, 2026 at 06:43:28PM +0300, Abdelnasser Hussein wrote:
> Smatch static checker warns:
> drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
> warn: sscanf doesn't return error codes
> 
> The sscanf() function returns the number of successfully matched input
> items, not a negative error code. Compare the return value directly
> with the expected number of conversions (3) instead of storing it in
> 'ret' and returning it as an error code, which leads to returning
> a positive value on failure.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Closes: https://lore.kernel.org/all/YoOLnDkHgVltyXK7@kili/
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>

There shouldn't be a blank line in the middle of the tags
block.

The closes tag isn't right...
https://lore.kernel.org/all/202103080429.X31wogmF-lkp@intel.com/
Sorry, this stuff is a bit confusing to everyone who is not involved
with the zero day bot.  What happens is that for some warnings, they
first send the warning to me and I look it over and decide whether or
not it's valid.  In this case, I decided it wasn't valid.  Sure, I can
understand why the static checker thinks we're propagating the return
from sscanf() but actually the second else if is always true.

(I haven't actually checked that btw, I'm just assuming that the
second else if is always true.  Static analysis is always a best
effort type of thing).

regards,
dan carpenter


