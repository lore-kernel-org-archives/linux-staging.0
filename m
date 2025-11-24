Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8E2EA481
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971104; cv=none; b=owGeGJk+R86HPweQj8m+MDaCqfR7CNR3sSZAp0XzaJcla/CudjmjdxuJ8tdlYiGVCCT8HZOeo0i+iW7n/TSGB1mm0RGcBsfVB4cdMkx61UEhUQ2W9nMOnXPd/lYyCoca2eBlv6jNQ9mYyRAY5Ul+wnkVRhe6pqsnTXOdVRpLZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971104; c=relaxed/simple;
	bh=1vl7He46Byfd9YcUWp3Dqj+GQqhs+LHuKG8zA25Qejg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyFJ/wWdBHFdb8PM0je97VqW8t3nYxBNx9t3B11YC7uvWKZYIPfriQXdAco+Ibz9bgFkFkWHAPgxMKMXVcfpWW2BM04gLABMVtf63mbHnxF8x5Ynfv2srggRplaJyexXSx0AV/XWrfz2qbd2H+gc4p7U1vSA6cUcB0mVwEKXypo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dn9fx/jR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dn9fx/jR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47774d3536dso30216875e9.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Nov 2025 23:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763971101; x=1764575901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ow5rqtFlkkCE0HO3jZ9flsQUQ1gP+yfpoRkDkTMFPY=;
        b=Dn9fx/jRok1EdE+FxLPx7Y1LlsvYbw3bhWZUYoETdVdXzRPJ0EfxVsETkJdmzMUSUO
         Py74UpPv35+fQVpEZFrqQheBSVg+XHE4uyUxR82o6CIY6MVA5MpKXwKg75+2qSEs6DYZ
         gwIvI4OFORxHzDv93DR8TT/9k95G3dkevWoWHe+B2dI1ObRrmBdztCjEpInY9UFO79xX
         +Ikt2zWxJShCWLeC6uFCfK7ZFHP4WMNBDAAjaHQy80jFC/Uxgutrf5xUw7i/M5+v0Y2h
         MmLkRPV6q0s8/UZoSRQbEsDf3Ay2RLSuZ6KoZVomk5KBICzx9I/s1byBgV7FNIODs1/6
         4VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971101; x=1764575901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ow5rqtFlkkCE0HO3jZ9flsQUQ1gP+yfpoRkDkTMFPY=;
        b=tQbT8w3BLKWf83FXTUZ5j3PsT7zOwo4xayLeetZQICHX5wwZ/wtzSPsMOHkMbbIL7o
         7tAdi2N4vN0DKci5fORDIQXJ8XMzpAzJfI56cgvDEy1/b3YCw4MbEfEiiMydDVD3wEzH
         GGQV9CQJK8q2Ig1P0f/ypvij1NyIPKc7kNpT2lPi9edRO/Pa6IwsNz9bycghQ4JF1pJa
         OrjVcDdx35mCeeGRcIEnqC242rtztfx87fSf8gq3NCg2AZyszCMzlTqpruptddJYikzr
         DaiUPOAN13/B4PTJf3UL/m/XrYc9WBHeOE99jo29M1V9BN+IV/bj2Zdf2IfOVfTkXi/P
         JlJw==
X-Forwarded-Encrypted: i=1; AJvYcCXL2Wdy5AN2qJNxFrTtGrUYdiL9pG37V2RSC0K+F9ZAyaJFczZzW8Bxi3RczYcesc5x9GXIH2kicLCc0z8e@lists.linux.dev
X-Gm-Message-State: AOJu0YygB1zi7VGBuOa4Szj3n2ea6OO0jm3xZMc3cSmfefUBREVMryXT
	5zh1+UzyPZaS1GwUEKsNaPFMpKZ0OOhHVaNWQ/fvSHG7WSuDr9ioeZOBa4R51rks8Ok=
X-Gm-Gg: ASbGnctYbW6NwEvhyCemYPohM2g9wLVbUSDEMQbZ8dwwxWa2Z7Kx8blcDQThP3lPOcu
	0gqBU1lICxx8HtmMuYvhivZVu4g+z7A1hSPO2cHnaYyabEHRtk0CtocdVRMae9GPKmrKHJVyM9A
	btJLMVkAUq5XQbH2f7W6vZgzAztcSlzWkTLtsiCmoGVmrwyIqWnFY85c25Esnp7gNQylIjz3TKT
	LdYbhXHtfpFwElGz9larqDdt9wch+nVdItcGV1c7PRPbGekdwoS1iWrXMha1vx4cHqdZ4H6PZYh
	MvagcqyTaBDzbZjuoeSKswcDxHncOQS7VCUxievq2Bd6rwd4gY0fJutlQLzcxv53uCSCfHAvrwE
	YQ72ZZl8gQbA8vZjTroJshzUvwpHAhF0Icu+VVj14LnnUdtkJ8Kxbfv+cadnJEtTBdM7OGNwQ6W
	bwF/nTkIaeOcRHrk1m
X-Google-Smtp-Source: AGHT+IEJF/HTCKkgiqx6R8LN1dMk2422nEzPu1NgPHZNxp0vZgonP3p6G9+9GqYYAwdh0L8bJfAgtQ==
X-Received: by 2002:a05:600c:17d1:b0:475:d7fd:5c59 with SMTP id 5b1f17b1804b1-477b9ef509dmr94106345e9.16.1763971100939;
        Sun, 23 Nov 2025 23:58:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9739964sm148939235e9.1.2025.11.23.23.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 23:58:20 -0800 (PST)
Date: Mon, 24 Nov 2025 10:58:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artur Stupa <arthur.stupa@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] staging: rtl8723bs: core: fix block comment style
 issues
Message-ID: <aSQQGULOM-V4smT6@stanley.mountain>
References: <20251120203056.15314-1-arthur.stupa@gmail.com>
 <20251121224143.33701-1-arthur.stupa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121224143.33701-1-arthur.stupa@gmail.com>

On Fri, Nov 21, 2025 at 02:41:34PM -0800, Artur Stupa wrote:
> Fix the following checkpatch warnings for block comments:
> * Block comments should align the * on each line
> * Block comments use * on subsequent lines
> * Block comments use a trailing */ on a separate line
> 
> No functional changes.
> 
> Signed-off-by: Artur Stupa <arthur.stupa@gmail.com>
> ---
> Changes in v4:
> * Documented changes between patch versions.
> 
> Changes in v3:
> * Deleted ************* lines in comments.
> * Moved dead commented-out code deletion to patch 2/2.
> 
> Changes in v2:
> * Fixed "trailing */" checkpatch warnings.
> * Deleted dead commented-out code in rtw_wlan_util.c.

LGTM.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

