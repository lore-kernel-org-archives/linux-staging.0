Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557472E1C78
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 16:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041574; cv=none; b=GdSQmivzl8o1AN4C/bSUEQpFNEAg31zhQfecWY6fJ0hUdBbI+Oc5QhsfRkRHImsU52wPYHDvm14ko1v3guA6WOTvlqcQLdAgPvJ4SFZpCKI6ckLi8DsA+wownxOB2ZbJ6LnZFO5jW3geverjDSDhDFbOt8VgVBlkIkBoBAmIATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041574; c=relaxed/simple;
	bh=iymRxdZHCbk6hr0LCFlebLISEqnGtGso2ocica07eUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQFuOocdkuhk9g4RF1/xhsdQ0pNeYnLRv8Q6+K4nlN7Rp4pn7Bvca+93OjWKSTAVS5O4snZnlavidf4uwxqrujZf16Le8VwveEbPPEYRhDQY4sxF70QGqPlgWHaTOE7uU9P8K20fbbuLmz/3FzntXvjJtdEUiiNmtOnVwa5W0jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTq8ao1Y; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTq8ao1Y"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so16131a12.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 09:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751041572; x=1751646372; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iymRxdZHCbk6hr0LCFlebLISEqnGtGso2ocica07eUc=;
        b=gTq8ao1Y4FJCXMX9VtLDNAEa8zvslDXbxkje2j5VYMSJ/XmJy0+NPK78PE6sJk4QxA
         kI6OTyEdy0fHfwsqTl98HfhOQ2hQviBBnaD6GMooC0tbxqrRhOm22p7f1+UZ9bn6aXuu
         zn1g+KN3PIVJaHkdKLH6bXnEY6gD7jCmq5fVY/RRO0SkZ/F4fNsYPOdf6Rw7/PzpdFmw
         OLr9FX3oGUB+R921S9Jhs+Faiyl85FM/uvyQKiCc3AlvP4TJfowP23veAw79060QPdwI
         ZRb+M2GeOqvPRphF2AnU1N/DGKf/pluxb3ob0paus73m/+gWASvCtiLLpKcJk4zvjziI
         gSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041572; x=1751646372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iymRxdZHCbk6hr0LCFlebLISEqnGtGso2ocica07eUc=;
        b=wSpb3ZndShbQk6wxBb9AkVfuHZzpmT/vHGl0K+LhYXaD6w1CdPRj53EJDinetV8tGl
         Ly5aN8e32V2DfRqto/6LZ/8E1HwxrIOAhaCOkOliN6azRANysewxjdDL9CsB+qISq4X6
         LDk6y01yJlKVohurRByuqBSIBnucPUWYtS1A3lN7Twc0YY1gRB6TNqj9k9IrBkun2ylC
         wcSQN4QAx3BJ3UUQ3PBl8ABZm+pfRvZOhRDyAsbl4rdW7KfL5JA2pSx9nIJPAxHhPSi2
         vYmz8BAjfsCdpprNTNrd+y38j28Mi8lvnNUf+NiqU97t4wVnJpZb4HECbjmbY+kgcJxA
         ywRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJMWT9UePI++IMpZ+PB+3EyBCkcViM4N93FZOFahN+ymkQCNUAB9FqyDJhWOj/zfmPL5kl+Ql7Fv1qqYjK@lists.linux.dev
X-Gm-Message-State: AOJu0YzQpuid4ZixACgyN+/tBXb6LoJ6jtxJe3Pt347u96wqUEfKHaGj
	9/zykvPaQdvOuRM0Nj8obOmLXC7HwfPoA9XeAKkT+iEJJwZhwnZOU5zE
X-Gm-Gg: ASbGncsUoE1ut29dJ6cMAwQbHPPj+j1mzMxV8Z5uzsYaaqtNXJH7sBGr9GkMFsagtlg
	iOmApV/QjDRfRDHjhjDSOPqaOS1sX3nyoKoI3zjdgXiDXr21V1qsiHcNuUF5MUL0704VNRQGo/0
	Pk6DyHJqz8uAzlyY6wlrvRq8PTbhZzTdZwSyDft8UmruDO+PJGaCyCa9ljTYNOkSKK0zU/scBUS
	Te856e4hIkus0PEe1doTx7qNomEStrX4GBmCpiso19hlOGVGd/UEl1IOXldkuW6WkOA9zSCKhts
	1zDjuQ8ceJFVHlSI5HwxUPoi3sq054Qvobbyeaj5S1lB8PTR4aDMy0Y=
X-Google-Smtp-Source: AGHT+IFV96Rf4LjT7OKaIYJfb5G8fLhC9of+ZZxWEW59VC9buNUWyd7wTakUgyC5gxDtG2Rwj+b4Cw==
X-Received: by 2002:a17:90b:3c4a:b0:311:c1ec:7d11 with SMTP id 98e67ed59e1d1-318c92a2e8emr6033508a91.18.1751041572454;
        Fri, 27 Jun 2025 09:26:12 -0700 (PDT)
Received: from essd ([49.37.221.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f51d7913sm6875386a91.0.2025.06.27.09.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:26:12 -0700 (PDT)
Date: Fri, 27 Jun 2025 21:56:03 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, andy@kernel.org, gregkh@linuxfoundation.org, 
	lorenzo.stoakes@oracle.com, tzimmermann@suse.de, riyandhiman14@gmail.com, 
	willy@infradead.org, notro@tronnes.org, thomas.petazzoni@free-electrons.com, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <gptas52msk2feixcrned7anmsozs5iyyku3h3am7fmv4jz46ty@lckiii7qhkq5>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
 <aF2Ic8BP0zWS6R19@smile.fi.intel.com>
 <0327da98-8a7c-4db8-8bcd-4179b87a9486@suswa.mountain>
 <aF3CwnHyW5HHzDSG@surfacebook.localdomain>
 <aF57eMeNafg1w9Qw@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF57eMeNafg1w9Qw@smile.fi.intel.com>

Thanks Andy and Dan for your detailed comments. I'll send a V2 with an
another clean up patch that fixes the order and removes devm for txbuf.

Regards,
Nihaal
