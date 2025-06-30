Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D176D19067C
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 19:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311053; cv=none; b=DX8lVNYVC83okor+BuVU5E0xdHpX7SZbL7EIDY/TvFOiUhNW593vnzl9fFCDK5R/ZZnTJw9a9B3Eq2ppmybrrfy3UDzCmiaexQoS3txpCb9l/giycTGhgZ3M7XuRsVVZlnEoUdDUuS3LJUNE4bEhXK1pNUT3mSxz42kXbFG8smI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311053; c=relaxed/simple;
	bh=NsqELtxqi47KDtpNerRjKlGBO25wxTKkp8u182cGn98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfhqDlSpIxD8Nyt2GuFEOUflpCfz+kgOtF/V9tGcnkSBeSGGltmsnj2l9aBfNkMIk8wAqPttLQJBhUk2H9hePniwJpsh/RWnbdfAKDjThWxVQnAhNV9XWLn1GlXMqfDaSC/09wBFzXuz810134l93oZ0wM08zmqT6k9M76h55Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD3g2SzB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD3g2SzB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso2367156b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 12:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751311051; x=1751915851; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Um5P65+nf9UZ6CcWggyKqfAjkPQHQmkomV6ie3f7noc=;
        b=aD3g2SzBYLU1vileFLN7zihmLl9DUy8pPMJtI1dPTBexIHWeBlVrR0AxvYsvugqjOo
         4vCqYs6EqPIIkQP1vM6wyurU8jtzYny9hqNeCjtPuT1NqynXSiKHLTVa7HWlrJjrZDj6
         0krFq1rnbH0EIhlzHhwrtdwuCyX/lhZO+D3wMuqJDHsILbJ9x4kZSCzKqtaGgLLCBUnB
         HtWL0X0N/f0FdQxlAHRpo24dukWVdadEk9xuyxUbgpndVpRUk1WvlIOEPaC9HqecEwpc
         0viYMJApjnR3UFq3eTc7bUu/rHWrocZZKzHZ9YheJoX6td1Gc2GMhActuCfiP5n/tw4G
         4QfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311051; x=1751915851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um5P65+nf9UZ6CcWggyKqfAjkPQHQmkomV6ie3f7noc=;
        b=Ksgsv+7FEyXEbs2eJbcFtzC4Tl/m2G1IagH9OAa985BekeBrF7EexZ5pKX7vw+MenE
         RnVMRMlwCtmGB4YpHj9QNh4ViWBzYs6ndBGvFhcRVZn6M6XWqba+LA1X+kv1T/zbzgUQ
         RaCr/HgpVSNCgHoJKEz/rMVFUYnQQMJfNCOm2IyTrsrrckbNIM+dBJgBd4uGdp5gqhDK
         ywRNtctoQOlToD9pPKkrD5RWGN+kHFjGcrWFE9O7r45D22WiWxEX5qtnaXcoutL5b+UG
         mVU8/wETjzwz+k2/paz1WISRmMJ/+bqcjWwt9j+Wg6SsWvZBghdc3toqJ8BoV7Y5za7M
         LrMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuc3W5MaQa02s2+UBDtb8f1VjFgF1xeehpBNnV/KJ2grPwtd3v+87JhyGP34pEy+UcliEI3+Y7yDIHZTIU@lists.linux.dev
X-Gm-Message-State: AOJu0YyZDfF5Waz8SbRH2WZjjVbAAgJXs4nvhq4QHjWDBjYVl9llgFID
	GIOmcSKdPwCd1v4OOG1KdaevW0PgYq2H0Iia4Qof3cutA28XkSEgee+Z
X-Gm-Gg: ASbGncuzPDdb7tzgu1IlsvI2VHuzQ0oCrgHZhKB2VSh6kzY/dExbl7ythN4CbVWdAtX
	8bfgxlgFqHqNIKNXrKUb+ubYsy2YBP18am8Fg0uNKcSL5tdrA1tQAvCYUkeDcf57B5iWA4opBbQ
	aw4Cp1nZ2l4Y/AuHYc7KNc/60R/b3L6HP+7cpkHN5qIlnzAcSm9Jkkd/Rro+45tscZ8WEZekJQ1
	WNgOGh2q68K4EXf5p+4fzEvvc9s4XkxePq093lVOEgZaCypysiHgvjMjFZVwLF/iHZfAHyR9NAM
	vJiRcI/8ur9NlVaxzYVP5BfrhPTSZG+dwHreXeOR2oIuQK76ycTgtOo=
X-Google-Smtp-Source: AGHT+IH7tDIInMf2NZlvN/kfsFCNXiU4Z8uqHFH4ypgMKE0Hx9X2SxMn1hWbWYecPU0Ne2UXg2PsXQ==
X-Received: by 2002:a05:6a00:2288:b0:746:3025:6576 with SMTP id d2e1a72fcca58-74af6f222dfmr19186926b3a.14.1751311051009;
        Mon, 30 Jun 2025 12:17:31 -0700 (PDT)
Received: from essd ([49.37.221.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef0f3sm9986457b3a.154.2025.06.30.12.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:17:30 -0700 (PDT)
Date: Tue, 1 Jul 2025 00:47:22 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andy@kernel.org, dan.carpenter@linaro.org, lorenzo.stoakes@oracle.com, 
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org, notro@tronnes.org, 
	thomas.petazzoni@free-electrons.com, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
 <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
 <2025063022-chump-pointless-6580@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025063022-chump-pointless-6580@gregkh>

Hello Greg,

On Mon, Jun 30, 2025 at 07:16:38PM +0200, Greg KH wrote:
> This patch does not apply to my tree, can you rebase and resend?

I think you have added both the V1 patch and this current V3 patchset to
your tree, that's why this patch does not apply.

Commit eb2cb7dab60f ("staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()") 
on staging-testing is an older version of this patchset, and so it has to be dropped.

Regards,
Nihaal
