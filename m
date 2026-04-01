Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B309A38AC60
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 20:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076763; cv=pass; b=KnZYIsJvU0u4E8qhj1FivhArXSJ8e5tCb/dRoenqTVQO0JU4bz8yA4ZB5XK517rMgBbbCDUcihF/uIp3yeTkHZUhn1dVFzIwM7Le2hMnTWphwfiBHqjWB2sFJCpo1bW6CLSgULPUZPKSesqQ+aZJZj++Jk0TvBqLY8IY+Aofg2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076763; c=relaxed/simple;
	bh=ri/pNPZ2yI/AphMFSWBYlDyPnCTcTEK7QUSx4kBYnb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOKGKXo7s6HZjRjEaI3BFKiMOSqSb9XAeIOTP7JazjdiWRUDYP3MKtcR0Uqm2bkKtqPHzr6q+USYQbcPcr6e1EGtXmqd/m5UIkO3XLtwi+RwhH7DLyIifWi65hVuqIj8CxqkL6WXaz6EDr7H8HDjaK+d7shbT+FVW+Iese8oC4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YP++eXPM; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YP++eXPM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so131050f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 13:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775076758; cv=none;
        d=google.com; s=arc-20240605;
        b=JjzBUSvt5nULrEwbezBlx5tDO2E3WLrjGrgbneIuNWCaZjEr2eqrWYWJyHt5pSGvEH
         0kq6CWlS2ahWj2wqhVSXQkCsvVZwmZGnw6LLHlEet9QtdXjI3SZa8a3Mhx+ixJf6q1ae
         GChOCQBJm87v5Z4N3p2sVA1G4pAZFjxlh3bZ6EXn3r+yzfP3GgWkypDCw20bYDZfkp9U
         KV49DyHLtfTq4O22G5wG1hMPaz3MQmvoFgwP0e3kG01AsgDvuG9oAB9VCJgkSA9R2+Xx
         XBjJmW0ycRQyE+nyBoPmEd3n7d96TtmOw+x7WsSDuVMNni+hr/wVqKo2AyJ45om51rK4
         SGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HoimxbKt5qba9bbJXYVSBq/YBaFKepqxOf2mE8S8QXE=;
        fh=+Q4WrsrF8hAFk3fUcuFuEWcgblHCSkAKDRMvg7UNLv4=;
        b=Y1Efr2U4ZpmpMc0Bv05t1zOEXaWjcD+E92nxUmcz7WVr4r1l7Zekxvqt1/5mxmALpg
         GJqnH2g6ioQyG4VqiKbQi8KTjYJr5mcYT7baKgP33CrxFa4UHJm9sC6pQs7hGWg7T0CQ
         1mAQ3TVuzHZ5H3kaG9ElXUm8niCwZ798uvyHYeaNo2gxLub4lVpVlNV2pR9mmyN+b+9N
         lKuIrMpaXBLlEOALKOwXS1eZuvMHCgO6YwXuAx5wa0SVuYb9nRQgunuMMH/1qJJc4mKx
         hzpnhP0HlFrnCuyh49hWoab/tb+GvNQuXc0ToTgCwMpBUz38mpY1ppzahfWFp+vlVVJg
         uRgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775076758; x=1775681558; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HoimxbKt5qba9bbJXYVSBq/YBaFKepqxOf2mE8S8QXE=;
        b=YP++eXPMr7zUbFGJT5THcbJ3J+rmi7/7dLBw21kYtriZQmbEwCrV7rK1HU6dHHjbyF
         iyF1vLrRPcySen1294Nv5vJhUBwZu+bLi/fH/4SuPDKqEYoeFar79cNAEzIy47BJvhIt
         LLWIbWBm24dHo6fnbKZZADTNUvGFyhyU2rz+AN4sLbWudg1M8319BsuV47xSCZF19L38
         jLZErseAIwmGvBXsmwDjGj2FSeVC84G39sKIjMzJ6BJ116SIcivWj8YqZdAtbCOKtrX0
         zpVK5l3kKrJatJl+EQCfpJjOyYDGASVW41r8LYVzIEgRPGfMxFvy41kDlvu9xJL5x4pD
         GtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775076758; x=1775681558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoimxbKt5qba9bbJXYVSBq/YBaFKepqxOf2mE8S8QXE=;
        b=H1AR2ypCH4ot6sl6aqg4DKorFAYnJ+cqCDWfJe4hzf8niAM6JZIAtfBhXm5ccH41tD
         WR+LI7Y/Ccnk1KOk5EL9Br9XHPOvBip+1pIPB3xVC3rvhcattiafFtprLvVTZdKIRhIx
         +fBrpr+wP0QFzdAuub3m/xHfJ57zNaZ9FQI4uXq+Z7Nl9bM06cxvYVmLgb42IJQNpPNt
         8peRdYGuJOO9c9TmSD35T4jNdMH0zgOxPLqe+5OubWdwDAZZtV9IsF8NUwEyWyyLYMfl
         elF+zpoYIiC6QMglbWdSszKWwjF4gKC9qzqcb+fpmYq6DHJwMlIXrL3GjDn196ggdezE
         CwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZK29xji2/cFzSvJYoqJn24FPhNbcdjmPGak8wAmXQCqxUaxyKr7XYkQEAvntZ95CaLnng52EGiK/EDY4l@lists.linux.dev
