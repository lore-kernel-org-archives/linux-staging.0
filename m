Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319CB236435
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404500; cv=none; b=R4iECarG6qA2B3K8agQVO+Z0+RyCUhieIBu8WfMNaDlimve6mErfZqS55WNtshiLqONfTCvsFGB8DFX/KW3DzlbNEQ3vrr0JSTOEOff3ghRrOnIqlktGUQ8uqxnhu+YkpG7S9qR8Tz1j4firTMPyyCaQ/Xk4PVrsSL218hpNsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404500; c=relaxed/simple;
	bh=bPYYoqftfSKsz0hlk498WcRINtzXQZnNUseNh+Begto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8lVg5EZq5U5Q7WlH1jseaNZyNh4u20TezXvMOnrKjlWvqjLSL+Ma1UiWL/ytnfVs5G8qa9Pb4cxEQV2PtOCvatdf2zgUGSrc8YBfMNzzvUUb4VNldpbTB/gEMzNLKfwJ7Qe236KM/u0GrFXAIwXcO7jD0PJ2CEEETCjqKGjsWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VvC0MdPr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VvC0MdPr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3e5190bca95so1812336f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Sep 2025 00:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757404497; x=1758009297; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t5sZUHke1cOrNWY6qZMJoyROLt4T1nD+uxD+OwzRsAo=;
        b=VvC0MdPrg7z6VYENqIN2WjSL0iCETulDqJi+7n/jsewmlBJOlfpByBAojns3g97kur
         6EVuR2Gpe3Y0FO++r8l2WDNneK7UcZwu6/TG8eVklooeiXI5nstr1xOJiUEGgxA2fR1Y
         9AdBB/Pmrgo2mI4RAd9nY9Nr32EMtheKVmP0di40hD3qKZ6AHRosboWGCeGiE8YN3I54
         SyLJpVAG6rYZ2Mfp7F8cZL45wvORi3B8hVFZ7074bReBD5Cu2hwQr9rEpFXfGg05SH2w
         mJIr5nWFc8Xfi4s+AjMmr+MuLhNmrgmSZeXT3SYFNxdK2Cos0V7pQM3iNEDWLFfyAdC5
         Nlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757404497; x=1758009297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5sZUHke1cOrNWY6qZMJoyROLt4T1nD+uxD+OwzRsAo=;
        b=OIAa8/F/o9M7/aFmTs92J71NcKsj92sN0XT1YLMfF6BRNLKBKiB0hOKY40EVBSO8c+
         G5HuKoKBaY5zcvodOiH4cjFUXE0ZOKd3ORXXbvjJhO/4ztBV8UavIwe+6Lye5DWa6N43
         Otn+1QuZECEIba7E9fKg5S120yLQpa3gk0pcLkamoJuO+7fNaJ/6Ps1Eecnc18F6B14I
         KD6hJsGsZgBAQw412YrKb6k7PT3WfPqLM03eSezBa6NsW/vEE83ElcToDF4JC+qLwKWI
         h+gwP4bQyQMVdyimNPtjGSAwRhHt7RQOpLEy+3e/tzG/G87xzOXgWUj+SidwV8EgcYzD
         64RA==
X-Forwarded-Encrypted: i=1; AJvYcCXFsGr8nj80eZVDst/oPk+sq1QyAsAkNu88PJJy2JgxiqpcBRXdJzyJX2JCjEJekQgSdnQf1OYmcx7Z8+L5@lists.linux.dev
X-Gm-Message-State: AOJu0YyyKz5bKaVhKw7eSX+VLMbnT0akZnxZ2x6zPLdH5xFBIIpmapak
	fgoGmqtkm/js5EZsUD1SL4C2p70MW6DHMZGIjYyW6oJcCikS0SEU5ClWr1UfsylO5dFaIATQO1H
	XdBsM
X-Gm-Gg: ASbGncsaRXm3TKhXjg5d8MO5fqn0/Gkfyoq0fIxxzr9cRRiXrI1IPrMkHfpKj4nxloC
	T/zupcamWdnOA70MI/fSjXvax3NzLana4ynZnRpKe9tq9Uyxzxkft/K6boFLq59ooaF4Yd6lRc3
	xh57pjeDA/3mvuaHBgRqWNLdqBiScTYCnQc0HTHyn0z+HiFGNIlwfxI0B6dW7uLAuAZKGgIN3xl
	B39RIBPiLc3SKfSFiOSkYHPBdrlpEwkJyfenxHRUPS6yEDY/Xe3ujlIuAm5tz/n8MD3mgm5nRlD
	Teg2tuwDAo/SWu6NTdXs5y2VA1LvUDLhj21tGVCyNRjmSwaoey0pEcexi1dnLZc4YHQZqaHiIYx
	ygVedeZTd+TRt+bXgWpr4sDHuGzE4wBm1VQlh5g==
X-Google-Smtp-Source: AGHT+IFMrL+qpqVZLHtIpk0NAIPagB6TkPEvQUOKqRDE9Ox6P//HG3+ZZPicp7UNZIR5zh9FPOH4xQ==
X-Received: by 2002:a05:6000:144a:b0:3d1:61f0:d253 with SMTP id ffacd0b85a97d-3e64cc61000mr8735700f8f.60.1757404497452;
        Tue, 09 Sep 2025 00:54:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45deff68b43sm5564215e9.2.2025.09.09.00.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:54:57 -0700 (PDT)
Date: Tue, 9 Sep 2025 10:54:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yiming Qian <qianym1996@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 0/2] fix coding style issues in sm750.h
Message-ID: <aL_dTVlN13Q2nYX0@stanley.mountain>
References: <aL5tjv_2YkvHPs5C@stanley.mountain>
 <20250909060130.12919-1-qianym1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909060130.12919-1-qianym1996@gmail.com>

On Tue, Sep 09, 2025 at 02:01:28PM +0800, Yiming Qian wrote:
> Fix volatile and camelCase issues in coding style:
> 
> changes in v2:
> - Split single patch into two separate patches as suggested
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter
