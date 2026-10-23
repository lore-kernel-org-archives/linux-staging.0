Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764929;
	b=QzbA8CzVXYC5bLvgNuvHbyxRGe+dScDvSK6+wkLwVHzCuTVMPUasyo0SVTXqdnuPyG/O
	 JrKvGdorKGTiNc84HltE5Itb2uB9ZFjQZJtJZjuhPOmC8J1UaALZ75h79F2WNfVjM2hqD
	 19agq7CvAsqvPW2Wi8J99yJm6t2CmMA2ma20MiBBGkizqu0/PxECr1+QTIQcE6Lap8u7O
	 zVT4ifdw2JS34qbL0KjkKMZLjLrayajUvxLIdC0aFhXL42I5Ei0knMR4aqXZpsXODEqlo
	 Z87NvzlT6/iXJJQ+AtrM1I1uR9BIdmdxrfxKxBKxOYRMBJTZEAKE+sHdx5CRnf5OH0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Tm/cpYxqrKZTkvEJNBnPzr85AedjzKo9UBMwFMFE+xU=;
	b=ouf/54ojxSNAbirPTmHSyOER87STo2w8YK7JUO66PGpX/CxP3fxpvTZmrSiSrD/mbRPm
	 Jy3X53FBlKv98A5oZ/gn1y5xyp4Gihe9OGY5cmwkvPMUNnCu4XFcaktxEW5Qw4Mx7NxYJ
	 Yb/znzQqlbkPrEokwroEhtKThi6j6lfbDJfIjsTwVUZWzP7W8Kso9SJwXP5K82szWiaDg
	 Ih9xxfCa8XYGXojGptMhIz4W0ni0neAn9UIi4oEkch3bXau0eA8DnxAcO8LWK2MU085Yt
	 g3JT0tv5ryJAE/56TOTIPYmMrLdNf7/yDnWeMrHMl2g52m+M27PMc1Gzw9BszCg9kVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EF23W7wN;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21521606A334
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 14:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21521606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EF23W7wN
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so662454a91.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764928; x=1793369728; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tm/cpYxqrKZTkvEJNBnPzr85AedjzKo9UBMwFMFE+xU=;
        b=EF23W7wNl1FWecDOBqACRo1K+JJBAWkC3PdB4rnURNZL0UApk3040AYJPZ9yatSJBe
         Dy7oZD5FrqNhOcIVdfK+M9ZZbTlPkZxrQ9ShqyfnqZF+9bH9UqDJ5liaENX6GCzd45B7
         Rl6RXYEChVMmWmrdk4NtdJH7lL4nY9d0UDB2lKFtgZ0Fa8hZ4uu7Te9zYdXkVqp3OA/V
         i+c+GBhd5af/kkRZqkFUP2MzeUNNnqb0orUhLve2b2YKss5MRQNIwBAf+033mvUIy6oQ
         UOMmI6JwnEsSJ4ZD5k22ZDPXE7heTPHcMNubSIp4DVhSkGIhUcVgwX2QHj1OHN6dwdHT
         DvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764928; x=1793369728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm/cpYxqrKZTkvEJNBnPzr85AedjzKo9UBMwFMFE+xU=;
        b=FC7fJHrDjdbYcgjbc/nPhQyggggINfa4/xUFX6J30bKcPyxPJrK1bgHUlCbAWlNY0H
         w00rjvH3ujZjVj0VrOq+53MmiXtzTJYf97gmvLr7skIqfGeoNRnd0yJXDebGeFT+gqhB
         qDo2I+0tR3nVoZSmHDr9N4L4GlMUwpe68Dp/6gjJHfUFeDR41sJKGFyIySVXpEUYWo6W
         EsU85oWALpUW+yhEVG/ssCq6SeirHh1AJYgWHRueWnWo63pRA9LcnINuSbB7Sn0xwZFe
         TECWJ1yxNPIbGZrZsjIvgzJ+gDnQmztvwO1Qx9RUfPenUNmOnI2LlG1Sw/134u0uEfd6
         N6lA==
X-Forwarded-Encrypted: i=1; AKwUvBw3ktO76c3Oz2nyPC1axuxeghReU4D4l9VlYekF5LZNl7zgCHt0GGjpg07HJIAD2p+bCRo0FUJwTXzscuzK@lists.linux.dev
X-Gm-Message-State: AFq9FYIFjJITVoCvLPiD3719cuCsM5xUO88Py3MIHxC7x7xUM7IvWCGj
	FYGpAyGSN9SED8i7HzqCH5tjKUQZzQVbmkLiN6knoRcS8eyL8ziH/yKM
