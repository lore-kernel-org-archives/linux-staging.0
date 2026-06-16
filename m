Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB171E8320
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612479; cv=none; b=o5VCA+RDsaNyQCDmVO56bqrfc/F7SPTO4+2tqOqf0JPJL5Xw5s2Dk41XMnb+ncatCOaLsensms5nXY4XbZgnOb5R7rUpKbPm4xJky08rXsdzAvTDsu4dRD7bOeviR3MOWSDsaG57Ur2xNJ+ywYZ0jCEpBuz8OdyvJNsqYT/Bw6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612479; c=relaxed/simple;
	bh=9aw1cfMH+kKh5Mc+0yWEHOiWc0rMapNGEvRyDKPYmCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tghqhlYpY0jO/9AgxRcel3osfWR/AcgELgB5158oHWIPmrwxRd/zlawNT2oPTrtlklQ1y8hNDbG2M4YHQ32Tb9tmHAqVv4NbgguhaqIAULEmctzwVhTHLKTIUOwzEG5f9Rnz3iEwiAtBk6QNknLX5us41fi1dnAoVgbz/wraXJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhGSK4AG; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhGSK4AG"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ccea53f35cso56313186d6.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781612477; x=1782217277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NsknH0XjAoVCON/7DgktWIw7R+brX1Ii48M3aYu6zgo=;
        b=hhGSK4AG/cTIp+whE0YooxrwFIfR5FBJiQJtVCQj8jWsjh4+LjKWdfnKbwWhbJz5m+
         FEbkFTq5Dltauni+4/PYsY3qCoxql/7Z8rzTkXKShSPzy0Oo/V9kEh2854AzK1xU+uY2
         vgAAYjF2gb7t57W8F7cPTCKGCj9GlVVJcFayuC3LSgmJzXK9iPhJFh3dN9JSJSjfDHdb
         V5dT4/DreBG9BJ2ygtEH0hUc1gy5q6L0zdkCyMHxREeq3LmFQXJ2A6yzZyNrgly3gYxa
         EmUEgaSiLtzW9PoB1Lh82ouhTifkwaPlBdxiH3JHERdg7Q+w4TKYoeCU3XKdhHNz4fy/
         bgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612477; x=1782217277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsknH0XjAoVCON/7DgktWIw7R+brX1Ii48M3aYu6zgo=;
        b=ILVrx3Ef98OsYxoYp4AGNb4EYErJHXRN1LZY+EuAed6CnXjtOaNK/q8+WuUn+xJx/1
         KY/flNmkmOO5+ULjZnAgEItsv8fd+inyptg6NQ6GPeYjGxDaKXnBi5t2qy9BhPs0yzYI
         lv/NJe2hGv6V+8crYvx1ddpYnqWHsIHhdFVEgCEIFqsZTzrjgcp6/Z6vvpRLsCTADOh+
         Pu8CQmYOLCegX4rIKQiukDeAeER3AfTC0tBIck5pOCtFW40zYE1Pf1A/RAqOCLL6qP1t
         iofd83y9ZSZiyMriRG13vdhqbdMyxohM5IHD4O2ERcYte4ZOh4RDbrX+YP6WztqfkLz3
         5G5g==
X-Forwarded-Encrypted: i=1; AFNElJ/yGy5tQQoBPL17rz6TY0rZ+eAhcYgSKiWGmMq/GU8fpVlsN+DMUrJrcKjyZJ10gFdXOhMBwpWcmAI1IRmB@lists.linux.dev
X-Gm-Message-State: AOJu0YwHCZbJy0XgxocE0qGbV6BvbNGNosB++z0pNMyUOMtToGzKmwoC
	J5rFrLBBp2cwLWRx4jTLV81Z7Mf0GVEsej3udNxMOQ2hB5crNxXHd/RH
X-Gm-Gg: Acq92OEUAG2I6mRwz35Djyii9+v/syY4HohCXPrrdKJ719OPIlA9tnbFv/e6QupFViZ
	UpDYS65iiox50aMNHGWfhMTvky9z9uG65bfVGgRWzakE37MtqPYWaCv017qN3Z99aBz8AZc9bEQ
	xjNfg4d2wNB3NZ4xfurleqvtih33zWb1Iu0r715TcYa80Y6/JtPhwnoOKwLfDT3VAGgnosHwdO2
	+H12SjJejoXFw2rcbPNv/kaK2X65dvoz7QEfzacv65RYq5zGer5nOIPLERnsWrbaUf1nL32BadP
	iWYWzsfcWQhyB/J1DOft8SJD4os4585qxjD/XShizmcZMO6K7PW4+vSwy0YfSKOgYBm9Sp2BgPu
	pf36yPUg9M6OZeJuO7UGn8Y6wdW6ezGz+Iqjid61r55BijzCE4ts/EiSlHtQsrPzHNZPt0HPp4d
	M5FUZPEmoKhH/t+Ac3
X-Received: by 2002:a05:6214:3d06:b0:8ce:a542:361 with SMTP id 6a1803df08f44-8d44dcded4dmr304999446d6.13.1781612477205;
        Tue, 16 Jun 2026 05:21:17 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f47407desm31446396d6.25.2026.06.16.05.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:21:16 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:21:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: rtl8723bs: Fix coding style issues in
 header files
Message-ID: <ajE_thze3242HVdP@stanley.mountain>
References: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616110048.45541-1-subhrojyoti0609@gmail.com>

On Tue, Jun 16, 2026 at 04:30:43PM +0530, Subhrojyoti Bala wrote:
> This patch series fixes various coding style issues in the
> rtl8723bs staging driver header files, as reported by
> checkpatch.pl:
> 
> - Fix multi-line comment style in wlan_bssdef.h
> - Fix enum indentation in rtw_mlme.h
> - Fix block comment style in rtw_mlme.h
> - Fix multi-line comment style in rtw_mlme.h
> - Fix whitespace in comments in rtw_mlme.h
> 

combine patches 1,3-5 since they're all basically the same sort
of patch in the same driver and they're pretty small.

Wait for a day before resending.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

