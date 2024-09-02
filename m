Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF201AB6E5
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725298648; cv=none; b=FDnlamIYs11kjMhQQ8DL5c9H661UY+5JnGMYm0bB/b/dUo86l4U1rjgKmBe5o5VZKRFf0a0pq95HjgbTMuh0c9QlSqpgourBoHLN4IIu67lFQvLrBDn/G+nWY5eclavEysSJUwHu3H9u1OWpuWn4WVW15gG+K3s768NVp8z0/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725298648; c=relaxed/simple;
	bh=R8ofBeXTUxkXx1pjhLBpfeL7s4Dr/Qkwx/twKDs9v7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZ0QU8bi+9CS1/DXwJQjSlAdSOmblPtt+B87atPGVWMJr8kUriTJ+2zTo8+WTsx3zTVhV8Ysn0u7NQsJGFiK4eKitOWs1pxeuHaanigkhxkRKNH2iCeaNVjqokuCqeRS7wA14VRCXa2qbTJCvkDuMVrvPTKnU0AN/hR3FlNdxGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPRV2F6g; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPRV2F6g"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-533496017f8so5997107e87.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Sep 2024 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725298645; x=1725903445; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ibmpJbas6vW0Ls/BRv2OtSqexGSYnkIyXeM8JWd5d0k=;
        b=cPRV2F6gzzGxatEvHOrIIRIIP2mZlTSD+U+sLSVW5T3/P0Mq2RNy0jTfDuxxPQfrSW
         8N/HBf6dEXuERx+hcZoUiPHFzNT+ZBE1rrLi3k7GH2bei8TW1r+i8e5gO1cBjGLnq3TE
         NDCDfBWsEY/crO4+nLkTiHuRrs2oi/RIhyYkG7f9PsykHS+3xlTT6iQpZbUeE7P7tfZh
         VbzqfuVEU8Fclj629ahlIGrMcEk0xkMUoN40EnE0ZCJt+v3o69TsEvoktQ46RK5mJCf8
         ir6mygQZWPm/CbZoMmCj8Eb8gND/L5pL4sEoldqx6iSPgGcX+8jViE/a8BWvR9tyMpdB
         EuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725298645; x=1725903445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ibmpJbas6vW0Ls/BRv2OtSqexGSYnkIyXeM8JWd5d0k=;
        b=CuqAk09GzmL/g9dXoGV67mAXsuW52dObwxrv33+6esb1UyJaM0ZjhFyCMIUz7VSnJ+
         nKWOHTk22svZ5ILxcI7FBY750wuOE8cvLyvKEBKlHVSWIM+2nVSLo0u3M8J6KxeCEBpg
         f8pJNcqAS/SOfwR0ALYsUi6rYk3rSpZl9rkbQTG8+iDe+U+/JObOzU5nmnrDLQgzyvCZ
         zJN0mOTQF6S9sJxpMjTu+lTni7OpTCKvEYFyGvryG1Ov5jF+bnmnTeNE657kGin4STgq
         6L9UDsIQQFNZlYeZTBK7zCL6Mkfr0PONiZe3m2oqB8ueErJzUArZueZnrYU9b/d0WmXh
         y4UQ==
X-Gm-Message-State: AOJu0Yyc9eXFkUPvjkStlZlcKE+CIcScgk9NmZs9je60kekqOTBdkT52
	+CoJyQrhCTxNi9gnaNgkFmrngyGgdbjwzuLTE40yrKbrOWbRjr8I
X-Google-Smtp-Source: AGHT+IHAJ83XUAO0vx3AzvPzn9X3Z1pPwBgDfvvtixBuJpPeTVS7Wiey96LreMv45WtptTzA3a+inQ==
X-Received: by 2002:ac2:4c4b:0:b0:52c:caa6:13b4 with SMTP id 2adb3069b0e04-53546af5056mr7946363e87.3.1725298644196;
        Mon, 02 Sep 2024 10:37:24 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891a3dbdsm583280266b.131.2024.09.02.10.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 10:37:23 -0700 (PDT)
Message-ID: <1a7aa388-0917-46bc-8c3d-b6219d472070@gmail.com>
Date: Mon, 2 Sep 2024 19:37:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] staging: rtl8192e: remove RF90_PATH_{C,D}
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240831100809.29173-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240831100809.29173-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/24 12:08, Michael Straube wrote:
> This series removes the unsed RF90_PATH_C and RF90_PATH_D from the
> enum rf90_radio_path and adjusts the size of arrays that are indexed
> by values from rf90_radio_path.
> 
> Compile-tested only.
> 
> Michael Straube (5):
>    staging: rtl8192e: remove RF90_PATH_{C,D} from enum rf90_radio_path
>    staging: rtl8192e: adjust size of rx_pwr for new RF90_PATH_MAX
>    staging: rtl8192e: adjust size of trsw_gain_X for new RF90_PATH_MAX
>    staging: rtl8192e: adjust size of brfpath_rxenable for new
>      RF90_PATH_MAX
>    staging: rtl8192e: adjust size of RxMIMOSignalStrength
> 
>   drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 3 ++-
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 2 --
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 2 +-
>   drivers/staging/rtl8192e/rtllib.h              | 2 +-
>   5 files changed, 5 insertions(+), 6 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
