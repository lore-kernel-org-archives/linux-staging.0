Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7882749CF
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379185; cv=none; b=VUVpkEZAHh5itjbxBZPamtyh9tGU4AqkN+7NpJwNh53XZsRd5c3+uFxGhiizEyvf8APHM/f/s0dbY2nJAxy/0BYYZ4PqQtatwt00mjrt5TrDj+FX4a10UOkubQgmHy8XGyJASGsdtvlADmjtcxs0GWYZJZqR3hRbYSGqI0Qvzhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379185; c=relaxed/simple;
	bh=cKrEiugH0xvIcKtzSeFU/00qwTU7Zi40z85pYKEb35g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHcMSJzznvAwKm6PCP/wfd4r0i74c9pCq1jpXOq7Ic1m1tVnakPR4Q9Lht/rZ5IAfOn1T6/BW+9xkOvxk5aAusd5qR2clCEEI59hbT/mUkXcUT7KUQjMg7uvk2MQaTkr9OUcqJTZ7NjpOrbZviL+ffhU+07tJFNYj7oIxmNuYf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gEAAoFHM; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEAAoFHM"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2efdd5c22dfso1877559fac.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751379183; x=1751983983; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgIRXBrUhqUfMA4ZY1lMetlJzjnZyUiR+RgRBjwesGE=;
        b=gEAAoFHM7cz9F5ay2Zt3clnd/P4X11nOqGf7lE3nrdjwcwS5GLuRplKZj28ufFt8uU
         sTYfUQxtnJ9DrRWmEljJSX1qcD/ac7wWHQe0Wv5RtLqxN/0lvgWJ5erW/Kkw141psRh3
         +AfxGj7TaRQZmTA7J3rz2hn9NUYsEDLfMRZ7BVaiUaYZ3VpYcCUE3ZlvvQQJg4TK/Xj9
         3BQ4rhRW5mL48FzFOnhePLDprZzHIrVsXqXr6WF/kB2gE0Ul9v5Y+6kj0daCoO6jOTiA
         nW54UeH3uMtSA873zKFYctb4lcpMqWajv9AqOHh7sCSVWupzkGqsXHJzspUxpG7WTQdH
         Tlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379183; x=1751983983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgIRXBrUhqUfMA4ZY1lMetlJzjnZyUiR+RgRBjwesGE=;
        b=hRGbRgSS5DPVT1ryCMVyPUFSu1ZWU7fie3GR1E/4MP5cPjAWb2WZUZxAWs/c2Ffa2R
         7N9sCjjKKrjoVn2TkWD3HUKF2t2PKstKGyfBOSLpEvxnGRyCiTDnWA2IJobakx4p2JY9
         6pQumfwj8Bt/oZCROBsdQVTU7OioHnyIwtfmEXk/inPrBUC9gTCesHksmtJlQ0Pddd9p
         29L56pH1PZzXYJoY7AIfpUJbEZyghRmRpB/U1izVMP7UVulOWCnS82e2vHsiQHrmn5ti
         soWCdztNq0DjuqtBMiOtCgk2jpAnjNbR7csocGlw0c/NBuYpFSAO5NR9UHdgh0YUe6ox
         V+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzQtvUHfHqbDQFLcoEX9xO9snu/yvG9cQ5rv2AcI29lfU6qSNPmFkUDsE1cv0nn3RzCuiSHuDLVBnb3BdX@lists.linux.dev
X-Gm-Message-State: AOJu0YyjatMgfYNHKg3utc5A0kzdPL9bbHqMMDzhJGkxfi6N4jwF+7fD
	+dWJOKuaBpKKx3Eu9Ecbz9uAI97KunrGByXf24XxcRrBJZRcZP82qBBjNJPY1cy98PA=
X-Gm-Gg: ASbGncs/pX19FjWvrIjFOXwsdOF9BKUrqHuH9gnRU/1M2p6ztXnl8OfcZiSkNhM7oHY
	CHb9vJ5UWPsWMBY7rLMTQDi+MeyXimw+DUukq+muOe5XDKUy3mpcN8CEX0DWpw5ldl7b5lP6GOD
	yyDUQTNb6JE/HlcpLKOlJjLsePXTyNpenKszoe+QDjN8flzmlFIg4JhfWwLN+L9BT/uzM03lk8U
	Rb7LlRs9vZ6H4CiZDzTP9S4RdLUcaWC/Lf/OTQydbR1nmm9Jm++UEnKnMXmIEY7JPg6A5G5GUml
	GSZo2KQT1LrEdPDAhi+iMt1GSwBBweWPCgx7rC05q4KajDJhQUYyAqajMaCB3B/EODYtlA==
X-Google-Smtp-Source: AGHT+IF8222q5H+Su9S8AoNHUZyIRZzavZDR6dz1AwLsejbGTN9lIlZ82z0uy9mz2H1nkV0KHwWknw==
X-Received: by 2002:a05:6870:a99b:b0:2e4:4617:f6e1 with SMTP id 586e51a60fabf-2efed451a35mr13168004fac.2.1751379183127;
        Tue, 01 Jul 2025 07:13:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50b1ffdsm3274257fac.26.2025.07.01.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:13:01 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:13:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
	notro@tronnes.org, thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak
 in fbtft_framebuffer_alloc()"
Message-ID: <2e1d692c-5f16-4042-9ae9-423e3991834e@suswa.mountain>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
 <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>

On Tue, Jul 01, 2025 at 03:10:22PM +0530, Abdun Nihaal wrote:
> This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
> leak in fbtft_framebuffer_alloc()").
> 
> An updated patch has been added as commit 505bffe21233 ("staging:
> fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
> and so reverting the old patch.
> 
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---

This is the wrong approach.  The original patch was fine.  Just
write the next patches on top of that.

regards,
dan carpenter

