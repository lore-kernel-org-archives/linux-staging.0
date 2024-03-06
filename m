Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C065132483
	for <linux-staging@lists.linux.dev>; Wed,  6 Mar 2024 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735037; cv=none; b=Y4O5vz/SRxkG6hf9gTPkMHxSAatgMKrcGAxQpiIFNfmkjPRqDLwXz6gcoRKYvSpidM3dOGmk8YhS1fOTJGiEjkt3cWx4NLaXfinXK9V6j/WzuRJofEly/s9v9nPKFhxZkUhuPHzDp/e3KcZzGIbr19Mh9fo5aRTThjgRudc0gEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735037; c=relaxed/simple;
	bh=wdJDKRGS7HFTRE8jxAsQE8U65zjJmRnaG0CudQdRd+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7rKilCnbnWWzyjvGWjPoWx73fEYyzmC1YGfBMDhNbmLVPl0GJ63q7J0BarpywMXPYyQ+q/O/b3VupA2SpyWK/RttaCBU39zNsEMzyhIQtW//F1Cq8U01wbGBsPNiGKDBXDuILv2s8pkS/95QoMDGz/UK0gBlf0yZwJnAVtA7KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sYhKk//4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYhKk//4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33e122c8598so4259191f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Mar 2024 06:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735034; x=1710339834; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJrroynuRnHM9d1uxPX2EIxDpMmTQhr265Ne8XiRXJ0=;
        b=sYhKk//4v+WZ4RpqZYNaJrPS5P0f5he3U9XDbD6aC0OTLGs2Y1G1xFXlCZFo0Ax90X
         k6xhi+zH45mKNYvfN0zHBRB60N9y6/FFOyyU3A0SbUp52bdDwxWM9JEWhPyLtXD5Z/P0
         UfQhLk+vtBy0ifACYLvpaoYh5UlezMXwj/djqDSY4oTz/4lsMIntlJvflTDgQlzvwDk0
         6Q7eC0tnM18EXPR6FYSH1sktkhtBVc+yl48JhCm1whfzCHzgHlnvjdBThdXokvXil0dx
         AhyAntpL7rJNU0PRETa1OuIYjo3A1P3S75W0JCPY+Zc/I/E89nGrAZFx0gG8S/aSqYG/
         RVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735034; x=1710339834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJrroynuRnHM9d1uxPX2EIxDpMmTQhr265Ne8XiRXJ0=;
        b=c1QG2rJ8kpSbNCM/glum053wKIWk4Ex1x7j7rPKEshVOqkG4o+EwcJzdCWwp2hHNCe
         ptfbcgAOzL59vQEdXOjfukaaHQxmQdJPc3k4jXramMgL5rwU98iH4mHYjXwq7QdeziDC
         IQmbHGA6TbZNN/FULpc27HKFDJ0YTM20hUvGeeUU7RVEpoqPjxFT9NoX3R23xWqU4ZkC
         hSKXTcKPT3yiy9TH8KkW0P5J/bNbA/3WpdoeXN5YPUUng3gvq77nU0d+/QikcMKwazUf
         hMs8vChWClq0jmpftlkVWXKRPwzIfkML5bf6xpl2dEcBilXIApDiTjkBzESht1AXAmXx
         ODYA==
X-Forwarded-Encrypted: i=1; AJvYcCUDU2jPzy6daFsy3WpXQxA82VYNke/1er5bDR4Sc81U/ecPv3rdPASltIEGV7rwmHsSlquWxqH7DA2rNcKxTJ0hCkpRzaeSx+L7VlXzRA==
X-Gm-Message-State: AOJu0Ywi2+LLLepww5ddw+a5bdRMKuZkt+UBXoDkv/9ztyDjKm9TDsi3
	rS3i0FrgPSeNBkV48LAFu930kQ8peGE9oXtGIwFRHEGPiTvFQ1cdmEutkwUJDQ4=
X-Google-Smtp-Source: AGHT+IGCOKQomyj1XoUe7rvgu9g82j1JsX9Z7KQrQqSb0Ub+eD1e9HZF+KS6bVximLW/7kDpMlUX3A==
X-Received: by 2002:a5d:6310:0:b0:33e:834:13d5 with SMTP id i16-20020a5d6310000000b0033e083413d5mr10627030wru.69.1709735033674;
        Wed, 06 Mar 2024 06:23:53 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bu16-20020a056000079000b0033dc3f3d689sm17892394wrb.93.2024.03.06.06.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 06:23:53 -0800 (PST)
Date: Wed, 6 Mar 2024 17:23:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 3/7] staging: media: starfive: Sink rectangle set to
 ISP source pad
Message-ID: <892d9583-afc9-4acb-8013-faf021f8ae87@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-4-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306093334.9321-4-changhuang.liang@starfivetech.com>

On Wed, Mar 06, 2024 at 01:33:30AM -0800, Changhuang Liang wrote:
> Sink rectangle will be valid for all source pads.
> 

This commit message is just really unclear.  What does "Sink rectangle
set to ISP source pad" even mean?  A better subject would probably be
"staging: media: starfive: Use PAD_SINK instead of PAD_SRC for crop"

But why are we making this change?  It's not clear.

regards,
dan carpenter

