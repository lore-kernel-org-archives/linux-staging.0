Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF683976A9
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930558; cv=none; b=IuIxy2dliXAWY+ZLaZ5mKDJnZeTQOwSFpUJDYApaJk5ITxVStlpNrm5RMcToLFYn47y0EjGmIIkmVbT+2ZcK5acOAfLee3pOZMh8uL+ou6RQlTckT1R/ZiDv+LAWb3v8BmEO+s3CMq/GnE8TglGIy33XsLlYZS+/pHh6fOoF5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930558; c=relaxed/simple;
	bh=CwfLVYF5J6eRCTrEzk7WnV2IVw70kjfthDnvHlS857Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7gw6sWdvOtb6MfDd7myKtQ8D2aa3mT1NR6WUH9T6hi5FNy4+gxRGktkEaUt3Qds6WJYQ0i3h6CkvcxMfFRqBe5qKI7qgVwnFXNbaTKPpPrEqOYyCF6mEU8vZQ5dkmCknncNGlF3scgLrA3d+aQ94X2GQchBTy9eTp4cC37S4eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccliReGT; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccliReGT"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so1308940a34.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783930556; x=1784535356; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXmHjxhb7fS4xbAyOZKgchgvfkdggXTJ5YRwc2Frj9A=;
        b=ccliReGTQ08tZ28xoXsa7n9Hb1yNE7Z5EDelduxZ6HDBS1YrmE0pss6zZec1nKUWcR
         Q70Xjs3qTS7UzdcyGcUWKdyNpn5Rdgkp5uE6o8Ib1rrDspxKR1MexDoXG8fxWt8y8XyC
         M+ctExn0H1VK2GCQzfNy2YNQa7rFR9HaGAlRDXHtazJ+W4NdgpSFaiiKpJ+st9EW6TdD
         qO5qxK6kgl8BS3sWSJp1vGOgPgbz32ljsSs6NKqrT7rFV6v7XcPoZL1jwNDbVk4gtyhs
         TABC+I8P2qXSAbtyzMUl2mkTBktfYJ7klzjZH7bqYW1rZ1akJIA9fsOThR9pNX06gS/m
         474A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930556; x=1784535356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXmHjxhb7fS4xbAyOZKgchgvfkdggXTJ5YRwc2Frj9A=;
        b=JCEjwH4LqAMIZH0rY9QIDqFWT9vd8pL4b4ulIW5p0DaHGLkPm0BTmF8r1wp6yds05t
         Zzzy6ys4pnUiErKCqaPK8R3hBJ6c2Z0bSY09rVjZwsMNVcZmIN2Np/oZx57yzpmiPUvR
         RlTQH/5a1Jtn0Swj18Vg2FXCofJ51lktQ1k6qVTh3U3TZDujv+mWqo7TiGFLAaI/AMpw
         hjMY8AJCj1yeyF2pfuyPo2Lh95krVq9XsMmTXnQz4Pw+eogQzYD7FElAc4jFpnZRxDme
         WBZcdS8Y7QeUpqxAgTOx3xBR9FA3F6hFJF5e1gCzV9ZWV7QGMayNKA1VrCqhNk2yAsuQ
         tcVg==
X-Forwarded-Encrypted: i=1; AFNElJ9L7rS64hBsqKzFVMakC38Rmuh6oBAtgjpL9B2SN6rzKWI8HLuIV03y5IXi/fGkOVfR36XL7g2s215hkeqP@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2JiCXHtiEIv0d0rJpLnqwEha7NlovDkxsll/f0SJ6JVSCi7p5
	6m/MhddSI9OtA1o60roOhw3Ac2++g4jihDTSvCLEKYtB5zZX92T6l2Mg
X-Gm-Gg: AfdE7clTo9MU52RIR00jLXYOHuTMYj4Blg/YW/XtVE1qZgzJOIoe5wzI4/Ff60SoYrW
	O61nDZU/YWYsqDJCjz+yOwiIlTKHWsA+UZzBnT8Hn73VJTLCkLtPC3L/758/mcpg4Jdrefz/Ml8
	DqXLvGfSDQo/dZq8aFFyIqN4+h5gLq1XflPqTxYHsYqW18ENh+4vhkFiHxKRXPD6QR6agHWEFWe
	rp9Tvy9cgVJHceiYvrwnz0so0N3XGck+CzR2hciNe0j8TPwu1AOVMYSBOfqGJgZElKtjo3n24Y8
	MOWFNYFtOM4d0y89iyFj+5jb0t5VGDKglGBhMxr/ariPdeU56DD9tE5L9EvOyAh0jpypyVOVVUd
	f2rqfvuEARIQqey7ty3eMxIQ5CgBoQNusfF3w3u4lFr4OCdZ0I3oJF54ruLFdmiRptR/h3DLggX
	tkcCOj
X-Received: by 2002:a05:6830:2543:b0:7e9:e0f3:b914 with SMTP id 46e09a7af769-7ec09693f06mr5776513a34.13.1783930556253;
        Mon, 13 Jul 2026 01:15:56 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm12662660a34.8.2026.07.13.01.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:15:54 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:15:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, khomenkov@mailbox.org,
	khushalchitturi@gmail.com, s9430939@naver.com,
	nikolayof23@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: rtl8723bs: convert xmit helpers to return
 errno
Message-ID: <alSetCKxCX47H7f2@stanley.mountain>
References: <20260713070537.15903-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713070537.15903-1-dennylin0707@gmail.com>

On Mon, Jul 13, 2026 at 07:05:32AM +0000, Hungyu Lin wrote:
> This series first simplifies control flow in rtw_make_wlanhdr()
> and rtw_xmitframe_coalesce() by removing redundant return
> variables and goto-based error handling. It then converts
> rtw_make_wlanhdr(), xmitframe_addmic(), and
> rtw_xmitframe_coalesce() to return errno values while
> propagating errno values through the caller chain.
> 

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

