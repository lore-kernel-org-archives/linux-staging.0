Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543B24C08A
	for <linux-staging@lists.linux.dev>; Thu,  3 Apr 2025 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683795; cv=none; b=R44Gnr6HyRxT9vvx2jrYUChQ0sBnF0+JxKhJhKH1YxQPeGeFmzhzclHqkJ0vw/o2UcVaq6NoJzCU7x9PXOBI1zo37XA4+a5YsIymm0d7OIB+O0mhOj6H5Xb1PNM4T9BV5t5ftdcbZFgD45vSH+GCfPGyL/ebYjDfp1gtpDaTlVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683795; c=relaxed/simple;
	bh=EC+jRXJYLFQfR1XxsI3t01FqkNMfotqtYy85kAcqX9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAC4Mef9G9hI+X9HdsZ0nbA+n+gQzir/+gg0GCj4SH6BjD24vlSGAnp7Bqfk4apl7pBiPVptqerT9GheX2EBUGCJI5OZLBOEVUi4gZjR9zEw7RI/UaVV+u+QGBt51rG7qgOZfKpzt5/E9KQNx3JwgntMnPvDn0b/iYaX1mUOFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hrnL+sV1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hrnL+sV1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0782d787so5401495e9.0
        for <linux-staging@lists.linux.dev>; Thu, 03 Apr 2025 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743683791; x=1744288591; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C+kjsh0yi0FCSevxaKtD2+LbGqyeUYLAkNUlbwLow8o=;
        b=hrnL+sV1wAdP/QO2QD+26FwOTyHnCgW/5v0A27SeCfIC+le/t/c5RNELQtwmHvnemk
         F65YHIVe30l+u4ZUshTkvyELEgVj17BYZLyD35HYt7bbXez+G21eZak9IH9A35fon+I4
         JJladEbmIDhEFIbvpLfGS/LRf47FIGu4K5ae0Y9xPAqRLQmAVgWKxIo8MFnPCIywvRbA
         FHIkCvBhttspFf479NnL7jx/fyGAis6WQfCoJWiX/E+z2pmkM8LDRDzNd6+PuyDZQN1U
         P5ymyPPjelpJRowwWzhObuBgEe0Le7Q8KbsCNTJoMQRCYKGcxs3QzvHambVxKTDJN+Sb
         JBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743683791; x=1744288591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+kjsh0yi0FCSevxaKtD2+LbGqyeUYLAkNUlbwLow8o=;
        b=rb1Z3tPP5MWkFQe62PcUQmc3rYOi2Fs7zMlQECpAR2AU0bK87A1Ae+cPUihzqIPlo1
         8SwEBRUIRYxSVPZAWIe1gCnaypwQeBRAhFBCgEhfrS6q7Fnq3uE39PtcyAb3D1pXJJAq
         TgLxS2eHHtxuIIuh+BfSrjJK30y9su96gUQ32R2pLxwTZ6tHynBUrbDAOwTm2F/mTwh4
         4AM4Y1p7ei/pPBkahZcdvymDQXUEVB5sFWODaI8wXkcwl5uB+I1ELzdJgUDQi9MkmtXV
         NVKvjoDK1koakgjxHJnIYCQhXPi8b3TC9WdWiJmlTz9uAPmnXazRQ1T/B5B0gXHSbRMI
         pvog==
X-Forwarded-Encrypted: i=1; AJvYcCWDBTABB3Aym1AlOJqlA/3oTAeF9/l/F5gbbwlCoxe8M5awrLgCO/zpaHOSf+kL9jUrJ4A38D3V3hZPD4M8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/uUFqGbWQwkCy0W6HRXGBWySFBKeFkfuEKmrZEcesojjYklyg
	PW+IbzFluuPwqfYko/G7gV8dTMQBsNrR3TWkqPKv7oDW0x5zr7DzYZkte0eiz+U=
X-Gm-Gg: ASbGnctnRZiyMnzW99GC2LyCKwRXwM5nDN2tcXj43Eav6YOqJyOsnJ0mvWwQcepGscS
	NO2LMA2HdPpw7OveQ6E26Vz2IWb/OvWYXyCCjXITjoPxQePvGWG4vDGEoSO4P/0ZCSSeUDflUPm
	bQBrBN7EfaCvJWYPCJvEKUy5JtB0wxHzNBF0x30ii+fSJCdD7ILZFwqr5DZGIivNoptVHE0rxmI
	3gQbZdRa7ZOrLRc/0Ec0ReN6docZ+IPpx4zv2JD220t3HvIEsfa9+Sm/ybuQyDIvW9ouWii/39T
	QV4TCPUbHDuaAm56WGBv5MK0Adg6h5e9un3okPxyP+Xydu5gqQ==
X-Google-Smtp-Source: AGHT+IEm78dzW009E77mGS/XMpvwRtJc+F+zhJbHZ/MmX0Htx6azwvDUIts46v7UeKdoeXtVIBNeSA==
X-Received: by 2002:a05:600c:6dca:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-43dfa59a802mr128749085e9.33.1743683791239;
        Thu, 03 Apr 2025 05:36:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec34af0e6sm17579015e9.16.2025.04.03.05.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:36:30 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:36:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>, linux-media@vger.kernel.org,
	andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: Fix indentation to use tabs instead
 of spaces
Message-ID: <Z-6Ay7T3n1vXfAO9@stanley.mountain>
References: <20250402135001.12475-1-gshahrouzi@gmail.com>
 <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>

On Wed, Apr 02, 2025 at 05:36:31PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 2, 2025 at 4:50 PM Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
> >
> > Replace spaces with tab to comply with kernel coding style.
> 
> Still 'tab'. please, capitalize it to be 'TAB'.
> 
> But wait a bit, the driver maintainer might do that for you whilst applying.

It's not an acronym so it shouldn't be capitalized.  It should be either
"a tab" or "tabs".

regards,
dan carpenter

