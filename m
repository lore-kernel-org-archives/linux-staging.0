Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FCD3D74
	for <linux-staging@lists.linux.dev>; Wed,  1 Nov 2023 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UxdKljQN"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9be02fcf268so981016166b.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Nov 2023 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698840612; x=1699445412; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oyFDIcQz4Ayb0YFR5ah1QzeXQO+HRuea1JiIg/q8N5I=;
        b=UxdKljQNXj/RBmCrNxqXlHGOlNJhQUkoiNRKmdKp5REZfO3ntGGST3oYNGeA8LZgk2
         ctDVRqjaqZTcsxAqjKWTHky0S0F8vJvnlZuAFg8pSHp0lfUkUanoI+pJSyzlr/xkLERv
         pPaj2m0NaKkf6gPovdsYntrwAw4yjrLQOSnIPG3KKJV4361cLCV3Swp/NCBC+2S8+nS8
         QSzT6sbDdLj5JjRFD6/dXXWNb6B9DYOdtDRud3ERU1SF3USyGAHVqSE9/A9NADS3vHNi
         wxJMkGEfFCYpMdmKg2RvRSp5/XAYEi1bz/U2hZNAIUyWbwRLcQ04Lzz06TYJ3PmWl8Xx
         MaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698840612; x=1699445412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyFDIcQz4Ayb0YFR5ah1QzeXQO+HRuea1JiIg/q8N5I=;
        b=tUMICslHAnFBufzUxVP1EToa/HAsdzfgx7C8J68ueQeqrYgNfXw4BTPYLquV2xcfoM
         ybYtrB8ogIgqmvj/pCUO54bjbYunxiwlV6NNTkShjWtjRXg6hpi0GptK2rEFRZHIRmd5
         mTBMq+QJpaOIXBkK8AXtFMEp7OlGeprI0vJCne37tN55N3wTPd0izoHkj7SBjU++1lAT
         VCdbIWMLb4OUnfFizjVfxjMJZsDuZwkgusKiwU13o/Q3JF8l8Em0/99WmlEglOAiHD27
         BG7jOvqEONK8cCle62Qg5JOfWsGcG6C8FX2+/RuCmi0NGduQbrK0aDEJfkzm/yKbp+Zg
         C3Yg==
X-Gm-Message-State: AOJu0YyP6R8JpckM5bhuA+8wycvka47/+Rj6h+dtPB6RXzrpbvqoTZZ/
	A/BCRtaKBn9oc/K6dwFz7q1aTA==
X-Google-Smtp-Source: AGHT+IFuf0gFji8DS5I6wGncn+R2QTXTkAX+przL9DJXGk+at70W0GVrrEvIRRn4IDxLhuEBZSQN9A==
X-Received: by 2002:a17:907:1b02:b0:9ae:82b4:e309 with SMTP id mp2-20020a1709071b0200b009ae82b4e309mr1859935ejc.0.1698840612034;
        Wed, 01 Nov 2023 05:10:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id gr18-20020a170906e2d200b009d3148fb9f6sm2307176ejb.22.2023.11.01.05.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 05:10:11 -0700 (PDT)
Date: Wed, 1 Nov 2023 15:10:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: umang.jain@ideasonboard.com
Cc: linux-staging@lists.linux.dev
Subject: Re: [bug report] staging: vc04: Convert(and rename) vchiq_log_info()
 to use dynamic debug
Message-ID: <1467fa2c-024d-4878-ae1c-5422779d33d8@kadam.mountain>
References: <be68424a-ce70-4a91-8b63-13fa4cce22cd@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be68424a-ce70-4a91-8b63-13fa4cce22cd@moroto.mountain>

On Tue, Oct 31, 2023 at 12:08:15PM +0300, Dan Carpenter wrote:
> Also I see in vchiq_release() we dereference "state" before the NULL
> check.  This warning only triggers when the variable has definitely
> been dereferenced before but if debugging is turned off then maybe the
> variable wasn't dereferenced.  I'm going to change that rule to complain
> when a variable is possibly dereferenced and see how the output looks
> like tonight.

Yeah...  This didn't work at all.  600+ false positives.

There are potentially ways to make this work but it's not really simple.

regards,
dan carpenter

