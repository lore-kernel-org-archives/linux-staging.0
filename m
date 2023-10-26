Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4852E54E
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ME/6j2np"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4083f613275so4228245e9.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 00:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698304201; x=1698909001; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7fEK5aXyqEKNX44SGAggLq1zICRl4jXqY0Tzaon+wY=;
        b=ME/6j2npCckvEUqIdqZcKvYiZyXEN4g3DfS72hVTzjI3WzNDpwdbANbtN/IOqsBm1n
         FOSOBCL4o5A685u6Xcw4SSswX163yXLRwHHDWvMNdcXbpq6JHiZmER5aV09elA/HSiJs
         BaNvEjYCzIPbnI8eTl0foLbq9faJ/xgzLmY/W0kMxhdKNdN1k5qj+AZc4ZLCzCtl12Hk
         GLMF54BpDfmfsuETot7xVHCI+krKO+FBI4Ma7inVDZqRIQx31aWxZteXFOkvePPm+dXO
         4DJS6I9TP0+ywi7LVaIcyZFp8VM9JzzcvBEzCIC6JunnW+ZjG9NZjYsZBjhCT1Fj/a64
         L0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698304201; x=1698909001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7fEK5aXyqEKNX44SGAggLq1zICRl4jXqY0Tzaon+wY=;
        b=Qzs99V4OVBSBdpKqxisrU2y/ouz5lsz7nUc3vlQOdlAsQcpApV3Zl+oivMYTuMFNxU
         I39ruEHPpPHrDp5GpDy3G8/N7p4TS3BHElMx0AqypwXClwtp6YsyK/nfBIbF7Feit8fD
         EwwUPQfNn47iWZWQ7owigHQJ/xUiGQ6u9xZttTYKsR10GqEIOuithGcBxQmB0f2w9lIt
         ILWYz7A96xJ9B4vu0QfAVD8FSLNByYE6p84Gm0XcTKzebVsmfsqnEE+bsew8SYRXM8Nm
         9d9ht1mW5KTMAi0+YWHF1Qk0a+i5feYcbvGlSN3iVjZ3IGF47ZEHdYexh4r9BTN78UtL
         G+PQ==
X-Gm-Message-State: AOJu0YwrehsH3RiGAGGS3WqkLdnoFRrgiHiISja3jt2wrEvLeqxpyEe+
	vNjvr3riLcgEDlSJBN7SKL3DHw==
X-Google-Smtp-Source: AGHT+IGaxyNX9QK9vfCs3UP2UmC2UTrq44i+jptffy+/gtg0PWTyu6iNg8pwtl+f/kkIMVqoQMPalw==
X-Received: by 2002:a05:600c:5493:b0:406:5463:3f51 with SMTP id iv19-20020a05600c549300b0040654633f51mr13710896wmb.25.1698304200933;
        Thu, 26 Oct 2023 00:10:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c029400b003fe23b10fdfsm1678918wmk.36.2023.10.26.00.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 00:10:00 -0700 (PDT)
Date: Thu, 26 Oct 2023 10:09:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] staging: rtl8192e: Convert array rx_ring[] to
 rx_ring
Message-ID: <e9bcae14-4667-48af-b7f0-1e4fd9bd9560@kadam.mountain>
References: <cover.1698295861.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698295861.git.philipp.g.hortmann@gmail.com>

On Thu, Oct 26, 2023 at 07:43:26AM +0200, Philipp Hortmann wrote:
> Remove some functions that always return false or zero.
> Remove a loop that is always executed one time and convert arrays to variables.
> Remove some unused constants.
> 
> Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
> Transferred this patch over wlan connection of rtl8192e.
> 
> Philipp Hortmann (10):
>   staging: rtl8192e: Remove HTIOTActIsDisableMCS14()
>   staging: rtl8192e: Remove HTIOTActIsDisableMCS15()
>   staging: rtl8192e: Remove HTIOTActIsDisableMCSTwoSpatialStream()
>   staging: rtl8192e: Remove HTIOTActIsDisableEDCATurbo()
>   staging: rtl8192e: Remove loops with constant MAX_RX_QUEUE
>   staging: rtl8192e: Convert array rx_ring[] to variable rx_ring
>   staging: rtl8192e: Convert array rx_buf[][] to array rx_buf[]
>   staging: rtl8192e: Convert array rx_ring_dma[] to variable rx_ring_dma
>   staging: rtl8192e: Convert array rx_idx[] to variable rx_idx
>   staging: rtl8192e: Remove unused constants starting with MAX_RX_QUEUE
> 

Looks good to me.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

