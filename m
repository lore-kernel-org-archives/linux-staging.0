Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B7A36C9EC
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 05:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782882420; cv=none; b=bs5Wny5h6psi6KUBl+c5vDyeLyoBRk4q/igPuzWHOov0glU5uH+Rv1Dy7JJT2gQ3ZcYcdAc0HU3ZCxia1+KJ6h2xz5G/7G3DfQ087Fu309ckd1R8fGUVoozb/2Tm90yUEdEiAn5GJzvAzUNp+61pyltUINhLABSu429XBMzfFXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782882420; c=relaxed/simple;
	bh=lFr+ukwiWIY19w+dAS6Pv7ubLR247NrU7SEjHac+NEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVicQc+hbGNZvkAeCZ3lTXxGIap/AseVoi1WAIoZ8Wufp7cE5v0E30JmdgCqRjEKRZS12kVT+V+Q+SHnJzmntU7PmENaEKpCQsJdCCaUPlAOUvGn7xi1V7CzxHtqEyKLacRQvmJ7m+5H+80jrlLulzBOCvv51a5EWhpTMRnHnCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlvY+ttF; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlvY+ttF"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso74647a34.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 22:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782882417; x=1783487217; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9862ZC2mh9/j1MKeFPYhR6cp5dT4HTxmJlSErp+XMAU=;
        b=dlvY+ttFI36n6Zt/CQT4PNC37x1SobqoLwQ4M1zGOgw4VjH4PVZZmSoJ35QYsSOI0Y
         7fJY0KYp2tFeEEDz8kp4v+MNxZCquUaPp++zgXb9B6UpuEci6VLnJZpR/nkMO602Ugrl
         7U/1GkFOOLtSWzL+do2Gh9neeiMOsvINpMjaWuJlwY4Xyzafk86ATL+MDehGTGfBiVm9
         9kWTLRR8Ujne+NocjFffRmNdZo5UpQ3uWP9Z2lkzbHiK3OvQrNo2xyF1xvf0A9+5Cnwa
         O4blKndy+Ld7NkKX0Xy2mMys83/BccnI/EURoMTgT4GyvfLstdXHQk1YoXtx9nOOTvun
         tkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782882417; x=1783487217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9862ZC2mh9/j1MKeFPYhR6cp5dT4HTxmJlSErp+XMAU=;
        b=YWGlYYHvJwsivN/lCGQvNLC354I6D9bBmClo7Bjq/P0bDc2tzRPU6GzlY6Hy3e3QzA
         eEGPd/PobiezQ5sBTQykUOvqkjg+XOSzxks2pEVKWF2tyah+/39xQtkTXoBZV1O9kOOG
         9Fb7IttH/qnp//vZYM6XDNIhqO/sLl5TnXp4SZJnohmZI0jWxYlTKzbuVOFoZCWCpnuS
         rK52svQZXE0YLIJ4EI8PV7CF4CTHsjMG9BiS1bBXI8ORFCJN41qLeTqhHVfKeXvcQRrc
         JWprSS20AVY2n7BcpnV+vByN7knQT8S1B2Som0QqjDivkVbSP8Jbb81UTd8hObSyeAIt
         1Olw==
X-Forwarded-Encrypted: i=1; AFNElJ/JzuLyH4TnJKpJ/pySTWkDKNyhjFgQX/hhQAKaIKR0UD9bP4JQr+x4oiMr3cdPxyx82Mo/2/P/D5Xe2KTf@lists.linux.dev
X-Gm-Message-State: AOJu0YzZswFVNycjnm7zBhF/QdsEx97t79L0Y/tRhoLKvBDAVhNm+TTK
	qSQPxJNVOdCiB5Y2rpQHcW24rTEm3kaf6dAGj3ymrKhVYf/bC9ZGQw8evckhyr26zpQ=
X-Gm-Gg: AfdE7cm38lZN6ZYHPfR93LERHPEe6ty9C8A3xqFzvAufdG1Vgqm2Um4SFXgPvND5cwd
	vW7Ni19olrsQkdNFFx3dF+RyUHueY3ri6Fi0MeIjH3VU81z5pT2kkWNSBZABDiK1pBxAqZbP3IH
	qyHy1K5CkvHJkl6dwBtJL2WrZol3x3jANHcleFpQNfWRu87K4+qx9nr9BQSoqAvXLmj4cCq8Ead
	b355iXrRvgSKEMZw/mDcJFLn9N+pqNzEXBPDTyAmghRMgxvL8NKP8WkROig5tChIehzxb9SJTcH
	gVUCxMGv6VlsriphxV1gk/5VtxFs6gVFQiIDmycUUmXwlvURa4RzKXHAfLl2TCcy1kt64eiDWmZ
	iqdikTGC8YSE1fURpQrMUVyzxCf7y7+CQpB8SyqiQlG/siiHBgTGrjPvXSJUj6+xtmv34pKQbRP
	ocOfvq
X-Received: by 2002:a05:6830:700c:b0:7e6:c819:22e9 with SMTP id 46e09a7af769-7e9fc23dabamr2278649a34.17.1782882416900;
        Tue, 30 Jun 2026 22:06:56 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec31293fsm3995004a34.23.2026.06.30.22.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:06:56 -0700 (PDT)
Date: Wed, 1 Jul 2026 08:06:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode array const
Message-ID: <akSgaOdkxQHL2R7t@stanley.mountain>
References: <20260701041423.7881-1-miraly.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701041423.7881-1-miraly.dev@gmail.com>

On Wed, Jul 01, 2026 at 09:14:23AM +0500, Ruziev Miraly wrote:
> The g_fbmode array of pointers to constant strings is never modified.
> Mark it as const to move it to the read-only data section (.rodata)
> and comply with the Linux kernel coding style.
> 
> Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
> ---

For old warnings, you should assume that maybe it's deliberate and look
it up on lore to see why.

regards,
dan carpenter

