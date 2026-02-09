Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9F1244665
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770639133; cv=none; b=ojAVo6r2NMjhmDYUIFaYNN2HDzmIrsNqAAtxaTKeN0JxbUzknFd4A68BVwk5xO50mQ4Y5mmV6hru93a5CtgXu4poJgG9gtspKjVbn2KthYCvkEc9cHXfVPB5UzYm/jTU9kZ3zwSTdnQ35WiCuh0XI+19SXUfZElC9LsvkdUS5A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770639133; c=relaxed/simple;
	bh=//5d6cQyg9hxJ8d8/kCvugk25dGme+4WCRruXjfv5PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLByVLi9UsbE+blvKvblgb8KEo6HPXe/5cMHcNbkCawLxTNe0JySe7iA/YCAvxFUzYTTxtWVUxI90rkPJ1QPdqE0dIua21Jy3lmg5NUbU+IgDKZNQ42w4WqbQDW6z6d/L2JPKf1Hf50w0chnlFeD1kWvyZSF4w/z09SLx3SJ2Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YF5p0w2A; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YF5p0w2A"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso12221345e9.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 04:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770639131; x=1771243931; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hT3D8JmpKHP7vme1FrMBSPjCBmb169ojrKfYHt4Aw5o=;
        b=YF5p0w2AELDHS2Dwwp7o/RI2tGKARUxMXOMAfWXfijVr8jDLQ5KACZA5EM9PCGePu0
         Hq+nb8zID+KrdrKKbq4ul6gte7qrNZRyiiyTT0uOS3zvo3X0sdSzSK+HA6qJU9iX+9/W
         b+aLxKKRJMmmikTiC8r8IeDcmtyWZd4FFiSdx/evi2Z1rsBwCInHUCJPBR/rSEqUT8uA
         3rwGoN85a9GJ3o92sh75YdeUyfKVwZ/DrtzATcWzedmpbp1027roUMs39WspOh+PO0Os
         wY4zMUIBRSwfPdweKXQMZ2BM3UdqmRCGlI438D53fbN6azi0rEIdmKm09yETIdcbv0CH
         pdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770639131; x=1771243931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hT3D8JmpKHP7vme1FrMBSPjCBmb169ojrKfYHt4Aw5o=;
        b=TBR2ngB4abzp+P98hxRqTK7vZ81g+KmvDLMl1qzA8/d4FSAQRTp6S5+3hP9r3GD6PN
         YLXf//D+hQuYr8FWqw6lmJch7xg8hp3nkaurajxWKUbjFHTHCEU7so7vE+Jqv3bwVEtF
         m9TMKO5UkIg04GGa7tzPMNmwszs+Qp7+EXKheHlxGEWTXQt0GPhvhmnoHey0Y4mytWk1
         bY0HsS9JEJ22cpS9vt80XFFn+YghBJsTOAxBXJAryEadQgJLvushJuU4dQmzyAhWSXzT
         MpwMOD7vpWUV5W+QJ2sSiPIwLDlEfRMRUlbBYwAXk7iARS2bVgilhgYb1a7K9VMnNHPt
         E9Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUgb/EZzPiKng2F0wGCvQ6zSyggdp/7/ZCjyAFwosPrSUBT9Ic/i/j62KAtmxE8tpN1oL3/CW8qSdaUnmBS@lists.linux.dev
X-Gm-Message-State: AOJu0Yyho/k8Hg/tasIbwdie2+4Bcxh10Uk0IATQeRRqE6m0Su7ilwXr
	eSQdapPK4iAnm8T/wj0l2Ln+zedb7jIuQXNH79x9zg2avLdB5y12tkJFsvcEMtdzkZU=
X-Gm-Gg: AZuq6aIQnRAfKpZNKXr2ogzKV3BMGHSRJgrHfkvRAo1o9QFtMmTKQYFbybgpYxY50es
	nL144nNjFDt2SjsCb6fW3GJju6oXjMQwZab8JliXoPffZESFgT4gIQSAszf5f0EDHTXCugZgB9x
	TPpXbsrgPq0fDfYom8n4Y6Us42pl7lDpHp96mA9ZyT96T26Y9ArDOXMKo33QQTwIvdwA8Hjm2/e
	Z/Vo9T/MgKeuVbYtBaXFRnhh3iV9xVvKJqBi9/3u7PcMDPG3QPzZmVyeUbRV8VcNH/1L4yeBrNn
	RZUmlPWCWG9b1kl8/7gT5p4aIf/qTZhhUjhd17FVt1V8C7nd0rR8f/ejmGYl5YKTiAJdOZftKQ4
	JsaFnoAvja/iduKMSsgDE6LJ35PecvSPwy3gLn1WoO/t/fj+9EnUi68sXnEtohTaw4HaC2ZgAkh
	yC6KTaqsecRu7VXmvGDzP86EDwAos=
X-Received: by 2002:a05:600c:348a:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-48337ae7016mr65141945e9.3.1770639131055;
        Mon, 09 Feb 2026 04:12:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206b8bbbsm409079255e9.3.2026.02.09.04.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:12:10 -0800 (PST)
Date: Mon, 9 Feb 2026 15:12:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] staging: axis-fifo: clean up probe logic
Message-ID: <aYnPF_IW5Ye4aW1T@stanley.mountain>
References: <20260209113229.7871-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209113229.7871-1-gustavopiazdasilva2102@gmail.com>

On Mon, Feb 09, 2026 at 08:32:27AM -0300, Gustavo Piaz da Silva wrote:
> This series cleans up the axis-fifo driver probe function logic.
> 
> Changes in v8:
>  - Reverted line wrapping changes to keep the diff focused strictly 
>    on logic refactoring and avoid unrelated whitespace noise.
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

