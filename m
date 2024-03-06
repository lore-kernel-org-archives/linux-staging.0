Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5812C52C
	for <linux-staging@lists.linux.dev>; Wed,  6 Mar 2024 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709734992; cv=none; b=lwfPV74FZYSXIy7Z6w+Gsi3cEoE7Ofp++uKUdE6K7iogxH7/krcRKEZG9xho01vb7AMyGUJOlLakk/uh69XkuYiMSS+Gl1Pre53dCS798uEKLVLP6ZDqBXZyR2oib6JrhnmR4b5WcqbLTb3TnJBRldEfpaYjwVbtYo/XU0JD4jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709734992; c=relaxed/simple;
	bh=AsmhaGXykgBlpIYOs3YSnmBAyE1Ypg8y1KFAQNP2p/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8X8Gb2yIcT6EcrGDb0cUsNwov+Z5lDYSfreJ10sdyEUYS5oQo8DWyTBfWsESOKN3+3U20iteiQbWFaXZKRy24fhovogSM9vF7GhDCLBYqHtDWL4vR+KdTXIiYWAtErCIbTsznFQNapMmXmnBgvykfKbOnsnPnBpyuDkDsMYZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ck5C/H+P; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ck5C/H+P"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412eced6d1aso14680835e9.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Mar 2024 06:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709734989; x=1710339789; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R30SW6r7kkcz9rR70c7AXNIgyI+HRbFxKSmQCilxNYc=;
        b=Ck5C/H+PIiHSMhZZZLgVwg+DMSym/5djBFTjbywNe4nQ7Dq9PNVkDLKurFUHlDpHD/
         mK3AxoFmPyOVO5BmBV8IiScwCMKFNki4Lhf8rfdQ1e9lKArnMIjRlqcbMduMZjGni5GV
         GlV5PbMS+ya1IWQDDr8GBeOcaSjkX2n3mT4VGab37XDhGHtooszJ8afgt+RJgs57WRic
         g88bodA6eV0bhqODett9W4zkNSWwI6FWMpxPjyQ+7p5LTnLQOf3HjhqLMG2GxC+BsIDv
         xkjYxuGtSygO//gV6azdEkEKTT4cAeWoU4mbW6sjU1HvyqvvNKBSGKo9IYMIPKMRURRG
         Q8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709734989; x=1710339789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R30SW6r7kkcz9rR70c7AXNIgyI+HRbFxKSmQCilxNYc=;
        b=N4xoXnVFpZW0Ak3ZFxhuAp4OTpfq0+zu/RAYpN8w+Y1a7EGOn+fxoBFT7YiaagzKoI
         JAffkLBq1jCTSUnSiKbJGW8u+E7bi8LewHwx0dICtyWBAezEZWrAz9TxeBfza0fzHQlB
         9Nyx3zqMb71dQ36j6EzSrkeMIILfBTQdN8BNgBYrsJdVKX0hYcKhc+CxfhdAQYM/nL2g
         SK8R6gmv+1lYjYbD16yhF3VZqriNaCc24gbbdIZ1KHahEb4w/TEnjKRXvS3wKtRExgTQ
         9RST/RCxQyrid6Jk5EmqJae4TgHGZkPcJefcBs5Brvoz4OoMpztqwDSx0o6/53vOrr+s
         XiDw==
X-Forwarded-Encrypted: i=1; AJvYcCVj5DqtJnRR/Ve34VEtIynBU6nPFuaCx/jEo9JNKOQX640r2rA17/9foLcfPa03EJw+uWkjVPm3vSj+DseHErDCt+hm4l6VRet+Ybv69A==
X-Gm-Message-State: AOJu0YwK33oH+dPZgI08iq6m3ag6ZXJQTY4pyTagSCD5xjnTaKsWTBrD
	0jroz6adJiJEaoTkjs7r2sifjMTGdYLb7lCSYED359qhO2Rj+ecKH58/e6RQxXI=
X-Google-Smtp-Source: AGHT+IFik5zZonyK9lfW3FFZ5//dn9vpf/Oex5P9EnsbT+ZYCfD2/JkWWjnOMVAt0EeR7S59HT1j5w==
X-Received: by 2002:a05:600c:3106:b0:412:ad75:aad1 with SMTP id g6-20020a05600c310600b00412ad75aad1mr11626007wmo.38.1709734989251;
        Wed, 06 Mar 2024 06:23:09 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c19c600b00412dc5cfc2dsm12309760wmq.33.2024.03.06.06.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 06:23:08 -0800 (PST)
Date: Wed, 6 Mar 2024 17:23:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 1/7] staging: media: starfive: Replaced current_fmt
 with get from sd_state
Message-ID: <8a0cf244-1cb7-48a5-a900-1f82877d1e2f@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306093334.9321-2-changhuang.liang@starfivetech.com>

On Wed, Mar 06, 2024 at 01:33:28AM -0800, Changhuang Liang wrote:
> current_fmt only can store one pad format, when setting other pad it
> will be overwrote. Replaced it with get from sd_state directly.
>

These commit descriptions are kind of hard to understand so I have
proposed new commit messages.

Subject: staging: media: starfive: Get rid of current_fmt

We want to support mutiple formats so saving one "current_fmt" doesn't
work.  This was only used to set the ISP_REG_STRIDE so use the sd_state
directly for that and delete the ->current_fmt pointer.  No functional
change.

regards,
dan carpenter

