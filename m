Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B33B656
	for <linux-staging@lists.linux.dev>; Wed, 17 Jan 2024 06:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705472270; cv=none; b=WBVfavQs8xHiGS53hTxKxiSDcMLKBfIurR8TDtw2Xb95up+MmFd9EFoM2sq86SlsNNxszzEqZqfswwHlWRpGC8m6TpmpiFxJXTOzpaSSc4elUUmH1QcxlqjqphUjTBuYdnTGLV4454zaBqoFzC0Low/LeOLaSjfvrg1IPHqokIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705472270; c=relaxed/simple;
	bh=9HbbufgCpeF1Z72M682Qsrwsj1hDdBuxzZl+OJESr+A=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EdlCDJ5UBlU6dJg6MhYWB9lx/er3YYOxoRHi5gTtf9o+TM+PyVumoJTxLN0jLqoSa9rhT+XCOI1m1kuApGNXAC3Cz6ktHrGNhJXzhUAPSE64p77nBINyIlKoYd8yFOVDIlr6YHhI5K44Zv65xBWYp4+bwcsjaJoExtjFCr31ZAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYOKfFkp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYOKfFkp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-337bfab4137so801894f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 16 Jan 2024 22:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705472267; x=1706077067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RIh/mdSxC+QwbifziEsMcuiyyKp0fbIFDG5Z0ia7now=;
        b=hYOKfFkp0IumEoIeST4lAcR2wjtrxgfYkHnfvOXrXq1vOeeTZC12KAtobEOuYcvgOF
         jFGa3yfQZr15eIArIckptxp8EdAxPNN6uHqdcZNvaofDXgGrX9Hz+aqfBUiT1rSoYpTR
         2SrbAbrCrL9FOt4VBF84N1vtr6eB6hXS/blf3JJe85ZAE/auiHyK86t3Wd3EEg7cCgeA
         2CMhR/YCTiTlS+GEz9V6Psdl9yeeWPN15UJL1zdo2Acc20JXytwgvb/ey+ufLLl6X73u
         +k+awdYl0OxuYz+eV9ry+0/zuimZ9BC5D19G6Z36vcJaoKVFcB9r80mqIe6ql2RAFQc7
         Frhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705472267; x=1706077067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIh/mdSxC+QwbifziEsMcuiyyKp0fbIFDG5Z0ia7now=;
        b=oVQ5UwrPl3hh2rxLT02oFad+q7Y/GiAVlPwEpLCbKnYI6L2kAeoslxYKfmcetSH4kz
         c299hB6Mm6sWwAVgc033sgkQRcfeZ6qlXUxedOguuc+Ukfd5c/qw0yxWApnTmVomp66c
         WUqVEEjilJ4XuTS/vCnu3vESEZh3XIK2jtBdp6NqFZuE7Lg1NfI7+x+3HEYY9zP0zQA8
         7zl1tJKPTjr79MLA2KeE34G1/aVf+gwjiXpZ8/X/wOm/XVQijwFxrPna8E2Cjif7pr2/
         IXPrLcRvaFN7GJEUGGLWObipOriMZfMyX7vmEQKJoGNu/pbnYWIrLT6lL//+8eTGz93U
         obmw==
X-Gm-Message-State: AOJu0Yw2a2Psvivryw/zKYdsc7wB5WwlAB1H1WGXDbYgZuQ4EWYSSuUi
	oDKo40Q9/KZSIVX5BHPRZ8hWcSHwqhwjqQ==
X-Google-Smtp-Source: AGHT+IEjNToRxgw9nShUjPn8KuIT4SgjhM1xOslW2JtRdjLTz9PVVr6v+9Nx51Fkr36WQYPXiuV3Kw==
X-Received: by 2002:a05:600c:138a:b0:40e:4800:c91f with SMTP id u10-20020a05600c138a00b0040e4800c91fmr4422019wmf.9.1705472267266;
        Tue, 16 Jan 2024 22:17:47 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600c314500b0040e5e21cd7bsm21036545wmo.11.2024.01.16.22.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 22:17:46 -0800 (PST)
Date: Wed, 17 Jan 2024 09:17:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hoorad Farrokh <hourrad.f@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: prism2mgmt: Removed unnecessary parentheses in
 if statment
Message-ID: <1f875e5c-34ad-44bf-bcaf-241ec393a6e9@moroto.mountain>
References: <so663sd33rgvgzufcxe4oc666os2gq5nrdinqaqquksrkvnr3c@odkxhcxhb3ux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <so663sd33rgvgzufcxe4oc666os2gq5nrdinqaqquksrkvnr3c@odkxhcxhb3ux>

On Wed, Jan 17, 2024 at 07:11:17PM +1300, Hoorad Farrokh wrote:
> Fixed a Linux coding style problem.
> 
> Reported by checkpatch:
> 
> CHECK: Unnecessary parentheses around 'msg->prismheader.status ==
>                      P80211ENUM_msgitem_status_data_ok'
> 
> Signed-off-by: Hoorad Farrokh <hourrad.f@gmail.com>

Just ignore these warnings.

https://lore.kernel.org/all/?q=prism2mgmt_wlansniff+Unnecessary+parentheses

regards,
dan carpenter

