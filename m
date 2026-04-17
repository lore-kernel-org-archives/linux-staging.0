Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3583321BF
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408297; cv=none; b=QBPC0bpph/XCgUlKOgRIu1SCmmomPx4K+znn5pQ2eDWoJMGloV1SNS7eyrJ5JxHLI7+1bXS9+iT1L8NCJZ1G3fvjLzpTJF4tXq/c8wazVKCxsai8RyEGGxOA/DArybFwXFsCCgO55HFqeSPTkPvOWAAi1RKrsV/GAECoNjW3qT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408297; c=relaxed/simple;
	bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTsLqye282xtI0D75RBC1czK0rPdLo8mWjoK02qiORJLerV2L0NLjz6Y2QOIC6joe8UHWxdO+/jHzC8432win1+HRUZ/RRkozLWitc/cRdIqaUcEZl6wD35THfbuWqlTEGr2gpGkv4Ii0dzD0SW+N2BUu84YS4Ttzzr9uMrAb04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCrSW5hg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCrSW5hg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d70b3e159so125048f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408295; x=1777013095; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=gCrSW5hgpR/vKxysfKtF+frzqizmI0fj/4+DdmhikLshaVJyqJ4Ei+gAikkw2CLIgO
         BcGtThL1kkNt3mYT6AEAu/RMOW7xbwsUu73K0hgr4dEZmHTyLOM7LYC5NImdb0vMdid0
         EgMteviu5p4UVrbUWeQm3FfMbCJibDDiQ/6P4iPkg6dlPtpa4Hi4e4bBFfHSb7axiZTz
         fxLPyH+3dJe6Z0kJRvCcCnyka/EXD1XOYLhYl+4NTvQgae4x1C6PBSjAHn8eJrRtErZt
         rmK9A5nL4SmMYoq5GIQ1wvrB7atjxnNU4LCAH18IwKOF7FBaO3d74v+hNUAyhBao3fy8
         aBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408295; x=1777013095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=N8+OlmRWv8VaEGzBZsgOROE8KjPQ31geLE59GX/lWUQugStEADa85jQ7nDvm16arsI
         NDMnFJ8835EZh3mBIh+xeFaqfuBmyieNWepsfme4rP0JBZdb1sI55szE/yMZ9Qhx1UYn
         Svczv4RgUtE7HbC/BfPcbu7UpgepFea7JVVrMIY+byD9nXIw32URzzuGRtcWy1DqoIRp
         irKp2H0osDMbS32cu44bGNGTr88R4TI1aIlWGbb0k/Kl01zpiHlJ5aq7gugFUls37fEx
         64w+HkNmMRVDpMLIEc/B7hMs5NPGvKd0+IrDRtTXglr5XMBR3YIcui2MGWNDk1grJUMV
         3Kjw==
X-Forwarded-Encrypted: i=1; AFNElJ/WYtwrm91QE9OchU8Pilcksu/SvrS2DGjopnlS/qFu4VT1kzisaUKd2jAhn9f6YmHiXAIAFNeFuosz7nf0@lists.linux.dev
X-Gm-Message-State: AOJu0YwzoXa+IkubEudE5VxCfrRBDrtj17pmmOwFcVFBfF67sYKCpiEq
	w9rZ/nrcghcPLF7Nd1gdzsSwnbX7Pbz51nW3s2z9cxehbbhiOwQOk5JB
X-Gm-Gg: AeBDies9agh80z1IltPanalMbJmj5Joj7sLt3r7KQKo/jiEx8qhMG6XNAvMmlO3vzG2
	JphRkRqd3clNwMJF1vHHszsgtP3QHw24IpLgTlId2gaGd7pRy1m+E4N5RChqt1M5MfgzfZxooDq
	QSyu9MSU9MkFUpkq64i6Ab5GeeQSV11Hf4dP+iaqh9ZRBcs79xpRbpuEGioyTteEs1RV88CtrjQ
	vjaB84K0lM5D1VIlmzyNx9Tz9pzKBq/Z35OV2dQqzCoclj0ir8DqdNk8U9QIvg36hw02usfua2p
	uPUEsX+gbW5uSXb7x2fmHC6U8Pz3/0Waoyoue6yNeWyDX2DItTqV5SVtkI5+T0Lz2Vbwjfof+Qa
	WM8qJvNK6/BgrTmmm/KWlVPjTqlTuSTsBRodeVo2JHdh1tdAHT3oI5mHXtCoigNThLJgMa0/Coe
	jqmvoYqhZc2GgTQWKgrcZLz9htsv6b/Q==
X-Received: by 2002:a05:6000:24c7:b0:43d:1cec:4766 with SMTP id ffacd0b85a97d-43fe3dfba40mr2145216f8f.23.1776408294517;
        Thu, 16 Apr 2026 23:44:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a381sm2312517f8f.21.2026.04.16.23.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:44:53 -0700 (PDT)
Date: Fri, 17 Apr 2026 09:44:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 0/5] staging: rtl8723bs: fix multiple security
 vulnerabilities
Message-ID: <aeHW4iigENNqmdFL@stanley.mountain>
References: <20260417061048.62484-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417061048.62484-1-delenetchior1@gmail.com>

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

