Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F483A48F1
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779429284; cv=none; b=GvLEUtrw2yt5kGtWZC+WyIPG85B45CX4qa/FEhIwfLlzeZOS8I7oDoiFFxXINiRt51WFPk26g4JC2YHNVBUbBIZqFsrqWptBxaJ958WJkuSrjOeYCn3O2rVpTzP0tpZy9XgG+xOQ7zwuxpiFAW0/TheYAMq0g+M3r2WQgf9DAXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779429284; c=relaxed/simple;
	bh=MLQYd1TUEGsy+swWeSk2UksjEW87jp4XumqdcQEBfz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqXsZC++B6nro9b2D8QHO3e39VnSkonugl/1oQxGcMaHPI7OPaEctJQdSyY517yF/bs16lzdGUmc7ghpkmYlqJWDecN3IwjWJiXWXGV2218FhIc57ES22X2emjjDGGHV/AD/erK2OOcONHKOlaITuHNLc5arIzn16xfBb1XpIrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVhkQDkM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVhkQDkM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so95333285e9.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 22:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779429282; x=1780034082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmwOasrsN6EcgHg6fWX9JfwqT/CPvGQqU71BhvD3KlA=;
        b=cVhkQDkMoSrm5WwJJikuU8wCY4K/0+E9G0Qm/STZBxLghy9g5TjNfe40OjZWKBuBBq
         b302mWGjadt7kwLlnkI8rWocpeRiEdtqhn9f5Moy843PNwGdEfVgoA8Vu9BypEBlda9u
         T7X8bfklDXP/DmwhKG20Da/62x67udeu6VBr/rq00qjd0G9R2JuR2QAzrFQ1l+GVGiFK
         QL3eptxdxrQ74WwvxTqCIM2Y1bNhtVATL3+EOAvr6IdnS7Jdk0qZediW+SLnqkKHyuNP
         bV8jcaLaj3EeRYwGzQAj8jg3XZ1ktOUkYOSSvDVYPWZK9jhPO/tDdCN8iSbLczjOsn7/
         b/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779429282; x=1780034082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmwOasrsN6EcgHg6fWX9JfwqT/CPvGQqU71BhvD3KlA=;
        b=nD8WLbF6+MNy/z/5Hy4uju6hML+EZQIVSNKyewErqpkTf51Kee4sYxvRBOnBbEPEyt
         r2jmOtwD/RFovACP9HDh12aI63gcTGinP1WZffLYTbjQaB/QuVHBQTkT44ynTKQdnu+C
         jQe9xqEL0n3MOir4pnqM6kaGrl0jzp/mEYg9QrnQoOEfSxqXVL7qHlMkzSZVb32L/T9x
         mhUKx5HhlQox1LtrXnoidWIT61Yc3nqjQkWtyTK+cjUgTZ3QmM65l+6WU8R8YRACDiaC
         +WJ96acOCpWTEKxVDGk6Mg3Yhe/skEViQxiZzuIknVGob3i8dtiwGSysEUB9Nsar7po6
         hjxw==
X-Forwarded-Encrypted: i=1; AFNElJ81k3SY3FQol8c0ru77D3TOsChgIYsmdk2G34gKdY5/TUCmeitvMGzrFBnQGTNxiq0c+phPRA2j/8vT9cxf@lists.linux.dev
X-Gm-Message-State: AOJu0YwTd2NJ08sB/oFmkuEzz3MMbKX4iUu0Rj0nCnxCCfX0cJRRL4Eq
	vJjV4IluzOrDiWhnFVlB0nvbvDblpyfCUsa8wIfo0wnZa2BsSk4gzkPs7wTM8Q==
X-Gm-Gg: Acq92OF5XIgPVaXg3P6k1NwqiaeJ1k76z6TXXfhKFkOrkxEnKcWHuz7PVZBsVgQ5mEH
	ZaVR1rmgavtV6EhrSid25ZpTLwdQEK0W/xMixmP+G85P2Db8MDfQrNmqozgFXmIIT9NCKzcyXhR
	ONNF8jdGjeBARR2fAI2JxNNtY0mPNyDtSpyxrtO3FcWjLRGnE0zm8MqnbztUGQ+zsOfo1N2ks0o
	cwMrlYB/qMxiORUzo7Ez4C9PUhuca2Wc0BWnE+QzKMAjmP6MMbE9PxX/QN5pdvfZyEIyscLGhaJ
	yz1al4bP7o5idLILR4HzMynE0EEar2iO/9dZMgDhy7LQuIqhIIEJi1V1fHx5og/UdSBATVKHKhW
	hWbnAsayAiT28eDq+8d6sTQLXzV5aXSXAOPwVJV/7Lo7YPgg0JQ2jNYbj5+ja9mHpPTdIex53bg
	FG0r7Wi9oNRMr0IrDS4N5Bh+0=
X-Received: by 2002:a05:600c:4f0b:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-490426a699cmr22262945e9.13.1779429281797;
        Thu, 21 May 2026 22:54:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527f7f7sm34162465e9.7.2026.05.21.22.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:54:41 -0700 (PDT)
Date: Fri, 22 May 2026 08:54:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Pang-Chun Liu <kevin95120@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unused rtl8192c function
 declarations
Message-ID: <ag_vnliWpoxnxw3V@stanley.mountain>
References: <20260521144113.28869-1-kevin95120@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521144113.28869-1-kevin95120@gmail.com>

On Thu, May 21, 2026 at 10:41:12PM +0800, Pang-Chun Liu wrote:
> rtl8192c_translate_rx_signal_stuff() and rtl8192c_query_rx_desc_status()
> are declared in rtl8192c_recv.h but neither has a definition anywhere
> in the driver, and there are no callers. Remove the dead declarations.
> 
> Signed-off-by: Pang-Chun Liu <kevin95120@gmail.com>
> ---

This kind of commit doesn't get a Fixes tag since it's not a bug, but
I'm always interested to see how mistakes happen.  It's better if the
commit message can say which commit added it.  In this case the dead
code was added when we initially merged the driver so it's fine.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

