Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF639902B
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543892; cv=none; b=ULUCD/FbQi4V982J77jM8VhdAJ8wv31yLRmLUpJkJLhfDkrzwQtEMQegpMp0tABA1YWcKGKhyUAa+O0q8EKOTxkwKeNtYeXsolBrBOsXDR8Ersqo1HiffG4RuTj09zhAJ8BPRfWNO5NlkCkKbdPx5JnHm6w8eJNCjWZRokEvM5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543892; c=relaxed/simple;
	bh=PcIqj9clG5vSHwjzka91hVCZU0Rl3dJ+gmavPcLWt0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfubj+Bv3vGYJ+l+yCxFC0/zGfELsOA7emKQmbk6WLuRQxgqyACyIN6v5EeHqeI6O/9MBHFSPxbLjMHezqZF/R8F3IFuK23gheJXeKfZBFmjB1O+XSjvVKRvAavQJVfMbpyhBpOJ9mm3E7RugKUEsS+VlGHsufzy9DU6tSLweWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZMJovdh; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZMJovdh"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7ec58fa3e01so2494870a34.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784543889; x=1785148689; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K1JwM55+0NG2uO4CBPpaDwZmw3eWTrlUu4CzH9U6B2M=;
        b=oZMJovdhTIkdLsikcQ7hakrsgS2ZvbdfX6Ufvz9ESOKEY0P5fc1+Oyu8DFPiHC8Jp6
         vdfRnevnErP/PRCB4ukMf1uvI/+HnpLtriaXNqtcllz+BzSvVz9LzFzVKy8U9JdEmlMr
         rSpSqyCvEM591EB8Loczv/xw/451l7r3jUa5kPyrpWszWVQNtrlilwosLgI3BUaNQmbd
         B47COZfVVLvocEcHnOQeWTkywSEbF8go6JbGrVSusC0C4dRLa870f53GOXyHBesKIDhc
         dzgHyeWA4cBc5naQqyeA4KFSr/+4Oi4mo+stXy6Qm9LUq2h+o5Gbuf7veFzn9AxOOcpw
         TAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543889; x=1785148689;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1JwM55+0NG2uO4CBPpaDwZmw3eWTrlUu4CzH9U6B2M=;
        b=sZIjAUSzJXMVzcAC5r40XGXlhXxyjRXcH5Xkqo9NchaXAtIsMLrX1UZXQKNlJowBia
         OH7cAomkBmJ7yS7XKxEuKT0BQGiB4IV/Lb8AFY72n9KyrEq9RzWFRnDLNUI9LCLxccnf
         zymgjNVfnu/PZ9s7atShWqZRxBD9PBDRBNTYw5REd4zJevviBLBJIqW/0ZBVCPKCXfCZ
         Dy433KkdvHR9D+hRg1Cie7pwfkAFuyGmqMATmv6RxrnBXHZpnXix9s8yFrSqftWE4gBK
         jmBXbJ5I0+VvPmXLLDeqbWfoajdjOVP5e6eaSNNEudG0AWMnaO+eCqY4U9arnRFNtl4A
         0jXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW9JBO92a9KcB+WQuyZZfIsvHJjZoPBXtNhZp/S/zqj3OGEcM5ct5AuO/pdbEq1F0ydk3uaP9qYRZngr7O@lists.linux.dev
X-Gm-Message-State: AOJu0YxgwmpdE6EZ9BvowaSz5FIJ2ea+Ga9ld1UjuEop/25kkdGmqr6h
	GA/xSh/AEsxN4KfSdSnd39Z1b2hvCSPuQ0Syb942AyjC9640T9rBtcJN
X-Gm-Gg: AfdE7cmtzkelVJ0G53uToEoDrw6QmD0v2Rv33zgPUjzJddET7UgivE39OTyF8NbpFek
	j0ShZDzBHZhkzk8snt6fnfXPE0Myu0/HCLhcKC0MANr66JefA8MSRpMitAgQmWM9BJqSHGvi3SK
	EhgssGIhxpAX41gyvC/fr12MlXuVYNafdDa/lY3Doj8nDiVneJLlmK7VO/TPWgXMbTeEawiWlPA
	u5ZmtrUgAFzTR92t5HLQcgjI59kkSDrxlEs9Vt9t+DQva7OAXYNHQ719+RpD/C22IfBF4GAbZJF
	+c0vBWu66Hr709vWzU9E2AvESPjfHRvIuF2aPuICDqQd/OJWb5PvIhoBeOF5mzC+HEHDdPbW23M
	kLMkkE5AaGrP2re1tR5gSNvS+AmP1Lta8B7IiShl6YquSU7E6AeESQcIJcOMEhacsbh+dlBsAlL
	m6NQOM
X-Received: by 2002:a05:6830:81ee:b0:7e9:b4d1:78b0 with SMTP id 46e09a7af769-7eda1157b00mr7640298a34.30.1784543889598;
        Mon, 20 Jul 2026 03:38:09 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad91b8a5sm7780884a34.5.2026.07.20.03.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:38:08 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:38:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: atomisp: Remove unused and unwanted
 debug module parameters
Message-ID: <al36id6uaqTB404p@stanley.mountain>
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
 <20260719140350.8266-2-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719140350.8266-2-prajvalchaudhari733@gmail.com>

On Sun, Jul 19, 2026 at 07:33:49PM +0530, Prajval Chaudhary wrote:
> Remove the unused module parameters 'dbg_level' and 'dbg_func'.
> Additionally, remove the 'pad_w' and 'pad_h' module parameters
> to prevent userspace from overriding internal ISP hardware padding
> boundaries, leaving them as internal driver constants.
> 
> This addresses the 'Remove unnecessary/unwanted module parameters'
> task in the driver's TODO file.
> 
> Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
> ---

It's weird that the driver still has lots of references to these varaibles
but the build didn't break for me...

regards,
dan carpenter

