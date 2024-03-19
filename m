Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0302080BF5
	for <linux-staging@lists.linux.dev>; Tue, 19 Mar 2024 06:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710829997; cv=none; b=uU9Vk8qhGhm2ftfU5W3wpnOMKiMEWjAexK6RRKidRuQLVmGvMZwPJ0Isrz152VJde0gl1I3fV/IYmEV3L4HJRZgS+qb3Bpp01Mwf7l13dJdL9YTsroNau61SVzojOL9qc0stwwUQSln0WDmV7qGpvSQtiOiK1ZKckZXYp0RBPMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710829997; c=relaxed/simple;
	bh=emvB+UPk4wGVsjn2XtVyzPHEDiFnOm03YX66S20HkhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojE8qP444gS5IiWrq5+/2IZocHNSeuyoiepZfpN91mAGmnC5pMEZ07zYag6eVRzOQwEVVNSNc/Pk5qUc3oQ00cyPhSUOBCwxowhG6eX4HhYGu3VUWx0Z3DteOBT47AojQTVldFvlA/vaa2P7Tfy2j43NH0QSL1R+MdLrZCM6PmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkDjG/dI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkDjG/dI"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513d717269fso5392639e87.0
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710829993; x=1711434793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQLjuETvXpykXhqUOpejSGf3kPj5baBzqZF6hMzvPVE=;
        b=jkDjG/dIo0IC9te+hb1gtyG+wOugCHuUP/wZJ8cuESLhe1ikDHOaWvQepJVR+//390
         c6iaJHFDujm0GY/KId3hurW82GIlqndpMVB6h+qHEAeVOTlwbzMQHGsvlH8hnwGbtJ06
         ZfHopUYH0/BArKz87U3NJeIfJceioMCCcwIF9r1fzOfcUVounRRe2jNrHNtbwtw6i07B
         696vq5C8P7y/h7truP0eP6uszGcZIDqxYSM9iVhVrKlv3023DsTBpH8EaHeM4wHGn2R0
         Obgj5LwplURN/PpPWt+6iCL5UvAF5GabvUgM8zCH37QxF8S1QtWXRQK4nqUwVdNlnqSk
         XrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710829993; x=1711434793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQLjuETvXpykXhqUOpejSGf3kPj5baBzqZF6hMzvPVE=;
        b=sKwIb/+5fHuJjwJkOzw6vTcMMCekEL39XpPlcNmJpLyYkOtNIGeUV6L2XJ7caAVbkW
         Wfw8qcrZZvGnouyHPUhUze7JD83dDlKg1HNhsoSEh0nVx9ItRAFBaBN0LYT5gC01SNWJ
         qQGZH/bS38pQIK73t8sz1Tubxi8VSG1WZtzAh/lWc3gWaQst1B3FRsA5Kk/0wby09/Y9
         G1DzqLPNyou+Rh33olsTMZAMRNCwkXiy5nn0xPF79n1n+Bo6s5CjzqphILsLqoTs18Jz
         e1HAv5Z3Zp6uU87qszY6ApAMSV0T2mOlqgK/95vnMZ9r7IGIg7Ow4ZIoWT18qKzJ24kR
         dtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWZUdr941k2sbIBhFJz9USxibziaHkfwnXWoqUeDC9qb6Hr+WNFaTARFRPAtwjh/5qSQUEZBHlZTlB1s2nnW+D/ov6oAFUSVksUyLd2A==
X-Gm-Message-State: AOJu0Yy90qw5SK+vNmN3MKCN9KxS+WrOdKHzUV+K8sbv3tSlh0ByCPPF
	WO/UCiEMLQCY/WVjmoyFgGg165oKS4JFUBTZx7TxZVtsT+IlhChvXUNDRVyi4A8=
X-Google-Smtp-Source: AGHT+IEkLz+CrD7kd9e1OQIXrqk34kVS2kjJ6pk4f2Nu6yVG5PdTdGqBmLTHCPeZZsJythZHkYBwPA==
X-Received: by 2002:ac2:4da6:0:b0:511:674d:88c5 with SMTP id h6-20020ac24da6000000b00511674d88c5mr9820073lfe.13.1710829993013;
        Mon, 18 Mar 2024 23:33:13 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id o23-20020a05600c511700b00413fea18735sm14220565wms.13.2024.03.18.23.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 23:33:12 -0700 (PDT)
Date: Tue, 19 Mar 2024 09:33:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8712: Rename blnPending to bln_pending
Message-ID: <865b37f4-8139-4072-a320-855bfc3121f4@moroto.mountain>
References: <Zfiz7YFKAqAOGsu5@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zfiz7YFKAqAOGsu5@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Tue, Mar 19, 2024 at 03:06:45AM +0530, Ayush Tiwari wrote:
> Rename blnPending to bln_pending in r8712_cmd_thread() to address
> checkpatch warning "Avoid Camelcase" and conform to the kernel coding
> style.
> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> ---

What does bln_ mean?  I suspect that b means byte and we don't allow
that sort of naming scheme.  But I don't know what ln means.  Also the
type should be bool and we change 1/0 to true/false.

regards,
dan carpenter

