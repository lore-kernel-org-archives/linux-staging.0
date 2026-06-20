Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15B53403F1
	for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781948458; cv=none; b=FMnrGvqsmcai5/6O4GyQeio4H+9LeJbzBUlFxAg7kzJhwVhqdK2crkrWHsTkc+zaTHIofcswD57HIfnVWKhzIA+4sQYtE+yWcVqu/3XCjIsv+Aag70sQ47mSGg6GC8Mf1p4dI8UuwuOVFoazFZK9CUBdsMV4rnJFnuUkvAKrJb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781948458; c=relaxed/simple;
	bh=bzMmMdDZb12pckhE1HCQMpbb9uubjGvbW/Q8Ly/dSdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eC40sX0h2XIq75rzhJXB+KqULORxZi3gEq7K5UnCl3uENWrED2XiwRF2wHA4bpJicejCpYHqa6VDvej5QymcG/QYbhf9FFtVjqtymSekeFWGrxLGIPMOJSEq+r9hP8MvJMuAecJEQ+edKwV24kANMRJmobhgyLAm7/EJ8aUBe3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzsWXg2y; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzsWXg2y"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso39736605e9.2
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781948455; x=1782553255; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgheUV57e1fbvrsFvTQvHjvUlEm1rXtz0JpJatjgsuU=;
        b=NzsWXg2yA+qGPH79+T93adfLfNbsplBqYvChzASU0VQmQOeTKAEp0tS8McrN/4+FJh
         kUXgfI+ZjZsveJWbTI4eb+iKMUhoNnswvY3Nz9/mAqLxfQAVdtbvDBkRXaPFgSZ4Ojsm
         yHMhSXnb0FznqblInGZTt2rQxEn4BhzuMguiZ9olQ5niU3hTj/ChGO92n0Q2/VWm3DGe
         TceKyGCNaXKIrwlRyC+qV8JISiOum6UkVSk424AVlV9rgSbwM3OB2kjhNnToqgqwKKa0
         8dGODJZJXhFvYDPAL5y2xvGYr6eQxI83D5mfVpgzti/S1xi5ILw78UdWelgpYv6nHmw2
         ocWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781948455; x=1782553255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgheUV57e1fbvrsFvTQvHjvUlEm1rXtz0JpJatjgsuU=;
        b=Vfzqnoa4TPsUDSnc0jQJEc9BQmvSqfgmUH/UAy2Vm9GjyEkt0uNMenPoTddzCHAPDT
         LKtn/RsErLMj0CR/rk3ZR7s6hYOAZGyPQnEDe08MM/oVgf69RLNe1dP2my44CS5kvxFh
         P8gjT9lD5oJvHCf8EdY8+3rrdkDplRB7bvzcfhDu4mJ8iu9/o2pkKdD6bee9QfnjqGL/
         ZAZ82P57YLtFWxr0aBU1k0gnbdP9FbdGYrtAxpMlzkZEoXg7gOHselwPDZr39axJZ9EP
         w+19EXj9KZ9r17xoLaUYx1mUwg+1sg9PJC9hZcCysCGhzW5+7nLBQIedlS0+NIGzzpqf
         BhMw==
X-Forwarded-Encrypted: i=1; AFNElJ/d9i9DN6ZnsC3e6SoYP9KHMbH0I7eJK+ZVh1lFl7zcLV7HhK+4GK+3ftZlEoZp7ELLuh+RmwE5ECDEMRhP@lists.linux.dev
X-Gm-Message-State: AOJu0YzHTfSs3CROo4P/XYrw4V7B/H9UHO5B/Nyu0mpqFofOOX7NukMF
	IM1iwkG4OlHeYxVAISHqOklvDx5AqB3pIfTYkzmBFb6a4gVOw2hZ56Q+
X-Gm-Gg: AfdE7clpKC4AZ1phMeaY9zbXGnq2AmgVuNe5eP1GhWQ+HY3GKaIFS1vrhlMdfnLuMzy
	j5ITSvBPi0BdUSP07nonPTUi6SoAXDnHyJHrRkdq3Af19/Hl9HzKgnGDtYfG3zlNDai/c/jUxSZ
	9QjIDrCY7ehM5PtQRvD07lP7hzNPeLC8mRhMYx+vkbQA+TrzFfK4C5xhLb2B12qrukPHSpJvW4r
	NAH6cvanOa0axxNFkZXRV22ZvMpFGpkzGauPrN3nc2qINPs5/Cu0RjrviTqimyYD/aDeDnIgdBC
	GZTkVr57t7Yyf9mGugdccYHlSRBGSrGphidClk0Y/rWIdEnObjWrzgdZD85xbPfy6/O/U3v6mvw
	F2eTSu8OYxx5imlRGsSvd457m8UL9iypahbB4PhaGFadmmgng8bAFxmxTuZCaUWeeHbCDcLYIww
	iSDu8EKUkw
X-Received: by 2002:a05:600c:3145:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-4923ef47e68mr134199885e9.7.1781948454982;
        Sat, 20 Jun 2026 02:40:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923392dsm84208825e9.2.2026.06.20.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 02:40:53 -0700 (PDT)
Date: Sat, 20 Jun 2026 12:40:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: av7110: replace msleep with
 usleep_range
Message-ID: <ajZgIl8e2e7dMaPh@stanley.mountain>
References: <20260619221524.51814-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619221524.51814-1-andrem.33333@gmail.com>

On Fri, Jun 19, 2026 at 07:15:23PM -0300, André Moreira wrote:
> The msleep() function is not precise for short delays under 20ms.
> Replace it with usleep_range() to provide more accurate timing
> and avoid unnecessary scheduler overhead.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---

We don't accept this kind of patch without testing.  But also this
is not the current way to do it.  Do a search for "usleep_range staging"
on lore.kernel.org to find the current way.

regards,
dan carpenter


