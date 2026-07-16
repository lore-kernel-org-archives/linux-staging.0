Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974553B42FD
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191924; cv=none; b=Uj7n2+SpImINXWCxLrznu0w2kgDSfbKFZehfxZXeuPcCgwOwQmlF4hnjsgU0dp7+L42fJTVv0amxc8daHouNpwhmebzKklam/Qi+9l0ZS8iyZTuzai8qXFDrFT6WSMd5Mb0TAiW31tUoejeXGb9++OtnWbUlePrrRkOhOTkTPdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191924; c=relaxed/simple;
	bh=BOTKuDCU3tdRP45CCg7RV/Mi6Bf+ewUdiyCH4EcQBJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gztRSfub23mqv8wqK7XOA5Pfu9bNJjqDnB8tHFubegsK6hENroRrm3yGvpxNw8oDrNbJKDaK8OR7pEQVLbp/O865wZPANVrRONIULBVE8KL8Lv+IDFiUMAA3hf8afyj44WhaQmB6K5Xc137IlfqBhz1a11MlzXV1R/BLzpfNpus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I88Z70Nv; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I88Z70Nv"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9d7464b71so2171665a34.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784191921; x=1784796721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yR2FDEtVlWoof8SpuOcxS9lUEU3R1LMgkuOGcWos4U=;
        b=I88Z70NvtiGD+fo34OFQlcuTFPmEBd4J8zP5EX4VdyXKbpI7gUaThqwEYzI8YBtlDS
         2XVgtTeCb3phqs1RxOk8Ddgfi3gVeIdlD40Onv5XtkJY5OAdVVEpZvSuyhHkg6XmqHLl
         UcZGY5pjXks1MPzjqvYNjNzuokqDRRrCmKz6fHNYdaZcyJoYptVwrYgssP2h3QneANIx
         KIMNEPm7DujaULU75euXVObAHLk3IXYWyl7Cl9V+fISPTznclfK0S0BRn1WQWfc48gPs
         CXWdS053HH1ISWneMwjtdmAf8BFtai9YL/bog7qwC+buUPKfsWnmmF65yJ7fuGM/UxDa
         BvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191921; x=1784796721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yR2FDEtVlWoof8SpuOcxS9lUEU3R1LMgkuOGcWos4U=;
        b=IkKYTxdz2ycZF1WZOz8X+qN5RC93vtmt3s12zVr4JkSSpXo6+UdCPk44WpE0NblU+q
         +u9OH5r6C4E6IMy5mFwxDlASgo7aDV6ZdRGWxF5Ii1Y5kzfhpn3Iw1dHdLDuGJluKfYO
         d3wO+7YJ4oewlV699ShQmMPMDqAMI4VXdQDN12FxmpvFrgbFQsxDbAQHLK7mXuO06qSx
         SybJnEC0Wy2NnFdbf1hMA5krTeyk9SlKdHBq8i0iWWq36frXRjCIdau8KUi6Bm3neym4
         ejb3KmIPcfLdT2Jim3SteAsYv4KS21t4ba5IWrelDPNC9pZ0vad3cM3tTlwpy6gQDtnb
         DP+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpFu/m7BwkbwNMv+FoYyYIOWFxlr7gBPVSCAdWxoJ/qL5iXOnkbDqVHp21t2bbsXdyN7b1Hi325QOcx3WXu@lists.linux.dev
X-Gm-Message-State: AOJu0YyvC5BQE74RwTKJufLGfZqdzlYE3BTzpCFfQl2h4ALuHoOe+Z2E
	vxm1V6CRtGNAfC4flV7Z98elVDL30KlUtSSj6+Az3LpegQ45PqYn7Y/j
X-Gm-Gg: AfdE7cmOCXOGR6zDwB7ZMilPZ9GN2v2Qk9VF+KySIF3aHln4Xgp/cYAQNe6NnZbY2yE
	ezYwZiCUGYinWhimwEzaiXlnAiLtcCiLUiLPwwjEqM2kQYw/qJYdcTuF2HyDih5cnrax5AUkYo4
	Gl47b2WKcFlzJdVupu5EY5EwDKuKWAqgXSB+IljXq2RsvgiQNCDUb/LJFajVE0WuaBRAlKKGXMV
	EGQZwRrn0BkfOSMMeUS19K8UvDIPiQbiemqFZC1UHeuEz4d9vxu2TmRTRM7R8ZAkstuLMLOYdLL
	u0qEHIk+stT+TptyOJWQzJpkzyj6S0/FxDS+koIJJjfsgL2jAu25+YKsnWGCwGA+DwncdFRHI16
	oCtOnB0qQwOF+kTAVgKyHyESHgr4aZ3n1wXWx9yozJVxqIYZRhjk7n6lVM5au2z68R0XdpB88+c
	jwXnTw
X-Received: by 2002:a05:6830:6a92:b0:7e9:e448:a28d with SMTP id 46e09a7af769-7ec4a916eccmr6064965a34.31.1784191921279;
        Thu, 16 Jul 2026 01:52:01 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2bc0d0sm19022110a34.19.2026.07.16.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:51:59 -0700 (PDT)
Date: Thu, 16 Jul 2026 11:51:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Amin Madani <aminmadani112@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Split multiple assignments in
 _rtw_open_pktfile
Message-ID: <alibqcLxYmCLdhEN@stanley.mountain>
References: <20260716083822.2898-1-aminmadani112@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716083822.2898-1-aminmadani112@gmail.com>

On Thu, Jul 16, 2026 at 12:08:22PM +0330, Amin Madani wrote:
> In _rtw_open_pktfile(), multiple variables are assigned on the same
> line. According to the Linux kernel coding style, multiple assignments
> on a single line should be avoided. Split them into separate lines to
> improve readability.
> 
> Signed-off-by: Amin Madani <aminmadani112@gmail.com>
> ---
> v2: Assign pktptr values directly to variables instead of chaining them,
>     as suggested by Dan Carpenter.
>     (https://lore.kernel.org/all/aZ_0OratIkUBNHmy@stanley.mountain/)
> 

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

