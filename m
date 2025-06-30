Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C9828EA67
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300640; cv=none; b=uNCRi86MS/CsrHjwGMNYIQokBGaT3jTEEBL2EXOeAlYR4Y+B7fGPvIEHpnwSYG5fvu3s9uwRdW98u7LMJqVN1iXVjq2VNMhFbt2NLpIo4ZzEbaUGQw8D0Snwc24bY0Tb+yyGNpWA9Mjit0pl+OCJ3FJgIkYgBaHZmFuWEc1uPBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300640; c=relaxed/simple;
	bh=5+OiCZTGghwKa74lu2VCudssFUMBCoc8IDFlvhmwSc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfB0x3yFTpqNVSo/6rrJSO2LV8LwjGesQPTxCvhTZjI/Dg6N2W2L8wVs8NKAnPU9DoEpPsSc8OG9ziotNgYdv0CEeoaKeDjDJGyx5qbAbHjOysoLvuhfubVxEHrOQFy/qyEc4WEb+JANtDsubebZ6gqEb38GUXpPLofGn+3aXg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W189mqUs; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W189mqUs"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-735a6d7c5b1so2418568a34.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751300638; x=1751905438; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fA2hiy3pBisBqFxIA1WfhCNpsJVYMFCT5jmkfAR5MRI=;
        b=W189mqUsJQRsGz0MEzx+M6BKTJfUEs96U6ALOPyoZWGzXaSv/qkILHTKzyhTAdhxW0
         nC4kS0yilSA2xhhDEIj+w+xXJPTD91onhaHmzM6gECINlkPFeDIS6UXPG+jfbzQLFcl8
         57zi7DR2gviFQnplJjwcAZDlkLHIRAvjD76FASpEoZqMDzy1sNo5Nhpf4NOZ5uquCWnv
         05EYZGa330UxUA/d+/gpa/l8xasG3i1qBS51DZboP09sgdlaqvPuZBOjUZgIOKEeGT0/
         HJ0LG3328I36OpP2GLhU/9WqKVe5v5EbU7Vk0BXpNn2GurhgauKBSFGqzcx5KmLKOLw8
         lM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300638; x=1751905438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fA2hiy3pBisBqFxIA1WfhCNpsJVYMFCT5jmkfAR5MRI=;
        b=GPzfn5payaEl+B9yYn+QD18RoFi4H/txxJbCUrETzvOUvwDAybOxmbSUsU22LkpQpm
         FiLi8IO9+Go6r9jzSPgOPh40EclJCSCsHJ7KaVPYF3D5/i7irWSRC2gV0NT+mrvZWeY+
         9jBfNUHGAO6zi3ZcoI3QWg7o4fStjn0UCODMKkVI0UARImWwEf7YGxol3gugdjhqECOf
         e0GgWR6sbbP3rCZpq9R/XWCn2HQejxHdnQGu/QWvpl/Z0PYND69tzTcLYNC2NOcmQN9t
         gvZrzMxfkrX17O23qupEbBU/URqkeMdIFa4MkfmXfw6FCorXXPy0QHPfz08mqofEg7nh
         z0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVitZDpSOHb+F5vjg+o0ZCFEkVbXo0AHMio7EceevGlemxUxI30DcHHSmbpK+rYqvQnzRCwTGEED+F1GfnY@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf2Ozx3vdZgwZzDqvtEXeVv07xdBZtLbOOPmqiZjI7mSQt6q4K
	MJMOu4sk24SSnLJ0CAxom3OwRQ0TSjI8fG+yn+LIVqXltB1RoOnLk6Hc0vKWLmbW38A=
X-Gm-Gg: ASbGnctxDhOsi2TzDEd05W8gNtwKo+HO0zLMcABBbXPnMb8bY/wOLq6lS0qdYy1J14I
	A9XcYAWwl/lFext87ZCONd6V4U0xUludzTe9WA11OrpcCId3UdS6IRc5/uKfufJOM1N157cPLGf
	jM4asnyibOf7YjRBhzIbouLc2YeQZhh2L06gRuyn1187eyfEXq6L1ZotsZeoDTiPrhldce57EEH
	3lnmnZB0f/kHht/uYYS+lqM+E57Fts7fR48oKI5YMtVLkjWXCF43pRthiXgU0HjJrYuKdlLDwsJ
	8Nb9PCX8BMZO9T5/eYAkdhfVEqb5yj7uDbXm2iJu4IatevqDqIcHXZcchnl8ywdqfkpl
X-Google-Smtp-Source: AGHT+IHI8m9128kRd2fU4qN7fgHZ/eU48Raar7DmwpFo5FAW57ejeRpFPJvZQgadqdVBw4gRttl5dA==
X-Received: by 2002:a05:6830:61c2:b0:73a:8705:e9e6 with SMTP id 46e09a7af769-73afc43ba8amr8817314a34.4.1751300637997;
        Mon, 30 Jun 2025 09:23:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73b2459ee91sm644765a34.51.2025.06.30.09.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:23:57 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:23:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
	notro@tronnes.org, thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: fbtft: cleanup fbtft_framebuffer_alloc()
Message-ID: <e15bb200-f59a-45bb-8349-72816629abb9@suswa.mountain>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751207100.git.abdun.nihaal@gmail.com>

On Sun, Jun 29, 2025 at 08:10:09PM +0530, Abdun Nihaal wrote:
> Fix a potential memory leak and cleanup error handling in
> fbtft_framebuffer_alloc().
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

