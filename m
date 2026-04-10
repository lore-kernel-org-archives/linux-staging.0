Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450983D9DA7
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775837674; cv=none; b=MX7KZfLQEe51Rpe52Kl2DgNw9LfckuFHRRPfEXmpuFwXpFtYihqwOB9g5Ig382cF333vPra04cvReCk3x5WFl9OLroBMHLKlJbXrHUAUV4OI2FOpj0lLmEiBJqOK8lmkkny1F3ob0LBALupZJ8IVzEGxcSyfvHgKd9QkKFO8myk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775837674; c=relaxed/simple;
	bh=1AzS82S56n+QGXJOncdKL9W5z7WDXflEXP+d4nQ61gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMhUnpJQO9/O5LSy4UNTWYSdRnbIZei+j8OP/4qCyF+ON+wgWxHQ61msd4EOEZ911okNtVFwR/qJLqBtAVOAwDmh72xgHrAPzu5laMnVCu0wp2WWgYbcg8lHI3aFSSGZqy01AmXfO043KAAoYSnelywMHSI85igHuaTUCUyuDT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGOwe09c; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGOwe09c"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d43e09de5so1233743f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775837672; x=1776442472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1AzS82S56n+QGXJOncdKL9W5z7WDXflEXP+d4nQ61gk=;
        b=iGOwe09cHxPv20lHS7zlCRrJuuWB4nPHBcWaS3IKsP3N4Ba2wOkBsS2GRsgW0vcp7z
         H5UEfAivW0shiWsZoV7J6m2+2nveuxutViPcxLFRTcRuSN5qSPACvk58Xykvn0Y6ck4W
         lUReEd+jhddedi1NYd/+6yQB3J8KXw/1KHDQ7oKxSDv4HJXP0Xn3PkLuCOOFyaxiuHxG
         MDHlEBXejr5kiJISdGrJhsCOX8sQMkEVQ+whDM3leQtFZHCMBOMhW6BCen1WgjJ5uYB4
         dxDhBeKbdhewruSsWAf3YqTtMu97/1qQcaxkQJK4lebwaPpx+6NvthmyQZs56mYeRVsb
         Tl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775837672; x=1776442472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AzS82S56n+QGXJOncdKL9W5z7WDXflEXP+d4nQ61gk=;
        b=p7UffZ0256x1ZUCBLhNg9Y3xKiw8IEfk/1xfADVRlXbhczVIVyJJeP98U+oelbxKO7
         dp9q6y7fxkrlyeqj653FTd5s4MeJDA8KutFrvNk6Yrb6u+9BN94PnIHYle89HsQegH87
         pe0V8NkIoLKtec2AHYIPpvkxGStpF1BVbHJV3gcMCDfFxNmG+gNbxby1y+ntmZTdo8dD
         YOsLVRqRvIzudji6ghJY7lkth/Qds4xaoFSUBTa64AGG+B1K6m3ckZRFBGP7u+ESwOMw
         IW3S8E6X4xvZtSYbucEWLwMBgXE4CLsVff974Hf4K+eiNdW+vF/s8gASHTUQyhEDTv6X
         JK+g==
X-Forwarded-Encrypted: i=1; AJvYcCUV7vUPkxlncv6uBtv7s6HuvMjXwcTx+Vkflx9glymvkUSm04J5nah4uNKAuqfiB0vy6ZrODvWZMPuvH26R@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4d6Xy7gFZt7uqBGbnaCEoq4Q/vmoelUwyIvXpCSPOUBX3MKnN
	EmHWkrwpR/79sSeLwtFEcZC9SZBZTliSjeAgbM3cV4RPp6lv02g/NfWN
X-Gm-Gg: AeBDieuKM+hW/lIFmg2ZSlF+kC3Sgmia6ne9VnNKlEapx9ptPUm/Qy/P+Y+8C+dDtD9
	yBYQOvNuHTvifsIq/JsQVNiXnmtjPgKGJBb600fVLl3pneGeITYqEJ+ZI/xYZRt/nF+JTvWZ+d9
	UA44TfUumEi5/Jz5SatgtbIp1dTmrcRd6xsENkIOVtk8RaJYlZ9KP39HHBZ/UbxVhVdefpfSuCS
	bktcZ4Jj7NTmwZjHAujIRPquLypTV9aJCBb6PgVvWaVndubpoQ/MFIdsqih98pDuZ/yAixfWeIK
	JiHm9KAfkilGDLhj+3s2vcJE4zaW3D8jHLzcBLi9gxIMd+MNH8k0X+8v2DMzkWpjcnLEuhP3Rh+
	zCz9/FwliE0u9o5r94weUB+9PyJv5rD2Wn2zC18ZftjtajsmAZzahnH65gqrnKAjbzQo3Nh0BjL
	s6JnhjfFRloQfHhxFA9mBgQG3qnAB9jg==
X-Received: by 2002:a5d:5846:0:b0:43b:3d4f:e18d with SMTP id ffacd0b85a97d-43d642c3db2mr5952453f8f.39.1775837671379;
        Fri, 10 Apr 2026 09:14:31 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1c39:1fd5:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm9029419f8f.2.2026.04.10.09.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:14:30 -0700 (PDT)
Date: Fri, 10 Apr 2026 18:14:27 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Josh Hesketh <josh.hesketh@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: remove dead code from av7110_hw.c
Message-ID: <adke6OqyRZcurrkn@gmail.com>
References: <20260410152502.25310-1-josh.hesketh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410152502.25310-1-josh.hesketh@gmail.com>

On Fri, Apr 10, 2026 at 04:25:02PM +0100, Josh Hesketh wrote:
> Remove functions av7110_reset_arm() and av7110_send_ci_cmd()
> which have both been disabled behind #if 0 since the introduction
> to staging. Code can be recovered from git history.
>

cleanup patches for this driver won't be accepted anymore :(

--
regards,
jose a. p-a
