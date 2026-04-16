Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC47391E48
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776373994; cv=none; b=p5WV2KALyaisSUy3OSwPajG7qJF/DV6zII10o7N8Q40OkKZgcR9bimRjJ2nY4/Sa6bzJX2Dga9AkgGSaHsJsP4Y7eHy1Nkv1LtuTQ9vrNOSD5hDbiCwgfWRo099TAzFX0kQjTv6hbIhpPa4cUOLjkueB5Hm+gKk0o7WSvs6dPP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776373994; c=relaxed/simple;
	bh=ylIgGBrsynMgUEE9Fpi9j7e5GYbSPq9xC4feukwCu+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHgHHNfifBBvuuQUjt6LN5D8DQ0nwj/c2HIr6XzDttLuuA0YLes4JhHGzH6XfLq6N6AGDLTO3kybxJR88/cpVHlXufUUqX3fpHuPH9w91iKt6AopWv4lZm5/ZH7QM8BdyycAQZW0WALsfFed5t00c3qwAmi37Xq7lBDReqNTaok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNa93YlZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNa93YlZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso100522175e9.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 14:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776373992; x=1776978792; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uoEJmOIxrlFqmI8KPwSPmOaLExlLGjywVGJPpSntiHM=;
        b=CNa93YlZRuLpEW6wyCuvGxqLfHdx22lcf5JocFVGFqDLY+Vg2oetugJljRYcebiZJU
         WQd8HpTqjKghGGrd4Cs5sAGUed/i/ri/NtLYw1JVIg99cFSQmeMPVkrJEsrA8FrU6U/i
         2L1eRZAaUCwv8r5exc9HU2QeuIb/Rz/WO8FQLSEXSjMjdRi9BZiRDmwTEMBXfZXAQi4T
         0bSwP/L0d9TS8P8xf2q5Y+yrOGuNtXDbB4ngy+94VpZn0UGil9PBh/oA0uMZHkaiZDpE
         c4It2PFQL8/zMgoed4tAgLKmIzsm66bOgUzBvI7zUw/s0DAuXVaFeQD8NxG5JqP0cmJ9
         wu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373992; x=1776978792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoEJmOIxrlFqmI8KPwSPmOaLExlLGjywVGJPpSntiHM=;
        b=dLnNW5n1UJ3JKORWlQFFAuLsulE0GDiKifdnGsg5IrmrrlHRxCnsML3qUX2iGOu+t7
         kbB/H4ZdAuJFl8d2jPP8qHXyH9hlGF3dxl6TeTdcVcnVza+l85KmxPrV+5m4nPh4c+rp
         vmmE3k2kWprIoueDO8IIIwFex3/yWqiD0Na9pPdE1PMicre7ATjI6MJijCIU46Qu8e1B
         Km2f/2JD0mmATSCrG3lmjYBsrn3GrmjimYZITtbWpBf8Rxf2JHlJv/haO7VzEOJWher/
         1OBhSbBxJxIUtvrLbreoyolEyNcOKLYTd2wHNR8+Mc7H/+1cFnziXG8PJE39Zhc4HABx
         iwFA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ro0dSEsIrb0Si9qcDAg8+d5xMNDSsLa9UpNK3lK3vMjpkyG8xhNmkeumQKhAHkDXa8djHAKQtsmDOUHIi@lists.linux.dev
X-Gm-Message-State: AOJu0YwN8T8ORU5xXvrZvwmCBf7gANaqae0PXTt4gLlonD3P5W2UCfM0
	DyEw3G8gpn8HWhYBtwpsmFMUPB5GM+DstH47MmwMr3x1NAqr2SDTwZJa
X-Gm-Gg: AeBDieuat0250Lh9Bfj0dbt3KtyYVyzoTDdN2OelcJiXjFGEyEok0TEZ8xFd+JEUrtr
	LuaHKhg20H7nE7rnmuvrJ73kTiiitncM+dCoZA04TqXY5ivHsZCfG4e1Lj1oyqNxk7a6ufrg4E4
	K2oE2h8MYfwoHCjCFPF245jOUrUpUoKMdBh16QIs+KTIgxMpFkKwASrvY42NR7Ic7f5mHkw3O8d
	VC/ZMl2t3Wh8HLY3bG0riiFyRNmhkgi10NlBQBm6hEmf+ENdi1Q0VYsYzNbcCTEgT71r7//hsdA
	Smk8smCwQ4uLOWc2qP4BiS405sK54HI9PLbsioPWKT9J1GotHS5JYx/dfrHYpIiXg1ljU8Dc/8o
	mFChjUxW2gc9FekOZDF5TnkNnm/vOHTl23yGi1e+h3eKKbmn9J2zBFjWB8Z96JUk3QWKhwkjpXd
	fgVPkDauowAE/FrIofZ0BuEOFjj0FpZw==
X-Received: by 2002:a05:600c:8488:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-488fb77b575mr2718445e9.25.1776373991754;
        Thu, 16 Apr 2026 14:13:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm1094485e9.28.2026.04.16.14.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:13:11 -0700 (PDT)
Date: Fri, 17 Apr 2026 00:13:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	starpt.official@gmail.com, straube.linux@gmail.com,
	sameekshasankpal@gmail.com, arthur.stupa@gmail.com,
	luka.gejak@linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix stainfo check in
 rtw_aes_decrypt
Message-ID: <aeFQ4zI3Vb80noQd@stanley.mountain>
References: <20260415184727.285753-1-mpikhotskyi@gmail.com>
 <20260416195338.324428-1-mpikhotskyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416195338.324428-1-mpikhotskyi@gmail.com>

On Thu, Apr 16, 2026 at 11:53:37PM +0400, Maksym Pikhotskyi wrote:
> The null-pointer-guard was incorrect, returning _FAIL on valid pointer.
> Invert the guard, so it returns _FAIL on invalid pointer.
> 
> Fixes: e23ad1570028 ("staging: rtl8723bs: use guard clause for stainfo check")
> Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
> ---

You need to put a little note here under the --- cut off line which says:

v2: rebased on linux-next.
    Also added another fix?

Please send v3.  You can still add my Reviewed-by tag though.

regards,
dan carpenter

