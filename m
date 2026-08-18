Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A74582E3
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060396; cv=none; b=kTmrzVdZ/06uIteytF0dspRdhD/Xtqarr7DMLJnUUGyiZglWF4eifHO3pmg8wFdMfu8/VI1cq5Hz0uNn0ZIs6Hr2IpFYziNp1PWF8ypCYxB7tXYB5JBG3QpsYj1DHORDEIPViyNNZWyo+kuAj2pMWAH16S/VgaE29BxOyX9R8C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060396; c=relaxed/simple;
	bh=g52TbLKOLRnjzdDqnuarp3D7v4E3YOEi6S8XK1pGiKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQWOkW4x3hYnIdCkbmR6hpogkYtmAkiVW+RWQfIL5jagxUPORpvL5r7KVK9aiNl3QCjxKvhSK/lkEekO0aaTao447O8IfGUm7cEEuuXmM8zd64PxD37rKnkTTSEpiRLBQa2qzFYLT4ZyUNBXpe1CN2LYz+qyzBYgPa+ZedQfRhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpwETzlo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpwETzlo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4998e0916faso26658765e9.2
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787060391; x=1787665191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SB8IZ6vjsjyD4oW3JJjsTxZenQi13vbgHnO3UjiHMpQ=;
        b=kpwETzlo0ELJ+YApl/sKrzbjNt1ao60cWxEqg4PG+qTHtQMBVxIOTWtQ/mD8WIl5He
         Lq5skkpb8AWcLZSNw9a+VzxKagm5fKPIFwtWXlj4Nh2Y6TXcphLz7wIcUCx8WN6blMrX
         10qLYOl3zecdVDlYKB66kIMtJtcD2228VpQEoo916supqEkudsDHZHFTSojTaF6F1NRS
         BFj9DDJssZz6JxNoZsZszBRl2Ydt+Gnw68f7buPkQr7zLfCZOtAlbBJa1zbvjfqDb13h
         G6wtc9GPxIyC3aMmBZUkNzv0tsi7Tv3DcJ29cM0lXuAJAYLcjoVUvoGRwdWqvGfgTjXw
         ZRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060391; x=1787665191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SB8IZ6vjsjyD4oW3JJjsTxZenQi13vbgHnO3UjiHMpQ=;
        b=XClS8Q+028w3TCsUrtb9wThc9Y0TdibjmuIALx7MgrmCgAnL+LZsb4DtKQkwNwUVHq
         stko8yHh3KlxHP2uoj4UfmYlNH30xPn1WmaM4ASQiHfLIuAINuGiGcbo7B1lMBf9/pYk
         gNRdGcTRJWPlMufY2I+ZcofQZ2aIxNTQSqScgkSlbITGx0SF8/bsS7JOms0wk1cZaReG
         59t7/sYYeEEdiFNOpZIIKnuHcOZWFJWv80ihabZ9ZnexfEa27hpultoPTXKEwCd2ki2a
         ei2qF+OCSWX9yRv1GX5/eKHm2/RdFWPMRE2Bf0j0uovNM22rhDs+N1fH89Xg4NG+oRHQ
         av9A==
X-Forwarded-Encrypted: i=1; AHgh+Rpwk5h8KRtu9UUF4ktu68MSA21qLsx1OPLKfcY7ho2nAiIF6aVUuUciL1pX+hZvGREEj33SEZmH6524FWKN@lists.linux.dev
X-Gm-Message-State: AOJu0YwqDLKwTx4IhOtxL2e65o8FgC9G8C7ek6jpINLRJ+wOQZGXnOlI
	XEyIlEOlOx0TaJPAiiArFYbG8NF7QGH0/PdE3kAcq48xp/ZUJezZWht4
X-Gm-Gg: AR+sD12szTKr9yOzNUZ/JAhs1Yuyx2s3RYtKTnyyrcCj1IO6kMxFVwH3b3H6cSwET6Z
	oHwXWWzTB3ggk+XLVz8bhJuDEa3oD8L8b92H9imQEOxQ5PIV41pkqsmp7S1oTWViXRcww5jqKgH
	+GLEVOSnxoUl5wit5Z6ocDHuUXv6fD236Np5TYBpWG4IIE83Hgg5H9oq72n1BGP+ORw4Zz4Dylj
	BS1gl85sCX1Px+vVyOd/dPwiD8wucK5XlFuEAm73WTJaT3rtc8ykDxVxmM8Hpw5E3KU6ONhd1DW
	mPpv4anQ4J63CR0jTPP/WpuneKCwgZtkbmT1j4yjexIWWGMi48ARUbujYuEGyd4oc7VirpG6uLn
	2EkmiLH+JnS185NW1UBvHgeJDWGnfGr0yGwvcbefwQKwAg5QsEgRKxdgMYrHIdb2q/AeYm9yvh1
	tlBJ//RxPnrS1zryB4l4HbC188hmZ4I9qmSruSJ3DrNFU/C05QL7QfymKpxVp9rg==
X-Received: by 2002:a05:600c:8714:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-49987938551mr591057895e9.3.1787060391412;
        Tue, 18 Aug 2026 06:39:51 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b7840esm11044133f8f.29.2026.08.18.06.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:39:50 -0700 (PDT)
Date: Tue, 18 Aug 2026 16:39:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dhanush Muralidharan <dhanushmuralidharan@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove extern from function
 declarations in header files
Message-ID: <aoRgl1l9PFeJwx7M@stanley.mountain>
References: <20260818131601.96509-1-dhanushmuralidharan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818131601.96509-1-dhanushmuralidharan@gmail.com>

1) No commit message.
2) No Signed-off-by line.
3) Mixing unrelated changes like this:

> -extern u8 rtw_setopmode_cmd(struct adapter  *padapter, enum nl80211_iftype networktype, bool enqueue);
> +u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrastructure networktype, bool enqueue);

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter
