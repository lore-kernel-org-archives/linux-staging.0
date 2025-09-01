Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E2D338F4C
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756730530; cv=none; b=gtkqcoyzRAH6Xbr5NNetnZ3J5YjibSfAYuh90PaciAZUwUML0e03e8jEIaH9l5oC4CeApu2GsTjNUFRaWxerzfm5fvLwP0u9jF9TkQJqfwHHsUpl0yrMGE22pwZwW7sebfvjwTfLYDzkj2SDT2I/wxEfsY7rIr2zSbPQLMub/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756730530; c=relaxed/simple;
	bh=gOY5Dw0yIneTkFl1rkItoGut8jnz7U2o1MHv+e5ti3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQ5EBHBsaIg1J5HBzez4KwTq6WI8F36FRmFO6TexRrULEXjAwdFKU8fifSQEMjfMw7G/AzUYgL/v8Y5eaQ+raeySsSKLvp/rXCDCSXK981DMpxrA30lEieqoq9fziMnNVM3Q1cpcuhK1R/xIO7NveNneA0t0HfFks0qa80OmEF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+FRkYN8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+FRkYN8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-324e2c12f43so534729a91.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756730528; x=1757335328; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOY5Dw0yIneTkFl1rkItoGut8jnz7U2o1MHv+e5ti3A=;
        b=m+FRkYN8a2SF1yVF8AHG5uAtEyOm8BJDQE/ARjYlvfwEzCXEAgCi5x4QHP5JLMeIqv
         hOAENyoPZTHReCuYc2FF794jkmjmXrQ6LEojrLWRLhoXimTTprYqx/Xv5giz5fq860e3
         jHbyk8sueqefk78MJvTwOXPkWQ2PHAbTCEhKG3QxcRpGrTTRLAgUqFalBdrvfJLMZEdV
         cJw1AMGxVYPCR8EmwdYRQVdwos4/VOmYR1BsWVMrBur6gq0Jq0jl4Ga371eia8xraElv
         C0Cqd/GT2UQWLgy61u+G1OWGAr9pG12SO454udmCjO+bxDbr4Fme832x6r1AkB+SVzuq
         dcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730528; x=1757335328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOY5Dw0yIneTkFl1rkItoGut8jnz7U2o1MHv+e5ti3A=;
        b=FsOkokws4FuSVkon6dhmALtLttMWHJF2KyAmZIQgURXG15nD/QAOnZCfR3jTS2L1VZ
         9oQ7WfInW1Yx9kZVARDfWDR9H1bpvglvxVHT40LMHriCM8dzTp9oMtu6RCOerVnhEz99
         8zHrnEj5RHu7TlusNOzu3B0+V+aUClcSyZx3JrzJwJKcbMWgZKPRGuNHH1bSUB0CGkHm
         g6mG1oUSEm6zAtKOpAlrGq3Inp5rYuQ1kX3G4sbXT4p7kRoskKzaKHWH6KhnlzeKSAvF
         X0B4VnRQ8JpUtaojJbcjYf8xNxuAnWiJtLDK+kYtXHzjcF7+vjfext3XxboUXD69mJk3
         p8nw==
X-Forwarded-Encrypted: i=1; AJvYcCUo4LNJg/zvRwn7YWviNTsUwTokYlHWRz902XFCe1Qr6guYwSAVx756eGyAT7UzG6ZL7Pew7GuyEvHrU72m@lists.linux.dev
X-Gm-Message-State: AOJu0YwzOFfbu7gmICraT2v7wRbJWBHBFdyEkXedRXyj4AXZnaQbMNfB
	aoIkVuHm04YT9jAdipMicum7jHpyjRbUOnQUkSxA38k5J9FNC/njE4Ye
X-Gm-Gg: ASbGncvmZChv8NRaL25HeOQ7Jgpfqtg+tbk4XfXbDq1m0m/cpM0OiTQlPJLk5q6a6lS
	e5GPoX1fK4klSQwhhpOa6ycXPEj/s2X2c5RcCkBSTXchtPcxRUkdtpEEThx53nvArk+DDcBbcNn
	suDxZ36KxbUkhjovqgOkmn2DbibHqZ02cbF1NGcOpViD49Z4tk0jH7DUnaxbfM4mocwh17fa5Zp
	ilcbqIyp7YzzHGgCMQ8paFMtD7H2TefDeFYuP8dw97ppofD6ok+AoQh21UWDeYOfsv3K1Kv6IRY
	uOQ/WpizdMrzElJ0X9ipPRjLUlMyGUTE5h3EQ9FxIxnPQTXqZkzUGi1r/X/4hKo1mvhaR8Y2p97
	NaoTZnQZl7aVPT+J+
X-Google-Smtp-Source: AGHT+IHUn0SC6xICje1UUoFTPSuAjVvF3tBb8TKjXdcRcJR9Br1XsPEsEJrd5UjL8hvq4o4e6MFvaA==
X-Received: by 2002:a17:90b:4c4a:b0:327:e781:3d37 with SMTP id 98e67ed59e1d1-327f5be1809mr8219063a91.6.1756730528211;
        Mon, 01 Sep 2025 05:42:08 -0700 (PDT)
Received: from fedora ([2400:4050:d860:9700:8e8a:52de:86af:cfe3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce0c5dsm16686640a91.21.2025.09.01.05.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:42:07 -0700 (PDT)
Date: Mon, 1 Sep 2025 21:42:00 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: audio_topology: avoid
 -Wformat-truncation
Message-ID: <aLWUmF2fDUyerjps@fedora>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-2-nogunix@gmail.com>
 <aLWEm2sQpmoNYLAC@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLWEm2sQpmoNYLAC@stanley.mountain>

Thanks for the detailed explanation. I understand your point regarding W=1 warnings and string truncation.
Based on this, I will drop the previous patch and leave the code as is.

Best regards,
Masaharu Noguchi
