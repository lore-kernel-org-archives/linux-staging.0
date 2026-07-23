Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C142EEB3
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801428; cv=none; b=GE5GsAnIJe4gvayBbY6VUCzFYVx1pzeUSwZfKnsck5s9ZqbZbrYFNj5AQyhuSKsKDxPNuFGoORC9j6Lbnx436Mlm/ye7+GPg9sBEfd5oIzF/SRAzxgSQ3ODuyIGBYZu0IXQZIfsSwb7ckycgCnesqhPr/EOiQRblny4ukBvEUbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801428; c=relaxed/simple;
	bh=ZB447XxCBqH89cLA+iAMyBEOgv3a3ukggHt0biRRmDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GR9e85l5okV34kMn/7cXb9pab9xf9ZE4C4upO5tmF23zC+rMeJ/q2PDE9CB8b+HJyUZuDvQF83D3A30gP3La5a1Ie4XL77yUNEEtZ1UlgEEcmAzjVXv7GvNe3bpMadzR/D5BOPMxmZPkPR6JlaeE6LdJzIUSdtViqvhrAxrkBTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APINqIEM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APINqIEM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so3312745e9.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801425; x=1785406225; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VlMWE9xZkorwpxL9EbIVt9uDSDnZ20C3ZODwFQe3gZ4=;
        b=APINqIEMxMcuYh61TqSRJRZ3GF+H4eRHZkRCvgnCMpQpoUcLoLY4kg+45eECM7Cz09
         gJMcqls1HXYJTJQ3u35Izmyuc910KtVreTaV7AcR/jLtFqZL0kfn1oAHbPiGeEBObSDw
         PW9qO314E2IV9jfG6x6aZUn+eaAiIQrO2nQOxEsO+Jc4Nafvj0Knfqw50XA18vM08Pp6
         NuR31gF+8IiIo3t31lASj/4QNqAJIKHaIBg5kzeuhVivimbU8ePPdxKSs8ax1nKvm/ed
         wCCJKLg+msivGHGm35vGCVgT7qBIJnYecptR+jSTZ6x0pzi2s2MYyO6WBH9bLDYSdQcw
         R/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801425; x=1785406225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlMWE9xZkorwpxL9EbIVt9uDSDnZ20C3ZODwFQe3gZ4=;
        b=BXcHEZnsg/niUNCwVCRow7/e/9Mg6zzv/r2tWZMjyCVqdm2reZx58wZ7hCZH4zGlZF
         8107PPTuwOEW0l4ZdmJFU2UtDDw0y4j8DG0fGoXynYfwEuTvwqXJvyGSeyX1dfBLP8ce
         bfDnEM5X33rBFURQrV/2HDbR8EtlvtJxjhqRE3qHSvRG9xhWSlU3PTCbqbFbmVnNz9Cp
         ifCNAjr1MaN0Qxq67eaGA3o+CrPGQKeg6E0Y4JxfCQHYUOp+TXFccLe5BFMNyPcBiKiQ
         kNr7I5WZT1Fl788N3Ho3RvV9eAHDrMzAlHDEm8ux3NYczE1V7A5QJFRPlkDCfxuJ+jk6
         imhA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6FyOFd6gEz1c85t8/lJRyQi2KEFAcR/DnctgADqjjeK2yUVTryPSNkP4Xr+103xohJqJu3RSJFvD9U9XO@lists.linux.dev
X-Gm-Message-State: AOJu0YwUrCUxwFyUiLJoaBDlrmp6NxgNQUbLVsdFyhJuKrDjZ+0h7nfb
	klvNegrRTkJuQzLGGJba0TsKWT5DrHLIQbnNo7zGEgJh7xFG/RLhhgB/
X-Gm-Gg: AR+sD118npRYORtUKey3FYlTrH6b3Bzuo5m57JGw2aqwZ7XuZAOInqwf+rRlpp5jhCu
	kCEfYkpBqBHoFIcjR+4c5toiutJ6Qft5LvX7ETWZzwBlCm7ZRKaM6ISsy3NthpECw9Yh7RDJWTM
	OtEg3FoozJisIZ81b/6sp8X2Z5UAC5+WY92dy0bNvsV+DpMIDAbpNQqB28lXa7EgRv+pVN867Fn
	OoJo75/ml16EWP/gVa5qjCdUOOKHfDu6eSiC0IQjixcYFHGjheJGICrC5dl95ZT8quJYnl3hj8T
	YjIkD7zFnstaUnjEuPqea/7dOBBJ6SIiiHSgp1BwYwkiKYmBOmrdGJdLigwWn7S3vG2wT5APWgO
	gpsSVco6EuUZDfq1UV60rukcODTn4Dy3CdXgUeZhehpQvRSs7ZnCV7UGwoQaxz7/HQ3hOq45IDQ
	==
X-Received: by 2002:a05:600c:190a:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49573c9995bmr27760195e9.12.1784801424740;
        Thu, 23 Jul 2026 03:10:24 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm229252705e9.11.2026.07.23.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:10:24 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:25:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: sm750fb: Remove legacy kernel-doc comments
 from header
Message-ID: <amHQE1sKtB9rxoiA@stanley.mountain>
References: <20260722175817.213235-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722175817.213235-1-mishraloopmohit@gmail.com>

On Wed, Jul 22, 2026 at 11:28:16PM +0530, Mohit Mishra wrote:
> The header file sm750_accel.h contains duplicate kernel-doc comments for
> sm750_hw_copyarea and sm750_hw_imageblit. These comments are outdated,
> still reference legacy CamelCase parameters, and generate kernel-doc
> warnings because they do not document the 'accel' parameter.
> 
> Since the correct and updated kernel-doc comments are already present
> in the actual implementation file (sm750_accel.c), remove the duplicate
> and outdated comments from the header.
> 
> Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
> ---

Acked-by: Dan Carpenter <error27@gmail.com>

Because nothing pisses me off more than comments...  :P  LOL.

regards,
dan carpenter

