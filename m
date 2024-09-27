Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E481113699B
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727451966; cv=none; b=jD2Uz/ehOFTS7wsmOGc2SY87/nRu42B3/xMlwYiLvv9ymr+rORTZJl44gx5GXQzWtZA/LyWbKePa2Ahlge0oFtHebKIloQcqlKRnigB38Hx8zUx44dO/ECc819NQRsVBpFErdo+FIcDF5NHmAykob3ZH3sOYoKUx/3VR16PRKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727451966; c=relaxed/simple;
	bh=AgyJyFGOgZH64q64HKY97dB03AkZI1CBZpgFYlnxgz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBi1pQM8xvMEXDHLYXOT9gdPSZAh6syKnsFjcgpYH0q3j5pkrvGIBLchPUHMeTmscZYfIoukUcC1qj80oS8fKkVFV0Mi46xoIJ7LCbqrB5ewScQNm4g6UEbQVhWnkMPwe2pdxvHkoyRQ1lcMXLB2IB3UsBBOk6EbtngdbacCEI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBSshxGa; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBSshxGa"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c4146c7b28so2589176a12.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727451963; x=1728056763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k/WxW8gZW6eJDpQYWMQr0oHbrmDPE0iNGmBYL31OUvU=;
        b=gBSshxGaJPRiGXLpwxX/5iLTAORz1EwBdDUic1eKkPgS5ySQku97yiUV8tV9NsETdY
         h43DHGphVlUg8s9QfrMkjzpN9dY4mH24b6u5ocU3npX2+OnByAEjXpsxGb3+c11BQovv
         QNaUFSh82T67vwS1cxbqWHJBHkwAeSteJ1LesUkdX7gykmq+mH+LuXJ1PzjftYRxEy44
         /Hhp0OGZwVGjvwhXmtK2YoHM/ul2tQ8v26Rt4XOIuPzpgtHoXML3KB/rL0KyHLy4XTS0
         k1OOMBPyEH8AKZxAaIvsDoD4x3nZsCQ43jdnl+SV0E70s6wBkN3qNe4wlm1tm/woaHFr
         VEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727451963; x=1728056763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/WxW8gZW6eJDpQYWMQr0oHbrmDPE0iNGmBYL31OUvU=;
        b=WqxLBqCl4eqNoYIJQ9JPWNkQbq0KdgdeA5kpDjErZM5t3h8sjSSvyxS+gV3T7NCgH/
         vJg400MULAvXecu4hffe2v/lWg1LA9PcoyjXpAjIPufY+o30SQWF3uREFtQcais6KxBc
         36xjtS7+lRMS+5kCKWnEvyl57WozPmuE34mURhwT4vAEDBAGd6+vDOks6lIGztrNkrkg
         X24n5s5QqlPX6+SJwl1C5L9XBxajAwG7gKlKUO8xWMPUYTtVQGmpQUTaXh59jMDMQGox
         JJU9d3fwyt0vXHu6Pri5De97LPNt09Ji70L5GM00xklhC696dEVQacJYkuF1vQMFhxTQ
         +F3A==
X-Forwarded-Encrypted: i=1; AJvYcCXC/8ZNCYEObM+GoeclJC0oHNd1rmRWNbqi0sdD1XZ1p7g0QfXcFtzWUw0uDystoYBDXVqYDN20VWtGPCqH@lists.linux.dev
X-Gm-Message-State: AOJu0YyOt80Z+ga5QzZHXnGPi4i0SItCL4XCHqisMclmeLmU43Dhlie+
	fG3+F81RDczfImgIvbyVvUhW9SW5uquMS+MWKvv49t1zNozBDAZbwwzLsNDMnAM=
X-Google-Smtp-Source: AGHT+IFS8zAPgdbQYxtGlbbfShLRGKJ+Y1jDmj/muEsQvezrcrzsLgiLNr3FkrTisB6yxmTr8mVPyw==
X-Received: by 2002:a5d:67ca:0:b0:374:c23a:2ce8 with SMTP id ffacd0b85a97d-37cd5b11da6mr2512494f8f.52.1727451963205;
        Fri, 27 Sep 2024 08:46:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dec169sm30953325e9.21.2024.09.27.08.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 08:46:02 -0700 (PDT)
Date: Fri, 27 Sep 2024 18:45:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xingquan Liu <b1n@b1n.io>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fix unnecessary parentheses warnings
Message-ID: <75267b21-f800-41a5-8a7a-ddbf0062ffcd@stanley.mountain>
References: <20240927151637.82772-1-b1n@b1n.io>
 <9bf11c06-85c7-4ef0-ba26-e4780a28f23c@stanley.mountain>
 <D4H6EYM973NS.13D8BVWVTVO2D@b1n.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D4H6EYM973NS.13D8BVWVTVO2D@b1n.io>

On Fri, Sep 27, 2024 at 03:36:42PM +0000, Xingquan Liu wrote:
> On Fri Sep 27, 2024 at 11:26 PM CST, Dan Carpenter wrote:
> > On Fri, Sep 27, 2024 at 11:16:36PM +0800, Xingquan Liu wrote:
> > > Fix all unnecessary parentheses warnings in checkpath.
> > >
> > > Signed-off-by: Xingquan Liu <b1n@b1n.io>
> > > ---
> > > I ran clang-format additionally because I noticed the Linux community
> > > recommends submitting code formatting patches along with other patches.
> > 
> > Probably avoid running clang-format.  If we wanted to do that, we could have
> > done it already.
> 
> Ok.
> 
> > >
> > > I'm not sure if there are any issues with this.
> > 
> > This patch does way too many things at once.  This is a long way away from being
> > something we would even look at.
> 
> I wanna fix all unnecessary parentheses warnings in one patch, is it ok?

Greg doesn't agree with checkpatch about unnecessary parentheses.  If the code
looks like this:

	if ((a == b) || (b == c)) {

then just ignore checkpatch.  However if the code looks like:

	p = &(foo);

Then change it to:

	p = &foo;

This sort of change would need to be split up by driver instead of all of
driver/staging.  So it would be a series of patches.  You don't need to split
it up by file.  Split it by driver.

regards,
dan carpenter

