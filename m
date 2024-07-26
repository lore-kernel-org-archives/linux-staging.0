Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B265617B434
	for <linux-staging@lists.linux.dev>; Fri, 26 Jul 2024 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722009933; cv=none; b=QsrLYno6BeUZmkVUd0UvPkM6UNsP++/kHeejBIFI/+jle/1xp6pupKQtxTZMo767lwlhMUgALuVhWvTLiOc7uCqSd4tBwDVdCUny42Fb5V7BvKvsC9L32qcHEi0iTusl0cPqHA8fVbZhMQJ/u/T07K+J9JnRN2iZKjhWgjmdydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722009933; c=relaxed/simple;
	bh=2MbdNmKtwPeqOyRsREhggpkzEEHLVnh/W/q0rkLYlPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUtsphVF1GJzqnybV1/cCQZjdNcXh4aQakdpL1KQlWNbHNHFvMpKWNru2pOaO16UC3Nl/vj/bjd3uCsVMrKEHRhb5zPVD8SytXCYkunXJLOQD+w74IJ/wErwNiZ4x41jJRry/aF+EtPGfFdqigivr517MBZXzDjbmRoCrLRY0eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L2uy6PIC; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L2uy6PIC"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5d5c7f24372so442199eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jul 2024 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722009930; x=1722614730; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvVt5nqDEIRc2f/L7PJ1Rm2eKJYsGEP/DbZbM7/vcvE=;
        b=L2uy6PICYBc5+90JJi1jx8JTtMNEjalsRb4cJscT1tC+ogLVL/k6UsjblCJSHYfiH0
         bun7scgSG1vEvI4rJXvROQa1ESsc/Vnh83co1CqU0wp6DqLLU1xuOkSJVTz831LkpDOC
         DDNjS6Fs0JsQBymmW4AaWRA/XGAkcAwRxisWhm1oIkIP3inyZrnSfqTHtWk6oZm8fIrs
         cLzt8vRs1UYKQVQ6e6tIsvlyDmb70o0H05NPKvxP52ZSE1WD19nxX7nER892bg0WY1qZ
         GCpXGiS/MMIX6NgY4i7ZOphCTmVbFU+d2Cd70vyoT2OeniiS9F/kmL7/U4VQ8743/hhE
         pX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722009930; x=1722614730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvVt5nqDEIRc2f/L7PJ1Rm2eKJYsGEP/DbZbM7/vcvE=;
        b=X8lXsea445qLOSQVbA3tarjVTOs11jxnZ1CfPm+zJ7mTDlhfb9OBk2o1ThjZzSuR40
         ZvqQ9LdA0SFhHUPeviIDC9bqOa9vBURtRBU7ZXz7ikjftqf4UfxpQjW8cWRHJlb1FGBS
         d/3WeBaztz/a767pjXM2LKnxL36iUFDve8nuauVN9Xt299e1eb+ZELNKEc5F42VZvmMD
         FtjAzwyuJF9CeavlKPabOAQ8hlbzB1ME8keNnLrv3KZGN3HNbU/tCJ5iSpLMEmqWax7l
         ApUeTYScpYltM+g2YlON4lg16lyEvAfRbGKkz5dprnnvdiYHgIg5kWUTJJtpRUxxigM1
         9DMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbwCmkusHJTv5ayiGfAP9t3+pbovrbrEwCJi16qYVMJclE5Qx2m3iRAKC5AL2VS7N3/K4E4p4WqS0boqbugPtXIokmUDb5pJCG5eePUw==
X-Gm-Message-State: AOJu0YznIQp6KpPtgfyzRungwFqp7/ZQiHj7Aup8ZxhILnnAemQ3Of71
	fTS41VwV9x38NFeNPoNjlsKUj7FPQ9CL5McjxD6fcHweobD5IZbfpAEH8Kdo11M=
X-Google-Smtp-Source: AGHT+IHMViRYg+LFHUT03Gbqr2PM6XGJAYoYIxG9GIgcChTJ6CaHiGtRIicZYyM4DJVQU0Eicwe+lw==
X-Received: by 2002:a05:6820:2292:b0:5d5:6733:ca74 with SMTP id 006d021491bc7-5d5d0d99472mr50338eaf.2.1722009929830;
        Fri, 26 Jul 2024 09:05:29 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:928f:fdbe:c604:7b3f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d5b346e0c3sm436523eaf.3.2024.07.26.09.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:05:29 -0700 (PDT)
Date: Fri, 26 Jul 2024 11:05:27 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: omap4iss: add check for
 media_pad_remote_pad_first
Message-ID: <f61bbcf4-ca29-44c7-bd27-3261781a1a91@suswa.mountain>
References: <20240726072814.3534601-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726072814.3534601-1-nichen@iscas.ac.cn>

On Fri, Jul 26, 2024 at 03:28:14PM +0800, Chen Ni wrote:
> Add check for the return value of media_pad_remote_pad_first() and
> return the error if it fails in order to avoid NULL pointer dereference.
> 
> Fixes: b2e44430b634 ("media: mc-entity: Rename media_entity_remote_pad() to media_pad_remote_pad_first()")

That Fixes tag isn't correct.  The patch just renamed the function.

When I look at that patch, the isp_pipeline_is_last() function doesn't
check for NULL either.  Why is that one different?

regards,
dan carpenter

