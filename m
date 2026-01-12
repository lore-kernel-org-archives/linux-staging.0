Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C0327A122
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213950; cv=none; b=n6/NiYMgU973OnDOm4jkX8iN/HnW/uFR9qeiQrE4iwa6NTtGsLkEtVyAL77pOy4l5tdnsST7dT+DrJz6ET8MGFqyCGmarP87q2KIysXH8THtvZtlOgCRWfTbJESVYjlpmvlPJZMRcqHX46vNyZk8bDsmNlJT4EBorsqQN9ekdXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213950; c=relaxed/simple;
	bh=vkqDBG0ihkiTbUWD/DISQfGHk5GEv1NJ57XjpTmuJhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ww5rL4ZXBerOolb3R7rfy+Lc6mjL+CWsV3crJFJzd0GMrlZTexPGHm0PN/Xxc265dgw2ulIi9temdApGLubvIsZSeEDPetfccrHeGlvBHbPTcLoXtg7k0VveKQQ9yaUUcA4d1gBYZ9Urma79bwmo4o+ggc+DNCTsXqsB51FKYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFW9m/xS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFW9m/xS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso54850415e9.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768213947; x=1768818747; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ND7UT8mjVsvfRhYfSb3VaxYMO5zbkjKvUW+07bOk4gg=;
        b=lFW9m/xSmbTST5G9lT0v0vl0k2cy27FqIVvHFV1vIGhYNRHZXRqsP6GDs6v5SnsQnl
         5M34+mfZGv3iZeI5spqV/wAKufy38ZCDk4LGkI7MlsnAwewSbeSgr+Q5PQKSHhjCdk5o
         Hq1/WJcYcCRbsGSwqRdsGa187LO6Lxh1aDTobowUAsmgUiwPSiV982n+OKHIU+9eSV4r
         7kuBl/QAXnQFSAxvgYdSRhuk5fIndsyo9FJ6hdge4HWQvLT2XU8wsktVtZYObrsXq4AO
         AHgqCe1CIsLvISh1vKrx2wmwFnBWekE4TJCgWAwbzyNruw9rTewcXjSqkgsgQoC4PmqF
         7NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213947; x=1768818747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND7UT8mjVsvfRhYfSb3VaxYMO5zbkjKvUW+07bOk4gg=;
        b=wXcm19Ybj9Ens8PRoKtNdoNwtB51D+QqszahsgJiWbGd8Zhj1JsDVB7I732o68+oUk
         Iqi08rOTUPMzUCfHLGh+TwHBVjVvr7jF3mwa6Ycj/QM+QZM5R8vxzJlvU8JkGLW+anvd
         SN7kLFdCe5t1pVhSYCIomcoQHUe2AiCBs7L6g3UAIqhtxlWVrbn2XMEpt5DXL5zrILNl
         w1w+IGh4ExuHqUFSDnNFSwabCj7QesAchsEoNkmrW1j0eMpzhuQE0LNaL2troCx9+/2h
         qtTvw7mBXs2KXERvNv5Ns+qxNpEuEUP8F2e/6mFCqQTYw6z3Ia2gWORpp58D6GAg0H0h
         j9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVZjOq3LaRFOrvPXcqBX44FEjleKOcNOcegIuQ1qBkvDS/Mt3LlvyT8MSd2fITLFyc7J/Jj3A1x97aw1OAx@lists.linux.dev
X-Gm-Message-State: AOJu0YxNiTrMprqYD7ccSPkHlY7vM4T8Tz4CMARf+k+zgYnpXOaG1/k6
	t5GUHMHJJpgGC1KNM9ExiltQiBH9iA/mM7wYwunR3e9NYNy5f7ifkqBkOj6Nq5NiXt0=
X-Gm-Gg: AY/fxX5m0G3ifVBiSWPnQLAR/pfzZy/r91Q8eJdRzVuSUllROFS/sTrStGzno//0K/q
	s21Yz/flRd6xHI0pRjzCZxP/LbTM2ZOudiepQv5k73oQ7POD9dIMNXK1yUkl613IS38PYBczX3D
	BMXOhcqAX5yuoe8MWSPornHBoCFXGUXbjaqNR1TLuvkvYyonW4tEC5IbLGjL8jxL+Z+UOvrHSfn
	Yl7NEF1niGOeJxuFWLMhDiMQCREPYMXz42xRhB1K6HZL2V+9TsW/kvR4blIlVtDmPvPiO5wgceW
	l6RIFT67M4kl4LFP2jKRVlfWXWjYh5zhJ+0Vdkj99XxhjnXSsKAS1TQI5GiH6dTPkqbOuuHSbV8
	2G5G9gybDTxGEgaxYsLpWjM2qIzf2PBj2vJh+uv5Y1t7CKyCF5c9ycnQgZjyFm1LvFLqjyfYLkx
	p/Ei2Snmo28PGOZ8GV
X-Google-Smtp-Source: AGHT+IGXGqMdmtBuUfz+mO91zCjBq2LCWCtHIbyiQZ6QFW2ziTLXJLlEWXm3Qr/qW8eCOHoXM3SFbw==
X-Received: by 2002:a05:600c:4747:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d84b18a7dmr242891425e9.16.1768213947168;
        Mon, 12 Jan 2026 02:32:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6f0e15sm345236075e9.10.2026.01.12.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:32:26 -0800 (PST)
Date: Mon, 12 Jan 2026 13:32:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	Unix Antigravity <unix.antigravity@test.com>
Subject: Re: [PATCH 4/4] staging: atomisp: Replace ia_css_region with
 v4l2_rect
Message-ID: <aWTNt4XLhM22Ki-x@stanley.mountain>
References: <20260112102518.19926-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112102518.19926-1-karthikey3608@gmail.com>

On Mon, Jan 12, 2026 at 03:55:18PM +0530, Karthikey Kadati wrote:
> Replace custom struct ia_css_region with standard struct v4l2_rect
> 
> to align with V4L2 API.
> 
> Signed-off-by: Unix Antigravity <unix.antigravity@test.com>
> Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/ia_css_types.h | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
> index 5c21a5415..7cfb355c8 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_types.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
> @@ -18,6 +18,7 @@
>  #include <type_support.h>
>  
>  #include "ia_css_frac.h"
> +#include <linux/videodev2.h>
>  
>  #include "isp/kernels/aa/aa_2/ia_css_aa2_types.h"
>  #include "isp/kernels/anr/anr_1.0/ia_css_anr_types.h"
> @@ -430,12 +431,10 @@ struct ia_css_point {
>  /**
>   * This specifies the region
>   */
> -struct ia_css_region {
> -	s32 left; /** Starting point coordinates for the region */
> -	s32 top;
> -	s32 width; /** Region resolution */
> -	s32 height;
> -};
> +/**
> + * This specifies the region
> + */
> +/* struct v4l2_rect has been replaced by struct v4l2_rect */

This historical artifact should be in the commit message instead of in
the code.  In other words, delete both comments.

regards,
dan carpenter

