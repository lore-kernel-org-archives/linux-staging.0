Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB7B18A947
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709401; cv=none; b=JnzguUOOrDQqVxVceJzHYN0gl8Ko4HgO4umbLDhmR8NzhSES7swPiFAoTD/nZdF87cjDOgKPoTyyzhf7fVtY4ZvjxNqHUcaknX0rdVn/gsRvZ9fRMmXNTmbQuOdie3BLLaEvTRJaFso5xwvVYoDUcy1j4VR/gX8qWoT3Z7QJIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709401; c=relaxed/simple;
	bh=9ER8Gkglev7unCJFU15f9FqH14o/KXHMMbhVZ0IW0j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMy0i6V6G5+rnWY26oRoEcokt8jNjNZmjGqDHtocT27pzIzbr9YasE+lR6PNjQUJT5TJHv60DO+UlBgaOlpW7+sscljHSJ9Xul+1mBf27NUt7zB57DxsqA6Rb1lkg7aEuekgRNVAY6UOpiJvADLcswNpRUSogxh+weWPjBC/qL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPhfHDxe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPhfHDxe"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso32189205e9.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 00:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730709398; x=1731314198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wQNba7SJ5waZLtab98P0tal4zlnqC4t8NTIv2ugdpto=;
        b=aPhfHDxeJjPClluVZAUHuKfeBS03sW24gr3z/sx87lR5XrtANj9+Ji/rHsnTRBZlei
         eR3snEENXDMglPupSzY5SdDZaZys6Hl02H8y/e3ltXuuYp4Wb4NvSNkg6THo9g/cKfOP
         Ca9yRlG6pUtF1UbJl/ac7jpFbj/VCDLwCwi9Ny5MrYey3VC0XZC1vh+r7ItYjDBWTHJE
         Sqjslr9PHALxZlf9nlt3NtEjiDkZ4l+PPTFe6de/ihK2k92qcp715D4JyS4Agw8gcZsL
         Rs+3y7ymISQkRX2Rcc9OBwUymUfXU6RScNxKATCPzyhKuC1Amxl0iSxa0t0taqQDWRS9
         dgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709398; x=1731314198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQNba7SJ5waZLtab98P0tal4zlnqC4t8NTIv2ugdpto=;
        b=lMG6CZLKmFsunhrNZrMVHX1UW/Paze1SwBiR7V1zXS/MWtkL5gIJhfcDH6BQ09Vm80
         Yt3lr1TmwLwMD8Sx9bhffz7ZryBIoJ0Pn/oUim7Wym7PuD9nTT4O/dkVX6hCa+d3M+rK
         BafeADDhcg5DMX21eVooeBolZFOLJUbxiZ5YZmpd7wSyJMh39+/MakK0pgptLddINDjj
         n6Soqb+VAWHsjLer5qo6Cyvj4ggwoNS6wjItKXRFTPRX7qhub6ivg0gVTu3owp0IRbnv
         ASr6Ey6pZem0u8xSZrQd4GYtB4wz6qlL6bnpo7E1VtXtrjxtJnCr0NCx7R3wqM8+Pocc
         hAGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyipk2pLGWdGZGHvgXqltXXr2Y4kRxXL85R7oZRP5kq6RGw/lsHegdX+WsFb7XDsVLkADEdGIh4OdJIFmA@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3AsP2iPrqn4ITSTtHvvxy0vrY2uGJokWl42iDs014RtPIeoKl
	gmh+2QaDbZgPr8dgjneBieRV8ddmigrdadZl1vbnUiSUwacTsvktu2kFOJgWdC8=
X-Google-Smtp-Source: AGHT+IGPyUj8y1xAfEDv4tHM9DTcI25WjBafMXnE7fuz26sXWASQTccZDR0aePOo2zm1sQefiJS5Gg==
X-Received: by 2002:a05:600c:35cb:b0:42c:bc22:e074 with SMTP id 5b1f17b1804b1-4319ad343fbmr291216725e9.29.1730709398454;
        Mon, 04 Nov 2024 00:36:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5abfefsm146381595e9.4.2024.11.04.00.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:36:38 -0800 (PST)
Date: Mon, 4 Nov 2024 11:36:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH 10/11] staging: gpib: Re-order the lookup tables
Message-ID: <439184c5-103c-4ae7-8232-d771012b9f07@stanley.mountain>
References: <20241103212617.13076-1-dpenkler@gmail.com>
 <20241103212617.13076-11-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103212617.13076-11-dpenkler@gmail.com>

On Sun, Nov 03, 2024 at 10:26:16PM +0100, Dave Penkler wrote:
> Re-order the tables so that the bcm27xx table is used first
> as these devices are more popular and numerous than the older ones.
> 

What is the effect of this in terms of the user experience?  The commit message
should be clearer about this.

regards,
dan carpenter

