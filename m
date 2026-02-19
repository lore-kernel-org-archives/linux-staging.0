Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D4E325729
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 06:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771484145; cv=none; b=sT3yK/fSzzOn4u4NK3//Sg9v6ra3YcFDfGnQOFsQiaJrz63u6YZTYhhq0v9wDceKDPpPlPh5T6dcVGpIE1in9JXUD7OPL/ICzqtbxzFO55YSXkthrOTxfKepF7EyS31e0K0RXc+k+4/OlelKyKNcS367lKnpPpXuFjMDPFiWPyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771484145; c=relaxed/simple;
	bh=h6C6Rl/C14U6XEKXE7Zacworo+izARx/EsAioocuE54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWxbKWxw57Gm31dxqFGEP18ueB8uw6843qrws6LHG8/+oD39LCxZDtxbV2mWtwX9+hr/UPTyCT/LNLGuZ5trvUmOX/x2MLztxKBsVpSLpmoR1GSm6Gm7BOvg8K2w10tjHq2mF87+QyRBYKCt1WbLYHM2aWnt/D1XlwB80A/K6kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qKtzV89H; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qKtzV89H"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483a233819aso59225e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 22:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771484141; x=1772088941; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E/z8DUBlvRShOEs/ZLMAJkKG+Ia036OEocxXbY1rOKc=;
        b=qKtzV89HvrQN0fxzVyJXLFFlmS2IlEERp0OyLnXZDoujT6eZhn8F8+JLctfKo+wC16
         4EelGmU55nnNDQCraOCaLKW9A1SFqQRYOORiKCWOv063kxZ5HOKMtSD3WMiEu1j//Sa/
         SZQJTl2xWWSFMyl04AhoCIXerINjMLy3dhPf8WdQTAl0bdVN8KtRGyV/FHe5Z38W34/s
         dCGgiUYl15/q2xTdpx83dMjElyb+YB1zOvPsWi6Fc6NR15SyhSVz797YmOrbJW1Vxj4w
         3M2EfxjuaUQB+eRWaLMWVb9yKEWCQMIlhjsxQHqod/3C18fo31JLgk5F3BvbpTPlOPyC
         OTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771484141; x=1772088941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/z8DUBlvRShOEs/ZLMAJkKG+Ia036OEocxXbY1rOKc=;
        b=UvaHNzzkDfH5SR7DlsAbWOvT9HGKRTeSKwuqKhsuU352KBBRvoCh6gmbq/ln054OqZ
         XW9B7T0ZVx8GuICr3mzhV5DgRkUjSYFkt0+X8FDqOXqMm2HL8sEM06PBBKNan62k+FTK
         lzYEz3tvi8qP7euIp6rYGgP6zhvO/unOYcbH+ee990LiNFdNegoqyym04Au5vx34ghOF
         7Ve0U0Ma48OLuvmCfbJJrlPfGzYJYx/Bt7u6P51CTX/ZMfuEJQSumPtX4JKB97li0hg2
         wudE40UhFC5gJJj5mdEfz5uwnfMI14bjJ/YYLug/aMmerhr8HLdqFzEp79XkZgyi2UDC
         B+tA==
X-Forwarded-Encrypted: i=1; AJvYcCUEncLtgxoKkieckoAjRQbrmeEc5KqMj6MlJf9jSy3FMpcCkao8Q5K9uqYR67eHmuBZyPvghuqXthQxWRNr@lists.linux.dev
X-Gm-Message-State: AOJu0YwpX4pmq44cxSXtGaXCsjtZcH0Q8wI6ztmg+gUPY9eq1JJqoNog
	TZGJJhsyM4Sh5sRkPBXXYwVLosLDRU8xOREsSLkOJ6wRnIu/VrGCYJt5KoTp13J0nNk=
X-Gm-Gg: AZuq6aLQtssEi3T8f+hASjQQVGH24+oYalDPNNYJouxdYuQnPXyRmig+c/Wquq9Jj5s
	7BXbZU9wKMPeYDI31sAycnE9IgeID42V5BZ2RbM16H4mh1gqNbmKDgyyNhDRr3HyEdc5LnkueAp
	JHQJga01wcp/+HUr6ikWVpfnXWyO0TfeOJtWk65Ff52tYX2PIDPadOI0e25/BqhoaAQbVlgGu3b
	Ldae0s93l/p7hiE4nSnz3W6U0iazpQ6Y0ib/mHIwBI6SHjL2GEGf4BD9+A3pnGit/BMCAk3n34D
	qW0n+ThwHIDz91pUPkkM4l3ngdPae8EZf4M8xBaMkMWTJx2HNPRwiI0uGEUEUj5Epq9M8omA5He
	AIRAYO8oReNnCLOIjzkHmCZYUwS976XE1m4QndijQowYWrdrDAGXJqX9J6Rdvnm1lBdX4B0Km4t
	BL+IaSBKIu+ehqzS5oDfxwN+n3/g9p
X-Received: by 2002:a05:600c:474c:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-48398b78ea8mr60187755e9.30.1771484141289;
        Wed, 18 Feb 2026 22:55:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836ff00332sm408299005e9.2.2026.02.18.22.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:55:40 -0800 (PST)
Date: Thu, 19 Feb 2026 09:55:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?Q?Ey=C3=BCp_Kerem_Ba=C5=9F?= <baseyupkerem@gmail.com>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>, sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com, gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: add missing const to g_fbmode array
Message-ID: <aZaz6ZyNqyyXuy3I@stanley.mountain>
References: <20260216003939.206758-1-baseyupkerem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216003939.206758-1-baseyupkerem@gmail.com>

On Mon, Feb 16, 2026 at 03:39:39AM +0300, Eyüp Kerem Baş wrote:
> Checkpatch reported a warning that the static const char * array should
> probably be static const char * const. This patch adds the missing const
> keyword to g_fbmode array, moving it to read-only memory.
> 
> Signed-off-by: Eyüp Kerem Baş <baseyupkerem@gmail.com>
> ---

This beaks the build.

regards,
dan carpenter