X-Gm-Gg: AYBFou1X+W/esB/wReAJtSTDlUpWtyGf2lLeWhH/uFDJZjRMBvaCYh4ejBka84GybAg
	uHD94nYgDGJmJK6grAw/uj/1SC0qFk0Lk/5Q3G8hsanWAO6JFAZhN4ev759h98xSBByhSGhqzU5
	4X3dqXv6gxRftAo3d16NNToiZxeu6K+aqLMPE+LVnwGNlfAADUseWd6ZGitKW16eB6PM1hxL+Xw
	zTNHZsg8ny70uUuHc+bp7iSDL4gY2hMoLzouhBDOWV7BmQyDD+Xo6rfaQy/X3h7Gt/M7826yu6j
	ETW1PSG1I7PI2dkNM3vHFtvzlzzKAbKOpUmzvJEOp/egzYyI8YyaF9qC7R/GABFH7EfNoue7yNJ
	L8F0KCa3G+7hK9ndsjBOYcwqMpAKJwbfaRefkynUJNGAGiruShPKt38/lpjNpQeXqa4ulFhmElj
	zzGjX7uPxXGiXOvzgbSx6wg0MN2iANdYmXeXDy4xmSZi+Rt9U2961hlw2evXhpRvNVBJd8u8mzv
	MFfA3JQw/tTU/CadkcuyPzZNod8O/KaIfFlh3TNgcirx2KP0G4nK4honWXo
X-Received: by 2002:a17:90b:3c8b:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3adcdfaab13mr2265897a91.10.1792764928355;
        Fri, 23 Oct 2026 07:15:28 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:4145:da00:43b2:a151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addeb56578sm360792a91.11.2026.10.23.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:15:27 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:44:47 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
	outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: loopback: Use fsleep() for delay
Message-ID: <attr11CuxTty7rPn@user>
References: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
 <a411ee0e-22c4-4797-9fdc-3ac11fa20d60@riscstar.com>
 <2026102338-rack-garland-2a29@gregkh>
 <fc3a1fb9-181d-4994-9bf2-45272dafc86e@riscstar.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc3a1fb9-181d-4994-9bf2-45272dafc86e@riscstar.com>

On Fri, Oct 23, 2026 at 08:18:04AM -0500, Alex Elder wrote:
> On 10/23/26 8:04 AM, Greg KH wrote:
> > On Fri, Oct 23, 2026 at 07:48:54AM -0500, Alex Elder wrote:
> > > On 10/22/26 3:24 PM, pavankumaryalagada@gmail.com wrote:
> > > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > > > 
> > > > In the loopback function, usleep_range() is used for short delays
> > > > and msleep() for longer delays. This requires choosing the delay
> > > > function based on the requested time and converting microseconds
> > > > to milliseconds when using msleep().
> > > > 
> > > > Replace both functions with fsleep(), which chooses a delay
> > > > delay method based on the requested time. For short delays,
> > > 
> > > s/delay delay/delay/
> > > 
> > > I think "checkpatch.pl" would have caught this.
> > > 
> > > Maybe Greg can fix this up.
> > 
> > Nope, not for staging patches, this is for "learning" :)
> 
> Sounds good.
> 
> Please provide version 3.  And given that, I'll add one more
> suggestion.

Yes, sure. I will send version 3.

> 
> You don't provide the *reason* for making this change in your
> description.  You say that fsleep() does roughly the same thing
> as the existing code.  But... why make the change?

Understood, I will make the reason for this change clearer in the
commit message.

> 
> The answer is roughly that fsleep() is a common or "standard"
> function, and it's better to use those where available.  I can
> think of at least three reasons:
> - It's better to use a well-known common function where available,
>   because reviewers will already be familiar with what it does
> - A common function might get optimizations and improvements that
>   your code would otherwise not benefit from
> - It might (slightly) reduce code size
> 
> I am not suggesting you include all that, but you should
> understand it.  My point is that you should be clear on
> the reason for the suggested change in your patch header.
> 
> Even something like:
>   Replace this block of code with a simple call to fsleep(),
>   which does the same thing.
> is enough to explain *why*.

Yes, I understand.

Thank you for explaining the reasons behind this change.
I will update the commit message accordingly.

> 
> Also, before sending *any* patch for review, please *always*
> re-run checkpatch.pl so it can find trivial problems for you.

I did run checkpatch.pl before sending v2, but it didn't catch
the duplicate word. I should have checked the commit message
more carefully myself. I will be more careful with future
patches.

Thanks for your guidance.

Pavan

> 
> 					-Alex
> 
> > 
> > thanks.
> > 
> > greg k-h
> 
