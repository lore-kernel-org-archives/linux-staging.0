Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B32EA171
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 08:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242855; cv=none; b=kTf9vQKmygUQ0Zjq/695FaPc6WC3h8ybMUotZIv8oDq2TdzLE0UvZWr14X2HXsmW+lI/7l+4VVXZFllZRTceDQKHTfUJTsT3xJfp2mIsOH4+l7ARY8/Sjc46rCOxneFxjIu2UNNYYBxhP/Wa+4j4OJ447B3+NFCu4LkHI6R5xpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242855; c=relaxed/simple;
	bh=lJ6ThLlEC5qIfLJ3GiWGSn2UDtZQp3g1MqucF6oNwZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BA5paVklwAKycDKIntD45YzTNMi1x9A/EpVdxXstdpHc40WBktUBLi+AvSsFF9lhvVEscdMbCXGsK0x4FWDO7mKP/jshlyTXeYw9npvPvrUsztGQxJ6KwJbYHvxhuVWQbqadiwO1WyeyIN0qbWiQlpV8suyFbJuW11Pw1t/vuIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5NAlY2K; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5NAlY2K"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfd832155so4474824f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776242853; x=1776847653; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xhH84NXX33T2mx07NdMMkNioRpn5lPJ7BGqiQz9oSTU=;
        b=g5NAlY2K8B1WNx3QdU+lfwE3XlSOOpcOoNVRAXng8U55Vp755AH+nGPdEeA5uxHo6K
         VkNG/1dmxTyb2VrdgNN5QVNchz3QLJAupMTLYMUlDOv3H0qXNUZKvGomdEqWYdEtG+xN
         GBBq3GD+nLfuhWvPobSBHiLJFqMK0A54DDn48G8+TSNtHQQ9VkaLpr+g+6zhm2D/buMy
         pb8gTg3M9ewGp5oOPfdNeSLeAlL4+kPoRZ0WUP1kxo3Ua1bB6EDdwekqcQ38Rw4uormF
         V3IQ2YrYXcWBiwUtO9QKXpQKvL5frZNGVfzeCZTuKc+nih3TI+sUgEXemJPJYS5dipjF
         Eq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776242853; x=1776847653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhH84NXX33T2mx07NdMMkNioRpn5lPJ7BGqiQz9oSTU=;
        b=ZV1/iDonZRmnT0t0HfhozXX8944cprlHRSnnyopacwogM7F58YfG9TWSstmG3hR4Vb
         oVd8NEer1HHQjA3xM/0oi14fr64jakunSYa5FnBa3K3Xv4is00RZD6sFN4D8BeziZjox
         N36wZHsS6ZTr05Q3+vt0tXiPJgKqoWluPlEVytW2GZ2MRWzy6J+EbfEcVcMTQwp1Q758
         6CtHd0Qn9B2XPMD8kiGOU1w6m2vd3n4vefQ8RyLfBMG1i22/TGtAscymkYAn73OmlgGh
         w5NnNyhJZuytLSnWV8ONiat7P1MHacc8OPWgpEkK6TDxCjUNnIH1dFySeBiWrc5QW3My
         mD1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+E1IhNpT2HVSXuizU2+hSRExVuNkA+LFfm4SmoEjCRpooP1rjQDO8OqYPC1JpEtm9A5Un+2rj4G4T6u3Eh@lists.linux.dev
X-Gm-Message-State: AOJu0YzvUAeG+9glo0G2+kSLptbsK5P40FFJvR68KrktcHL5sRqKL6Ia
	fkIn6MQnBBR8Iwgmo45cTZZT3TgVgzJXnTn9B++AbeqbLx5tO1pVOCsi
X-Gm-Gg: AeBDietIKvvzsaG96O6I6Qmz43ZZhNWT120dLTsfxEGIV3o7YuFyBo0tGQXYSBw7ZKu
	4tHiqV1L25X4icwVhOWHBROX9fxXtp4VVnd601y4LZKQT8pAR7Cqv6L+YlYVgw9LGg6Jpjkzxgt
	q1hW+xERZCemfWz8UJBsWQZi8xmxUXlW1ktmAVmzq2BYOgh5dqUt3QD00fLHJvEVMZrRi8cGwxX
	9RZsVFplp1FAOzuGmiaHFOeXL7nPlAY1pEqIVJwV11Z7wQ7Hj2JmcfH08neZ8YU4a4MSxFahDAW
	1brdELvu89T8ZbMOzNEKRe/Zjta0OeDf4LF+aqjGPXRndk99LDS4kMgp9S5Ei1OJd7cBKiErQpW
	TuaeVSUwb1h8GANmmEFcQg45DWaAbBO+dJkxRvq3a8+XZh8VtyU1o9c3l3yaao0Np93a3Oaug+b
	QMq0R4Eyd6YIIytXVoQ/0=
X-Received: by 2002:a05:6000:40cb:b0:43d:1c39:593c with SMTP id ffacd0b85a97d-43d642b6a52mr29169874f8f.30.1776242852517;
        Wed, 15 Apr 2026 01:47:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d665sm3372873f8f.7.2026.04.15.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 01:47:31 -0700 (PDT)
Date: Wed, 15 Apr 2026 11:47:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix missing frame length checks
 in OnAuthClient
Message-ID: <ad9QoBHfCdJuYIw_@stanley.mountain>
References: <20260414213959.1028301-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414213959.1028301-1-hossu.alexandru@gmail.com>

On Tue, Apr 14, 2026 at 11:39:59PM +0200, Alexandru Hossu wrote:
> OnAuthClient() accesses pframe without first verifying that pkt_len is
> large enough to contain a valid 802.11 management frame header:
> 
> - get_da(pframe) reads bytes 4-9, requiring pkt_len >= 10
> - GetPrivacy(pframe) reads the FC field at bytes 0-1
> 
> Additionally, when pkt_len < WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_ the
> unsigned subtraction passed to rtw_get_ie() wraps around, causing it
> to scan well past the end of the buffer.
> 
> Add an early check against WLAN_HDR_A3_LEN before any pframe access,
> and a second check against WLAN_HDR_A3_LEN + offset + 6 after computing
> offset to guard the seq/status reads and the rtw_get_ie() call.
> 
> Suggested-by: Dan Carpenter <error27@gmail.com>
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

Looks good!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


