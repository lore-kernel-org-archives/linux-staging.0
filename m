Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697618027
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 05:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781847368; cv=pass; b=HxhqesT195mQeMtL0xobQ9Le3co2L1ZASDY/iMLnTpUk2aakBtZEScwGpAgAI8EyRPouidjnQT7ECwP2zjPsBYfhAqT+6IZL6spEqimc2K3cKfwiQ77sW3/1yJb5K8HGLaezGT2V1ABgkUS8+B3kvTyHfkTYfFXEysAs4DrsKRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781847368; c=relaxed/simple;
	bh=Xy35Bh2vgCmxOO28PoKalm+RMq1DHI0nOEA4ySWZHrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CR9E0dFCmQTCuJzoOQWDc0yN1hoGgqGgRJQPT2fA4xqn71ci6nq32M7gZpjWJquufn0O2oOaYFzmm2cqcxLCBFt6UhoEl8gV1spks5qHP03IyB5TuuUt+AXm3SEyWfZ7Qgz0CjfwCVkZ5p7Y25Doky5XTePAThJAU8r4cawqOzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7WeBJgw; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7WeBJgw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4624c1409c9so1277402f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 22:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781847365; cv=none;
        d=google.com; s=arc-20240605;
        b=NY2Cb7r0cffLKRvVueSEfZayOAzJ/Vz44RcS/Wx9WDFnHMA6tRSriSJby/VoK9IR+Y
         gc0CU5Y14z5bCHhX+RPczrs9kGufvgZoMtdtIv9KK4jf+AQEuqKkGYejfDGzHtDYKOGH
         eNPOIVVZR0EeEvYrsaTgH5Fmfya+myHDt14Xbyn5OgEXmrtF7nTDcFwFAnD4hS8SwDna
         K3+ipsZ88ILOCIt/2KL7JKl9mU/1ljDCrkbHASN59bMUN39hJZzxH+aeaYesfGn6LNWe
         ePriNxqLhTN+h869P5papH6LBSgAyFh67RkiwMR+KHkKs2LNIE0pdvezNCzI42n/Z06J
         Coxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xy35Bh2vgCmxOO28PoKalm+RMq1DHI0nOEA4ySWZHrA=;
        fh=7ZaPcakltwi7V6JPNAmMvxTZNLFhUib6qNGZQLQPnvE=;
        b=UJVGQoqHyxVfpnI9M9miHc6K7nLkO0Wa46A8sxjbTMRllJSDDIWjgS/6Dks8TKGVbg
         8g+aofJJBwdtO72/kaPc+zs/ByXU9RiZifBPfKCbXeTuBUyURxl2CSSEu7WWmQyhU0K5
         4oBaYmm/bTt423Ic0wdEppnh2l7AITHNbtZNOdb+Tb4Oa4VvDIeSPJB0dklHlcfz4tTp
         XbhHe1C4vOrVUOkrGzspQNtQtiGuiYFxWMCKM/lYKc3SOe8G6aePyj4nMhmrWfSdIkp5
         iRrgRC0dhdkari4bhKop/Ogzedb5KDk+J55JqVxhi9ayPstQ5gwgmIET6Mzk4l8FAtQk
         /Ipg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781847365; x=1782452165; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy35Bh2vgCmxOO28PoKalm+RMq1DHI0nOEA4ySWZHrA=;
        b=U7WeBJgwyt1oRu46Hun+vyRClIZwLD59bdOQ19LfXHUCxW/tXlZumZABTeL7y2U4Ek
         mJcREa5xMzhwyx9Edc0/+Alph4GN58ivWEO7yqGTnsYptBT/19bVt6dxlhGbqERplEJE
         gzXyLpbE9PSbGhSjMhd79TC90l/oAbEjs1kSZ2bwrA/JTc9FmFTL1YAj9GDrv3qave4m
         /U/rL9bWM1fU5B7n2HE6uWln+wzXqd1m8HIIU2ZrIrhC/ZX5+16vm4Tk+xch/co/ILyb
         Q7MOjHqZ/224q3RHcBACyXCbZ0+DYDVRmlLUCVZTnnndra85V/kTma2QHhQR1lf9qvaW
         3kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781847365; x=1782452165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy35Bh2vgCmxOO28PoKalm+RMq1DHI0nOEA4ySWZHrA=;
        b=fcsmPOGkMc4Sywb70puH2ptqcl46gPQq0wT3ym/S+wxy6GtlsR7lh+IIqCW5yHwJId
         zJBgvAkQmmrZkZ5eQmByUIXJf33OADfN2Gjwf9VIxRsYxjRKaK7iKZ9f++uZ1PijS1in
         rC692OWSsPR2jVSvl9BqA24uoOFTMDwPhNE7BInuHeveBA2CTYvMnEFKDFNpniekPPCl
         EBX3i5iPL2ty2Nd6LfjfXumhMbCfJxl7AoCb70LO5qV+LwHtFvwzppvTqsgvd/+ZKb58
         qBN3wwKQZglwyG350GntE8NFvwCOCz8DkJOVmtnhBtEpIAAoaxpmTJNHsrnMitI9gDRb
         1y1A==
X-Forwarded-Encrypted: i=1; AFNElJ/W5xiZFle2Dv/67T71YfhbgQQz1QycNSmjL8J6ub5dVUR+vUQBsxs8WWI7/L/Ry2fIf1pnUMyu2LKxyXa4@lists.linux.dev
X-Gm-Message-State: AOJu0YxpbzXsFm6cdDULsgkKsk5646ljmWYQoE+zvpnyglwUWCv3/sFQ
	b/o8CXqhcVaDxfXj2/PAIfxtrmGUqq8y0o9+uyRhX84m/NNv8jSaC116eR6v1vmumtTklQop0Mm
	PQC2psUO1d2jicJ6MkicPDIOLEpYguzg=
X-Gm-Gg: AfdE7cnqfy3YI1PsAiTlsLEPG00F4FAQj/pRlYrQIi2GKg90bke5JmMkcpuVvao74aq
	Vds62+JTB3VJTwdyj3QpFK+ZgeMaLMvf4yHRsDN1KmJSNMZYXrUaW5AY6YZDIA4VkkIVbBp1lHK
	t/h5Yj/cwIcGmm0HoW++Knn2to5lMwPJt8gbDIhwUnh7ASBuX9AkPh2SOI9w8t8m1UTCWXU/3SF
	M+CscnPqFW6KDIEloaJ5RaR5OGjfn/3TSbuLV46X/E2GXobB1FLIuQ786SIPokgYCSPPtFB
X-Received: by 2002:a05:6000:1085:b0:461:fc84:dbee with SMTP id
 ffacd0b85a97d-4650005c5cdmr2905403f8f.16.1781847365298; Thu, 18 Jun 2026
 22:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178183657058.3862365.12892304946786698397@maoyixie.com> <2026061910-supply-jersey-bb24@gregkh>
In-Reply-To: <2026061910-supply-jersey-bb24@gregkh>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Fri, 19 Jun 2026 13:35:53 +0800
X-Gm-Features: AVVi8Cf-IL_a8SPBYpE2y5wxpbHqbpcxZabaJGxadztouYdjaCji2c-MHSWPzrc
Message-ID: <CAHPEe=GZ+z=1zXUn222ajNjUcDkRMcGjO=JeYNkb3m8a1Qkk+g@mail.gmail.com>
Subject: Re: staging: greybus: audio: possible out of bounds read in the
 topology parser
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Greg, understood, I will keep the device-trust model in mind.

Best,
Maoyi
