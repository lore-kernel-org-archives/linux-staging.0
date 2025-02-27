Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D91228CBA
	for <linux-staging@lists.linux.dev>; Thu, 27 Feb 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650402; cv=none; b=qDgW/Tvj/g4lLDfBGPu+mtQL/ENe8eQ8SkhFg13cNZoaxfJvU8esTydH9rh9zQUMgwdehfAfNzbQawyMUz70KPn37J1Il7ODx7FTdfAkW12qc4nMPR4WQA1o5Md9VWn9deZ9bDKDr3XYX1EKDydh0LeBiZSqAv4LtGAf+cXyNfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650402; c=relaxed/simple;
	bh=Hxy4zLP7nPAij63gn8nYyXPjhnD7qhC4nNggf0uoN4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogrpAuqY2VgtntOCfG9VRTMtRxRsMv/fGSdvA/Z8Dlo14SIs7BCyp8G6NzCZAGsN9cMQDFZrwZkkR350o4yRlqUhky6BQRiVh6txbqoG8CwK41krAzo49iN8wULy8RK5iRIlunyPxngw5ANo1P3fx5xvWi7SSTRbLvcTTwPvijo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xjxybo9G; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xjxybo9G"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb81285d33so146816266b.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Feb 2025 02:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740650399; x=1741255199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIHFyw4DJimMnpIl8i0OzzVtEtYlzfhRkm9JXG7+7wU=;
        b=Xjxybo9GGhelLpyevjov7GaKOY3/8iLlzjtuUMtKrn9xmh79h/KipyDpFwM8mlbtvQ
         4NR7GeuciqlYn1E18SNXWUdbrMl14SMumZYMF9dERSO6U+rqe5DFWeXqJg34br+UdVsW
         ikjD2O53ll8Q7Ur3a8uFQCgfiTnujUPrwwnrXGaSmmiX6dB5ULCpd8eEUGL7hnWOjcX3
         G9xGwXmWpdKCKCQfqhFXfR75xcajs5uTMQsAQzS/5ANAb86iccedzo2TgGjqx3MpZVry
         YcW/GLGDjSDbhudAAjmej7XGCo6gYuzca6pCA3OgiqYQdm+WPlNeeLsTOX0JcT2v4obP
         ovEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650399; x=1741255199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIHFyw4DJimMnpIl8i0OzzVtEtYlzfhRkm9JXG7+7wU=;
        b=HXYT6abLOJ0XgaBIi5ih1Ph4WihpmSE8VAp0chp+bsJPgsvV6FUiE1htAZSsa/UkSX
         PwsWFcaGK9h3IrnRwA+maKB3pVnCcaBcRVEbnzOsHuZ98TrkbBJwLleLfDDHJM4UFmAJ
         vAPMNQzZrCJahOJ3cwUXa7YFKFCjWCKdNzhpKpEPB4+ke/I8XKEliouCiHjZwZAhkIOY
         4n9TUJqX+1KVYFSXIsCuf1O2y745X3jst9hJqLXN1l96KBd8m/10M/jCb6Wj9pXyhQiX
         ptH/mtgLB3evpRiRb+rxAkxa31intpfBZvrdgTi/8M9MvI/C53kYzjHmD8R9+YR/O1Ss
         Oebw==
X-Forwarded-Encrypted: i=1; AJvYcCVuvA+BfY2VYoZ9CdMFNuPSai/9PHFnUuinwLDZIAqMeNpasVHFDmRzan56o3+WJpwCrS58Uf+CTg54rIec@lists.linux.dev
X-Gm-Message-State: AOJu0YzmAqoPlTKLmMD87DTUcr4OJDfUttDpRzo4do3JnMczPexTqo/Q
	mX1W4ZvyeclrC52KM5Ou8w2DTEIYZCuyivBVd84ugZVaDPumXfvubcjgiXCU0VI=
X-Gm-Gg: ASbGncsdeH4N97U49fw9hP5Wdgz9OcvvhCNJuLP6g/SSgfFsN6WjwsbXaa8WCKsT2zW
	mbf4DhioexHOrfL3KJPON0dY7MHxKjxFdx7VKa96szOKxbi3EFD2uZypAsfy9SMMtrurElIW76t
	yxm1418oEWkMb78ZYXYO1C3eoluZm+/fvP5pi+yuQ5GMm/jGy2cfMO57cBMEPG7atUb78bOid+B
	tLZ1toNwBVVubwMJ+y61M7FP09UBx9GU7LaNxzR4dpGoWY/FJ/Wvq1+UuD5ivlFxyBeBjxZzn7W
	MHSWwZfPQijrqWjYYWeqh3a0QXTFiao=
X-Google-Smtp-Source: AGHT+IHunHmqDDk/8KV7z25yVlfx9n1ZmOsivVdt03USwowQNbi9YBZAEFtlG6SH7Vi2b3fPs6n3vQ==
X-Received: by 2002:a17:906:7cd8:b0:ab7:b5d9:525a with SMTP id a640c23a62f3a-abc09c1a653mr2285136866b.37.1740650399043;
        Thu, 27 Feb 2025 01:59:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c0dc21csm96948866b.42.2025.02.27.01.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:59:58 -0800 (PST)
Date: Thu, 27 Feb 2025 12:59:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hverkuil@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: imx: fix a potential memory leak in
 imx_media_csc_scaler_device_init()
Message-ID: <d09ac514-be27-46eb-8b2a-1a397e3321d6@stanley.mountain>
References: <20250227074451.3698971-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227074451.3698971-1-haoxiang_li2024@163.com>

On Thu, Feb 27, 2025 at 03:44:51PM +0800, Haoxiang Li wrote:
> Add video_device_release() in label 'err_m2m' to release the memory
> allocated by video_device_alloc() and prevent potential memory leaks.
> Remove the reduntant code in label 'err_m2m'.
> 
> Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
> Changes in v2:
> - Remove the reduntant code. Thanks, Dan!

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

