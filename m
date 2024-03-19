Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8E57D088
	for <linux-staging@lists.linux.dev>; Tue, 19 Mar 2024 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710827657; cv=none; b=tOj2k+6b2BSjxnN0YqEtEP9eXda0kDKYXK+7MqKKknhXbdKfJ4hHZQbsyrPyGo27cB6VluP3epsmF/QVESUwNgS2oaQJNt6Q4iW9SeuS/UQbWm5XufqwD2LlH6pwVyxskvZnvEDTJMm7+vhQ1YvW1/asvr8eyDSI8jAyX6NKI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710827657; c=relaxed/simple;
	bh=1hih6VSpKV8xqGVxi4o4YhgWg8A3pPntjmOFpkgpVZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFEVLZJcXd54RyL2B/bpy41ToSJLsW9YeVJT9FVDhYcjG4MYqv43HBMcKQ4A6/AWHqVy2NNvan5UnkvSkMMLpTISbrnODvMA9umLYyNnHULOTwAtxSBw3OQKHtgSFFDsT4X7b7ZCI9VC5ycqMtzrxJ+rbuDW0yUKN+k7wBkinQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LvWF4hui; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LvWF4hui"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34100f4f9a2so1381557f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 22:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710827654; x=1711432454; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vl6AA9br/anlnpNsGMnkWOpzBxrWrKpWnKKq2r224oo=;
        b=LvWF4huiKEzryCqg3DvlOvgtkRXaFuhiP9I+og2DIIBOVXlrr8EEXuCZL/IA1Io/64
         qPXhbuXz5DQUxuHFMSM+KzBhZVNaqVEe9qn/7c4ZUavQnPHV0JqZ+ShLLwGDWgrE4cWU
         4THJ4OY41bn3nFenaWw7tkS5t4U8CP9jxlV3xZikDCEZNmTXhN3gvrfYQH+d86aU6UdH
         L3uFH4RIjmAOHC76ZKByq9v1c3DGjDsnGi/yFBb67XpKMZDNNNZFvg45OXatMV3On1PS
         YqZzLsAzbHubrp+tgocLcOICADOZwP6QRXihW4di1lxc7mYWnZoxPCexfPjlMSC32HbE
         zLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710827654; x=1711432454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vl6AA9br/anlnpNsGMnkWOpzBxrWrKpWnKKq2r224oo=;
        b=uYF97vJHD4RPvroyUxt29HNSFPh+KVmOJXGSoEVjNBdKqNYF3bHiloX3MepygEE4GY
         ZOyJgleFva7fvEB334csszEnEwJ4jU43wFP6c/pt5AitEjNz9yMGY34ZBr4J6sF464On
         1xtl30eNa2bH4cp02/l3P7CjeUF9c1eBGT+sZgd9z4Y+7fNAAIWMmk4PXYdFCgdLeF9t
         Xcw56PE9hhJoA97+1kwpNzLfa/CZi7CC/B68K3s6lTZwc6CrMsF+AJJAiogO5PT3y7vZ
         6bUBDTWDniPI8SAHoBC7yNPTjBASQ3S9dFsFsTbPNbBh5niaWt1H2essFPPD4TtHrSgc
         eARQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Ec9Q4DQXU6TiHMz4mZqy1yi7yLNfizVrrAda1W9ypSRi+bOEeJ77pIgiWa6JX4FL3Q1Mpuv2mNw60IrzzYXCYCZfHRQWanFOX45RvQ==
X-Gm-Message-State: AOJu0YyQkIXi3KQFx8WCxEU6qTpLlDjF3iOL01WzhJqTTRzX08QNqHI8
	+jIbiP7n3yqOnPYNRIyfbftlZeRQiygJ0X7fIK7mYDMlmbBkDVGgu7bp61LtvRs=
X-Google-Smtp-Source: AGHT+IElLSQLz49jl6r3n4FmIzslQwWn+SuuJwo5rV6apuyC+62iDEgiFx46QapPIPE18jQwDqHimQ==
X-Received: by 2002:adf:a494:0:b0:33e:6a17:3e63 with SMTP id g20-20020adfa494000000b0033e6a173e63mr7815867wrb.47.1710827653420;
        Mon, 18 Mar 2024 22:54:13 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id z5-20020a5d44c5000000b0033b87c2725csm11418889wrr.104.2024.03.18.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 22:54:12 -0700 (PDT)
Date: Tue, 19 Mar 2024 08:54:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8712: Fix line length exceeding 100
 columns
Message-ID: <51060bc1-7d1c-4687-ae20-864e65068858@moroto.mountain>
References: <ZfiNNvks6v0JGhRA@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfiNNvks6v0JGhRA@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Tue, Mar 19, 2024 at 12:21:34AM +0530, Ayush Tiwari wrote:
> Split the argument list of the kthread_run function call across two
> lines to address the checkpatch warning "line length exceeds 100
> columns".
> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> 
> ---
> change in v2: Fixed the alignment to address checkpatch.pl warning

You've created this patch to be applied on top of the v1 patch that we
are not going to apply.  You need to restart based on a clean repo.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

