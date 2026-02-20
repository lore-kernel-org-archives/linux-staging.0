Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1954D3346B4
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771574637; cv=none; b=YRETfzd2UwbUiq7sVOFuLwe0kr/Y77kGjVzRoGFywkBbz4inBnJhtN0y9CoARX4PqILXdjNKtFzT5fDOgztgD01yKETXg2wyixXvYHe6GLHVpmFpW8nakdrKub39vApcuhZkttoJVhV5Hc6IxCanrsBSeTrtLab7Q4baRi1DB2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771574637; c=relaxed/simple;
	bh=WCpY8DamAm/k+L3M/EaCHKxmn5LryL5yTFHZ4s/JLXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwZ6s63//irxBHmoMg+u4cBlfjT8gczB0D+MWJEZpn6q0pYplyZgwbx2tKqTvN/gk1LV4Xw5MfEvvRIEfMqMZsvY/cZRr+K+/Oid06RD3PvzpW8Sp6xtPCL8TYRQ2zh1aqQfDCHN6MNsmCY2+5E6bo2w9nGAJeVNe8ob2H/4dtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vnw7mWCd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vnw7mWCd"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436e8758b91so1324500f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 00:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771574634; x=1772179434; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1eHENbQgxiG8g4Iw6sBHR/5X6KByktzSsOmA3jGT73U=;
        b=Vnw7mWCdu79003NNQ1X7ngJwE3kVTTNq1WlXd0LUr3WUA6cKj79+RpkaRWCjXBB5FN
         PuxUezx9ki/jbYYhAMx9C5x0S2Z3FLhVsvOjcaXJdD3NNv/0EC4keescmGKJlcb2GRGh
         Qgt2lahwSv7yZAUO1sjXi7wpuOg1ETgVCLFVDQxDXB0TTg21eTMu6BEcWiheJy3u34S7
         EEbq5emX8aVXxHS94i1t1iCO6RjyZvNK5ev422H4wFBynEY6pLXsoYuO++duow3wr04V
         us2IAh5MAvic7WhTsQ2QiGNGmL4FsPuA8waFya99ORLWdYth/IqmdGAMXFQ1XTESORec
         jJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771574634; x=1772179434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eHENbQgxiG8g4Iw6sBHR/5X6KByktzSsOmA3jGT73U=;
        b=VDAziPLaYRAnzHx1YTBEKVhhz6NsH10YfZsizq4aV39r8tN1iIhci/DSbiBU0tVfqY
         RkIZtEypuHYXf8kxkaptUYzEUrDOedz6fRWzA0Nj4z1IUZ6e3dOadwONM93uVZ5ruX14
         fUALXN2FKDvr0l4zoctMo9smfH7JeuGyuXWT5bBez4PZglyXdCorAckgLUKWYAppmOUZ
         YXVdLak4bn2vBOywJOdKlWPDRkYTinR+7oEjm+vKYU8Vi6dXJhNlMgO6eDoxnYVnXb9X
         wPLoxvIsU1Ob87HzAcy+q6frKFwrQC4UU4zEWG9+HpwNjToiHRo3L+pI0rYW9AGdx6oo
         u5rA==
X-Gm-Message-State: AOJu0Yzn03OQD5SqxxZpUHGYBmnfKcDMXXgIhC8pVkTYddboNvhqR9iD
	JnxPN8C2aHR2uzyv0GFaxF4FJSe0qqcZIdlDUSt9RDFDvl6MwcbdPMBr3svQN8WHSK/G+LqsjX9
	19J4q
X-Gm-Gg: AZuq6aJAPuF3j8isxxSrnTnzVMOD76pUSwA3k96IQmIj+q8OJO7z9QiyrGH73tUEno1
	nhC6BbKTU273Lm1yZAFPcQY08C47HICzkDCCUYo5AC1xUbnj5kmrvLbretQZLQUESm/nbdVVP6B
	aP9MchqMGrnJCNhO1GQXm02qsudlk0XRJe3ehs/dUKUJ3+Zlw+5mX8afdy4AB1OVBPhKfU8+ZU7
	OT3hDCL8gTQHp4KzBc9bHmJ+fMyxN04W5v5+eHJcuY7upMrzgAJfMvGV8ub1Z5JvqK8JaaYrmji
	vExCAcbRanQWWxuEAasrAzlZJd+pWrpYreiFE0PiyVq7DBlh3axUN//9MwGjddNQshkQvycARAv
	C6QecF6qQS7reI/UCNXKFeNW6WhWyWE82i7hP3GBU6VWh0BY8W/x/XwOJAn1Ke+lhCDhl+ZDIGI
	62I7xHiSuDuOqjycg2uwmhcga9P01j
X-Received: by 2002:a05:6000:438a:b0:437:6aca:d1cc with SMTP id ffacd0b85a97d-4379db372f1mr36014949f8f.23.1771574634151;
        Fri, 20 Feb 2026 00:03:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8075sm51473944f8f.29.2026.02.20.00.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:03:53 -0800 (PST)
Date: Fri, 20 Feb 2026 11:03:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Cc: linux-staging@lists.linux.dev, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] staging: greybus: audio: fix NULL dereference in
 gb_audio_manager_get_module()
Message-ID: <aZgVZj2WkSNaFjcp@stanley.mountain>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
 <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>

On Fri, Feb 20, 2026 at 05:44:19AM +0000, Hardik Phalet wrote:
> Empty Message

> From 3b496a0daa8cbbbe50a7a09e6daf7bb4d8e6e9e5 Mon Sep 17 00:00:00 2001
> From: Hardik Phalet <hardik.phalet@pm.me>
> Date: Fri, 20 Feb 2026 10:41:49 +0530
> Subject: [PATCH v1 1/2] staging: greybus: audio: fix NULL dereference in
>  gb_audio_manager_get_module()
> 
> gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
> can return NULL when the requested id does not exist. The returned
> pointer is dereferenced unconditionally via kobject_get(), leading to a
> NULL pointer dereference.
> 
> Only take a kobject reference when the module is found.
> 
> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
> ---
>  drivers/staging/greybus/audio_manager.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
> index 27ca5f796c5f..1da8804e61ca 100644
> --- a/drivers/staging/greybus/audio_manager.c
> +++ b/drivers/staging/greybus/audio_manager.c
> @@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_module(int id)

I don't think the gb_audio_manager_get_module() function is ever called.

Otherwise probably this would need a Fixes tag.

regards,
dan carpenter

