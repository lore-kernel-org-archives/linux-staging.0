Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2F83D16E8
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651824; cv=none; b=DhTseSoaI1VrVd0L20VHKrqnGSd1rzB7qpFiOCWGo7/I2eSq4iL+hVORBG7Hb1L6gMzArvYAy7gmYBMn89KnYyGukoYggcputOiNBG+MFCKElWw7iXldXn0P2DMZ4s7S7z9swip5tKXu3hTqdr4T3vvsyvnwP/JqKG1JdofXzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651824; c=relaxed/simple;
	bh=siKandvWvtiBR5e9UWqOOQecDwlnZ0hGS4SYBGCu8Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uu97ShG+94Bk1V4nGIbF1IGz8rqOmZq9oI/gAlOX7SAMiD6oerH+idETWFK0uPheYbJQ3MmW+37/5G+WIs4YZ2LRBqMzOK5ffVwGQaOSJoUStdi5NzaRwklTM1xESGngRX2Lgy9pNs6HA7uDMIa6PN0cNucEZKdBJMq5NIona7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2xxNSb2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2xxNSb2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so21643185e9.2
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 09:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777651818; x=1778256618; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h6xC7JfImrJgetVlvK/72zwn9HkupN9sZhP69nFLTWo=;
        b=Z2xxNSb2AO+tkHTa292qDP2HctubVw6IxPPxgwQO+pZwR7JqUyUTPa2lMKl1bThkXy
         tkBHBb0Sg0kzRPh8Y4JWHyFSiCuklJE67/r3N1xnqt+14ZOiWLV00j49lfx/pkXfDV/c
         ly4KcW4DXadn0X8vcOgO6NOTYhjLZv1VNVTdq8L49ralpbko92TWSX7nSn6JaEGxbOXY
         McKZCm5cEa3+QFpojsL+txLGkq/PY8zPQKP/uU6TDaPbECPhGYAFUlBxJz88o8SDkqra
         Rq42bgmd512v7Zp/q2lbh3un9C0q1mQ+V79rrlrCHCfNPkhDeY4Gfsd73IUq00jEtsbr
         dxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777651818; x=1778256618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6xC7JfImrJgetVlvK/72zwn9HkupN9sZhP69nFLTWo=;
        b=CU1HCUhdRrEKRWlXNPUnszcbR4V54E9Doz35NMzhatNKfT8MPT696HSEdBfzCY5Rvl
         ANOjHlksafJl/Cb/fBR6JJdQIV9PRCad9PPCv/pNY47ZYOZn7+oKAgVH8PRfft7k3eLX
         M19TPYzdw/RfvCinnpagnvEiuaMtiuOqBS0noSH/8+v0sW8UAiDO22MfOzYVw/U34xI9
         U/iDuFP4prAueI6h4MAja47NIlIGHYjA0WqmLomSpZvevEYqtJudL2FWG2eCmEKF1Daj
         NxXt2kA+3l+tHAHmhEL9rjxwO+5Goq5Dvcyzxy+kFMMczPvTSxx7jOHlLzYWEI2HQh8b
         6dwg==
X-Forwarded-Encrypted: i=1; AFNElJ+WcvxUC6o8SNqjDW3bDJlI4cXHoXFNjYLaaXmekUUkeECsYsNLco+EqJSgeONoAXFoQmNuhE6zwbryNmxB@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr6orSK8MwWgCqFeXcfkICQ9F7GAFwv19bqHqDm5YSUwXRDuh+
	EtyOhpF27uRg+Lgi6k2CRROstccP5vGucFqlETuPnemZvrTea9K2nyLx
X-Gm-Gg: AeBDieugNhrh6WTbACzIbPx4Bvqs3dx6N5lHNXYVnL7XeQto9WHod56IloFlKud6xBY
	jUV9zIyFrGnsB/zelzo5dNDM73Bz7Xvc3/gnwP6Dgde7CZfo4fdLgrxHi1gUlN3NNjfJnPbcu/m
	hicGhsJIfWmzTIAQDzSe5S69hWFLCvr+6aK8MR1nwNqAZVwgWYUuo0MXhWLgtVApdtHkK7aeiO0
	6Uv6boz1CXYySUHO6ts44hcbIrxXKvXj/88xZc6WEt1++RhsF89LcdzjFoJI7aTYKR3eFhYXIw6
	WvZ+GhPI53PCy4nbCJHo3/fpI8q7bDj906KrwczYSpRPiF8yFgP7jT3kLHsdsn+PEBwy2zroZBR
	IWXlcaxO0Z2C+Z+BOK3tOBjZkj8KgToEnFYJKJPw2yPxfyLHA7BA+2OTIMHpyPes+tyrNcFJqIC
	mjLsbt/XBSx7H3Mg0VYxbjjwv6UUkqTA==
X-Received: by 2002:a05:600c:4f42:b0:48a:568f:ae6d with SMTP id 5b1f17b1804b1-48a8eb6b7d5mr56259835e9.8.1777651818277;
        Fri, 01 May 2026 09:10:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm136482475e9.4.2026.05.01.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:10:17 -0700 (PDT)
Date: Fri, 1 May 2026 19:10:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus:add missing newline in sysfs show()
 output
Message-ID: <afTQZHlmMkTZDP2H@stanley.mountain>
References: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>

On Fri, May 01, 2026 at 08:12:08PM +0530, Shyam Sunder Reddy Padira wrote:
> Sysfs show() functions should return newline-terminated
> strings.Add missing newline to sysfs_emit() format string.
> 
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> ----
> v2:
> -Remove "no functional changes" from the description as per
> Greg's feedback.

How do you know this doesn't break anything?

regards,
dan carpenter

