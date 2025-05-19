Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543A267B9F
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657163; cv=pass; b=PlgCcfnXMyj0hOJqWlczkCnBfzrZnn5eO42UF6lf7UyUBVFZ/rg2l+cwBW+aerGX/QJAU5YhBf1EhdMUScfo3hYsbuldsyT0lfISUbDLt2I5ZkBl+bJHLVDcokoDT1KWnANPnPe5nIroUOTAzP9P4zoQptPyWIPexLzjJZhPo8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657163; c=relaxed/simple;
	bh=CEHYf1T11klF91HVfdAG+iLguAhg1a2dJ6rbhpXk8Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxQANZYJGo0qp8v1oO209qYkAs0auEtmlgvIJsMkQXVlXgWm8jebgp/ndbf8QJS2PxkRewKSBiZDws61H0Ej8bMiG+ExFqqj0owdcOd2eWb3Z1qi/8wxTVMYouy3d1XHuXiPT07ErppJVnInqu8fBhXLSfnxO15RhIOfVf2jtOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=uNJpjB3c; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="uNJpjB3c"
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4b1GvP5xtDz49Py8;
	Mon, 19 May 2025 15:19:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1747657154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lKyQXvgWdSqT9FQ6fxgOxXDjc0oOU4e+wSCd1qtuo4=;
	b=uNJpjB3c7PFDaaZMP0IsQ9xx+ocIFcTTSefSEHAiPSZ5jifjH7UXCnPZ3+GvTzuvr4z/2g
	GGdvGYBWtOaWUQ3gWgovgEKBWR9I/FrQ/kAzhKCHtussfbVz0mBKdJEmMf5ZAU+pgosDtI
	A4iIsTCMRnMGrGf3IbW4VgzEPMbDEEXGZHoqnNtyR9kJ1Na/Qvvu4JaFKKBrJF3DEtj+9B
	IiyGzytnvEiw9Myp5dnzjniyyXj26LRO1KL0qRbKW0ZrZ+8FLgCn6KMRkBe7J5GyFf+dhW
	KLFPFPafQJMb7/l2uE89fobxqewpIN1EytyvdUpW1tQDYNRT3o13TnIkMi2C9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1747657154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lKyQXvgWdSqT9FQ6fxgOxXDjc0oOU4e+wSCd1qtuo4=;
	b=pJA/dzBaJ0/zyMwbZosM2pqVzdCgT4UdHqp9o2UxqFBXgziuAAbBhwY5wzox7CYcXuwhzO
	bsuOdH/iOSrzNxosCOdZsx02s7Pg3orowY+ENRKwjiy8tbNuDdO3FFvJl+XfBrqKbP/l2C
	rCt4QRiQ8Ao5yhi24sylZpCVzEu1jL8KXARG2EdeVHs1HJV4/FgAsG0mr2JPcJjmvUZir3
	J/kDvxsFcgFWREpLIAIPgy8f/0eFmxo0ZR6D8ijQp2lAcee2qIyQmpU9CUGiHerWgKc5Cg
	iP7vrdHfIiFEWVhvcrV+A1j9QLtuoJX5o59iDXJEWKguejofhsavk5L5RcVezA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1747657154; a=rsa-sha256;
	cv=none;
	b=Bx4oWCnbHcfaDA6ddFfzWgEpzTnT12bsTFrvmLLOBc0g1WQXAQQhC7vck/ocEBz4GW2v9A
	cq99QvPAyJaEaUclCtiLrdjfdvBRruUdqTEGLZNddyjCqHdbmbYwPnESQz0FIhjZh1vIk1
	/hqDiGMXKiY/N2iUdoT6v29mF1YHghlVb3P3iyRfsRr2yNKiXLvL3yXhUHJTXT5tWxsWyY
	3d3yxUUc2Hrf13DgbwOcQN8vq8jaSnA577BX6nxrDBnfeWG+Hz2tuJytsqRHex3V4NceVM
	sj90sBvBdSD1IZRMQltiKl3K/AOYmN2sOVfG4UiMJ4mvlxEX2n0S6oWQOrSytQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3FB0A634C93;
	Mon, 19 May 2025 15:19:13 +0300 (EEST)
Date: Mon, 19 May 2025 12:19:13 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 23/23] media: Move gc0310 sensor drivers to
 drivers/media/i2c/
Message-ID: <aCshwZqgTvmyzVzf@valkosipuli.retiisi.eu>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-24-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-24-hdegoede@redhat.com>

Hi Hans,

Thanks for the set.

On Sat, May 17, 2025 at 01:41:06PM +0200, Hans de Goede wrote:
> The atomisp gc0310 sensor driver has now been fully converted to
> a standard v4l2 sensor driver. Move it to drivers/media/i2c/
> to reflect this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  MAINTAINERS                                            |  6 ++++++
>  drivers/media/i2c/Kconfig                              | 10 ++++++++++
>  drivers/media/i2c/Makefile                             |  1 +
>  .../i2c/atomisp-gc0310.c => media/i2c/gc0310.c}        |  0

Looks good to me, with comments addressed. As this is a staging driver
before the last patch, I don't think the order of the patches matters that
much. As you'll be sending v2, could you also drop the debug print in
gc0310_remove() while at it?

-- 
Regards,

Sakari Ailus
