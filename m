Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6FB3769F5
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783768157; cv=none; b=Q3Opb1b8dPR0dX7k71wA9MnQ4ez2GVawNBShj/xr8fU6XJCohCJMEa7/L5s2fOqnHQed/k/tcCFaBQaKFRsTerhQvi1VaTdpQcb9xs6NNHtvtZz0dz2E4nyEBZcjcveQRcKZ8SPZmAtxM+tGy+dRGA6Bf7cTxSHcGbwh8XEFd4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783768157; c=relaxed/simple;
	bh=/ct3a4d07mIPp80dTOTKKFNLheltHpdu7cQ/5IYNZcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br7W5TpldDI6jyHw8ur4keSI87HbVXP6aNCzWZeCzGixdEx29ln+Dqiv8On63puSanjEBD3Ec4LarmvvrTu/R1sPrJNtooBGXfLr6NNKBTfhBirNGoanwtL3d+zMj2nFAEfrNLw5mBnZdhBxPFisNyr2RnXiBC2vnaa+X/g9Rig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWY0BkJy; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWY0BkJy"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-44868d6a066so492838fac.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 04:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783768155; x=1784372955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ct3a4d07mIPp80dTOTKKFNLheltHpdu7cQ/5IYNZcg=;
        b=MWY0BkJy9IM6E0t9TA7+2u2+GlNE63YBBMJGGmcIORilX+my666uyZwWR3lcnkVmMo
         fVXuK8fkmFocOyfzbr/NO6AbvlQyhDMAD6fcKEO3qACOwDyTJILrZZNyDhgnfH/ylrKO
         L6TSYw/4Ri23/QKWIj4V/oEZJu9yu+kEeOjs0FFB3Z+I0MyDteq6NEZN7Eoed+0HxkMz
         NSvcgJmWN2G/gFOKUdvvkpRQF/dBXpKqYTszQuNb78spOFkLHR4hrZdAaJN4QfR2axOx
         0pugcBcS5uf3Hzeb7VM3rGAyzkxk7moOewXsloWsy/XvisIabafBQspBjtesV09oYkw7
         5Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783768155; x=1784372955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ct3a4d07mIPp80dTOTKKFNLheltHpdu7cQ/5IYNZcg=;
        b=HW1fxkX+R5zjZZb3fRtEGfCpM27ROWW3AWbembQhbDB2qtOAllKewlNFhVTVzAUwiu
         jMILoyO3TIMFoj1+yviQ7CGvlq8McjA2KmI/f4RzBrYuOOiChLfytDpoW6dv34CkevuF
         ZQhkuU6hIoO8TkITuFcw10Vt57t6WgmHgLij8UOgkf9RzrS0+UJTxVNrkxGdMjCV0mzJ
         4Q1V/lNDgnWzNNlZGMLMt0LNwUZixu8cRnKBOUQoMpyLysEcP0zs/LJ/uUWWuByySV4A
         HhIXYcq7PfH7Cz0uYRSNKmN8pfTkBjH2B6cSJxucfHSuyRdFU2czY7vR/JFFIge3sgXb
         EK6w==
X-Forwarded-Encrypted: i=1; AFNElJ+cZIHQxj9VnK33A0padWXyeFER3Nb+3qllgZvUoY0Ya/tr0uUAvJKSuB6/ahmX+LcQV9QNP4tMO7pjnNq6@lists.linux.dev
X-Gm-Message-State: AOJu0YztoqLXwdGjSzX6JS0AIkP544a7iBCyMEzPWuQGo0iIPn4I/fUY
	FI1SQaNlUQFDV9YKFgzxNpyBT+f1YbKwiBD3BA3/oKcVMI9j5vkFIR9I
X-Gm-Gg: AfdE7cmcKUN3+bF1erwP16xqe3vY6FivJY5COr6nLFlzuCAnsIP5EXSF7RgYjUljPTK
	klIyEnyATa5JEWkSbqf304dbP1iBEWD8NvzJaR8BvPCNTixk9IJOXK102M4Tq50t2ZLRyfBEQMH
	Sey8qK88KIJIm+ydfsCc8GhbZ0Zx4C+7g66+KcRrLu+vOVu/sM1zpaB9EahuH1NP9s6qir8L5/7
	3GEHP5RqbnkQ5J/gjnjNzNot2AOWE2ZsmY4b9fMQ113T1yFZ5GiFkV7SsBUA6M1uTA7nRJoQdEP
	e1Te3Av/nqc7baj2zgoASbDXXxYIMXRg21p5z1EhVtrYVeX59HI8h4h5WoMeeHydRq9xRMG+XJw
	FBr0fdMwLgFmRru9Fp527tJUTn2e5AqYZkWAKqt4aZjAPLh+5CHkiJ9k9EfzGEX1vz6laM8FFcj
	JgTjIy
X-Received: by 2002:a05:6870:a255:b0:43b:5268:b7a0 with SMTP id 586e51a60fabf-451f1375b2amr1284724fac.26.1783768155055;
        Sat, 11 Jul 2026 04:09:15 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451ff78897asm1123162fac.17.2026.07.11.04.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:09:12 -0700 (PDT)
Date: Sat, 11 Jul 2026 14:09:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: "A. Kalimov" <erqeon@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, andy@kernel.org,
	mchehab@kernel.org, sakari.ailus@intel.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: media: atomisp: remove unnecessary
 return statement
Message-ID: <alIkUiNSk-GbxXDg@stanley.mountain>
References: <20260711110152.66188-1-erqeon@gmail.com>
 <20260711110152.66188-2-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711110152.66188-2-erqeon@gmail.com>

On Sat, Jul 11, 2026 at 03:01:51PM +0400, A. Kalimov wrote:
> Signed-off-by: A. Kalimov <erqeon@gmail.com>
> ---

No commit message.

Please wait 24 hours between resends.

staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

