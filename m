Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B11F16B
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730788417; cv=none; b=WiRBSUFTqOrx0aqidXPllue2ADCgB8cv4UztaoUlxgn8ns1lGHaxA4djz99bOvedTH+m2iBbNVwAjhY/fo8Mz9juBjdi8ARcM7twq3XqdDts0GuuRhQ2PpH4mIhFP4gg3vm7kjZxNtvQwo3crwEJOb2FJCliATLZ/PlK4HkYDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730788417; c=relaxed/simple;
	bh=t3bvFmNuQGNs9UGiiISlH2teCewegtta8jaIxh8ONf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1ChtVEWPxQYOJA1ZPBjV83wv1BclsG6V+dPOvSPDpkqH4wEgOartgOYXagnTg2N/GYe+GZ0kdHAcgqPRaLQyyfaptz7zytrr3fpq+xFivtHBZY5qMZYj4nw4cYUHpDMv1eTOOPfFkZaoMzNmLLRGZ3cpY6eV8hOTh7VwsWCiRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TLt16ggS; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TLt16ggS"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a86e9db75b9so799125866b.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 22:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730788414; x=1731393214; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3bvFmNuQGNs9UGiiISlH2teCewegtta8jaIxh8ONf0=;
        b=TLt16ggSaZwm0Q6d2yaP6chGqq5OfZIh13BIJC352s7sfDeg4XNe99K3bVX7LKodk7
         x7ziePH8j43W+Ffr06LfAVPoE+vU0qqy9NZwSyNbRUhkV6E/0/aFEXH3ujzgxyS3YWXH
         gpabh3Ga134bkDXOWuxf0RGQZbDhXhkEHTqOzC1LBTkZI99K0FGZg5ss22m+SEzMk7sx
         LEVKjpio00+/BXkN2jpRzHz+gPVDgkIZ5FOXwpZisahmDw8r4k/n7K/3kzTP/hjirJMx
         i5ycTYpqGNBTBSUUwqF2lIw1h0pJz0F3EHIiWRJ/bEJ+7lBFewtGEPk/JJu69s4l+RiO
         eqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730788414; x=1731393214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3bvFmNuQGNs9UGiiISlH2teCewegtta8jaIxh8ONf0=;
        b=lJC/DrjfTVSwq7i30PyVaeU4cZ3L9jXnEhzBOubr3s3WbQgdWiDmR9v5SnDw+rz5p2
         yznYpxt+5Di7N7pWmQ6uqGGLGzmp8KFK+/sKCqJrcSQeeO3qe5fLSpwrDwhDt0WPrcsS
         cadapn/GPyID/46D3OmS9VbDGTnx7mCpll1nbmYc1QmBxa7OsqrmMrmUQ7gH6vwGL/M0
         pA+ob1I7qLnsys5sZA9dFm58mSSiFiEUF4gaRTbk3JaKeDm8CrluSG+ZctPRYe2s5cL+
         YyVixUSWY9fpHz4d6eKWGQaXIUwWOpz5X47c2xVpogDhuHDvgH5R+rUm6nIEXhp7OfSq
         v4VA==
X-Forwarded-Encrypted: i=1; AJvYcCWKaxSXkD7M/Ig5VEPacrcAS08Qs/PRlvn1+r5mu5wgUpjCEekXMvsJWIabeYtGRUinBKtQTU89fzWMmp9W@lists.linux.dev
X-Gm-Message-State: AOJu0YxOgq+keSCWG68gpR0wjL1mkIOxbA9pF8+G7v10l5VaHhdBcoT2
	/SN0hD/M9mRghcaqVpiO4Z0iiLrsQJ9Eq4l1K3NzZQLOzr9C7qtlY8BdM6c/3Yc=
X-Google-Smtp-Source: AGHT+IF9V9Q8NkCfVRclh7Q3mDq8C0xfRD+iZKCJWd9iql6JL8dFIMsWd/abfpHvPCmisIhYNnTz1g==
X-Received: by 2002:a17:906:dc94:b0:a9a:12c9:41d1 with SMTP id a640c23a62f3a-a9e5092b1c4mr1812239566b.28.1730788413729;
        Mon, 04 Nov 2024 22:33:33 -0800 (PST)
Received: from localhost ([77.241.232.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9b3csm83341766b.172.2024.11.04.22.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 22:33:33 -0800 (PST)
Date: Tue, 5 Nov 2024 09:33:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH v3 00/12] staging: gpib: Patch set for gpib staging
 drivers
Message-ID: <d0c4c59f-dbaa-403f-ae39-4ee0476ed9e7@suswa.mountain>
References: <20241104175014.12317-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104175014.12317-1-dpenkler@gmail.com>

Thank you!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

