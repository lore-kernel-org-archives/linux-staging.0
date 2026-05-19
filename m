Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D523D3E0090
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183294; cv=none; b=mClijPJvKt3Z9doGzIkTzoF8H026GVfBQeWNhcZOLGe1O+wWya5T/zbq9UdDmQ7XZ3cal8LB11nXjyKBmOmJEMnc7xXFf88K4j2GfLb3HYFqqqgO3LdvP+zpA2Xr1T6YDg262oEy+kfm+bmhD0DYjrXZ2Cbz4fRFae8UOZhAf4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183294; c=relaxed/simple;
	bh=5BRUkfJ8yWKLSlTeo99Bxx0jEUv61v6j26fDM1Lpuhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gu+Djys0GpJU8aPj1rfYQyZA3nmSYojypYqGTSl5YgwFCYov2KKhHBkWG5eeLxgZYHhTLCj7Gt8lBWFqrgqVHO4XFcNhPPYi32ywb23VGiEEi4vrJ3xKvFcdz4XPQd12YZgs5iqzqhiP/slGfIpSPa5xrSB//H4MaUwIJ0mDVeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaSVupmn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaSVupmn"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so21389265e9.1
        for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779183291; x=1779788091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6lC/QkW3y7vcOvBVpiAsZwYueGMsLbUKcivFxoMy4Vs=;
        b=KaSVupmnRhbu/wFmOdYTw3G7U6XG9SZBfe8V2Qg8aQQj+/7r2ji7FW+FuF70nbqE1u
         P1X18UnQM5HdDWf/fYtDDpaCLG+daP6HcUzMoKVOcUNk8bpTtQIQvtjJEFZFJG5KSN2P
         CYqogntqr8kwC0aLk0JpqyEomJWoVCEgrxAkAK+wlIlcZOYhMRmObjoyMgibekLY0MMt
         5YYsek5b50Wu2M8nGvkkzUG9yIHA3zQ0MoR2VqTAvd9YlkMsBvitqUPhDIIVb6Xpnb29
         c+Y77fldp0lrLS4V+dbp9h/knravA6eg+1Qnl2xPoUjVLBW9l7gWTrskPxFaggz7kVRo
         cBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183291; x=1779788091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lC/QkW3y7vcOvBVpiAsZwYueGMsLbUKcivFxoMy4Vs=;
        b=oHvB7CL267kJ/ZvVDgjvWjMEsG4I93UgGYnjQOwN6qkrx9aWIAZ5aFix/8uJun/CuG
         bLIuMXlpCL5OVjJQUx0o+NmpEWX/43n4grqwzaKylTgK/X6T2DoSVR4ZkehF8DLFqk+j
         dMm/z/s7l708Gl4nNxFppiZUwVbAVUYDx1Uw8F/SPZ6iLQreqCVkMJdWCtVhAq7FNTz+
         gT0QDn7mj9hhn64CZHnJiVXcQ+8IGQptCe2+mzh1uk0WMRwj8zAFuIg55n3oPRTv3VbS
         30jj03mCJRc07+U4TgFvMh5q4ux9/5O8xcod5ckInNIpKBIzaENNbYHmlDAzgdrJJ6oE
         EKCg==
X-Forwarded-Encrypted: i=1; AFNElJ8z5knAMXFS9OjPPUt7vYwdmBuuU3JeVhJixPaHzHPC9qHD9nEnGuKtzZGex1FZEfYGTlUgTYzX5EV1LNWp@lists.linux.dev
X-Gm-Message-State: AOJu0YwlDeAkb7l6m3rQdk1ZiUbKa2KFAK9yAxtYeVzbOCH6BI0W+GZ8
	HptSMjl4iS4j05Smv/CxqR1O/7iSIUq2VNIpKln01tP2mFWqHKq1/Phr
X-Gm-Gg: Acq92OG/rNpbaH8sDiEW+dm5+xrAn/fxouvo6preXFXGL5+ea32ImtmCcK0sMRHNAek
	h6f3U9lq077rU0r6MqVwo8bhLAzS0xxMvC99PKryKKVKQMHfbgJGNc6cyP+pMrHK8Kz4Bd61Bat
	hJIbSK2q4yhKhC/rZ5ZfUrtthqVjaBzivx7eWlGkz+TTxrmtk1B7TS9B4k6y5vfboYD80nIOE3W
	y99DeFoR00xz61R8ofb/Xcc9h7TYNH1JUTxCw7xjvDAiIkypv9i0+8V2vPb+Qe1Z0pOdli1UiNN
	wA+bqAJZ8MtadU/AXkwGh0ko5s86LwKeQDhrfqreC8tvqoGoKRpHx5OfEEta/a/1+CIegYihbJT
	KFUFAgENwhZHD4m6o37AK4i6fcEojfJzUaPtRJgrLx4fO4tVLsPAdes0gDdStdasehrXfnPaXX7
	WFHSX1+Wsy+HW6ufUvZCbJqQ7rvMoWpMw0AA==
X-Received: by 2002:a05:600c:5296:b0:490:31e:d6f4 with SMTP id 5b1f17b1804b1-490031ed905mr175484765e9.18.1779183290935;
        Tue, 19 May 2026 02:34:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm344478195e9.7.2026.05.19.02.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:34:50 -0700 (PDT)
Date: Tue, 19 May 2026 12:34:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: lixinyu <xinyuili@126.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style issues in
 rtl8723b_hal_init.c
Message-ID: <agwut0RgL8chBQh5@stanley.mountain>
References: <20260519090114.828918-1-xinyuili@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519090114.828918-1-xinyuili@126.com>

1. Work against the correct tree (staging-next).
2. Fix your From header.

On Tue, May 19, 2026 at 05:01:14PM +0800, lixinyu wrote:
> Fix checkpatch coding style issues:
> - Add spaces around binary operators (|, &, +, >>) per kernel style
> - Replace C++ style comments (//) with kernel style comments (/* */)

3. Do this as two patches.

4. Run your patch through checkpatch.pl and see this issue:
	ERROR: Missing Signed-off-by: line(s)

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

