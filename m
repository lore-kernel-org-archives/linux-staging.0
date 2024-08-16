Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4736D84FA0
	for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813486; cv=none; b=Ylo2yU8jyMbrBBdHOyczckEQwneB+GRZXm79b4m1ASgNx+5tIUZeNdGn+JO/R5NV+LKjv+kYPWfCFhSH/rrEHCOe6xagj37HU2J8VT4vgSS3oznav1qDiFyNOpxkDC5CNZvpCfEYwP8rKR0RS8ixmoTrHWwlkDyJ0EJpUuKbP5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813486; c=relaxed/simple;
	bh=xCA+fzmmUO/Z2zZ9By4jXpGmtLk1cHqcR8WLtleZB8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffNvtens9S5xda1941/My4L2Uj1mhmX3yTZO63Vn9hJdhi7sPz9vLi0mAW9GfrAdst1FA1qsI8ksrO4WI9w6ez3MokjRxbAisWeEA98OZckQhGO04cieliVmYtzkzrLBwNmt4fSS8hdCe/uBn593KSdS8n79sOMCZ8HkWHxCdug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jB3qbFvz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jB3qbFvz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so15455115e9.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723813483; x=1724418283; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LwH+A7WJGbb7oRUSLGU41BUJqJ7C+LPqpHnCCWzrpI8=;
        b=jB3qbFvz6YSs5mVMtgDdcXm7vvaJaHfQUYOvobO9BvcSaIuV7Y9LAttRfrWvBg04Q/
         XRM4RxdNqwUb5mNNelIzZ8FlNKVtuA4QkrTHTFKwv40+dJLSlL+70ZH/Lx0NTN1d5UhV
         NU8rqCqUNh6HtegmtVdIg0vw14Gu92Fd6S1Qn4Dmm9VcHycOLOfyyCKnGedy9xs92VO0
         gFliaYgnBn4T//+7OmpX235XbhmxzKNu4cbnsgXETFo1Edv4SrZR+h7/b2Ba/fwMM/Uk
         3Qj0191VO+qcMvFAMEwWeo2LCsbKeCI/MzmmYzu7XJ8PdNIU3xozHVenAaf5vY5YTWiO
         GWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723813483; x=1724418283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwH+A7WJGbb7oRUSLGU41BUJqJ7C+LPqpHnCCWzrpI8=;
        b=S0EOOcHpA1BSg22GgmuAHQO6FuQ5sC/zshztMrVdPgq0Nos4l89OHV4KMfHtvS+ANL
         JbtxMVw5w6CaJz6q5m41dgGW7zClXHJ4Q+edMdImXDl2TBOCL2u64GFv6je2L8JcsFzf
         2pUdyLcwC/0CDMhOmdesLeAGY2m57TrbRZM5yFKkUA6hlR0GECKVtBGElr2J3gIGqa4r
         /O9OWZ0umIkQLs9jPd1yNcoAH2mivS5JkF2vGRCb+9OfOZY8LXg0POQ5dXEkNJkKQelS
         TnumNT0QLnXBmsA02GN5nGA260+qA6gWbrq2Cesq+nb6/JVsrP7wR1mjGsZK6XsxY2mA
         YugA==
X-Forwarded-Encrypted: i=1; AJvYcCUOx4vI0WKrr+xtN1OicrQwGvaXWyCZfoCTG6Ms1oT10ihLz6T+KcLFHLg/yYGYMxyusac08Xwrdhr9yopG@lists.linux.dev
X-Gm-Message-State: AOJu0Ywah/aeLwPF/Tt/MVVVCap3+C5SqCcAAD47CIenN0WMhqEBzI2d
	T+wGLfRutZIto1R0wFuzihwnnH8eJi6Pettzqhw3kdfMKg3mHC+tQCuGcNKwlyQ=
X-Google-Smtp-Source: AGHT+IGfiKnlklC0Ei5PXNRVvsnbaf8I+4iFsT9ypdhWM+np2PgwPcKV7gjfF++N+9WO7Z0ipv8AUw==
X-Received: by 2002:a05:600c:500d:b0:426:5e91:391e with SMTP id 5b1f17b1804b1-429ed7cf0f0mr17537005e9.26.1723813483555;
        Fri, 16 Aug 2024 06:04:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aabdesm3610389f8f.99.2024.08.16.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 06:04:42 -0700 (PDT)
Date: Fri, 16 Aug 2024 16:04:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [v2] staging: media: starfive: Add the dynamic resolution support
Message-ID: <0680445d-1108-4400-b150-4804da63ddba@stanley.mountain>
References: <20240816125132.514488-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816125132.514488-1-changhuang.liang@starfivetech.com>

On Fri, Aug 16, 2024 at 05:51:32AM -0700, Changhuang Liang wrote:
> Add the dynamic resolution support for video "capture_raw" device.
> 

What does this change look like from a use perspective if a user is reading the
git log?

> Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture driver")
> 

This looks like a new feature and not a bugfix.  Please describe the bug more
clearly if it's really a bugfix.

regards,
dan carpenter

