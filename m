Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE00A1D1E6C
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 19:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490677; cv=none; b=W0VCtjHw6WubvNg1MMekmzv4WlfCDS/RRgjGl5VczAhOLiQdl0V1Cspr1cRSFVwm6h97KWwWotWWNdIVBVXOc4G6ykxsI3wfHq7vp8S0kYTyf7K0/sKsBopd5HNlDJltDTTAcVFlBd/9wah29KSUcQzs0ua9dBw9yuQo0Oo8Jc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490677; c=relaxed/simple;
	bh=MQtGnxAwsf1JT2gO1pk0zvmIp9n6WmA95Nf/ZTXOBuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDThA06ZrjLHuyjQhq5Te8m/zctCDkazDnzuyu2m2ppsxV2AXFP5fK35W8pdinVlX9miGZD3ltlUjkfr9hIX9HmwtIeXeWt55CljSvwlWijRFt6l/2Q5eqlUY2xIWWRI5hH6XiXKnp80BOzm6iJt5Z/2lshx9C9O+iraEbj+S8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MLh0/BXs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MLh0/BXs"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37f52925fc8so1399068f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 12:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730490674; x=1731095474; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubumAp7oHPfClW4j0mKbxq7mn8cLAu98dtVt51dy/BM=;
        b=MLh0/BXsuqzU68TftChSc3CdxGt7GqL9t8wuYOAPSDpZUjxSlEkihj1ZTskufcbQfB
         ZPGSwSyGMXicT68TPWmfsee8xHKcfyTG8K3lrLU6svXaWjmTAejC91avv57jTnYx8JfI
         cRj2Zj1Nv6vZxC6w5JYaw458CZwRfHHKyv1Wd8wcSGmuMfw+eko0ypD3OcZy7zW5hIjS
         gmd1vhUZR2dgJNqzT+yBQoc+jeVDKwb2mfRDTCgmfJQJEqOSBjsdh18JIB65L8lr9V07
         WDzaHVfLXc5V2YjRc5s/Jt2Vw1yYNO55Fr8XX7d2zUKDOPFPR7ESQJsPIVPDk8wtEn3w
         iYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490674; x=1731095474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubumAp7oHPfClW4j0mKbxq7mn8cLAu98dtVt51dy/BM=;
        b=t78+HjybNsdyKnOXyuut5rzgj+HKHoQTqTL9nXN7V6rtsh0i066Xdeq9emFKfUDvDq
         KjMSqA5nWrEVABNubvrlzMJ4txWi1obNXAlJomKm+FqBOMobaZpUG4EwfskZQ71hfkEA
         e1qLADRAKQlnhbFqIKwyEl/bLuekUeWdmVs/b70Q2BPAKD1XGskWu6/+WYr5EVI9Uypg
         kZWpNtUBSAbrrbHvHbaRlMhCPhIDouIToNExiqOh+C/pGtQ2g6UGYjcvy9T159iH/D6m
         6IP3S8jS9wtwEJv8jV3DSHL3PlVBX9wIEMHXm+3ko1AdjICNfnTVddVvgAmkHiZeQ4G7
         awpA==
X-Forwarded-Encrypted: i=1; AJvYcCWhrbCAGhpZTuYPWjmrGvkNtIgQLTmRB/yVksNVqKAqYQk42EGNcqJxpTdzpLy+D40sol2j6Kv7ulWHFLw+@lists.linux.dev
X-Gm-Message-State: AOJu0YwmjlQi9cmqunkOBBCsc69ccR1KbuVlC7fekFrk4jCyatmQVJvp
	NJLjhTu8pCMT0SO2b/J7kho6IkQ8zCRfkRcPan8Tp2qf7I6TzGLSddctrJlomJU=
X-Google-Smtp-Source: AGHT+IHPioO6oD71XBGGsELVS/jdi/1jH8Hr+T/UGbOX83OThn6zU3uR85UiBVncfIeKQAY2cBYc0Q==
X-Received: by 2002:a05:6000:a08:b0:37d:39df:8658 with SMTP id ffacd0b85a97d-381c7ac8985mr4227904f8f.58.1730490674213;
        Fri, 01 Nov 2024 12:51:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7465sm6024208f8f.53.2024.11.01.12.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 12:51:13 -0700 (PDT)
Date: Fri, 1 Nov 2024 22:51:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH 7/9] Fix Kconfig
Message-ID: <4c5d1b45-a3eb-447b-8269-8828dcdd2088@stanley.mountain>
References: <20241101174705.12682-1-dpenkler@gmail.com>
 <20241101174705.12682-8-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101174705.12682-8-dpenkler@gmail.com>

On Fri, Nov 01, 2024 at 06:47:03PM +0100, Dave Penkler wrote:
>    The NI_PCI_ISA driver also supports PCI and PCMCIA
>    Correct spelling error COMPIlE_TEST
> 
> Fixes: 2c9f5d8c6ece91ecd33350749230494d224550f1

The Fixes tag format looks like this:

Fixes: 2c9f5d8c6ece ("staging: gpib: add bus specific Kconfig dependencies")

regards,
dan carpenter


