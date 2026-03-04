Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78482388E65
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611862; cv=none; b=HiVs++IQrmhNs+p+oohdSKt3yiyNMM5Fmt7lQO7mAL1A3JDeGRABLV6octUuloCpZRKNIYfB9XuDi8aR5RtsSWPMO1ty7z4fx57yJYiAIRcxcY+TWbsihKpCuy1VKXOfgbDGEkvtG4y7LfU6/SqIOdkYAluQDTrXuzT7F3JFDoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611862; c=relaxed/simple;
	bh=1gMlLUXhCv91U6qxn9U4jYEbEj/754SDso/dXbzlmxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGwhhw3s1Mx8ZluZ638pmS0qPmqBJLy5JssZCxhrirHQ5g3kz2cI5RZLQUnY9c4zpFR/bVhQm51DPkmddmLMHn2Ln/ndK6fqAZbDICWw+8qPQmHDZgkxr8IqLC3fTsx/SnVwQp+8X+6CXqMDJJNBpNj0EuARxzJ4XkRcqXxv9Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dg2jjmpJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dg2jjmpJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso57763625e9.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772611858; x=1773216658; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i8pSDKN6l/7Id5MISZkLrIAbbIL+fWy4XY0gx/wOsW0=;
        b=Dg2jjmpJ3x038zlnvBLl/T9UunkEoSRebn0koGW/P1hRsxARF9Nc+vxkJqHfQcAOaf
         zBf/nJzFwcXR7LATJQn5eTBg71RNBxvfJTl/dp7moPCl9MUaDdUu5SUsBHJHyBAVlHTs
         RD91tiJ8hcj2NhctXq8kOf3xuwkIw/OjaRZZ4cdlipEZ9sO35ahISgXUmUWfEOrP6vM5
         GnOtrsXC7Yn6sCPKapWGHmOe8Wajpg9ezCFALem37Bv0HmYo9bdToqz+UjjdlRwoZjv5
         ZDs4az5zAawc/1pqJ2XM/8S1BqC/u496uyxYj6boByYbvPnjVFiasy3ofMCj78vPQSoy
         UKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611858; x=1773216658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8pSDKN6l/7Id5MISZkLrIAbbIL+fWy4XY0gx/wOsW0=;
        b=iDL4y+FZDhO+czEbZthnUyqBIfSZwFJk66iAqUPbHH99bPaYlmIThhR13K7gCXluat
         pb17G/LnVAO3c5ntsPX90tzGRnXsMxjomIvO2T9KIS7iWm/9wrPK5+U91VUe3VNVxA3o
         ++D8CulF1TYxzPE2SpwGcpoiYSdd+LeCrAKA38gJzPJhXYatHVHMl0+6vSCBn11eW2jj
         IJGhajWiC2u1jZ/2Q2j4ier47X3mdZidSth1/nHG6hGWm6bUgBDu3PDvB9TAmqCOPxey
         8GAJhLDaZPHAfC9RTBuzopmcxlPvLepJB46+j296u1AV2SgoBaI13GJZN5V7vkZpzu57
         TV6w==
X-Forwarded-Encrypted: i=1; AJvYcCUJoqBoUqRgM8yRblLv+13/RlAcKvxzpdmqWwnzDHOSofRu/LNN5g7rCFK2zXdobtWhlSPBh10WENnUaV46@lists.linux.dev
X-Gm-Message-State: AOJu0YwvMk5JfBjpJB4Oy10M5nAvr+K/ou2iyCk3Qa8/tSyH0HVVp9p4
	FFP01a+RRFoCSi/nRsDbPcigpQbbx+g7GgvSXTDNuT05xALsZP2HQHCK2JYd8sqqQ20=
X-Gm-Gg: ATEYQzzDX2feW3jCMyVULMMflbz608RbJSZZTlMksvXhd2RmzDzOHA3XOXmoi+j0gaV
	ZaIBHDaDMT63siZDM3GflIz7EvamN9CA49qfgqgEZNr74Aoa2tc6cfy+UO/Fqy5Ehb8qIg24/bx
	ZymMcFjirhlvaScY3cxgSxDKb5Q1nWAa07vL9nFvK1DnG+Gd89klDcxGVzP5yyiZbETDrSztjC7
	eTNoXId/BViQWaT091a1ixdTeb2c3qyP9uh7fmk5Z6C3Z4os/5HQjiLeeqFez5e7TO0/8GKRbeR
	YvoRCbDtjvP5vOrWYP061B7OHRmlYw5lZDgjf9SraxEW5vjOyeG8XcMb9xf0AQqk3G6OiAxc4qG
	tDAe6Vwh5/jQxeNrL7DK/lKEcFBPWHSAhPwqVxJDJzTCQF2rrVdyNduIjRS6GC78Ru7aS1Zjevh
	iLqMVApBdkQ8I8RizkSdXecNm9ULji
X-Received: by 2002:a05:600c:4e51:b0:483:7783:5373 with SMTP id 5b1f17b1804b1-4851988ce8fmr17102135e9.23.1772611857549;
        Wed, 04 Mar 2026 00:10:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8d4b3dsm6444525e9.9.2026.03.04.00.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:10:57 -0800 (PST)
Date: Wed, 4 Mar 2026 11:10:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Windlin <gawindlin@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] staging: sm750fb: remove unused CURRENT_GATE,
 CRT_HWC, and DMA register definitions
Message-ID: <aafpDlf_m2SBNg1b@stanley.mountain>
References: <20260303232434.1850583-1-gawindlin@gmail.com>
 <20260303232434.1850583-7-gawindlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303232434.1850583-7-gawindlin@gmail.com>

On Wed, Mar 04, 2026 at 12:24:28AM +0100, Gabriel Windlin wrote:
> The CURRENT_GATE_VGA, CURRENT_GATE_PWM, CURRENT_GATE_SSP, and
> CURRENT_GATE_ZVPORT bit field macros, the CRT_HWC hardware cursor
> register macros, the DMA_1_SOURCE, DMA_1_DESTINATION, and
> DMA_1_SIZE_CONTROL register macros, and the unused
> DMA_ABORT_INTERRUPT_ABORT_0, DMA_ABORT_INTERRUPT_INT_1, and
> DMA_ABORT_INTERRUPT_INT_0 bit field macros defined in ddk750_reg.h
> are not referenced anywhere in the driver. Remove them to reduce dead
> code as noted in the TODO file.
> 
> Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_reg.h | 41 ----------------------------

We always remove unused code, but I don't really understand the point
of removing these.  It's not like they hurt readability.  They function
as documentation.

regards,
dan carpenter

