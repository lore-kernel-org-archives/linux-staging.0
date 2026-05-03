Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9A273D6D
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777824931; cv=none; b=q5mrvL3pMGzOwNSUMc9S24ZOg6vY9kP91r5Jou6yhuF5EUiLWOKDNHNuD+/sIpZjQyyZvggsqCdC8vjo+8E8mQBu0kZ1RwrNPL+aKTP0JrYxn4GazXnTIFLCiGQAjvYmyv2sBH7lDB9piBeCGfonHUGJ6mVmCGanX1NH+rak2I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777824931; c=relaxed/simple;
	bh=B7Ic+IK5pwBRmUAFn0tE/KjGCQ27mBxjyDUv2r61RXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0tIc1f1fMoGiaINBOyOWo0d3DmFYKHhRHkWzVpaGDaglhk0E2SNztawrnIYaFUllhxo1VMQMYNKDjE8CpYqCBZJEQ3cdffOLnJynfW2t+sw4Y/OO9WEkfPB8cxXAYZ4ukR4idl+O6AZyYj6aIV6wM65yx8wnwHJ64XsPr2sS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF6QOW4l; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF6QOW4l"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e4a04f059so4758426e87.2
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777824928; x=1778429728; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol20ZxoHMvI/BcgfGobPA5iMXoKgNHR5SmDQFRES7gI=;
        b=EF6QOW4lvHuMJNLpD2wnAsPoAS4wAQbY67Sn5U/15OP5U45U/d5WOKGHMd3sy3UoTH
         RhgrtqptJgZoezepMDEws3VXaQh9cK2U1ewMlvutfZkPegJYF/6K2BX1R19JPOLVzEhx
         L2icnpGHtIQxEngjwUDtW5B3xMvYzui0IVkGN3daAp+2WE5DOwyfGDW+H9hTjN6K0zSv
         56unduYv0Z61V2Fu4PNVH9oO+13DXt0DM9EUV8nLXbFPXDxAhSBcONS7BKnQfGWr4ESZ
         mUXWTG5b6m9evlnefstQ6pdY7p72WybvK7A+l0XiIsNqDrsmpXNpY8b4sdfDaXNnUq0d
         Pftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777824928; x=1778429728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ol20ZxoHMvI/BcgfGobPA5iMXoKgNHR5SmDQFRES7gI=;
        b=M4mDmlJoo+jxLOKqM6sV1WhoHVIoCRFRnQpzkHryuxYr5DTzbp4L9BVCC4ZAQ0H7DO
         Uf0SFTeCNHwBvABTIw+Uv35pdkX6OAA9DEeSUUgO1pkYEQHxL+X9uDILzIzv4TK3G2Jk
         pGN77D97sYIKirEMqWHB8UxgixdEsBy2kcLoGmTt3/qUZAWpio8y6MsOtU624wx4rjkF
         cMOgHlj/EUw7vrGKsGOv7dfmcAt0eNg6hdI1aljMVG1Omszz2okES3yW0kHm7SpzFapi
         fvCaMfDEAwWKhyVGWEiU2JRCidmSdW6ndo+a4JwcUZZoiWEaXeKl0apYtSv2g7cVNzOG
         Lw8g==
X-Forwarded-Encrypted: i=1; AFNElJ8TKMI9qhw5ZHeFFm7vlfz5Ttz5DJbtJxIS1ijdDFgMSeHIFvwqTh9kftTc76MV6UUyUpE7K+N+VPPGptmy@lists.linux.dev
X-Gm-Message-State: AOJu0YxfGUEIahWCLttKbvP63MRX+icRnrXIYRXBrY0lHQ8AnYZIkflk
	/hxqfIUS64scVG4IF5dXol75M/2vflunQ7SU27SvYLtOAXYCuIbJcu73
X-Gm-Gg: AeBDievGzGYlLh041u9Go+nPVh1cUc7lyPgD2dgLNQnfLu5TOu7xFZXpZu/eCh+sJ1b
	58HWJ2zYcIpS2Epr9wqrJBPNRPBSyfS7rWxZjBdqdeyulIgkSYXkRNIZC0ySwjhyGIhHDzJMg6G
	mDWz4uK0g7b5Z945bdS283CadRSPzTJp6++itXy2OEVZLivqAUaxkgN7HN/HqgvmxdGSY/guvDj
	S+/19ao4ysMyRahNWOi46fx05BU84hvUz1j9iL794IlKFeCVhP5tdhz22nyAuYfWzgmg2Tqxl+F
	qMp7p6rs7d/cV0G/+wAN0uT3oqX0zA5OA1F2/DBoKQ+zzS+6zWH1LKLyIt4E0qf4455WeMwOokP
	ycbtDj0By3KvXffYncEryW1Z/5qMSC2++VQARZ7p0/29VsA1DBDlrqbHWAhl89BcFzbqUKJs/3Q
	lw+Z82/bOxArKiEb6o5sjCO3J5/ZLx6rmNXSg=
X-Received: by 2002:a05:6512:2252:b0:5a3:ffed:8443 with SMTP id 2adb3069b0e04-5a8631ba00amr2178273e87.23.1777824928040;
        Sun, 03 May 2026 09:15:28 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610901d3sm22197031fa.7.2026.05.03.09.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:15:27 -0700 (PDT)
Date: Sun, 3 May 2026 19:15:24 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Aidan Russell <aidanlrussell@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Fix spelling mistakes in comments
Message-ID: <afd0nABRW5nzhgKP@archlinux>
References: <20260503155043.15936-1-aidanlrussell@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503155043.15936-1-aidanlrussell@gmail.com>

On Sun, May 03, 2026 at 08:50:43AM -0700, Aidan Russell wrote:
> Fix several spelling mistakes in comments in the rtl8723bs staging
> driver.
> 
> No functional changes.
> 
> Signed-off-by: Aidan Russell <aidanlrussell@gmail.com>

Looks good to me.

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>


Next time, wait 1 day before submitting a new version, give other
developers time to see your patch.


Thanks,
Nikolay
