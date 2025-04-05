Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507AB4D8CE
	for <linux-staging@lists.linux.dev>; Sat,  5 Apr 2025 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743865120; cv=none; b=Gy0g/rzkIBD8Kme8rObIq4lzsI+bDhL/+kQsSsjGs4b/nuZmKacv/RGcDJ+4N+nTX+Gc+Ym+LrGfxYc2RpwP2lJxTqgQ6EdZGl+GhOjaGMm8XkShvkFjbP1jkanQHwK8pEBM/uj1z4SOYb1c2niaM4Gfs47Tf8ZXOvsOSm2naJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743865120; c=relaxed/simple;
	bh=N9t93yqbj2djYP7dFCDgM1xUqHLYdb9cLQ/mVQ8ZdXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtmLpVqou7Vxag+0p/LluvhftX/1EXOyqmk7tUrl3BtDTuJBSSG00MrWMcLxy9BeQW318GwJ37uPbF94mcjzbsM8JbVrgx3Gmww3a5X3qbsqsC4rBpJmwHqudHfJ4MSgZ7ds4BbrJ2tNRZhdkmMRO+pJi1aKfooo7Xcun6y/Nco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5PO98Jr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5PO98Jr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2678206f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Apr 2025 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743865116; x=1744469916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/SmM4ytvnKmQeFMenBw45G9NZO2G3CpELElKjb7zxY=;
        b=r5PO98JrKj6wqiah/oGIkG23KzQlPPun5drszvF5dpb2KbXxnpbU/wl1t6x8I81M1h
         KuWLNvyhuDaGbkUengRVyDK3FuLnPAZTyPwFHm3R7n8laHDlTUGhRxRMnEGO5aikSEbU
         IbNinL62Q7iEnuWNdhR02FkR0pCn3D00P7MaXA6WmhFUuKxbrdArQxoTLiz2Mrb9wFFl
         VLQDAPn0UDh51O5KGWu/yo2zMK6icRI8kjZHTxN5fBg2RMt2rAk7tWErOF0Y82HxsU/4
         X1TIYIKMSmvLcHmbkthZchkY+DTbUvkUGZ3HkgDc+CT4pl06siMc310DLr+LQdZWk3K4
         +Eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743865116; x=1744469916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/SmM4ytvnKmQeFMenBw45G9NZO2G3CpELElKjb7zxY=;
        b=T3sxVCpMxPJMeWgJbtbQOqf/qba20+IeqqsHTHfGJ8UYRigsIxVy3k4in6rF22KxRe
         lq1qthuvqk3CZtnJMKk2PN9+8m2Y6E9OPLxatcWkAUnideYOC8/bNUP8tn1p2EoUMbJ5
         EgcFys2TSdEzO5/XB/h9T2dAgkSivhZgvh2swMVeAAOyhavCn2c/yz4VWOpwqA9IeCdA
         57qrYaEuGvnZmvcSF4vDDXDlmhZ0Y7oPPWhum+dYdjd8CLOCLAZisD/lE7n2mZUWAo63
         5s8EIxFt4efWlkGymS+j5CFQrczbGgJGiAyFALNSn11T2m1l/WoPXKA7btc2FurKQurp
         dGhA==
X-Forwarded-Encrypted: i=1; AJvYcCUM1tYTr2tezPV9bdsA1L1vyTmhY3eYNdqfGSoifSIZ5CcZAlV57RMsju4md3w9kTZKvc6JftPLfGImwBMt@lists.linux.dev
X-Gm-Message-State: AOJu0YzoHzZcF1WDMtp/LujLu/vFTs69+9eWlmm10Tr92UrkDazxbEnv
	BX0tWnl+cIqWePrgeDrA2U11UJBMsjiawRFYXM54bHGCwhG8E6dIuPnXoPU5Tl4=
X-Gm-Gg: ASbGncvXotBf42u26Ibt1pTostlIQy0qQlotB+59WhX2ybwM0Ajo599BPHqoxz4LiW2
	OYBVk9OnNYNmgE68cgBjzE67V7Owre1ZTIjo93UFEnxpQqsiSF1dk+qSEoVoz/2CedmUBamvBui
	y5fveVoS9hw4XAZ8YibR81NTpVzSYqYjT2lPZEgVtTOIBGqWqWkEVwdCzlAUiZ6yBymyiNOzQUF
	YirmI9bbBaxw0YsWN0VlsvvtQkEyLLpii/Ht9QB2ppfSpmhBm5nssMH8G5HCO++ZAh0ERcKrfXb
	jtfHi5UMPipnNxIahiGLq+efWUwQfUW+dUTYfk1781q62Q9q0w==
X-Google-Smtp-Source: AGHT+IGstSgETdMzDdB1cn7SMeAEZaDIH6PcSTPH4LkDpdeT8mO6u1QWbvUSiJCc2vQ+HL8ELQ38HQ==
X-Received: by 2002:a5d:64cd:0:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-39d0de66efbmr5815830f8f.47.1743865116566;
        Sat, 05 Apr 2025 07:58:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec34bf258sm74822035e9.23.2025.04.05.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:58:36 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:58:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: rtl8723bs: Prevent duplicate NULL tests on a
 value
Message-ID: <7f19d199-9702-4829-a4a7-b1eada2adeda@stanley.mountain>
References: <Z/EuZuvGyQ9QBl6z@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/EuZuvGyQ9QBl6z@HP-650>

On Sat, Apr 05, 2025 at 02:21:42PM +0100, Abraham Samuel Adekunle wrote:
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned to NULL.
> 
> Remove unnecessary duplicate NULL tests on the same value
> that has previously been tested.
> 
> Found by Coccinelle.
> 
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

