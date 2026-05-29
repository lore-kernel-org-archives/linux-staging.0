Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DB3B0AE1
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040468; cv=none; b=XoH3fPN8rqyi8F3/9qoVlwPH2taWL7POHbz9YhXNhPzCj6zsXqPlwZL88hvXn1Ab1W2PXd0Vxx69qnESB/CuVPzo8I/a5d7yYg/Qlr+B0t0vjkzp8cxqWPbSOkYYgr0hV7qSA8Oezom1t4xJwR+uGcNaxoawRFdZ2KIeF1ZoFNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040468; c=relaxed/simple;
	bh=PmQsecW3ppRLhE4NufL/6bCGuDUpdU+aofWqPDOKEAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4N3uqobOZv7ly/VApc3jY8L54LOrNoOPEJX/jZdXllL0J4KWRt01e+Tes543pxqjRycCZ26IQYrU3bBCSIoipAfPe0BWuzfNblHWuy9HjH03kFnBuXbYsDksaNOfLBJlA9hgx3w/wqG14AJ0oE+iI3CaJyrlWulGBJSr801TzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqeVtwm6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqeVtwm6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso118050205e9.2
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780040464; x=1780645264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PmQsecW3ppRLhE4NufL/6bCGuDUpdU+aofWqPDOKEAU=;
        b=HqeVtwm6kqz80v5FQxtPLfI2/x51xXS9/F8EVuXDHS87tahLyiCjtcBMV/6a1Rtp3C
         w7vFwlShWU/6ebGRshKrJJ0mZyLLCutAj4yBMdwBPmVNdziNTTdeDriiAQ7QN/JTyJDd
         nvmU0Ymehf7xNaT46we6i7zYNu/TqWFSiPsKdBZMro/YxWQjQACv+xU1gdfaEgas5nFa
         +lW6BDWGr0IRJ26GOkX19vTC9veYcvPrVR5eTsqFx75/veGyHRZMGWE4TQCP7uuHhpc4
         t/8U2eLjB0OC9bec7x+TjH9Sm1XgBQayDMckOHl1CBTIa+bbeLwJeqgx/cb5S4F/Lohj
         wQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040464; x=1780645264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmQsecW3ppRLhE4NufL/6bCGuDUpdU+aofWqPDOKEAU=;
        b=fccDLEGAzRqnYG49FOWdFTKPu9ejVFvjL2tha7heVmekr6rd480JbrdX12KfWs1kI0
         bwUyoZZJwkHjBE/zr82RlmHQ0QJfz4NXiSzNtvPghnKUq8hgMJZIouPGEBM/Zmsy2KRX
         riVKBzNy6J7gKBHjS6ZgYevrB2o7g9FBGD+AnLvFPS0GfQ2B1Jo8qkdUa5RsL9nj36GS
         5YKIPIU99u9kr3ox7TdPPvZI0EPSSRum50cMT9tPwjtfSrppJvO1yirqnFHt4BeojKLk
         lOlVAEza1GniheazFvTK4UzVOGGwv8EBi39iOFmWMQz7RjTSbf8ZCgSLPvOujrLjo5d9
         GUnw==
X-Forwarded-Encrypted: i=1; AFNElJ/Udl3J+Ra+4MxlbxJQVTI5R2P+Dma9B7hSkISeCrT0ftORILPqtVb1UIWraSRJwBTCnCZ1HJqbwJ8NADkb@lists.linux.dev
X-Gm-Message-State: AOJu0YxZctB2Qtz/zXhFVED/QWgG5lVX7XGZm1HG3gE76jWQQN8JnQmC
	/gmELQT/HYQXO9MMBQKQ0DnAqPTA0FqLob/AW5h46Wzjul/8g7YsFHyP
X-Gm-Gg: Acq92OGwrN4l5UWwBNBHlvZOMbvjtIMyK06M9hLkCbUgGqqG+vsAr0+8o9y5wqRfVWa
	4w3vbopVOapyk+uMhV8/DBUSipaXvU4Nh6q8YgUZMP1pih65UY7ssxaQ2E/xip0lDvIWyY1e7Lt
	vsUoCtBFs3ikelk+0SjvcSiworW+jY4tuqyxo05uUg6521kMIM5eNa6wKvugOuQiVTioDLk4bk4
	sxV66Mlzv0NFBJpYG9bjL7gnBb9jMbSKpCejR6uH00J2yO5b4hWYCYN/tXfC0TWNkuYYxcFAqOv
	OyKB+rMW2YdTuLva/tk3qKagW6MWVVNDeluAfBw0VcaV82bshYhfpgZbywMC3g151k3dHvaRmym
	ido0vuPV3DD0xS0DBJAA3L/DhyJvkq876dkmiT9oBDd07MN5UIbFRJ82d10e9tppcm3v7Ew7ALI
	zcwj7Ez1jLT3tNKRE/nWtO+4q1/LNIFoaakQ==
X-Received: by 2002:a05:600c:c0d2:10b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-4909c0b34e3mr20904435e9.25.1780040463558;
        Fri, 29 May 2026 00:41:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b896csm15747115e9.1.2026.05.29.00.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:41:02 -0700 (PDT)
Date: Fri, 29 May 2026 10:40:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: artur.ugnivenko@gmx.de
Cc: gregkh@linuxfoundation.org, ahmet@sezginduran.net,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v9 0/3] staging: rtl8723bs: fix several style issues in
 hal/sdio_halinit.c
Message-ID: <ahlDC0WJ2f-o8KNt@stanley.mountain>
References: <20260528170645.30861-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528170645.30861-1-artur.ugnivenko@gmx.de>

Looks okay to me now.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

