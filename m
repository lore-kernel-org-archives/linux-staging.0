Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165D326930
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953072; cv=none; b=mjqxhbf3Jo7OXPXKDgHkuPymA0poUl9w5/BdrK5+3pTeSMeX2SgkKPp7VpXLejN+hLC4dc1oXr78p/WngdlWrncZZd/oervYpb076FtgsgLzVEA9aZryh2zjEqmS4O81h3Rk1kB3XBBKlurn21WVPTR6n69F3GO0dCx71+fziU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953072; c=relaxed/simple;
	bh=TBz2r1xPHMZDC55N6i9lY1AmoGak+sjHOpSXbmf62uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4IuPXkqZPOm3Uqj7AOnisIQWRhJbbPEg+TUtIRESf2TpHD0sp+pEGSUWaXvehDJhXUCV52+lYd1X/yA4/brplI4hvwP0AFXcsh4/WjFkWTD962EM9OkExu1bsX2iZNtfWeOZaV0gMIJGT3qpsiaKmRSmaPW/QOHnvsJxRlDSm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdVRypVh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdVRypVh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so7674402f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 00:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779953069; x=1780557869; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g6lE3Sq8rxhemKoqKXkLJqyfurkKVZXFbhdF/7p4yCI=;
        b=LdVRypVhr1aFSkUNA6wgkxywGHNbiPpK0rTUO+x9HjV0rGS5SN0H276vp3//w/ZnE7
         nWAaoHIERuBgUjaB51rvrjmQiYcbKh2O182XCS0ZYb9UrW9dfYja3gxvc/wzh4boG3DV
         SRUXFIZ02BKVAF0uf/fKlC9bhbodRPqIigdzh0BoC5v7Og0BjNg+nYrXH3Fy9O7Xb4dD
         cSSIIpOJnJdWsJgArYrQBnuh4rLj19UWuSM0a3O+I4IvHMY7GthiNDEQt89B29do8evc
         VigeJEUutxxvnSCU0YABA/43EK7bdz/sN910eGEm4rlbILLBdm8GRN2Lg/GL96/rxl1s
         YtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953069; x=1780557869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6lE3Sq8rxhemKoqKXkLJqyfurkKVZXFbhdF/7p4yCI=;
        b=GKUyXVtTDh8dEW9PXmbu7ec/XJL1V0Q3zaSfrmOJYj9SAklV68qSKHn+S2T6/FhINs
         gOp445vk9zX7/FZUoUt9uitI9LoNXp6+uZYtygBy2DQg4yu2OoY3ngRBnxlKxXxtUo6Q
         i5jFdf2IjyAPR0qJZpwKn+FIAAeuVm4uPSfHquhCX7+Fr7Z/4knPwIBygPotyP2GOKbq
         VS1w/XTh6C1Afy0XM4PIt6qVFfKy2QX4Fh6iYnB6WCMLj6p26BhubmR0HqSqvtTgW9GG
         pODWibRxXfWBnLklzul7u7+Jly8aAy857tVZajTUg1sf8agPWu/F/8jYWDgPPE2H0QNB
         81+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8MMMvby87cUTDN5DmPGQI5RhZdx/SxW6YwCtb7CpyLR2P8OSMAb/7Nmx3ApLZYh3+kgFy3w2VsQVcTJyiM@lists.linux.dev
X-Gm-Message-State: AOJu0YwBX5DLUIGMigRxXJlttBemeYEiJUClfFQYGhwYSrk2PiyFPnFA
	dsQN7isaksfweaeZLOOSCPza5ALBvF/UE2SSZE1YGjAPz1sVjFokg9Lu
X-Gm-Gg: Acq92OFnpRa6CFbAS+NKo5WgPxdH7gag8GjXf0xn8o3S//HN19iv7onC6rd3aOL3pcV
	vuaLpavsmU1a1dbI5+XOnnLGvu22x9r5j1kloazxO935OY1U8RuWWpjjicA6Dff4aENOlkZzhYQ
	3yor3qlfQwHYkQVbX8pHq23ljJg7LjY+GbK5pQLbvAEYTOaENtlr81+3A2qygCGXWxuAH8ksmRm
	U1hfMYVe0/fahWl98YoqRBULDY4wAENj3XN7wP5xIQ70zPvxiMoB0A51+NzXQccLnp44bdRArmh
	EMMtOS12klnQLylshofGwPPPdr0uDCd3VYfDi1U34hcL3y7NuuETUZ5hGWjVXPvLTpZhsOF++Vh
	PxzN7570n33ab0NClTN1sMPXOezung0FprFJmvrWh2daZ8pkYxVRxFubtddDa48hpemvT4XxjIZ
	6r766U/U+FNnDL9IHXFuQPKK6c1HsSq2QFoQ==
X-Received: by 2002:a5d:5a48:0:b0:45e:ec27:b4b0 with SMTP id ffacd0b85a97d-45eec27b5c5mr404125f8f.18.1779953069386;
        Thu, 28 May 2026 00:24:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb549e79sm12521145f8f.7.2026.05.28.00.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:24:27 -0700 (PDT)
Date: Thu, 28 May 2026 10:24:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix CamelCase macros by converting to
 uppercase with underscores
Message-ID: <ahftqCfnQceIw2_H@stanley.mountain>
References: <20260527191203.494292-1-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527191203.494292-1-lucas.fariamo08@gmail.com>

On Wed, May 27, 2026 at 04:12:03PM -0300, Lucas Faria Mendes wrote:
> Fix the following CHECK style issues reported by checkpatch.pl:
> Avoid CamelCase: <VME_2eVME>
> Avoid CamelCase: <VME_2eSST>
> Avoid CamelCase: <VME_2eSSTB>
> Avoid CamelCase: <VME_2eSST160>
> Avoid CamelCase: <VME_2eSST267>
> Avoid CamelCase: <VME_2eSST320>
> 
> Convert the lowercase 'e' to uppercase 'E' and separate the protocol
> naming elements using underscores (e.g., VME_2E_VME). Update all macro
> definitions in vme.h and their respective usages across the driver
> files to comply with the Linux kernel coding style.
> 

No.  The original is the correct way.  Here correctness is more
important than the CamelCase rule.

regards,
dan carpenter

