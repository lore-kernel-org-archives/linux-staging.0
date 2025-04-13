Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8184718DB0E
	for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 17:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744566222; cv=none; b=aaC2loGWghabLPh3wB+0W4OzwXO7C9kNiesQbIQOw2ar7XReGBoF3C/1w8hkvsi6tZ5vxVOiQQsFJukE1ViGoaTIV/wlAL57AnRP1GKYwNp6oW5lyP5c3jhFUeRpXaVtlaSsmL1m1FTrpKDmmCsS/PxKeNgecY6Ez7bcccl+H2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744566222; c=relaxed/simple;
	bh=8HBuH+FZfQ0GDiaUaZy+fQQtepBsVB5ioX972Ybr5Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/DOKQH7CKEBDIeynFqEzN8ZFnqQcwqyj3aES5xfX6vUZE1bOyNEKeAwnIVDo2o2eJknRUK6gEkjlTTRGacSqixB2XgsEQ2PXvhjt7Wcx4DJ2d9Ns73LmR/q088cH3msVozwOXdktI0V99JRVs9iqmGo8s02v2j43WOslnbNpv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6U+rQNF; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6U+rQNF"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736b350a22cso2932396b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 10:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744566220; x=1745171020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=75igoPrprdjp4EmNwfQjVuaGw65H5Ht3+2Y4xn8eP9c=;
        b=J6U+rQNFwzaUg0aVPajJ5AvjmN0PGq/BNdgHs5ZU8ZEyJApnyv8RIizn5K1QDghgpA
         jgcqnQqyyuyXW+BNyBz8Mlg/7qVQ2FDaWl0EIzPjgUQ4hox3RqDr07Rx0SAeXxJw2/Gv
         87bTTFttsCs1HiuQ+441l2AtsLrC+dQYKieT54i9igk3wpn2dkY7cHQ7t7ZdOPEVj9Tk
         RspiMlWDU4Es8qxHwokEzPNqaeA9C1f7N1mAnf+YR6xngr9zuz8of2iwI4BNuVsn9xkk
         gjdHcmaDEyoay8a5eauJPTgbx01G3II9CyxVDM/Ipu20kB16qBD/4myYISnG1xFTgkTb
         V9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744566220; x=1745171020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75igoPrprdjp4EmNwfQjVuaGw65H5Ht3+2Y4xn8eP9c=;
        b=pOh2didn/G8yLGF62GHnzVCg9GJScmHGIcNLgREbUAnxxQA7gCmv9YR3e8ut+78HRB
         zUpDqQb5Q/5lEm9xf8goSV+9VjQn6oPpC60w2v2EE8UfLzvsomm+19271nh/mBPSJvbp
         ys9bTILpjUJ3ye8sLf22w/NqybmqkCJPL72HnTgRI/vQeNS+h4pf/Ic5MfxYgF6hHR/2
         0JS1IUdoGDqFpMUd5Rz9cXTyn9oNg98x1/0j7eVzT0TE0k0DwyllvIFkY3AYO7iMC3bM
         koNEyGXTeAY0mChm3FR1XHPGezBFOGsUuUXl8pfhIU2Ul/3ZlgrckyoVIgMODhNM9vSj
         J++A==
X-Forwarded-Encrypted: i=1; AJvYcCWhLxreS5bD/0aR9DiJt1aVY3B6yU8sXdosBXaQIKxOCBlH07rJm8niRAz6FfRULsEW2JC57i4MwxvaQNKG@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo45LlXhap+qQ+qyFNo9pwjsAtZ+XMspFHNvV4mVCKZnc8ez6f
	b8rEGwVrL1uqHvpWBhtDI+n9uyTZjIPmxskiHAzFSCovsUfdo6cX
X-Gm-Gg: ASbGncuwi0DKRT6DfAfmoXn/HU6iO5fyg/ywieBfk1bSdtAGZtVXaZ88XnZbCIw4eX7
	/Wl1bSrhzIo2vfluQGepJeAfjxFDYYt1JLaM2eg6dOflihHyUD++Z/u5xT0DhlFN3OlAcOGjRf4
	JHD0UMaShQ8/+dwXReApUYLYUwgJu2cDwgHpMMbEFw76tlLm62PPsS+i2r0Pk0XFxbRVrCXeKwl
	khEe00mlG8cs/bRV2XNi/J0QA1Nxf6AK98IXPj/RL9Tgo76C+pW73nhBRkrQ/dHbmNNTCxRAtb5
	/YRtDwwSqhH78HTTosNmscPx9paFrTT5W08KEP88xRu98b9K
X-Google-Smtp-Source: AGHT+IFRCq7w/UKkvuBmcREfCnZ2HoWtJ8ccIbPQ448PYdZpq5CvKWZ4MF8IyfGGUJr4FDOpapIFAw==
X-Received: by 2002:a05:6a00:3905:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-73bd11a8499mr11089061b3a.2.1744566219547;
        Sun, 13 Apr 2025 10:43:39 -0700 (PDT)
Received: from localhost ([2804:30c:92d:f600:d5e4:543:c403:4767])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73bd23332d2sm5184931b3a.159.2025.04.13.10.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:43:38 -0700 (PDT)
Date: Sun, 13 Apr 2025 14:44:48 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v6] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
Message-ID: <Z_v4EIIy67FfSDWp@debian-BULLSEYE-live-builder-AMD64>
References: <20250413120354.19163-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413120354.19163-1-simeddon@gmail.com>

On 04/13, Siddharth Menon wrote:
> Use bitfield and bitmask macros to clearly specify AD9832 SPI
> command fields to make register write code more readable.
> 
> Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
>  The error path for AD9832_FREQ_SYM was not removed as initially
>  suggested by Marcelo, since he changed his mind, considering it
>  would not follow the proposed ABI

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

Regards,
Marcelo
