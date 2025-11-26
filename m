Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04350278165
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177824; cv=none; b=frCyLKSYhY3mHYuaOgCilVgWbIgrQa26dSmsRO/3ULoo8TRJymQO85ylG9T5IYA+zcq17yCW7CvM0nsYrTClWalxRNR6Gf/ihzANSkitOKDehjT2mNyqk77YF57vOqcaKgo9XyZ98qqow6xP7kfZmZON404zQmv6nyCOlBAXXdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177824; c=relaxed/simple;
	bh=qdNdvkkcH2DrTe/8i+gZe6RIJVkzN/uOUD5qDgg684E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6UiWU/M2caG4AdMVsRb65niqL12QfS+lIomCdwUKAqL/0DbcD4Mc/83xIfqRe4UMdc4bd2nS4cBkJPOFz99pG5hBMOKhCSBcxYihogIH/orUDqX0CO4b53yQu2f/kPffphD93FeVc1El8f+Q9OBzWrlJS8QEMl5ue07dgK/N6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OR7h4ucq; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OR7h4ucq"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so7286485b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 09:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764177822; x=1764782622; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hgccWNagn5NoA0GO3nWRA61ieoEenim/RTtgR4hPSL8=;
        b=OR7h4ucqYkkO8NNRdVfQWr/0MICx84GXX0ofvSd2UVoiZdST9vj26BX6D2rxNJXJIg
         aXvY1uYvnODS5Y/2GQ2w/Z9abW8QNetnQyePuOXBbtqy9aw1sySneiQ7z89ajK8aznwn
         B9vBy5hVx4Or+/FkEFXDDCLgMiiY+PsYFnYxUXHsrD2zdxnS08/6SpEpbrM6DdnpdFjV
         utHe1OYiVJWXlAFN6Oh5dalHrbyhZQ4DddYouFH+K1bmZ/e07medJJtWLcnMo6LRMqDd
         XSAqh4DuLYiRg0jyEbzq9eEtwreo5YU4sGznhLK+5RFLa5uCQWQaduQfZFF+DBra4SnV
         lORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764177822; x=1764782622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgccWNagn5NoA0GO3nWRA61ieoEenim/RTtgR4hPSL8=;
        b=b9TXhEEdYCDwBjaBWhDqA6AsQIJKbJ3qwsNV7BBaHYd4s9m9qmiWlR6jOBb2tFv3Ax
         dhZQ0RTiJcOgAeohwO7yOWAIfkM3eRLLNnJNJvJlmB+7fP+TPNNaI7MsKIv3LS2g/ZKM
         Wnovi7T62TZJCGXpDBugqzlwSvLkizJLZAz20lP9bMEwI0/l0iGoa1ARAbyS53UtGa3J
         HvOvD+lHxb0+ohH3P06woiXz9+4aT6G2tc1M57DXS9anLqzJv8ybE8KFh6ZfCkuSJell
         fc4ffWQnEKb3if/sYY9owOJ4oGR4ucU66b4Jq9K/C8N0+R/jDybkMGWgSZycdRxb0gO5
         FT6w==
X-Forwarded-Encrypted: i=1; AJvYcCXq9+zgHlzlgUdro0Ci3lZK7Oeqkn6jbkhaWiVmwWOxPGlONj1+cCT2FMZTQwrIxTztVPfplBbB6gbcje/T@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbnn50AlLLHpNb2TTtborap4Ak0xgk16/k33A4wfWzOEBrLElm
	ZGVuQgNnBQl+qv+xdz+xjbRu518aK2He+H+YgmInRzXnpginWngyG327
X-Gm-Gg: ASbGncvhXXF6H/YRRCUE4XVT2SlS2hTPdVsgPhUTcouwJy4vtsGNPj6eoOlT1KUxqZs
	TwtRocufC/UGJtWYmzGCVdPpBFWna5R1mUPLnsPjPR79CpGgmR6ZBRx4R5UCrrdVIx2cQVtP6Db
	axXDLfUpwf2gDx3kdv6L89J98s+xd3IcVo4FRxRhZjAKzlH1Qw7AkaEtAFgvCFxzgSXsQaMivAE
	4+EMItE2KLhuzpgKKwnCMPdNnjLPFpg0aWw5rhG7SP8l1G+skE/n7n7mqosoFsiI2BdWc8WOrUL
	DYQI4fX9Te9xbMMzZa2GOOMQuL87ZXnJf8i0cbVyIuCSZc57xuuso/apVxRaux6+V4RunYlz8Nk
	4sMnGlyA5MG6a4ZnKGhI+dO4xvMqA9hvTZxWzEllEy2LclXs3xQsfAtKQN6dYnmdpbL6GSwMRqV
	j0opc=
X-Google-Smtp-Source: AGHT+IGRHySdo9FUgc9/IfGNIOwPg48nCrRI1veWq4/gC4L7OsRh669xhqoh19iqPh9ixZzao/CDeg==
X-Received: by 2002:a05:6a21:33a3:b0:2ca:1b5:9d45 with SMTP id adf61e73a8af0-3614ed962c5mr21060373637.32.1764177822231;
        Wed, 26 Nov 2025 09:23:42 -0800 (PST)
Received: from essd ([49.37.219.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471f8dsm22477330b3a.23.2025.11.26.09.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:23:41 -0800 (PST)
Date: Wed, 26 Nov 2025 22:53:36 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] most: core: fix resource leak in
 most_register_interface error paths
Message-ID: <oshrhoyltm2unauarzluds3dczla6zf3dhaqk7w5ua337sbllo@wbqyquk32mhh>
References: <20251125225606.70719-1-knavaneeth786@gmail.com>
 <20251125225606.70719-2-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125225606.70719-2-knavaneeth786@gmail.com>

On Tue, Nov 25, 2025 at 10:56:05PM +0000, Navaneeth K wrote:
> The function most_register_interface() did not correctly release resources
> if it failed early (before device_register). In these cases, it returned
> an error code immediately, leaking the memory allocated for the interface.
> 
> Fix this by initializing the device early via device_initialize() and
> calling put_device() on all error paths. This ensures the release
> callback is triggered to free memory.
> 
> Switch to using device_add() instead of device_register() to handle
> the split initialization.

Acked-by: Abdun Nihaal <abdun.nihaal@gmail.com>
