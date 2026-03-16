Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C96A367F20
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649521; cv=none; b=rRePHNtSumF+Z9Tx8K/S/gkFdHHWdODjYsJ90tmWzxNV6HlHom50lLRnDVe9qgNSwOiQWxFqe/x6pE28ehVHEP37Q0mwBXqgLHf0jzvvazz8Rq85QzS8pokX24b0dPTLgZb9mRPNF+wWZ4jn3tFRBpUX/Vh+fCLHQnzgujVvmR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649521; c=relaxed/simple;
	bh=zM12fMXBkz/aGLdHAw4fO0MXnoU1d/pnk8/kCrsZuAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLBvJUPlnDhaUKRlgCHsdkMNVLlF/Ttg8zgc4mJ62k8UQSScxH8AkIY6cwinbpJlsLBKShM45QgpdaAHSM9Wh8Eu6Epfg+Z4UdBpJx6LrINJ5DyEoHzumhPgWrRp0H+NOT7ARyYQA79cll1th6kk4yfmxhjdpxwUckTrivy3Mgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9dwNQYE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9dwNQYE"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439c56e822eso4522850f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649518; x=1774254318; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KlLkAnNKGsU8T/jwAcNk/EsAb1/TAA3RavYRUsvMIn0=;
        b=o9dwNQYE0tLfibTWb7VInyuauDxy+8P2ua2jMZoylmd+Cw6+tHSKC3hFkD/NlfwatK
         +Z/bpqB/IhVr0LtkjepSvguyXJ3brRFVDVGBIR3c8+0knAaZZJpeu3PvlqbxXnND5o0G
         WCzKy1jtfmC/FXIVRbthmvH9JENw9IP2hHtTudsAkEVkK70CootwKJgIY8i3Q6Y1N04d
         Dj+z6m0j2rUaJ+DNJTsUAEX3K1563zLNiy0Qf+SdcsAg9TnPTXvy1PPg/k31bbcp28z8
         VuVsU8mBoTaAT4tivHAvjs5sBhW0TL7N2xzYlshbxBdISPyOaH4dS2T08FSSu+FyPPuO
         EyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649518; x=1774254318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlLkAnNKGsU8T/jwAcNk/EsAb1/TAA3RavYRUsvMIn0=;
        b=al2MdGPdxB7Pl+Mx5GmYjucBoFGxpa8fmS7oG7xHWPNfzdIKf+wwQX6gGnz16mqDHg
         2iD2npHmZTEk6Xlnin/2tOsNV40vBZ0C+sdQybQ6EsFzi24kG+pBeq3kEhUMoMYd7wWv
         czKsPNxvF6WZu+O17PjunYe5CdMOy9lkm0VTzoAbOOhiNbnOZ0/U7kXhd7z/kcY0m0I0
         fZL9pHR5FELBqM9KYRgrwHTDGwO+682mjEoiL4WODJ+CUqynJs3c6g1/KYnfCbcx64bI
         BKvOkZBR/T4YfORt+2MiXExcONfnx/jUp7zGQFXMxKMSHFOFpV08eKUR8h9I3XvMXP8A
         yLwg==
X-Forwarded-Encrypted: i=1; AJvYcCUrRsGNOtAnXLH2muf9s6UjpepK98n58vFSlkFuWkvJDKksH+ykHNoqc+GFw+3Bzvt4kuyXoKf+NP3lBzQJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzBE2NfdAK7FL87zYuyrZC7/qFt13OWsmHFeHPcXZNUWfW6L6I2
	qfBQwtOYWU4OTt3qhjG0oPIay9S8e/K5ONbOSiNtppLnxzBKngbuFOGNRkD+KuND8dY=
X-Gm-Gg: ATEYQzzDRLkXZMIRBfg7ZL82sGVwdD4rnAEqCWTOSS36kjTdgzAQ4/jwki+eEavjo4n
	RFeAn3hTya77PvRZ8qTB+7GA8tO9ET8iU/VwZBTijvkAhTFdpgYdrjsvLXxrDE8+90fUo5uFh4R
	HNAZHYBqhkK19txPMrNCXKCJBnAuQwWSrfWRtovF4QntRQs7mRiJHjI9Mz0prjx/sj4TJs3n3Eo
	ZM+dpY2uNYTDvZUH8bq+JIyJecrTdEicONZkVfc3ZLZ377PMArIlHIgn4KdCIHIYxXkeCZ/DlXp
	ZTDRan4PNpdrhQemT8ldFKajwTqCOydvwA06SdFBvbyBQAcVhBKvhOmufblc35FSqbqv3BV1P8p
	P/KORpPC0+AT8fLnP0pPLG8ZzTOdv1a/KrparoXdRgUWBV3IQhNruvlFUiZaucTCyJmz2UOX/IZ
	oj/El948dzd2mXLO2pF0cfesjnDguV
X-Received: by 2002:a5d:5e01:0:b0:439:be67:a034 with SMTP id ffacd0b85a97d-43a04dc0c3fmr20758154f8f.47.1773649518277;
        Mon, 16 Mar 2026 01:25:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm40560973f8f.4.2026.03.16.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:25:17 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:25:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Improve error handling
Message-ID: <abe-aqobxwCIMj33@stanley.mountain>
References: <20260313163740.454-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313163740.454-2-b9788213@gmail.com>

On Fri, Mar 13, 2026 at 07:37:41PM +0300, Bera Yüzlü wrote:
> Remove unnecessary ret variable and goto exit pattern. The function now
> returns immediately when an error occurs. Additionally, ensure that
> intf_free_irq() is called when pm_netdev_open() fails to avoid leaving
> the allocated IRQ uncleared.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
> ---
> V3: Fixed patch description.
> V2: Used int_free_irq() in error condition.
> V1 Link: https://lore.kernel.org/linux-staging/20260312131933.29505-2-b9788213@gmail.com/
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 28 ++++++++-------------
>  1 file changed, 10 insertions(+), 18 deletions(-)

I responded to v2.  Same comments here.

regards,
dan carpenter

