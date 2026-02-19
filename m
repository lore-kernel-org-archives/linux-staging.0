Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280FB32F761
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771489129; cv=none; b=GW5P2eGSgVmkRiLR8RVBK+BKqpChUwOFncolSyQ/TB6EPQZRmfUDiYtI1MRPJTDiA0BI/I/VOn1nTUT3RyZlVHUZz5bInblqUR3iLPl3EbRSh0jYdeAkCpaSqcThR2g1Jo4acD0K8lMCv7LSvz/s/Vy2WqBxeKjK0d5bIj2iUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771489129; c=relaxed/simple;
	bh=25fFjG+D3oG6/FHvCcw1tDZoI+FYC8FVCy1xsCiumGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIqmvXdlZG7BrzZwV6lCWMGgzGdUZHnu33dRpMF9AeIn71vhlSqxTMjhGDYQkB4730YtZeg/eOAy6hGjnnj+xKNVojXWTCqu/56k+EmmcYiQbg/caqK0ePnMIDEuZDHXLXXDBAUSzbXACIBvJtMlhlpUN/DRg2pwdLTL7hJYW+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dYtdzNDb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dYtdzNDb"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4359249bbacso1098643f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 00:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771489126; x=1772093926; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d07fJbkwY2gCz5xybwCJxh4H8QxouBn3MykfLYVImdo=;
        b=dYtdzNDbEjXxCFo02iTiaDUj7iytryLH0h3Kth/irlXKjQPRhDUFfX4nnKvOgAQzB7
         mac75snR/YtkNzxfvCDOocqG165yTI/6X0EQfpgLpWZbfbfzOQQmF3RulJ0SHBYyvNlu
         P+9GUkrpYyEP5H+48MSzQYP7r9SQ4w6DIPeZ/vQtWjWUcvS+hTT/3zW6t36h75dBzUk5
         r/uyX9Vuk3ayF0XsfT7RYiLmn7XRMB1qTX6/rs9Zx8a0DZ/qi3mGZW6YPyJ4cjElK0jc
         Es1C7NKqjNmH3ttgf8Yu4HrFy4e216kXPvIO9x5VhPUqsT2jRegQ9e0k0nN9SyuxJTnz
         5KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771489126; x=1772093926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d07fJbkwY2gCz5xybwCJxh4H8QxouBn3MykfLYVImdo=;
        b=uOTo9VUn1EoOCZhi8VTH+9HYj9PYe3JNDla0f92u6pwnPqEw6bQK6p0Tob4e09BDTm
         PZlBEZaOKg4mpN6M/ZQ9hsEBg/MmiCc8nDqJ9H7jlrYQFotNq6te0t788dug66T2kidq
         S1d+Jtitqd3oADt/pZzePb1FW82PqnUwWRX3BbFQ6HkNLiQmdEZA4lviOSr7itjrnZNB
         i/P1EqlpmevPqf2aEDRN3QH9wOs09QlSwroPZN3BWL61AXqaqIlSq7nfgNFc5q7jMsL8
         l8h93ublVZ0XPF3Fo8X5KHwYId2nGjLLPmYTX5dCtMcr9tenO5AOOZjZ8D4//h/PkPqL
         s9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7+FYEADY44UDlUhUaYtd6jgl5yerUWXahdIyrVt6xx0gS/fPkG/IBAPyrRtkvysQMuhWWTWWlZk42xKuL@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3W/3c2CBPio6VCeim2OdIopiY0uSGQxTYyMtijc++aV1hXBGh
	DrkzBd4/TM4AHYcURNS42OkB56zjPfTnGkev9pgtDFMDPithxJCfdXUAGLpni/4mA9w=
X-Gm-Gg: AZuq6aL9UmBjAQ28J2AyYXi0+htw5K1lUE23+4LUDDid6Q7qHlip5lxT75q7/A447PF
	kkcpNyjbfEFL3kNre5l79U6oSjmaHZ8jQxpQQa55v79Tf1McB2sy0kB4Y8Efqmi6a2WTtx0m/9t
	Cwrlzn/AFvGpQJ6RYLN0njhnI0o/3e8ugsacpArWImckpPWxzfxzBpPS02ohLBFN4FSSy0KdGi3
	gQZfC8F1q99Q0sCzcRHcZkXtrTqzSBq3FSJYPP07OuL0vFooDJxK9nhHIm4xwPvnUOzEMEqs/CH
	7JYgFB1rQEInHArvZG6NgS2CM2YYv/pQMfxUwqHxsyR64rK8obtxG+c7sRMmHAnQyZJRPPYg/57
	+SigmZBo8msIPcH0INWX+7ezaXpfQXcIncpAPWmpmpmhA9kfp3LF69bnTYWl+GSvPScjvhpR+Mo
	Hs2CiFzW9w8LQWupcxmbV0y9OFsrYL
X-Received: by 2002:a5d:5f82:0:b0:436:36cb:70b7 with SMTP id ffacd0b85a97d-439626c745emr1549552f8f.7.1771489126216;
        Thu, 19 Feb 2026 00:18:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74918sm47314947f8f.17.2026.02.19.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:18:45 -0800 (PST)
Date: Thu, 19 Feb 2026 11:18:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: most: dim2: fix error handling in
 fsl_mx6_enable
Message-ID: <aZbHYtevVSHrAIR8@stanley.mountain>
References: <20260216201921.1788-1-iprintercanon@gmail.com>
 <20260216201921.1788-3-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216201921.1788-3-iprintercanon@gmail.com>

On Mon, Feb 16, 2026 at 08:19:21PM +0000, Artem Lytkin wrote:
> Address several error handling issues in fsl_mx6_enable():
> 
> - Replace IS_ERR_OR_NULL() with IS_ERR() for devm_clk_get() return
>   value checks, since devm_clk_get() never returns NULL on error.
> 
> - Replace hardcoded -EFAULT returns with dev_err_probe() which both
>   propagates the actual error code from devm_clk_get() and suppresses
>   log messages during probe deferral.
> 
> - Remove an unnecessary string indirection in the clk_prepare_enable
>   error message.
> 

Some of these are unrelated things.

regards,
dan carpenter

