Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D654C21E098
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 04:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778473251; cv=none; b=U8d8BJTGTQtl+gjEMfuAValmiEdz4REEZ1uiEivYwRX7pL4k2iTod+kDjZDfcSiCJiC/xY0axiE5vn2CIEXLTSpd9lkxpvgau5OLYXvIK5wQCumdH73+CaRKpj4CdbJAU2tLDf72tkdhsTlygDRnE8+gO6XEJJzakebRWXgbedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778473251; c=relaxed/simple;
	bh=g8xjf6SRAZNgZLqoqU3nBAfIwiOv1sWxiqLC0rGoolA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myrVuaAuCt062vR7pgcfHfeLIBSE+cAq1dbU3fg1M2u+Ym6EHrNeXnUO2w9UWUHMJotEOXoMr0WKQ6tGCvOix9wlDt5XyW2JfTLWu5drhFAKIRFc7ODSSe8JGzKLh/Dzs0RuAkjg2S0TPeB1zDWz6IMs//WXW3BckQ3MHRVNVrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bz26UMyU; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bz26UMyU"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so34196311fa.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 21:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778473248; x=1779078048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zXTkU1VA1FE8QmNEFN1q9XNa+O1Tj1mW7R2ZgYVgJCE=;
        b=Bz26UMyUD6bEU5xyqJLSo6rnFj4NxvckG6Ja5cKr5tvq5ewbuXdFSGKjDVhDjWnEdF
         bGFSR5IFmiNcHXxsFbu4Ioz6gDUacCYnME3rieT7ufudgmsgK9BIGQsdDrfJJju+ghzI
         rFSpuIrl/0zMLfNjnmNpFySP8M7WwD2Jk/dk/WNJ6t8Ou8t4woQZ32Cz1PZmiqoDJLwf
         AnxUs2FEaPbEc9vcBRqEKrd61MZVYAZZGwe4yRPvfEdW3X3Ni+ogiX5nExQP8Zpg/J+l
         UDD53DD5LdPCOUH3r09l7Bfl65k4jphHzu1P0pgMJcLQILCkr5SDTHJRuzn4b5iNCdtH
         dKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778473248; x=1779078048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXTkU1VA1FE8QmNEFN1q9XNa+O1Tj1mW7R2ZgYVgJCE=;
        b=MJu3V7HJXw1Olte1e8xzRcpXTphZOnWvjHmoitE84vvqrlbHLnkXt94ILwjz0UgCSB
         KuK6UGf2kLhR9cIeBTKJRRvOZpKBUQd/TRPIVtVVUFqV72o2lYK1Sn4eCsxT//coZQaE
         rJEFhIwWHc1K/ArmsAXEAa4i60MFyn5XJmcBDsdiET9/8Ql+uiPsq/pqs4cF6I3hlJY2
         iY3UFHyANbRzES7HqimehkVZfgsoRjZmv+BWiZFwzfeNbjqJTR+zU6bnEpNZflkpv1D6
         YvPQle16vFUOOf9Y/GL+ZJ8Hrz+FQtFC+DRyGbkw2Yxe7zqZhNZxqR6bT5D0MfOHpqPF
         Im2Q==
X-Gm-Message-State: AOJu0Yxg6AWnjFLI0eFOmIgnkvyROGki0SDx8P3GgRgsLqItczkUu5I+
	QWsD8U5dlb94TSzl3FzkkbK3c0E6y6bb12g2+s7/z/yJxPVRuFvYiwID
X-Gm-Gg: Acq92OG2YowlsTqjbzJkccVEWsLboQMo+Saqqf0JMrXVKkzNTauP2DYk6oCK37T+GyC
	ZjQ7k8ExbzJo97Q0NPtd6k0zIeuStWOe2/8GxA6NkseHUQ7A/3fIHersN4SJwg00pwebsKEF/D3
	gPe/0A/B7O3ptrRy808rJ11Uxg0YbeLQcntFnQos4n+j2RQD05cxanSorFSrtN3MKWCy+CKQjvQ
	bnBIg354gkUSYcZxx/LkZ8f9ZbfSCq6u48GIVspzItLP6ju1O577a9XYuTHSNiRIzs3ZhDoiPS2
	6ZQb2NQOTr4JBNZh7phMYY1WG0wrtDCsmeIk2Ft7dF1jZaM/rEj4FBQTBFIF8g3AyLYMJMjwzoC
	+h5ofQbl/j2OIoN5sDDwxWBK9NSM/XuNGHhen7wz4UP1TV8GYI+eZFJpCy4XoB8e1BXo20wgkYU
	glQRjrb20KD1Gkzbv0psXqNoAz
X-Received: by 2002:a05:6512:3f23:b0:5a8:638d:6f53 with SMTP id 2adb3069b0e04-5a887adaa88mr7377504e87.6.1778473247958;
        Sun, 10 May 2026 21:20:47 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956606fsm2315986e87.60.2026.05.10.21.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:20:47 -0700 (PDT)
Date: Mon, 11 May 2026 07:20:44 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Jennifer Guo <guojy.bj@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: rtl8723bs: remove commented out code from odm.c
Message-ID: <agFZHOV0hhB0QsAm@archlinux>
References: <20260509051240.5807-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509051240.5807-1-guojy.bj@gmail.com>

On Fri, May 08, 2026 at 10:12:40PM -0700, Jennifer Guo wrote:
> Remove commented out case statements for better readability.
> 
> This also fixes the checkpatch.pl warning:
> WARNING: Block comments use * on subsequent lines.
> 
> Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>

Looks good to me.

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>


Thanks,
Nikolay
