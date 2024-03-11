Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D4C8F4A
	for <linux-staging@lists.linux.dev>; Mon, 11 Mar 2024 05:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710135925; cv=none; b=a/zuJG9sYx2Pc9uiKlcTj8qI0fJZH18COVw9t1ZdBYT3l+24R+GeAICuDVJ27UNHr0MGSS6lVFIZDld/iW2EiJx5jVUmUClLciRHZzGnjwM2anMHKRyatDPSA7K++EvI9RfsU/DBlFflZ8NHJb7+GOFkGY4WMpvSjzp6m9r1Bv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710135925; c=relaxed/simple;
	bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH3CRWwc3mLeEvw6OtVVXmzay0Qw1LxXxr7anA5L44O1ekINb9HhKzOIR4mBR4aUAr94cStJyb6wcHcY3EZkDYfyj+/IX35iTCd4vaa8wyZZRaoatCcjpBK8PG53eVLLg/6kwHatqPhuhGg20wds6RKxZhIapXA+I/GYX+TmKSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kLXfbufp; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLXfbufp"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-512b3b04995so2953847e87.3
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 22:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710135921; x=1710740721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=kLXfbufp2vOKfulgiMA1TiG5Jl1aaQSiZRdylnow2nDYQHpfC4jpyhxoeccRcgjHSK
         8jXRaCRTEGNmGXbCi7CkDj7zq9jzNNrupm7Yz3aLZk1Dq6V/LoWeLcvApq1Y08Df9IBi
         ZhQNKK1ZfCRgHbOkQisiao57N+SslK819f6z5KUWoI0k7/H5zP+ksRu0j5qXCHeQB/A5
         uyqQwjAEgSGDbjWf2kKWw+Bm/UXuvw+HPxr6hsp6roj6yfussuuSz35GC9MJ5MS+TKvf
         8RVV35sWIrcQ/B+VtaQAtY4PDhKbn0qH0snfY6cBkwn9ZWSkHR0464zHA67HVpX5iJc6
         ZxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710135921; x=1710740721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=dzuyZDLPqwEKO7zZbqSRy25wK/Nf8doAkc1CkFJ8LgazNzyzD3s7+BlPqgpf9JYLzD
         eNJ5Rp9SlsMgUeaJC287rwcu4VGy44n4qBj+OcAJSpFHFISx+tP6qLEenLBZ+cENosy5
         is9k8+wc8R69leA1OzWgR+FSfakrxzH3JQjBwNcTOxjMoz/+OVHsit3bQ15wWYrRBbeC
         5CDkkeFEtyyvFKFD2hxubcXZQwCtGimR1YorJSCOT9kYFZ/hUJ3x0mF4GYNkfhn7PEqu
         C+nf7iHovr9U3CsShr1o2K4JhOiSdGXHxWi3yiATOA0RetRZ2R/QfOsxkyZArbFnfuD3
         a0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD1cYq/ZpoTpi9bFohbuEFapWyktjQ1wkIWqEK2F0XXmC5cVQfbWUd7A9Qh9UTKqadeRHHEuLjU3foCFHDQGMqJNTCtoVKQLybivpArg==
X-Gm-Message-State: AOJu0YwUqtwZbGnCij6jjfLDfG1UqnnasZ3mPiZG6Y+X7D5BSJNfiSnz
	cUorb9W3cWrp3R+icEkbePH5ygfp6SrzRnfEg/cc2XQmqb3qbSv4WhbKybqiG1g=
X-Google-Smtp-Source: AGHT+IHJ2gbnZ9MnnVvT5DXlGW3ZTzM+KRjQJdC9cAu2KH49RjtR0glNyuPgGWfqlYRnvMKuLREuzg==
X-Received: by 2002:a05:6512:2c9b:b0:512:fb30:aade with SMTP id dw27-20020a0565122c9b00b00512fb30aademr3725265lfb.3.1710135921306;
        Sun, 10 Mar 2024 22:45:21 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id hg6-20020a05600c538600b00412c8117a34sm7713946wmb.47.2024.03.10.22.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 22:45:21 -0700 (PDT)
Date: Mon, 11 Mar 2024 08:45:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] Staging: rtl8192e: Style guide Renames and Macros
Message-ID: <4d4a3566-4591-434e-9226-f3d41a364531@moroto.mountain>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

