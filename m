Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CDB38656B
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 19:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775678392; cv=none; b=Qka6vsY5h8x6KMciFvr1GV08s4QreEXnj+p3bF8VJLOytsKMToL+WPIg7qFm5PTUEJy1eZ2NaPZcruLfAGKqJKwusyLM4HvkqC36LfINnxoVDnA1KlvMgaV7PjXV021ulbqfs9KgPu2XCuYEI/BSnHmG+wuJw89PkPpCbfJwdhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775678392; c=relaxed/simple;
	bh=FerRYkmJ4yyfdIttiwMEYgYR0TcFjIKcmhdnkB7SnrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TE4HqaoyGRrIUjbpt15nKBx4Y3ROsxCjKserRZtKaavs3cAoSAZAiJS33gdxKeG0nN756YvT9Dh+Bssu3tYZXw1NUhl9xAMBIkgq9r60xAORTQc8R3wN74fxQflDn18k1JZMMM7I6CTwRFf25M3TJGcnJiSj3QsbLMg5UrNn6Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTL+ES+P; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTL+ES+P"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-358ed696623so100884a91.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775678391; x=1776283191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T62ak+RDMJ/ecbm+4TV9sT+dXCfZWT7fcpu5JcoxLqc=;
        b=BTL+ES+PEWHRQPn9xcSCydu6T8myzFNSbrAWuT6H0n1PZxjKTZqGjBAFPJw1FzsZMJ
         tcPk6eUjHGe8eOGwcPp8D7rOBJ6mNKQx6ieNkfBI44bFsWxvZhwpx6Z6NxeiKp5+1cue
         tyQY0MwjW3pbb4G5BYHYl9vXvHxtAMklvTR+aemdBvTUcZmVoshRGT5wqkvLyxlDUwuj
         G+wiXO+hrYN06a8/AstY/EgVQdIOAuDWrHwYgJjp8trES/aHuFNFei47hv1KwHNn3sxW
         0iBvfhqQxycwhHBxOALklV7uHNE/Km05HzlbFCCiplO4fkZrUXGE8Tp75jw2eGavozKX
         st+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775678391; x=1776283191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T62ak+RDMJ/ecbm+4TV9sT+dXCfZWT7fcpu5JcoxLqc=;
        b=cNkp3AqxuYyuSGkp4tLcv2tuNNxUHU8SpB4ol1aGXzNG1std1cTuNgb+tMETsgGmk5
         qwNcTkMJPr+nTNl6OArQD9tlvI413bGow8fDpauvwf/y6oB0GCw0aAr/v0TEm1G6oZep
         kUSjGDyKSaP9ShK1+Q5pt3es+djzsuigD6wPXBlsc5ezkzvRD2cxrjobWsaqUvEBaWfG
         lezwax/FuwLmHxEb5yH3K2NbbVcg5ysx/pmX1P1gTICC4Is2VCUFxTFP+48QDzAfkLMT
         7k4IWFY/poMQ52sMmHsbM8RwanO349+YiQC0/ujiyX5Ey8crPhm8PBerpfDiA47oFf9O
         /BWw==
X-Forwarded-Encrypted: i=1; AJvYcCULhN5neF0NwU1eJc4DjG/BL48jxTiHKJntxhE/fhy8MRuu2YzUAlZ8bJ5bWUbQr3M8PqbSO/wqHgj8QU+O@lists.linux.dev
X-Gm-Message-State: AOJu0YzyZ462PoHZV0QUNrg0l/eutqOF7hzq+gVG7odNGKLd8mVT5NVm
	l8WKJz30bxZYHc5+28dzxzVBYypmQBvUOeQelZbGWKwU1ZRtUgvEB/pe
X-Gm-Gg: AeBDiesC0QSBzXKva049Jj7/+uJuNsqbdo8SbYkJNUa3X45i1ukT6bsB5JLko+ODFEi
	ihpeyMbZ1DU8MRXADWfRZ3x17EVq9LUWTjVchRQdjoSBrIN8dI/QUOJ0OXVmOOH/5bRKeu6+inQ
	0h+B8i8iJMX6FnPcSjAcPMGW+pxwhafAYhrNbk1pCKogUXiMZtXQ+5vRz+Wv5NwtGG+KHDbqyjC
	3yxFoOegNMCJp5/KCBCltFkwmee49dijYsS7pRBAnoD7jgJ8wZVr45aIx7dx5JqN7M9QYHXUsao
	PZRSymkZE1KspKwA2RhlHH+xUc+zM1I1Wrq3H8QGD7V7z81Qr2ZFPMk59Jh1NLAHfimBz8ZkJTJ
	jZpQ/5t5fwGTSXnNXBbitoxSC3WcK0UWZMISd/4mfTxPRHzEOjzGyLlhucfIa0IqZegZ5CD7Rsw
	TjqRqtqq2Xf9sUY1dt/B6s3Ls=
X-Received: by 2002:a17:90b:2fcc:b0:35b:9d3b:34cb with SMTP id 98e67ed59e1d1-35e35774202mr599371a91.8.1775678391043;
        Wed, 08 Apr 2026 12:59:51 -0700 (PDT)
Received: from inspiron ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e35155829sm480190a91.13.2026.04.08.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 12:59:50 -0700 (PDT)
Date: Thu, 9 Apr 2026 01:29:40 +0530
From: Prithvi <activprithvi@gmail.com>
To: ethantidmore06@gmail.com, luka.gejak@linux.dev
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	b9788213@gmail.com, straube.linux@gmail.com,
	andriy.shevchenko@linux.intel.com, dan.carpenter@linaro.org,
	weibu@redadmin.org, knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [RFT PATCH v3 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <20260408195940.m2nz4xaz6vdquda5@inspiron>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>

Hi Ethan and Luka, 

Thanks for taking time to apply this patch series to staging-next; I 
apologize for it not being possible to apply this patch series. I just 
realised that I mistakenly was working on mainline kernel's staging 
directory rather than staging tree - probably thats the issue here...my 
bad

I will send a v4 patch series to rectify this issue. 

Thanks, 
Prithvi
