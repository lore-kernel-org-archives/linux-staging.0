Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D218BBBB
	for <linux-staging@lists.linux.dev>; Mon, 28 Apr 2025 05:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745819047; cv=none; b=hXM6Mh92opr6WoDoyZNaTO9O9nr/7LNDCZBE1VNouVniTswod6fsY0nUyg1SHvRgSVP042U/tQYX0qCor5NhllReJTIuHf2uKGROPHAwuxwBjVLnTKpF0SqKnCWrn7NYWGQCLVVYKggaAM8aiwvzcPeyyIQPOyEINUOqVxwR+6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745819047; c=relaxed/simple;
	bh=7OBlNKcgb41G6IhqavAJDTWirgKpoxrbPjKlSZC7E88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kq2sk3MoTEKH6IMYpqH1hWilii0a+TNUCzkokTyzWFpR7Bs06Hk+90sJpJWPDgAMMIf1sxrx2jBeI/KR9asI7USGqBrmHRCbQokIyWm0F4qAiRsIJcM0ZLIW7Cnmz8EVoTBe5H6q7i5pFTJGGwwm0vJ9T8DzBcXTIvnZvQ1s5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tj6KKDWw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tj6KKDWw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so41791565e9.1
        for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 22:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745819044; x=1746423844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgtRYdcfvTmxq+8qzLNSHcUhGdDYkpaFe/ZlJNjaGwU=;
        b=tj6KKDWwAPhPXAXy0FHHPlv0ov7RezwBbd7OuYtSMsrdRehSlHpL8TCZV+7gW6+5rz
         ne9jNoWCTRSL9ah0/t1aOGitcn9DeYYqIkvKlzEDapcMPfTBFUNYd63Mh2DSkeMRliQ5
         fuj/qRoc4zfQjibKoDEmtGz4ubWWAmuF7I2RRPyLaFdY3WYouIMUO41I208nPkzxC+dg
         Ln6Od+iXF8k3/TMX6H3ajh6rUburet0ah3+6bbaLCDa8jucp87qfh04aY2aw6VAMyCWa
         tbJsajjIOAyA4E8oxt9kZC5F8qgbOEvhpjk0RowyTX1HhTGh51ccDB8W2oXN9BI2ca6e
         5zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745819044; x=1746423844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgtRYdcfvTmxq+8qzLNSHcUhGdDYkpaFe/ZlJNjaGwU=;
        b=NLOuy25QUGekb2KSPPRyK23yBxV8bUFO4okrf/LyI+6+vpaJNiHUqObNQVPZYcextz
         va9K7AEH8yocN9VcYrjR/H5RHwnPW4vxatMBdToAzqSxAmB3ewjQ84KQHJD2RgwMnOcp
         pgirNKRzV1PxZ4SQDMXfGCCHQhRxMYN8V9ez6Y9IgDRgANb+UvbOugru1P9Ydo33t2hZ
         ur9s/Soyn+ryYLDklkg/KTm8bW73VrzWxzdQj35mfDkV63yh7xGv3eqFLAD4hPjbuE/1
         57qri2xVhXVxtt8u30GbDK2OZhdUWGtKhdQhoOVbugWDY3lNlb3IKVS21LB8oHHD5UFD
         bW+g==
X-Gm-Message-State: AOJu0YxsL4Ggf1Rg5NKsE5cJiYElamLXrsxGHgNAuVhOPDwjdgXDhDDB
	y0ryWrQcW3dGB1JwmxZ9oszXoSad+XpV9n9j1LVfbzCFbdg5Ase1BcL/izrZQ8M=
X-Gm-Gg: ASbGncvRf85G0u3KUPhgjyrEP85jTobJFpmEhKDxTs8/O/1IygasFALA0nYH9tbGJv8
	7t4cBIrzzvYInvlGg/nHhnubDPINzFNw9WmeN2NxUT/6oEJ7RAcCjybi/s8TIz5y7yQGQ2Kq0bt
	0f4SaLpySSJslLj9H/MenZk/eztjBVcz27hZo1IptQs8j3BbLNwskXCdspTM+FB8X7dFXdh+sMP
	C4Ora3xkt2s7jL/OByXUFG+CBQoYeoshBRpHHDhWQoRg5AIBxvCMrbzu5vSxa/iHf+rcV8Cz+hH
	xjvu5W4CoUORmIqyLO8ZRb/dAPZSU3apdNsXVKwr7O3H0Q==
X-Google-Smtp-Source: AGHT+IEMBYbg+f9AEzAksF/OqkBJkvmHUVQOiCMw8s1vnSl7t7DPDYEuDePhz6/DbTjqSEm7TQ+8tw==
X-Received: by 2002:a05:600c:a14:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-440a65ba21emr83788885e9.6.1745819043748;
        Sun, 27 Apr 2025 22:44:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-440a5310a1csm111324515e9.20.2025.04.27.22.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 22:44:03 -0700 (PDT)
Date: Mon, 28 Apr 2025 08:44:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sridhar Arra <sridhar.arra@yahoo.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] drivers/staging: Fix indentation and add mutex comment
 in fw-management.c
Message-ID: <5dbc180f-7d5d-4a79-a8cc-3c38ee3898b2@stanley.mountain>
References: <20250428032621.656795-1-sridhar.arra.ref@yahoo.com>
 <20250428032621.656795-1-sridhar.arra@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428032621.656795-1-sridhar.arra@yahoo.com>

The CC list is wrong as well.  Use ./scripts/get_maintainer.pl

regards,
dan carpenter

