Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856226B955
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752516479; cv=none; b=CGnMvxaCqF2lKByNLzHu8jh4r+6ZtGjV2EyH3Yo9xFJxkWu26xvBHfJcHgHgm/5M3cUK7QJtqXoAbVzFI8b4w1yDeZuLg2tJHELTvBZje3qRyXvEJ5851u7o3Jn6WXrZRwu9qp1tGqdhApEGeU6EQIcZAYuH7hf3ltadvTYUZPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752516479; c=relaxed/simple;
	bh=4A6NEnLEDVYPdt7kptKVv8KoV4dKTNbBlfJrN4BTURI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl4xi7LJrMfO7cvmJwT6M3QO+hhXFmgUTaKxkfPI/aU3m3bYbWN3JmfXIeqOO4wgJU+xFhlACdl55WlUd/vYvb91sr8XY9sb3roa5ju2U+R3dHvKSbsIU1kV1gkBfW7t9/TlUW6pQkB2ru7jA4mbmbzrAZxz1713iGscAwwohMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aR3psaVv; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aR3psaVv"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2da3c572a0bso4288355fac.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 11:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752516477; x=1753121277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SkqPZJTfP/dXrtN6W5XHyA3cwGmH6cdb96S+qyDy9TA=;
        b=aR3psaVvqlWerol2Yg2vAt/DyhW/aokg3fo9yDR7jDXUM0OwvPlo6NaIPdrAKUTyJ1
         dgokbKNSBhIJHGmE8fN+0K1sMXr4wjAUVJ9YaY38W4zliqiyTLafyhooP+yIWU+beuT4
         +T3fcpI7TA1RGOYLVsdoE341W2pIy39SKNJl5ZFJWOiqckJaCpZl3UbVObU5fCgjpEaA
         dbE42TB3V8KgUI4kZD7v6IZILl+BvtDkwsUszU+lP59Zge9uyrRqunkbgiW7DCjS2SZc
         s2mpRGi/IQlqYHJk2PY43plSzond64Cha7Xsbw6//dkAY/WSqmDep7g9d0fqUTAWJdMh
         eNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752516477; x=1753121277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkqPZJTfP/dXrtN6W5XHyA3cwGmH6cdb96S+qyDy9TA=;
        b=fUKQaDYNdTG5pmSZDL4bzk494Pbz4+Ymq8HsLk/UN73JT9Vgxw+fO+IqqYA0zbtBjl
         X3FNjdBNvuhv7bNy2K9ayw29tG5wqT/DGagWOnkpFEepWagX2iTZMQA3qyeHtJn32vzl
         T2qzaEl3J3tlrIXw5ABR+KcumYm4tEb2tf6zJfbPmqzOj3A8XzitGSWgWwM3sgQ4B3BT
         poaVIy77CjXmfjxbR7shw9IRR/Ez93+7W0aaC8uK7MOc1noZdnnxs26OVL0ZhW5xBiad
         Y2gaTjXkOkd5GMXRb2nO9h5ztvY3wsENOPwuGGZXaYmY3vDir0l/Go4IEb3ec8YpGKsu
         u0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxxgw8iVxAunVQJnld2q/uIRy+5Q2WrzOnedQwAc9kzE9yQNZi2QM8jqfeufdR1o6lzn3EZneNDCin8GaQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwOSQlM5ceB8bvHl2gn+ebBxcj4gS+fu9mLS1+dcjujzestjnIw
	FZxgXZUAn+lPjgYcYGlDLGwIqGh2QJoWTR2F9MX8x9928UZYhGtEknn8fJmRmyemI2A=
X-Gm-Gg: ASbGnct02jrwwdtRRv1CF3lUTT8uxr9KgYfBdzrA+jXzUZaJPTSCRsOWqnCet1gkDeX
	ka6cPAGkIpqXGpGhaGnCN+QJXvtOvzCrWoZHBvd5MtpiJmc0mBJjP2TLnTx6zciEpy87r23kvV1
	W7p2AzmXprWWTS+Zsw8ZfI2wAu/gqwA+I0Vh61rF3aCLX1JbFDrJlX4travZyjopTjRL6fYTEyx
	0zsHMNgVsTFKdFNPZYKJy/o7/Fv5xTy2afFSO8XaqWtFYd9Na2dx0jvQyiYSlOkWhKcWTwtl9Pu
	0qdBDNYCWQojiezgjr9vfMJi1I3tCeMG9m/kuFP0MGG2IiFA98oC3j65h6WfYSRIEu9xGjUWcCc
	IX5KJiz+j0pLVF10LwzL72DaDOyOyKA==
X-Google-Smtp-Source: AGHT+IHEpey/Ia+RCf0jqI32ZfN8fKiRgnukKmQ9MOBS/IEh6vRzjjE5dHNk9XWCsGIIN0hQXIQuqA==
X-Received: by 2002:a05:6870:6e0d:b0:29e:3c8d:61a0 with SMTP id 586e51a60fabf-2ff2670e0a4mr9867811fac.8.1752516476616;
        Mon, 14 Jul 2025 11:07:56 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf1272577sm1640198a34.43.2025.07.14.11.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 11:07:55 -0700 (PDT)
Date: Mon, 14 Jul 2025 21:07:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v8 1/3] staging: media: atomisp: fix indentation in aa
Message-ID: <1fabf80a-0172-4bcc-bfcb-96a7ab5f08be@suswa.mountain>
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
 <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>

In the subject "aa" is weird and confusing.  Say "ia_css_aa_config"
instead.

regards,
dan carpenter

