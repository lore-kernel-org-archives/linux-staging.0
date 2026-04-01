Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660F381B02
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034708; cv=none; b=tHcUY4pOn0zJUlSBPNIl8823lN5ogJpSkZyL6LrP58rOJhgs7jWsgD1FYJElTrvyLu4JhuFiv+kb5rTs/g6LXfdUdvEpgwc63MIxpzd7blgy/pCm8ww5LcWDanjwgQjnz+oTMN5WZYbrzjULrQwZo97KdF/jJ8ee+udxp05Xfy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034708; c=relaxed/simple;
	bh=//Ff137ItcAe5Ga2LCorRIy8/izw4y7+oMbb8vVEi8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DY4df9sdm5gpFN0JTPIpTH3WACvNz3QIN+3GHqxbhX/IKaxNaFljSjFgWNkkKBZX2Ryn0REz4RLCchFM3XyRg6+V+1ipe0IioEHcT26RR61XGwiU/+cBAfKgdql5sVwukNAd+g29OcjtViwil1BoEqkehjzTpui8bbJTIG+657A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nchMaEze; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nchMaEze"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so9825995e9.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775034704; x=1775639504; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GU2MYtgtof8zhGg7Ukz6W6ZgS/Q4jFeOlOLWhznUGu0=;
        b=nchMaEzeAyKEo02atTEYubV/VZHbAJGDxy0O5KQ78JzvTcoF/zjrN7qcAW7FcuTJ/7
         6KkgbdUf16wvurJsOmUN7mN7c2yYuZexV8cKubTBNdrW0Fkbh9xQHSBvrhwBdIO31kHp
         iX/sFu+jrEOwRHJZS+BX0aHsa/MIzwQzY2BF1hk1ozEYsROIAy4D6uEAFVSKeTOs7x0I
         bp6etG15o6xgTkcW6hPj6cYrGR9crT7IsBNECRMz0pUlzeUnpFQZXqHuXzieKhNRrbjM
         oVWbV1rPKn0dq+gD/rFUCSNFBcI0/tDxgy1LzxerTvu49BjtSqUru70lOQ3nLSSXWWbi
         gbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034704; x=1775639504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GU2MYtgtof8zhGg7Ukz6W6ZgS/Q4jFeOlOLWhznUGu0=;
        b=Wkz0G5idM6g77ESIralSk27sql1vHl7ONHE3xWibdx7idtT+bhLPgkUHz815ZHx8hl
         j6O6gpXCeJzsRRjSgfIv1ZbzSbaBd5DVKn98BP7v0BzS9OdmKKkRIFEYcF9K0kwfEdcL
         yVeTas4HpdeKaghSOTvHYyVq/8TG7YXsbb3gmb5d1lGSJZSDEpwp2/Q+Cqy3ROwSK3Qy
         y6i1A56NYk3S6DSY3jwkPZin4U9DG7ZcpkTC0U/zPT2jRyqly809foEFedaQSLy6nCml
         lGHn3sqL3Gp2NtIAlFFCWzf5xRANGlU43mY+zCRJN3EUxVvz7J66SSc0Ba89GbuZ6xFt
         Rurw==
X-Forwarded-Encrypted: i=1; AJvYcCUx7+cQdjDiDhJksBk23z0J7EFf4Nc4WVEu7SMa2LRvV6TDRYebPMng+P9pXq8377jSP7LOfqyjotrb/lK1@lists.linux.dev
X-Gm-Message-State: AOJu0Yx606apUBo5B9cE4bZUtGedlwKx7toVDRl2y7joVJZqzp02G2FG
	4Q7Lu4sTRJjviXUZ48RSS411MM9/wyb8GbteepHJRfSUJTuFjruNbFRQ
X-Gm-Gg: ATEYQzwE9rQ8Iu2iLDCnkP85QuBo5XQZlukmoV4GFeOwlaSJ5s/Gg5J1miZdTJqj9tr
	PJPidCnkICvLMGc2Y/x5MfePrXFB7jaetnHdYodO7W4kIv9eUaQkwM0ysUJUKFYe6s7Ls+SVU2m
	RLkAZtaY5BVa3x6gDE3+wGJ6L3BasdV+PQBXfwtCnpHnRrbaYUtDn1hFTOfLEtA4Zl8zv3wVBv3
	s15kEq0QIHOYvUfW4ge/CU0ngV3k4WGN22wfDav+jFr/cyLKMaTKh8Z7VvQepPejtchyoi0G4Ze
	zfXflqh+dIZER7WKtZpD47WN1YxDn0X9PMzufzHT8EXRdmMzH/KOg3V1yUc/h33gze6A6RbNpOg
	kvIWutFi8CTLP6YI8+BOHLmrKVECuUNnyFeXQcC/8cu9RfYN6CFZ5aZYIA2PWMFyGejqNlQXTse
	kOewpADEPoiIk3aprbqnA=
X-Received: by 2002:a05:600c:8184:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48883575bbamr42898405e9.8.1775034703589;
        Wed, 01 Apr 2026 02:11:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257cbc3sm33508339f8f.35.2026.04.01.02.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:11:42 -0700 (PDT)
Date: Wed, 1 Apr 2026 12:11:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yuho Choi <yqc5929@psu.edu>
Subject: Re: [PATCH v2] media: atomisp: gc2235: fix UAF and memory leak
Message-ID: <aczhSwl-PQKQ83AR@stanley.mountain>
References: <20260331194727.52054-1-yqc5929@psu.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331194727.52054-1-yqc5929@psu.edu>

On Tue, Mar 31, 2026 at 03:47:27PM -0400, Yuho Choi wrote:
> gc2235_probe() handles its error paths incorrectly.
> 
> If media_entity_pads_init() fails, gc2235_remove() is called, which
> tears down the subdev and frees dev, but then still falls through to
> atomisp_register_i2c_module(). This results in use-after-free.
> 
> If atomisp_register_i2c_module() fails, the media entity and control
> handler are left initialized and dev is leaked.
> 
> Handle each failure path locally and unwind only the initialized
> resources. Return success only after the full probe sequence completes.
> 
> Signed-off-by: Yuho Choi <yqc5929@psu.edu>

Needs a Fixes tag.

The design of this code is that gc2235_remove() is supposed to
clean up from every type of possible error.  This style of
error handling is always buggy:
https://staticthinking.wordpress.com/2025/03/31/reviewing-magical-cleanup-functions/

However, the commit message does not explain why it's buggy
in this case and there are still two error paths that use gc2235_remove()
to clean up.  Please, could you fix those two error paths and explain why
we cannot just do:

	ret = atomisp_register_i2c_module();
	if (ret)
		goto out_free;

	return 0;

out_free:
	gc2235_remove(client);
	return ret;

regards,
dan carpenter

