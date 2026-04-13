Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AA41D435F
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066458; cv=none; b=N1eWvM+vWN9lh6wy/6T/pd24P3wCTHIBncQEXIPQVGZeY1td0hgon/xWxuPYANjmfeByEIl+3clsBcn2T5f6per5s/jop/wDXJtypHLQixBUyL2fgTPS9zNf0oIxtdJWS4DcLJNYNssiE88Gghpn1RR1VRb0Rdh8RkK7fYOf2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066458; c=relaxed/simple;
	bh=cogvOr4vEBotFyTJYUG5btaH273pIVXxEiy+6sWzZsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKuxfe78gJRErTs8GnBQoStiqJ5aXJtgmgegos2IF0pGg8VXuZcxbxOB86vMS5cc/yuNPZrcuy89/vYdc69dnI3belfGT/CY+ZR98m+p15+69w90Gq5mi/ZNF6JrqAv+Gysjpmv7Cjb5ybjDCzQvHOebW8ShtoZ9fKvTOfuThZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNQ9C60i; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNQ9C60i"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so26122035e9.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066456; x=1776671256; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4WXXmkgmkXLRFQs5TSJIo6nu0BPdGMXPBlQrEL9eq3c=;
        b=PNQ9C60i3/oe8Uxm1eEhjpHgz59OA71zsd7IVovSItmbG8SZshvO9VYNOahHEeo2t4
         6RgKBSbsvHF+/2WEWIAnnZjsEYtiL80W09U9a3sm8Ua4IjIGV+iKwKUv2Z3hfib+Rczg
         B9fLTm2Czh/MkbgSuayHe4Wz9D8PIk79ImdaXWP4wTd/dWmEHWnAhgwqE9l9lIJYd5m2
         X9jSzxKcRqg69D/eV9jFR37lOEqvXYyhQYyJzxl0X7SzZ2iroqMvfcR2AhUXU0Q9wEUN
         XbDvjsTsFHJv5FV3yQgGj1w9LOqgmajlV16+SOz2ehatqwim2L+CAvLgt/LferX38aSH
         syAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066456; x=1776671256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WXXmkgmkXLRFQs5TSJIo6nu0BPdGMXPBlQrEL9eq3c=;
        b=iYX8T5Mf9+cu44+OhPzrJX143lILqKPeWKIpUYGlcqZpLDghz6F47AigTqCDc5FCR+
         vjool4l5a/wxa2KJWrr8RD6cty9N5dZOv37aFVEOvY6M/8E6JgqIWOfUDMJA7QEwzeHn
         ETICGAt0kMsMridAVC5v1KOEE778dNCGFIo/tbClxHbnUpUVi9lP/RQbXfcoxI+n2HXQ
         X2VBtZRn8kh5Ix/fxWDYeU4efhcs3patLgTGxM5WMzvakv2A5M8018yLOExa0pNtEvyh
         pebVO8zLXrIwG3SgyhFvl/pDphzToCMnwjnkW491NRHiJZ6XLnaBf9Sey0cSMZvyvW7T
         fozA==
X-Forwarded-Encrypted: i=1; AFNElJ/dy3QPtBcxihmzAGdRT7bCyvCKdaBe8dAm+vwqTG/vSZ5lWKXksgG9Hk2e5iSvhFW3UahwyWYCS1emEwZc@lists.linux.dev
X-Gm-Message-State: AOJu0YwvXjOmBHHNCIG8dyoXHAH+tFlcpUQvHPP64c1DCfREXtXcAtuJ
	Igl8MBrbQjMgeFgIFVTke6Ry8KTulNYZQk6ZroTArs6qVMbI8GwT+wu/
X-Gm-Gg: AeBDievWsqkZnar/VS0g9G/rUtKr1IDd36SwIFXXn1368MBAw2sCmjsOhU12JCVhc/K
	oinBgEcrVam64YhrwC8CTQhmKuGqLrEWpSC9HSZSpByMllaxWTaOE0ZfTJhE51WGp2UzGiLu0WG
	h8Ej7tLcg/zKQYAw2wHnMWbhKSs6OnKwHZkt4B107CXF1GZBdZXl2UgakzzlRIxkxmzfPIDgMRx
	5nARiimH1eYxuoFXPPe8PMhGvUiqFetK9uCBaCMi8j1xq2Q2SmR0ZiFj6nvaiqfy1AgwvkqhfC8
	QgbnDVBGipXa86yJCzBaFa6FmnyIxcsoAVbg7tQi9XR1XPdtPRxmJe/iDR0tBygVAJW6sTJk5r/
	w6ePe+yf80rt519hr6CklzSEXbPi7WotOlCp9NAkyDlCkDbU48l9k313BpeY667tyhqFN1K8ESe
	8UNATRCHdQlyUXO50hKO8=
X-Received: by 2002:a05:600c:a105:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-488d681701fmr110867815e9.1.1776066455645;
        Mon, 13 Apr 2026 00:47:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d538a296sm279835345e9.12.2026.04.13.00.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:47:34 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:47:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] staging: rtl8723bs: rename dot11AuthAlgrthm to
 fix CamelCase
Message-ID: <adyfk-47opra_5fZ@stanley.mountain>
References: <20260412130012.5832-1-ducthinh100812@gmail.com>
 <20260412130012.5832-3-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412130012.5832-3-ducthinh100812@gmail.com>

On Sun, Apr 12, 2026 at 08:00:12PM +0700, Nguyen Duc Thinh wrote:
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 4b4012411011..3ca8c3640acc 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -228,7 +228,7 @@ void expire_timeout_chk(struct adapter *padapter)
>  			}
>  
>  			if (psta->state & WIFI_SLEEP_STATE) {
> -				if (!(psta->state & WIFI_STA_ALIVE_CHK_STATE)) {
> +				if !(psta->state & WIFI_STA_ALIVE_CHK_STATE) {

You need to be a lot more careful.

regards,
dan carpenter