X-Gm-Message-State: AOJu0YzYWIn67j/K/vrLpb8GjjzUsGcfMF+cWG/Uu/FLPTIAbKT2jv9E
	jQfWMsAEW2xGhCEgpvQVPKYfOP6bHKVVpxmaFRKYoaP+XZ1zNIkPap4t3I3G8a+1S1e997bxMaN
	nYzSwU7q9v0VDmtNhmCgTQdVsAWb+Yg0=
X-Gm-Gg: ATEYQzzBQWWfv6MqGx2XY/j5/sB1dByzq3Sg7LYtpv9BwmBQJIZd+dXx5pimrgBl+sW
	gT1pX2r1kFj3Vtgkb4nDV7YvbriFidOENjQe4ii7FIIjHE3WCBHrGj4ZuiGVw4NWbPUPJeyh8Q1
	2FmNh+uEQQuzO6aA9B4+X6VsndJ+DgpPw6ej2Ad3nzYHeF1pTtrd6DEM/Ddb055eUFoMOuHOhbY
	7R7ShSK7UuhwrmiKvnrgZUxyXZV+/BO7Cq4gkkH0iRVhbgoOF/1CajuLBZzivz2woUTlPnwbpH7
	LHy8gFQGwkUZdReO2a952IbxQ8ox1GfPOpDUeAVOg9RNw9leDG/MMv+D+LMqM/L9zN2EnynONGe
	UR5ldeE7I6NAMTuabqgXfOj9A
X-Received: by 2002:a5d:5d85:0:b0:43b:6352:a262 with SMTP id
 ffacd0b85a97d-43d150d98a4mr9405424f8f.41.1775076758375; Wed, 01 Apr 2026
 13:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401173917.2946-1-joshua.crofts1@gmail.com> <2026040114-evident-groove-c44e@gregkh>
In-Reply-To: <2026040114-evident-groove-c44e@gregkh>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 1 Apr 2026 22:52:27 +0200
X-Gm-Features: AQROBzAkscrVcrr_12bkY7XXPyux6zfy-kMcba7RZcAgW3R6Z5O1KXCyEEo4wkw
Message-ID: <CALoEA-x0BfyPNxTcv1TMBcHoZHC-+iVjSwvqG62QmZXGWf2rJA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Use array_size() in rtw_spt_band_alloc
To: Greg KH <gregkh@linuxfoundation.org>
Cc: grondon@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2026 at 20:15, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Can this ever overflow?  Who controls n_channels, and why isn't it
> bounds check before this?  Also, this is just getting a pointer to a
> structure, it's not overflowing a size of an allocation.

Hi Greg,

You're right, this is pointer arithmetic, not an alloc. I was investigating a
Coccinelle warning and hadn't fully considered the context. This is my
first kernel patch after all.

Please drop this patch and thanks for your time reviewing it.

Kind regards

CJD
