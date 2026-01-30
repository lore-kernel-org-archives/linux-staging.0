Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB8B2DE71D
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769763492; cv=none; b=tV6ytCqBYT/InbZooUBDAmV1ROETPVjoF9BYve3e3ky2q0gOJTqGpfDMoGKiLzwp3r6Lqiwxl4VnKcR4nTb+SlUmMByVyDgESpMWh7CATStUL8Npz7AxXoJWFGGGPpWqyYLSNuEhlKeCKczn3/JgfmykoAyDLxzG6iZQUss7i/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769763492; c=relaxed/simple;
	bh=WhW/zL/v333Pm7WSuFaDJwlZ6ddMQjL55UX0uJnq3PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHAZjwJrWQ7PKBhPor85Lsf4ibg9WSpBiC7bnd5HNz9M5bvAIjMiN5GbHkDl5xpyrorozztML7kSfU1TroxPZGCjPsnCWgT+aypZehmJfYieQhxrB1DffkT1ymMY7of5o+cHXKzRgZPhMjnT0thEz+VLxWL3DRpP0s4Js9JdIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AKUBODAF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AKUBODAF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1149284f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 00:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769763490; x=1770368290; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cfk+So9j7LmEglWj0SSY3ONnLjxUj5/C63f6qCN1qV4=;
        b=AKUBODAF0ZSGtgB4v3dhmEThpqKOfdfEva2CvBI/RknPC/UFbh1ExOIY77grMiJDKc
         Bj0IHYNFoNXrSsTbDs40L0/bXT7fkZ8jdxWB1YwtV7wGZ2vwB4JGoemWF5dP7fWbruy7
         iSzEY2wqyLF3ysRfb7LpLfDH+oCZUH9Lw6ovoc7DHPG8E4YnxRTEwnPgJTD1MI68T7RG
         uWQtSWeYaTWgF6uiSSlSX0ViZTKTa7i2UyTtdcNEhbi2Ce999JlNnHVwqHy2DjMiXTu1
         NTxyGTlC6fDIk4NugVipNLjs0seDKuLdyNzfyfsduj9psiwmv58X5oi2gzXGdHbbBhJF
         jXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769763490; x=1770368290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cfk+So9j7LmEglWj0SSY3ONnLjxUj5/C63f6qCN1qV4=;
        b=lR26HBG0poy/HcbL+taDUq7E2WKdc/2QYAZWBClUx4CikqDqVopXAF4D9qWS77revM
         /x45lBZTWPN+6puZx1yz4eSuPmxjpqAHpmUtFgi3mIcufWcQPKYdCore5fBKY9S5YK1z
         7nnl4CrF21CjjepnEGoeNyRZZ5qaFvaQ1shoTFo6zjR5rBVH/ZNV2X0iFXJ8wmOHDOYo
         wKVrM9KqpDgnWrHneqCkt4ZAdfMIRhbypvQWTbyT1ZxxggAuLsPIXo1L62FBOsobWZHW
         o2n7CzffoPT7tHWtnQAxoyCXK4Cj01V12ieO2FItNGHyw/O0HdLnXg5LGcy4Jlb80tnr
         44vA==
X-Forwarded-Encrypted: i=1; AJvYcCV2c7hG8Q7T9kiVSaDsxF6m30/wFAXj3AgxwB9qvsDB/WTR3aNdANpj9ovIRREX1SrOVcvlF7iK0n6QSXU5@lists.linux.dev
X-Gm-Message-State: AOJu0YxT1FsBqLqpVWOHHP5dPlW730sYpEQkfmtvRkqn9gfekZCsoX88
	QKHIuDJjiC7hmiaZDl/bVPZlfCLdVVHcyO5zUZDJpSZWJcLWJJJSc43et1pReFCuMiGDnL6cO2W
	u8ihL
X-Gm-Gg: AZuq6aK1bKJeG6UEQjxRUqtHWlxXJkgv9gwV0EWdjqXEH6rjm7oRiuXbCHTHMfmMEgj
	kcz5co/QcguZkv1EMS719WcrYTlv14OjPN7l3J9vod9MRawZw7dX9Rhp+yi7jXiju/SIHZjOlQn
	7Pc4iF3RgYEd42fW56a+jWxOGPZ5v7Owuon261r/2E6rGK6ykLcBqkWT2LnrbxTLNXAnXHJxLgn
	rTJBALanSD5kbqB7/JvB/O2gMReTnyGA7VY+sgyrCicf02mAOX6wkmCcegfYD1bKc4TGmz0WopB
	lcwCC+/SIWo1zs6sfqZzpx+YH1Vm1qggEOwHnmB5bpp26lW3bOHwjwWdiapSy98OeWxZKjB66lH
	7BrDmh7YSRh82f9/96Y8sYXRHNsW136pKgIFrM9hj/WOBKZMKmaRi95wYaZNFoJVIUAOLCa1Exd
	iZVZiQdoG5IrQvvuoC
X-Received: by 2002:a05:6000:2689:b0:435:e436:7fb with SMTP id ffacd0b85a97d-435f3ab00edmr3363688f8f.50.1769763489486;
        Fri, 30 Jan 2026 00:58:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e48a6sm20330162f8f.8.2026.01.30.00.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:58:08 -0800 (PST)
Date: Fri, 30 Jan 2026 11:58:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unused private debug
 counters
Message-ID: <aXxyndc-IWY64d8J@stanley.mountain>
References: <20260129163438.35749-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129163438.35749-1-ethantidmore06@gmail.com>

On Thu, Jan 29, 2026 at 10:34:38AM -0600, Ethan Tidmore wrote:
> The driver maintains a private `struct debug_priv` embedded within
> `struct dvobj_priv` to track various error counters (e.g., suspend
> errors, alloc failures, RX drops).
> 
> These counters are incremented in various files but the data is
> never read or exposed to userspace.
> 
> Remove the unused `debug_priv` structure definition, the instance
> in `dvobj_priv`, and all associated increment operations across
> the driver to clean up the code.
> 
> This also removes the following helper functions which were used
> solely to update these counters:
>  - rtw_reset_rx_info()
>  - recv_indicatepkts_pkt_loss_cnt()
>  - rtw_hal_check_rxfifo_full()
> 
> ---
> v3:
>  - Squashed previous series into a single atomic patch to remove
>    definitions and usages simultaneously (Feedback from Dan Carpenter).
>  - Removed stray blank line in rtw_mlme.c (Feedback from Dan Carpenter).
>  - Removed unused variable 'fw_current_in_ps_mode' in rtl8723b_dm.c
>    to fix -Wunused-but-set-variable warning (Fixes kbuild bot failure).
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---

The changelog notes go after.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

