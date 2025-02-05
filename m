Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054CE21E098
	for <linux-staging@lists.linux.dev>; Wed,  5 Feb 2025 05:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738735033; cv=none; b=V/Y6yy1PGfXnylvj1jQewob1dKN+k89QpczR0WzU9WxIA2KRRo6FPaq9sG+PUkavB4YN6uEHNTAkKCwWxbLCVb/wvhMJXdfercbpuuVeOWoIp0PwuqHXkY38gz8DqFE2+Kv1Yw4B1cVzcft9+Pv5TLMIW+4Se28Jm7jRXzBwB8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738735033; c=relaxed/simple;
	bh=JmHHk6b4grLsldkwDlWYnMxUVEDLxRUNdHIBTOJGm1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDfWnCW4ZaktHf/qVhja/5v9TLJYyeRv4qigqiCV1xhYT/QL5kuulrBtdMvUOFfS670zW1NrGfMhg1wZjbdvFxhdvmC9Teq2+IOHU0JHYdWEvnzooODfnIxeLUFwgLFUbf9Epdu1a4ZXGrAf9EvIcLuZVphhI3D3c08syIqmncw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VnugQmxP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VnugQmxP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3332932f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Feb 2025 21:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738735029; x=1739339829; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Wf//K+zDvjEZ0lCO7qefASJpOtz5W/b6I3djUeQy/I=;
        b=VnugQmxPUgjyzh2uDg/C05Sn/lTQU5IfLsqFFt8gQ3eB5dN2LnklDHbDFBjdpiZ+JE
         mnlv1hwDJdXeJvurhXhAP9QDVm/+4yZ/uzhS5aTiShPT5CEbtHGPgE41EEheabcSfomb
         rA6vnBSPC/itCPpup7Crv28KR8ZOiKSNQI517UeXbWNK0yAGusZ5Qq3Eddy5d4vcgUIw
         7dzVPC7OEHZUEwI8V3CJjNcKTFeFHsqPm2aPmQA3oRW2IAa+WVjgefjPxPiRwAGSmSzZ
         w2NXbN5WQBEYCQqyOVkeKutEXoxRtqfETqnZsFOknJVFD0UIiQOcnFH/ES/auyPTJTBk
         Uy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738735029; x=1739339829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Wf//K+zDvjEZ0lCO7qefASJpOtz5W/b6I3djUeQy/I=;
        b=PSmLKT3ApDwdLf33KCajtdg2nBEYIl3yIRwtEm3IKTgSvM8pQcXj3l7axnhXvvE1fE
         q5DmdeDwMBACGUBfOY6bFosQzQzLJtkSPehq7srXsVWwFr66UbD7qESq9OxQBaIrm/kF
         cbdHa66k8h3D06srNUQ9mvtp1pocjqIK7QAZPY/AU47eNwEZXleibUPlZEIqiYHgOxvS
         88119Ib525qzTb71v7sgZiiVu7pXTx7NG/bkNnfoguXwWwx3H+tJKqzCijNGD+vLMAkc
         BMHIRIdfnnQqCPhiVYLEyRiXT18fha+G+t0u5y/TC+M7L4w26sAy8ueA0VhnbPJF83S+
         H6nw==
X-Forwarded-Encrypted: i=1; AJvYcCXdAaf2capvveq8A08Yt4tNCKLOA5HKajPK6f+nRt+VBemO4Br2E33eWD2g2Trc5grYjAv+XsB9mqdEx01g@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ05pYX2O5WDHmgZQ1AmnYhAvA0huuf+do2VfVIxLnUKJ19t59
	C6sKxoyQdiLKcl1HJjbzMdVy0rHnkNJysx95BW238v02ZAWBFvmLuWaqXAK0lVU=
X-Gm-Gg: ASbGncuoKByT6s2bqXErIZ+3ui25pM6oQR2sCNnz3uEIot1CLX/7z2rdal1njCSrMIs
	/HvHmYvAUREZNccF5WTrFLw2551a9fMp9Pn2ndaMeVGsoS+ISr0cma/Y5gYm9z6+gbyr+BL7Snq
	EqBP2e3MZsLEMueWsmVRtidvMvjbttpmHSszcWj/0CskXozqdmrDnmOQe5daIBMJUVZSd3u5pwX
	+CNyx1vPmi8djRvStzcxw36G8eJzKaC1SEZUSnGaJlkMwW6w4hg0ZmOATdpiYmmQ823cScNeMC8
	d4y/Ni+/ExexSffTKRO4
X-Google-Smtp-Source: AGHT+IEzl0+icrJdfMURnyk6DnvesW8whXjv5guwsjmV0E/xmX8GtuyZJ6P1LmUsWNrvnv90m7c5jg==
X-Received: by 2002:adf:f810:0:b0:38d:b1ea:506a with SMTP id ffacd0b85a97d-38db488dea7mr777074f8f.28.1738735029283;
        Tue, 04 Feb 2025 21:57:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c102bdbsm17526023f8f.28.2025.02.04.21.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 21:57:08 -0800 (PST)
Date: Wed, 5 Feb 2025 08:57:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ian To <onlyian4981@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <3f548286-a32c-43d7-8e8b-6812a3fb9214@stanley.mountain>
References: <cover.1738720049.git.onlyian4981@gmail.com>
 <d0b70310eb6b2dfdf062ba865362cd2640cb93e0.1738720049.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0b70310eb6b2dfdf062ba865362cd2640cb93e0.1738720049.git.onlyian4981@gmail.com>

On Tue, Feb 04, 2025 at 05:50:16PM -0800, Ian To wrote:
> @@ -492,14 +494,14 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>  	/* If we didn't find a match, then get a new network slot to initialize
>  	 * with this beacon's information */
>  	if (!target_find) {
> -		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
> +		if (list_empty & pmlmepriv->free_bss_pool.queue) {

Nope.

regards,
dan carpetner


