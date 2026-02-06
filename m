Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2134328616
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770363804; cv=none; b=B1Ht9a+sBH3K5rM+mdt/Tiorx8XX491tz06Jd/0YE7DmHY3WdBwneLnQfKUDkai/cjZU0Za7GE9ltiRBHRGh9prLXzUjG6lnRzEomMx/BjRHBJm/FI6MTiwOk1UGlqNIbsvGSSiWFpfVfiB9RlUMD+Xbz0/uEHD6T0V4VxuXLCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770363804; c=relaxed/simple;
	bh=9RjpjFedtU0Ptyh6CRoBzII0vCDL6g1Rl3WR6pG8Wvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHHNYeutfhURLCtJoz/tiL0UZZcKaj2AtHSFKTiycoXYwsCyryidz0FOipiDCYXGomNPTu0AIhtvYIn00dk376RyW3UCLMpSHlHneW4/3euxTuWOruF7Gn693h4izauqtQXkHwUGpsrl/X4eTIGPJsydUTNLeRqsaXhljuArAW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QLEavhY5; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLEavhY5"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so3735345e9.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770363802; x=1770968602; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KgDuS5mG4Fz7SD1w0n25gd+R6hF8xgeHoOBsycwgKWM=;
        b=QLEavhY5+wp1LlnKXaLhYsJRQNrcTLtupbUVLUA7+bQp3RJWWEiJRp8X4M10MefcRq
         RoQA+pL+gYxABUX5fD/X4hAXRQmy0gExZzXYr0Hvb5vtbtsm5Nn/cn/b2EKxwdpynU2H
         BRFlajWxRXS1xNfcoNbScziriICPraMvKKadWJ3PV7ctNTzmpgYhK3jqEGx50jm8Ok4k
         kJ0PtzZAPUitu9j5V1Tl1jFCFfW3WHHzP9+uI+Ch0sNVqy1zqBmi2NuT5hwvdVBRljHW
         mqE3mzOmwRWm6H4pvrmPZivp0ULoQRj86VqvMYx+VainJTioAsLQaDYtrJMFf4l2w0Iq
         +zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770363802; x=1770968602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgDuS5mG4Fz7SD1w0n25gd+R6hF8xgeHoOBsycwgKWM=;
        b=WjIY9rd1OcaZ269zcHJi9sJUX5iOKOkFhKYiRiVkIZjIqJJ3FjqK8Xs0xUcmOSrXo+
         WhtLtCpAgU5eSu5/azNu/HW341mekAXv3J1I5S71uh1jdj91dLYGrWIGn9dZLsN4WQQZ
         cnpitA+0wRmtFsMRDBYMKMWwxhTWqMq+u9J9vrev7+QctG36U2UcplT3g8kTZzARtTjl
         72yhG4v38/32TiLbJQvGqx0B0WLkJMyNc/hagJKo0bpqiOVKrUjvXTLU92pkhmzzuqml
         THmGHXgcg2lTWdoUj4YKBSqiiQ7tEYodIacDIiGdRV8j+lQcEXvSGE9wvqjr2JruznZK
         hj5g==
X-Gm-Message-State: AOJu0YzHqZDAsK72MozEDlHLR96HkYLjDy6k6um28NASZZDoFpq19eYk
	3FI0BrpCPOW9KC67MCi2/fv6Hv1fxZp5MiGHqEP5wEiPfEfTwLpg6dRH/6rjt4f6HMkBTJtiSx4
	MUFPE6gc=
X-Gm-Gg: AZuq6aLczG42qYcZ3plDnToVEBoo1mDHqE5rq607pQMmFc5w2q+K48l4hxUzjnbvFfX
	a+vp63q19lSj7WT8QwoN9QbSfrJRYsWiErBFC1oAHHaft/8D57mh9CJ09HSrzThQeBZ/G19wwkm
	lKba032OCr/eQudqkHKBgnlRxXsO0/PSiKEG0W2kOqs1CxmLctVQaEAZiCjOoQYkqk6akp2nVch
	RXfVw+P8CiqM/opVJD9caPjsCYIGz13LGAC9R2brhxTfyTQ8DfN2YAh0YcFavoZTH/YhMiWm8BY
	nLLb5JSvJ3W4SkSqMT9/zaLqImwhzkSpJKr3nRleDYkivGtU+qvEgA39jnmOipjyd8Cf0Cwqrqf
	n+09P3iX4sCaK4w3XqKSazNsJiq6TG1fCT7NNGzdIW8swqqQO6w0V+lfOBXZP/5tamfElAbNjxt
	c1WRxWdNJeLrSHe8y5
X-Received: by 2002:a05:600c:5489:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-4832022918dmr24764095e9.32.1770363802205;
        Thu, 05 Feb 2026 23:43:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206b8ebbsm51176895e9.1.2026.02.05.23.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:43:21 -0800 (PST)
Date: Fri, 6 Feb 2026 10:43:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: bubupersonal@tutamail.com
Cc: Linux Staging <linux-staging@lists.linux.dev>,
	Linux Wireless <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] rtw: btcoex: clean up style and documentation
Message-ID: <aYWblhoLbSYCHkwH@stanley.mountain>
References: <OkiaM3C--F-9@tutamail.com>
 <2026020541-pectin-jujitsu-0c63@gregkh>
 <OkipX2h--N-9@tutamail.com>
 <2026020533-commotion-surfacing-e9ea@gregkh>
 <OkisUHh--F-9@tutamail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OkisUHh--F-9@tutamail.com>

On Thu, Feb 05, 2026 at 06:38:06PM +0100, bubupersonal@tutamail.com wrote:
> Here's the correct patch.

Nope.  That's not a patch.

regards,
dan carpenter

