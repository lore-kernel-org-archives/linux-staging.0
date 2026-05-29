Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C1E3B6C1D
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051277; cv=none; b=O/4iPgrEx4icYtKWJSF0UEsZdzF+8TZTGIkeO95xdl8A3VNEUTgxyuRnqTA9yj5bcU+XLzrCxBL624fBu7YiqCLqCxebQYM8Ci81qy+vr0VHH0ME/K+5ol9LKhk35jNsmv5bARGUgkYOL7lismoEKSKRECSrl08RejpEJdIWd1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051277; c=relaxed/simple;
	bh=oHKZ7aZuBlsJtJpEtPqvcdM7AnR3aUHFHT0UZkB5BHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaM4fjKnDA2PxGHrannP5QIfcIlbdhtKUuzuhw1WaDVG6KqnigxG/fjbZ6/5jY0bjEiFA7ZpXNv91rsE7ZGwP/seG4+8d9rPB6ZIkL4Ten6CkYkI+PsE4sswgQeZFx/amye3s7PbNg7tif0s7dIWS6dMt7Zt1rCrpiGW2uYS4cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWrZtnGh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWrZtnGh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4906238c62eso53039515e9.3
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051275; x=1780656075; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqhodKoFqMFPzDEPcNHt1DpRqaaJn5LAtjO9WeibWTM=;
        b=VWrZtnGh6pStz5LQBpRUyFDDbe5ssJYwJuPiNschkXrAKWx9c9bE2WOflj3asRTNWG
         p640Qj/YlT0XKsiExUxmNVb8fKTTMy2dF5kuFl3po0peOuO1vJyKvX8P1/3awNwydL3F
         Dq3vqR+uRkBiglsW6FfsWpaOeWTpDMtlu0YCl8IfRkUTLFFFGN0SclSaZeqNm80OdIf6
         hHjFRmkVqc406rXq9AsTpbBYptHaED22qicft4qyVZbu9YearbUgRWShtwuFAqLXs+z+
         +k3ZD7n98mqicSwMcZ1zRACxeDpChGmXYt76dETH5IunmVWtr5D/THB9ThxUKj7tIyuE
         W6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051275; x=1780656075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqhodKoFqMFPzDEPcNHt1DpRqaaJn5LAtjO9WeibWTM=;
        b=eGmM9DWDboSyc2OExsVHExnduDAU6X0m2wk6zxMGaummZ0x67dq/TwCY6Ax02VRQMD
         xc+QADCMbcKT8QK+gs+jKwp2E3nTv+AhsbhRrUkNkc4opOXQw/3ep/m/67Oo0+g4EvLs
         OstLamn8BLnIUFXkasdGAzROyvS/pTgezoB1ShKwyWu7nid1YI37V/EOTQxN30uVxBQK
         LvOmtFvGyRe/Rb99F3oT87/lNGFKze7xUoH9QRj++ETD1deeJ4ObMAkT2q0x5YhA5L6U
         pMXCXN5W8Yg9ENusK4O2jlXIMH6joj4PPDuPJmUFY+p3l1PS3jA/hVM75fI0zNM7p4fM
         mayg==
X-Forwarded-Encrypted: i=1; AFNElJ8j4bb9iV6Pe5okcxqsHHBdjtJz84hohftz9Zw0QW7xhKnoa5WFaEgxZmQSPaasSIXJkiilVtdyt0jxqW4m@lists.linux.dev
X-Gm-Message-State: AOJu0Yywx/7G9p3pFYvCOR8NPZSo2URF9VhIXrh/hinOnoKqqAEYyz+0
	xa0rjrfIpwOce6mwVhrAW/jzBSt3UZle0aea820VIeFiHYF4TVpdYoj4
X-Gm-Gg: Acq92OGCEEmZbXyJjqSaN2KuO4PGL9rJo5DnqFvhEeySmqXb5zTpGwO7+JBhfdXvvWm
	CJZ1lyQ+dMIjVGUrzVg4gLlw45vBNbg24PGhChwlhL5sW0aKRldDmhqEsZpgYU9nv7F7KIH0Oox
	e8VBVjUFCGdUAV2R8x3kY5nGs86noz95p/KFQSlpAnmRw125OdJaIULHMjBodPcaEr3QQDTOVXV
	wOXp+luAIFIQb1yD2vADOPIp0yVNiotG4AR3JKO8sbzJExdg/XKXgAUiXGpA0AZJH2TGZH5vFl6
	8RLNquh+udnEwLH/duu9TcpHr3mUL70FHp9GVHv2Q2PFLolSEpcyt96525bk+S5fe8V49fHdDoA
	VV4T4jG4uVyMd932F5U1A7mGWIAWcY1Po1ixiA+qlNEt1bapgH9MfEYoGIgPg60Zk+esyPMRvTO
	ZGVnzGuPRcOClrWKE2QJgSYbGSxzlk2U7eOA==
X-Received: by 2002:a05:600c:6287:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-4909c08cd89mr42255635e9.14.1780051274994;
        Fri, 29 May 2026 03:41:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0a4dc0sm17471315e9.2.2026.05.29.03.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:41:14 -0700 (PDT)
Date: Fri, 29 May 2026 13:41:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Onish Sharma <neharora23587@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: rename pv_reg to io_base
Message-ID: <ahltRvVgehkgvDFx@stanley.mountain>
References: <ahhN_kiSb-yRWfiI@stanley.mountain>
 <20260529095233.9015-1-neharora23587@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529095233.9015-1-neharora23587@gmail.com>

On Fri, May 29, 2026 at 03:22:33PM +0530, Onish Sharma wrote:
> Rename pv_reg to io_base to follow kernel naming style and improve
> readability.
> 
> No functional changes intended.

Run your patches through checkpatch.  Also v2 patches need to be sent
in a specific format.  This should be [PATCH v2 1/2]

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

> ---
  ^^^
There needs to be a note here to say what changed.

regards,
dan carpenter

