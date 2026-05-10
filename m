Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29154253B42
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432857; cv=none; b=qLujkYbiF/OY+SDn7OlZkxH7GMC5kglno8e2zM2j4OTxlbIfPLmIhPAygx9w18XHOnWNRTQYIkG8D0HaxzqxqOz58qGhiBtUJdrSm6k+0LVlm3hI+9cN5xEBv8wxClXfIFNIaOcySqhNvfFgnFWL89n8M8AAdSgq/fZOUEv0JLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432857; c=relaxed/simple;
	bh=0TkiaQDCTCY1FoIXh71doV4G2A4Z9yQaHv+H2UwKgUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6UfVJRU/xcbm1Vy0lHG0L4dudygjzKCzpAt5bXmOTji5BSVRRLEL062qW/HjiIHNZbzEJUjC6KCDBBfdk3tkKRYUjh+feBzjKb1Q9mhFuOmIUE6IEdHSqrWTuIlafqJtn5s8D5eRnrEMY+BEaydum0KluQspUp53THt+xn5ZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3ztljVu; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3ztljVu"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a40502e63bso3119462e87.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778432854; x=1779037654; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0XcwMLZ/2Z3fZHXeSZCKnmGYaMss5K1mcWkWF6PnlI=;
        b=A3ztljVuzyMf98D/ccm90TzxPxqo9mAa/e1psfIYgfrmwgLsopKHzMUAYs3WzIdfEi
         BFodvoAYBKUYyRbn6W6xT9x6UTaQN4/h+PIAPpP3oIY5bSaAx36lZyaJ3wuSd/wDNF1L
         cbKno+q0T/56UVHHGxAijJiCG19uDt7Q5cN4QB7dkvtull/ZHGGohc8Wwoc5mOqhXPnV
         y8F1X2RN3A9CfiiIsJD25zYqmNPxX7CLLw0g1u6sCnN8ql2ybybUEmwdIbIJa1eKjBCB
         9l7uBrgx4oVyNpbuBQrJpMMGV3HuBm/pBoiC40WwfuUSVLVaKUvsnNATcqCi64vI1azZ
         VoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778432854; x=1779037654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0XcwMLZ/2Z3fZHXeSZCKnmGYaMss5K1mcWkWF6PnlI=;
        b=i2QqLBELoFlmwplhtLxDU6BsX29HbKqOiF43893dhbYGx1JxEwM2KemAwdNHf05T1Y
         nCLaSdac2m9GrHApBRgKhiL6x3PJwaZWBKt7EIDMgQf4Bx6AZw8Y7PnocN5Y9/bDLHye
         AALFMAXWi7BYURSBrvgESOPZtxNtlyHMJLxBOwVeChGyT0GL34XgGn6gHgllgIHVrI0x
         o/XY2FByItYz8HkOQLTeDfK0pBfbk6jTWYb6DZ6uhFu+MmKL5FoF4Xj8+wcMTalmOiWs
         taLtP7uybTfSOjIJy4bxfC96i4SPEjnaEKTG/jmXsRfrvo0/XBzZM9wHelryWYC5Tawo
         8Lvw==
X-Forwarded-Encrypted: i=1; AFNElJ96FzCZrsLpoJWWIVzFZyU/iciVrBc4k9dUbwvsio/zVCDN46o75k4FcT4Hz6AQ49gkyBg13yyE2R7fE8Q7@lists.linux.dev
X-Gm-Message-State: AOJu0YwvNsi61mOJGTcKrqKfhUfHf1TVQFnMAPShTFDGzWzpTU235hHp
	Q2OU4amvWdy7WhGEiQBz60wVXeuoLFhJ7/zKfVRBN/xEiM6CeG6iBa3v
X-Gm-Gg: Acq92OFMTEfzBfP7Yc5kgRZGhZXjDJdp3A6POWsXp6qE85i8X3nauS/x+u6Pj4thbLv
	WAW6GaED6t58BqBk3ghQHik62WhXIiP9bS2MrCCBmR4TIwlOczGrI4wKWkn+Oi42qRuxN2Tr+1+
	KhaVsYVZe1NnUpw0WgmfsjEYhL3a6AwaHTJ7st+XjzObK2Eh3awY2qkuF4WZYG/vyvVFWCWyAPI
	3sK0Gxt9C751p2cfgLVwqBa7sHApjnF27A1s4SBnOMkmQHmBB4EcG3PISYBVr5JTbOZZFrSSBLh
	xHCXM5puL9MAEeAJGmZ/9XhkG+VW7IgyU6xMglqv7uFqa6Qv0jApTKX7/fhtjZuNymdDDqfc10F
	Drv9YpOht30iV2pyMandjkQ9KTHZX0FQqDndKrxqWlqKU5Jlj7DuNYLz2CmRIMfzFZaihFoaRA1
	mdXYfPP5vvNXDAvCVPtaIAiNel
X-Received: by 2002:a05:6512:3e25:b0:5a4:74e:5f75 with SMTP id 2adb3069b0e04-5a887add952mr8233622e87.1.1778432854342;
        Sun, 10 May 2026 10:07:34 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c6f78bd7sm507558e87.74.2026.05.10.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:07:33 -0700 (PDT)
Date: Sun, 10 May 2026 20:07:30 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Fix coding style in include
 headers
Message-ID: <agC7Us4hc7wWuYZK@archlinux>
References: <20260510151735.520685-1-pramod.nexgen@gmail.com>
 <20260510151735.520685-2-pramod.nexgen@gmail.com>
 <agC58XCiXVKdR2Lv@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agC58XCiXVKdR2Lv@archlinux>

On Sun, May 10, 2026 at 08:01:37PM +0300, Nikolay Kulikov wrote:
> On Sun, May 10, 2026 at 11:17:21AM -0400, Pramod Maurya wrote:
> > Remove multiple blank lines and extern keywords from function
> > prototypes in header files as flagged by checkpatch.pl.
> 
> Please one patch for one logical change.
> 
> 
> > 
> > Files changed:
> > - rtw_wifi_regd.h: remove multiple blank lines
> > - sdio_ops_linux.h: remove multiple blank lines
> > - cmd_osdep.h: remove multiple blank lines and extern prototypes
> > - rtw_ioctl_set.h: remove multiple blank lines
> > - rtl8192c_recv.h: remove multiple blank lines
> > - rtl8723b_dm.h: remove multiple blank lines
> 
> git diff does this for you perfectly well, why repeat it?

And you haven't added cover-letter (PATCH 0/2), you can do this with:
	$ git format-patch --cover-letter ...

> 
> 
> Thanks,
> Nikolay
