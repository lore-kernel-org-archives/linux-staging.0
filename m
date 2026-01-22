Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E73921E9
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095922; cv=none; b=oz64iKs6u1dTfxlvnCbjXTXFWIiAsCQt/e7vV0G232GS1eDblh1uASbg9qkO3RU7H8aeUqjXjw8k3UcEgxf9bd90gAFPnRaF/5CfKpi0hh+nNW6Ple1Zu3EyO14GZ7Zxvl0riy2ggyiTD/ntIbwV+dr2k+VdayrQc9QRxOmzTL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095922; c=relaxed/simple;
	bh=3OkE4HhnJQtBO7tgZ4igiMABadrGvCo8beeOHA1xdQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5rRVIT7Fxb6vlqNm30rDpm50dLD7FwKzgTSAfdlWBE8iZdQ9KPWMuq1f5QtAWxw4/X2b9d9Vkh1YCuphPEvr5zt64c2tM+AM6giY3iD1NlLa6NwNjuW5YamLWdGYWpyfXrJDsQKrQlVtxJtVCwPD9LHniTGeE86Rq9a0Cv0XOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t/oRMQ4j; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t/oRMQ4j"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d2670932so1056854f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 07:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769095917; x=1769700717; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4bkWjHpOvcH5gz/C25tqPbs4mKVsSfHP43ZInYU7sBc=;
        b=t/oRMQ4jKklNhSPufBeEw3sJ8LpFIpNHZs6ugAyF72cBFYNe9sG155KTbz/xBqChkA
         S+UAbRH2rRQcVRTAbmJpQD3uLDGj0zYNOY72ILtLWuYKbcj/ubGvzDelm587ar5m3GWs
         81EClhOVCVXLnXvUCt5AL/AMLRrWzwlRg5gRgg8do97b7xGu2EMiTwIqZh4GmMmvc+7m
         Fvxe/uNTwIyiQGWz5Crtt+mSE8EucAMFSNx8BMlkBnVSDUpUD2IcSvKscQSXK1nYwlz6
         VBPIW9+o/UXz9p5TcxY7wFUGrmTBEJFK6eOGb7MVNb2ArOmzW17ckfPeLQMhuTNm5MY7
         1bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095917; x=1769700717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4bkWjHpOvcH5gz/C25tqPbs4mKVsSfHP43ZInYU7sBc=;
        b=dCa+byBECnkFJ31cqGFO96uykUDbv0txqUmyc1XsRAFhXn93Ptv54X4n+YcUF6JOU1
         dye3dFLnXz/fV/6GJb7tSs53RM8HxK7jX2bSXGTW8vCppHRzDBflJ8/2tgTxoKWIX3z5
         6eNn6UhqeALhpSiSUXVQeLiuC17QjlmKwNgOx1RKjK6wO6rQXNYfg1CnyZc7iHFrqo+l
         SgsOjpcSSRHpzGtdKLZGqE1bJb8DbE04+bxCKG19aFAEOLSLHVlNrfMwFzHRyga9ImH7
         v0jncd0nqb5GMizweYQyG73f/sS6ggKtf8bfUQbWmZrsr95B9J/tgFpaY4wEzsndLhBQ
         MlOg==
X-Forwarded-Encrypted: i=1; AJvYcCV5JlQdxz7CiXZw6ddo8ruWfHaYJ+3VlqNqXxgy45nYnZ4uopxwtVX3McOKKkPWmaalWTuWZl78nLjekboj@lists.linux.dev
X-Gm-Message-State: AOJu0YznL9gk9fsi4RvuwiDJ8dOgEPL4Cof1Q6bnJsuCjZAqw4UI2O3+
	OHHFDEmyO6dnpzzPjDo8eVDHA+u4G4p1xpJAd4NcvZCGZ4sLbw+h0oEP5jPFYLxdabaPeV5p2I9
	SohnCICtpUw==
X-Gm-Gg: AZuq6aKa85AMaI5T0cMh4F438hifq/2voKhr8INbFul0v6J2ZrVFhv3CrlCtHxvbz00
	cPzJi6bi92ATax62k4ckeb+uNq0dU81X7XDe7PNiyn4fZl1JOn7m/nub94EswhOOa3e2DU1+SKF
	4A4CHc4TIDDWeT2/waoFpGxcGkhQ3G6JZU2S83CajDkbo6FXhkPWMrX6eoIamLxdDqzrRCOv17g
	VWqchbuARJx7gfdaSa92EpQpB9yxS1WPdmONnZLfjMiun5SRp2vOlszqpDHw5qm7URGdj/8E3Ln
	m+GTMOO4ImuaSbCeC+KVOQwVtIoLHGLm+pY9mWMLziZ+tmmSrpDeXdafa3YmR8Yw+RDCUOYqFS0
	aPGR5jo7dOTfW9xGYkQvJ9nbp8o7J5eLRI6naQ9BIAwOnDvkkCgts4xeIyHbdtvh98Pn39VzVGY
	E3hUyFJiQAlHrEETSx
X-Received: by 2002:a05:6000:4382:b0:435:abbb:fa77 with SMTP id ffacd0b85a97d-435abbbfb7emr3910335f8f.20.1769095917136;
        Thu, 22 Jan 2026 07:31:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356999824csm44923679f8f.39.2026.01.22.07.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:31:56 -0800 (PST)
Date: Thu, 22 Jan 2026 18:31:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com, zxcv2569763104@gmail.com,
	milospuric856@gmail.com, karanja99erick@gmail.com,
	weibu@redadmin.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] staging: rtl8723bs: change return type of
 _rtw_pktfile_read to int
Message-ID: <aXJC6Veo9eAzqclx@stanley.mountain>
References: <aXIkvw2bVfQwpqWF@JMW-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXIkvw2bVfQwpqWF@JMW-Ubuntu>

On Thu, Jan 22, 2026 at 10:23:11PM +0900, Minu Jin wrote:
> Hi Dan,
> 
> Thanks for the feedback.
> I'll drop the type-change patch and reorganize the series
> into two patches for v6 as you suggested.
> 
> Regarding the return type,
> I’ve audited the call sites including set_qos(), update_attrib(),
> and rtw_xmitframe_coalesce(), along with their callers rtw_xmit() and xmit_frames().

The issue is the ordering of the patches.  You introduced a negative
return and then fixed up the callers later.  There was only one
file which used the return but it treated the negative error code
like a byte count.

You can't break stuff and then fix it later in the series because
it break git bisect.

regards,
dan carpenter

