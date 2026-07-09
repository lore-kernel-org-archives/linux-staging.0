Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D15E3F58CA
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594226; cv=none; b=hRFjTHuVIPiO7lZ2H64J8ocnBRKZZNWiyt4+/6pS6pCyj6wHAFpkrVjEArJihY5Wg4mR31vxXRhjaPQHwZh5NgA0LumLq1tvWlHFfoOaFwhUXAyDFGSSiqxsGqEiUDQvv5YgQ4VSSkAWZ39a0v+DOR2FLiRofnLybFoJorA++5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594226; c=relaxed/simple;
	bh=cX2g7yN7CxbeKX26fPZDKH5AZN7XyJR89rq5sBUstZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDIKgJlLP3SYfc8nPrKlRilwRlWWmMM0Z0qmqakg49rQlnOsZIAjMN/bvyrSGeRK5MSaegJVatAwEebb3tXw9OUax0WcKhVcmwnIzGlwyJGxQdRBkcnPPP/3NjfBZ9FUUbjqNxledQK6fwTgKPx978LnJNXhu5ZFoDD9SavMX/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibfXNJG2; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibfXNJG2"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a381bec3f4so170525eaf.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 03:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783594224; x=1784199024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k8iBNfPXmnCCmwf2N2IyxDUsXI39mwQG20vdtqKjBcY=;
        b=ibfXNJG2IJCGynuazpk5Ysrnb5YZkXENbLVS3JgUtXkRasWtVJlUF66BoCFHZe9esK
         IH8OTb5eEFUOSLbXtu76B4xlgmN4x/cDK+YCHEzjG3KacexzeT3RXbvZiyf6PzBSwbT9
         Vtf9RmsazDCFJ+JW2mwNqgCVbf58D9dUbnMSiTegJZkWY7e8foPVI5yt0T49rSlbF3jW
         bnwaHEl4oIEzERIGEYG6U4OYGstVVmlMMigTFfGWnbNCxZWDD+PfK4qeh2QYlHQ1vmp6
         pFf5U9kjf+Q2s5AbY79BN4mTi/K8z3MUt5z05narUlS0cWwlR/4Hy/KVqokikhv0tjlH
         PKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594224; x=1784199024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8iBNfPXmnCCmwf2N2IyxDUsXI39mwQG20vdtqKjBcY=;
        b=O7Cj+01LNtSuLAropzbf6v/xbVR9RbA7QavwcY5j2miVBChuKHlhIg0wSqm37mO7vT
         /3Dow6EVQRUa3dkdBG5F2WF7Dc2J+vV6hXgBUiMMuOoWcRNjOcBPmOUKdMT554hPvtc7
         /XHJCdYMUNIZXYBPA2g59fADFH8Fbc9easNnk3g6XxoJIAJIOnSvWDd74z5iXOi1INT0
         BkHZyU6tAtqhEvZOABB1r8TBqwITC0/I4wJ1lo077+Ic18dAq24lfDVK3ReDgztUpkOX
         YEQIYKsOeyW6708+zdcG4fCGNGar0enm8HheFSCAV26SZYogblaNMfRnZSoEZc7Uq5HA
         1/rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ncSixqGNRhRtIv+XzkkiEMriKbsjN/X5L3Ux70txxd0E5ecYOjiZlwFmFxHTysvVW61j87u7M2qIOd1zL@lists.linux.dev
X-Gm-Message-State: AOJu0YyEG2vECywRWIM+3qOsAaj0lcSLOmEVA9I50fnA6oHlsjuhIjzt
	RXXu+v37vb064mfkeZED8cWyLps1RQDdzP1+qW8XfvPPcWD1OrgAry7G
X-Gm-Gg: AfdE7ckKVKTHpq+icxbYi8sMfaovhLIgT+bhEjvBdlMwSYkxY81skuYaYtQ3bRgM2pI
	HgOEOFMAffPQlOhaRUFH3S1jeY7KJZhkS3+vT92ImX/sAE0knEgeKSoj+gYRcmHo6Ys72vZpLjU
	km6CEUt1Zd690pkiGhZc/picenrUb9Ed8Cu1pT07rvSjtMZ2jRP6CeZz5jjkxoDCwCcANxHb9Qp
	KahKau0/33mUahCqH6eeYmpre85Kb5+/MTPVaTfKkbr+aw5ScHT52nZE0SoncEtWJ0UNMckv6Bz
	mAK408XkBEodsRo4J+agb1+0DRB8urOSz7dZzYtntKTgp0GOfDbtCoVZdD8oM7pxsR+iEIktm9+
	tdjeC3BIf/30j+jsGKbx4t1gKor3y1j8Rjyz4ohGbsQ80I3Lqh31OsvnyFUhVsPy1MeZCcO90u+
	8h+Wp8
X-Received: by 2002:a05:6820:2014:b0:6a3:14f3:3cd8 with SMTP id 006d021491bc7-6a36da20005mr4557700eaf.52.1783594223912;
        Thu, 09 Jul 2026 03:50:23 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a66b668sm3910366eaf.8.2026.07.09.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:50:22 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:50:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hao-Qun Huang <alvinhuang0603@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Nadzeya Hutsko <nadzya.info@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Martyn Welch <martyn@welchs.me.uk>
Subject: Re: [PATCH 1/2] staging: vme_user: fix location monitor leak in fake
 bridge
Message-ID: <ak986K54RhRDMpfn@stanley.mountain>
References: <20260704065817.403111-1-alvinhuang0603@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704065817.403111-1-alvinhuang0603@gmail.com>

Hi Greg, I'm back from travel.  Should we just delete staging/vme_user/?
I don't know really if it's used but there are some pretty severe
security issues with this code.

regards,
dan carpenter

