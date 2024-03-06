Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3E9131759
	for <linux-staging@lists.linux.dev>; Wed,  6 Mar 2024 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735191; cv=none; b=pz81p2Out27svr2N1Ij9F0Z9i2sGpn6BoSRbOdro71dhOYf4nl+Q0XXvtGw4fCmR0VpZ7XkFxTe5dNLw58PTejm4r98lWWlN4YfVqxljx7RdWCU/0XPb1UTeu2D9aemV8qB8Pa/8ICpF8ceGHVOxYmqyBGu2zi7eQ0c/V7mVFMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735191; c=relaxed/simple;
	bh=NFU1mATLRRBJqrorShDtM8d86bmqV3E0R8MdZOK7Xig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YARLcFW2v1m3H756kuPr6OPsHkuOLVeDKu8aJFHwNDuUdhZ3KJk/DWM/DiR53pKf0Fx4G3Ae1SEBvRIfcfhKDx5+XXOy9AxvY96NccCFJio1Mu4cCW4DBB7SAo7NcNrWNv5epTCnhaChuTJt0SlKwnGnd7SdxY3CER63Hub82Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=slzmpLQ2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="slzmpLQ2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412f5e905e2so5330915e9.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Mar 2024 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735188; x=1710339988; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sz597cPsAWEUKOTFznKZhGZK0K5yCCqY1F6ggOkfftM=;
        b=slzmpLQ2Din/XR+7HsQJuo6HIZKsjO6vZl1heHHc9RVAHjzXJ2YhnWkewf8+tvL1Zb
         INEGScAsmrzJvz9lNhyVU5WQcl7Soi/3PRNrDrBFNsJ8ifLVTIh4GKjTlrM4L53aZxH3
         2fOEtp3LXXdw9LXisJKVVLIkjKslg8prFIdIHOezBsadUFpyoIPKrVtQw3dkkCAcauW2
         /70C7HYdiJ/XMhGFq8ewtqH2cyuNrEAPuIa6+fXALIfPsouqzuAFNZGDsTcIzBHCtMBf
         tryn9c60wY7ruxQK90k8v6evRa5kuM9bN10IINzCg/4l24NLOfyfY6a5k2eC4F+9+U48
         zHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735188; x=1710339988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz597cPsAWEUKOTFznKZhGZK0K5yCCqY1F6ggOkfftM=;
        b=fdnPy/16U9pNxxh3HGvBVkquq7vBdijbwdd0PJn2NPiS37lDp1xRaKhXCqlnXCco6D
         6JfDrZ/lJi0opO/vypoGocvPP4L/CLV8qwsTrBl1PH/q+3bnhEnnTKvJ3FQHoZ4zC+pE
         jcI7G9kW0dMhPxWrr6PcXwxeVwEYlSYw6e2jHkVWnzXG5xR0xewveTdpfCFWrpvHHkGf
         WXRFt7p9thkxgb0P04ImTCSlIkVAKpBpDDac3MkaD5V0hOv41d5nHWzsmT1slnNUYzx3
         ACVLkD5i8pYPlu0i1mhm/akGMo1vjrODmCrsaGSOIn0zu0m9blhgmgtVmbyxa9DmcYIz
         4icg==
X-Forwarded-Encrypted: i=1; AJvYcCUHE0dmvDFEZRVbfo+bI+hOVaLvYmpL4X/7rXqDV9eQy/CBm3udlTvsnxvvBn/o7+cYkCseRixosrqpYOVCYgyKuDhmYKd5wOZ75OqrMA==
X-Gm-Message-State: AOJu0Yy3+U0J0RizXltFrJgUKXtjf0tb/g0Facb6VXKmTrXoPk9fT0r3
	+J9D7x4C5/skD6zCAoI4rO1bp1Ggut+97COoEyNMM+xeC+77K2sRdkWXx8nZ9V4=
X-Google-Smtp-Source: AGHT+IF0YddF+g3tLcQDMU53CKKJm1hZPkdzoF7aB0gEjJiiRFsHLJHMcGngoj6lxG/F3l6jAhGIYw==
X-Received: by 2002:adf:fc8e:0:b0:33d:284a:401 with SMTP id g14-20020adffc8e000000b0033d284a0401mr11678384wrr.68.1709735187795;
        Wed, 06 Mar 2024 06:26:27 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n6-20020a056000170600b0033e45930f35sm6077958wrc.6.2024.03.06.06.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 06:26:27 -0800 (PST)
Date: Wed, 6 Mar 2024 17:26:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 6/7] staging: media: starfive: Add raw output stride
 configure
Message-ID: <9f346733-320d-4a7c-95d8-1eb2e5cec22e@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-7-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306093334.9321-7-changhuang.liang@starfivetech.com>

On Wed, Mar 06, 2024 at 01:33:33AM -0800, Changhuang Liang wrote:
> Add raw output stride to enable sent the aligned raw data to memory.
> 

Subject: staging: media: starfive: Fix raw output stride configuration

I think this is bugfix?  What is the impact of this change to the user?

But I can't really understand the commit message and it's hard to review
the code without being able to apply it.  I'm also new to this subsystem
so maybe someone else would have been able to understand it better...
Sorry...

regards,
dan carpenter

