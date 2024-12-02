Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8AF2040BA
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151153; cv=none; b=Cvujyj3SRrykQlR2+Xbd+tn2bnBuZfo0vpzg7F+DPkfR1YInC2RGLzj7HRb9zKpbISv5yUB3BIsx3Pk0XLjJJDqiLJWXS55j1SLx3ZNoqhL8OQmt+PvtlwM5EXpPNCUw5D2DRpkSQJB0bahDzWtiUEIEntPgOoKZWQXNFTNLUSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151153; c=relaxed/simple;
	bh=jrRG+x4jQzJzNhcGIs7b6FHPgRdPwuIFG+cBHSXPm2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1C9pdcOsNwFWxRRKih0lm3gJz9HEOluM0EuIAF80y0kybVqf5h8mgUhfkVcbkwKQ6ez1UOyBEIrs4eV29ECcIG/R8OmfcMYBSa4BpGxK54otrpadEt8+4BWh7AQL9YRJyjq0HdkIyJgnNX1nKLfVZJ+wjRbbaxF9m6r+4dnJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4cLT8/+; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4cLT8/+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2155312884fso26178825ad.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 06:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733151151; x=1733755951; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qY4G00i72hWsO11pBQdjSeQLWmsDLsKik7ZCI1vFqwI=;
        b=e4cLT8/+jlTl9gAPm2+S7AaL0L/DD7Ml8Frp+bND7i9f/t0X5ZhfxPp+axtLy7ZaOv
         FkmQg/hdw+oXtiBpwdPb7De7LRt6/aJjhTWpZafN6NVY42Fjq5Zg5J7HeWI+2GdALibR
         K/9tODntERrq0gXIc48KQIrn3z9xU2OXy6lM2sxBV6NYM6aznpw+Y9BNPTR1Fd7R3kmq
         nr9uk4eWvvwQ6OrAiXwnkMcb1yE0tgYr02LtYEqPm8EAGjMiAA086ZSDP/1NrzZ3HtEm
         4cwj4CiFM6f6LwyuJ6gTfzkUZeDQH9ee1RLDs8nd/gSCdro2xkavBgvg3ztcWBwaVFJE
         yuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151151; x=1733755951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qY4G00i72hWsO11pBQdjSeQLWmsDLsKik7ZCI1vFqwI=;
        b=X9Zhxou6dGAdxHEtArhrfqWJe0kIzoZCvPf/0u/rZbwGshS2l0VOGg/NILTQGZfosr
         ImQerlz4WJ3QV/qNEDHq4yClUOQOB0AVxqDovOswVoZBp7ZniOvirY+AfC+ew11A7Xkp
         7cNHaOPYhmIR69LKAi5ubwdqZHnXXa/SSPuXgj8rGuEFU23L5avPaTi9Fj1nwW0LlTPs
         A7Uo+CaZmzKgZ+7athe8ZjPjuZlOES0xbydV990/SoO0cBUyiLzfx/kfc/pHLrEqvBWS
         RFDKWjDnZDYDVnvmvMRL/nZUk2bZfF0j596HjHwlrOCqp9c2GhTzhXLKpGFTqTiMSC0T
         /bPA==
X-Forwarded-Encrypted: i=1; AJvYcCWvJCS1f9bdUQnxdzuhjoxU7zWfV+f+If8amWfZpg2eZBJb3cywQLyOvdQWduzaAXUucFijdw3L7Tc1fU61@lists.linux.dev
X-Gm-Message-State: AOJu0YyrjoUT2/ik49Ah4spK5HbinDxoYtUPmpew2Z5lvF5LvUGKBZl+
	Fq0kU4AaMSJP1G/JmqleFsHeknQvB1p5Q7++YA9nHEtMev7rQJmu
X-Gm-Gg: ASbGncurvmUN6feig1KDFAxjErtzaZ8+pllGLTvvLsZ2L4I4HctCGr6MlCRsuIuhpcq
	zjxyQB6RDgqqZVLSKxz5ViTfXcWnwk7lvYSYisQ/2oMmOPiyc45uDn09TTtWInudBYXdxWuaEi+
	OJzZktK5qmoEtxM1qq4UZiW1M18bAzDfyYE3r6i9USSWOe7tXQWRiEeEqt+EBiDPAPe1Nzbo7k3
	Mj9GvH3tf1gPmY/puttfRCp94IN/IbYb1L93pKCSqdJj94mRM+XOyhjzgfVKGM=
X-Google-Smtp-Source: AGHT+IGf7NoPu7BOLPEbIi0SaK309Vl2fbA9zl/kZ7oiQDGYy0PfgNZNKDYvNnO22siMMJpc2da/KQ==
X-Received: by 2002:a17:902:ecc7:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-215a3fd642emr22145965ad.5.1733151150953;
        Mon, 02 Dec 2024 06:52:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219be22bsm78161275ad.248.2024.12.02.06.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:52:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Dec 2024 06:52:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [GIT PULL] Staging driver changes for 6.13-rc1
Message-ID: <f4ded99e-35c7-4651-8c73-376390ceb130@roeck-us.net>
References: <Z0lCyXBV06VyH96s@kroah.com>
 <f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net>
 <2024113025-sly-footer-3462@gregkh>
 <7d7e65af-b818-45de-a92c-ee59a864dbdb@roeck-us.net>
 <Z02Cz6GbdtGNPywE@egonzo>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z02Cz6GbdtGNPywE@egonzo>

On Mon, Dec 02, 2024 at 10:50:07AM +0100, Dave Penkler wrote:
[ ... ]
> That is weird: the type of resource.start is resource_size_t which resolves to u32 via phys_addr_t on i386 which should be the same size as void *
> For compile check purposes simply changing iobase type to phys_addr_t the following error message appears:
> 
> drivers/staging/gpib/ines/ines_gpib.c: In function 'ines_common_pci_attach':
> drivers/staging/gpib/ines/ines_gpib.c:783:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   783 |         nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
>       |                            ^
> drivers/staging/gpib/ines/ines_gpib.c:783:26: error: assignment to 'phys_addr_t' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
>   783 |         nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
>       |                          ^
> 
> It would seem that for some reason phys_addr_t resolves to long long unsigned int

Check out CONFIG_X86_PAE, which adds 64-bit physical address support to
32-bit x86 images. Pointers are still 32 bit in that mode, though.

Guenter
