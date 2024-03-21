Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06D32BAFC
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 05:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710999185; cv=none; b=bcLXMabb/V/DHdRvwYQSpKjW47Ko2xNczT98k4Hco/ZzheEH9nEz5U/SNjpeIL5EFmUQIxAh6nlTtJ/KgvDn31voDGAYddpcgRfOBTOhVkiWGJ2PHmcJopUDpCFhQ+Dk9PrKaTl/toA/yo9QJTFK8DaB1MXnGRIkZKvMSBvTRvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710999185; c=relaxed/simple;
	bh=APhaJyz0eNl0QLfcA/wbbgGPP4h1JOszmjto8p08kRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUUYACkY5dyQ+KCURjKwKC5zZT6NBdwbk6oeVdwoesQVbjBILpBFVFoKgaEU4NNVonYjbpCL2bu8AU5lH2CmHyQ4Tg0LU+0oW5jKXlzXrfdFH2TU54crA7z703GnzvrN03BJ6Nswh5XXaJ9BGt/ugnAS004+FVpNUk01ylpJeJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZze12+b; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZze12+b"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4146e742cfeso4490535e9.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Mar 2024 22:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710999181; x=1711603981; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SdPjP84IZic2EoAFg94q9ioTBhoCVfACUPr9otSbXhM=;
        b=yZze12+bAgI4mQRWkNINMRPY1p4a1ZxsxnE/vgfcOx2IcEbya+N2mOosML/MzKSj1A
         gBoqsGvBjaMrqvsjMr6RGTazIofcEISdkG2NhWFy/Q0I5soZPtXkgTzR01aWQmCrg3jD
         +SXBHj03OqKG5jJsMHPVi6aQ6U4KlP3Ol7n5AeuNFZEyabuj3IzxC2SYvwNPN5/0P12S
         cYK3H5BXUyO41OeXZGYFhGF+NhPMNWfNIKLTunv2pI7G5Q/f3v18ZcG4A2UjCvOG4dJq
         DNunfbnPGObNrunAckybnjmocThwisgrR9RkBmpKRAMUWRs8dBl/4ME9+43g0LOmPoBa
         Jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710999181; x=1711603981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdPjP84IZic2EoAFg94q9ioTBhoCVfACUPr9otSbXhM=;
        b=dd5PDuNIP/IbQoCep+YZHk82Rf4wDKvNylRcNVnJVWDJtwS9NSopklKcMPPE4g6bCw
         WXSdD3n7YtKRU0DI3WNCu3RmGKFyfhTuY00RcV/n1r25i4t9HnSGgIPRme//oS6jsj7p
         PmdCqZ8X6O2MmpimO4eEEASV2qlE6/CEzfiTZ6acGFKc+5h6MiXn0WAvIRPh80nINpFm
         3iKsBTcl/BHCg+h4CRGpH0KR2Q/gg7YdAQ3SMFWocW4ppqYUDpA1Squm23LwarWB8fyU
         qo3Tdbi4COzyE7CSeEsohMbA8lfIMyJr5XCR+87g+Ok0BUY0T5mjGxSmy56XnAQAkxGg
         Aqiw==
X-Forwarded-Encrypted: i=1; AJvYcCWTM68oZExOlaMJD+8CZOkRLxTGJDgeFBxd8IkLGuApMfIWVnEnrl4yyueZ1rMGLI1uLhsVqeTEAJZh/6IjP29E0oNWgZO42UBlAQp6ew==
X-Gm-Message-State: AOJu0YzhPCgmBOgyAt7QfFmgYdvYq6fpG+pEIByt8rOn3T7fkN3aTdHM
	ftFLtsxfq0Mv6H+6KACopgZx61nVHWu9PfXI5qaOBeTSkaaKUzVOlCnQwzeMorU=
X-Google-Smtp-Source: AGHT+IGhp5Hb9VQ974bSDizDdPObUDCk5Nhc6/DIgkVg99Ur3u8VPRK/UjnQ8mHgTnedB/bk/ZjLQw==
X-Received: by 2002:a7b:cb91:0:b0:413:ee37:20e0 with SMTP id m17-20020a7bcb91000000b00413ee3720e0mr2763020wmi.9.1710999180930;
        Wed, 20 Mar 2024 22:33:00 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id w9-20020a05600c474900b00414659ba8c2sm4342626wmo.37.2024.03.20.22.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 22:33:00 -0700 (PDT)
Date: Thu, 21 Mar 2024 08:32:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8712: Fix line length exceeding 100 columns
Message-ID: <7392cba8-37e8-4165-b56d-6581ecac21c7@moroto.mountain>
References: <Zfs2u95QOKHAiR1B@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zfs2u95QOKHAiR1B@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Thu, Mar 21, 2024 at 12:49:23AM +0530, Ayush Tiwari wrote:
> Split the argument list of the kthread_run function call across two
> lines to address the checkpatch warning "line length exceeds 100
> columns".
> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> ---

This patch is fine, but you forgot to mark it as v3...  We're really
particular about that kind of thing for outreachy patches.  Try again.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

