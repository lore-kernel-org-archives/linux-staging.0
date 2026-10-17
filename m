Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC837A4AB
	for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 04:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792212348; cv=none; b=hW1NPr6R0jMj/+QU7ZN9DQDGHat9bTigrlWJ4y5j2GjNVxhKOyjpmzHIUvu/3C28cJGhBgFXaghIVVKlTAo9GR2BU4+Ep6eaZiP4QKU2LfwaZyMY8IkC+fAfa5VpptHIiHf4zBr4S4GqzHVs7974NSekTquw23qnsvlqwJNviiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792212348; c=relaxed/simple;
	bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtN0tNMNfN1cKj56BH84MYmsQu74PyOVMD0p5wIhV0R25gJvc6PwoxjT61fWnChsUPbyfKwmNEJ2FqVsPoQjLoTFvEmz7LnHSq8W+EyvOQi1oLngcH64TzTo4R/kzW85qOjI/OoaiDMQQLKi+oK2eh6DsE/dnhJo1CdYylF2ooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Opdi3v2l; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Opdi3v2l"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so1135374eec.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 21:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792212347; x=1792817147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
        b=Opdi3v2lke3xOUy7vGvmeTCRPJC6c+fMsDcRFB6CgN+ycmjg6rSu4eN1au3Pn4GQob
         gj2DG6M4k2Juwz0WI7rqr5NOcfIxs0z/Wt5knk737JooD2waxFs5n3P7QQKjNA4lRkLr
         5H84FTqD2ZBk+MTjQfYjYb9rOIAPnvHeSb5c8DkzIgJ1tcnjyqyMTypJ7ywGIzbecldb
         4yQQy03u9ybFc5Khrhuud/Ub/fU6nwmDnLs3iXgVR36peiZGh3hvF230uR/z+GFqj4RQ
         OQF3A5gqZJfGajUs0h/NYvHFu6KtusgZWswwRSjfMxAP7fD6uLmgu+cR3LjL0d7b677O
         HXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792212347; x=1792817147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
        b=izRrl/xeVk5AkgxXXL6RS+e7VoWScEARPmqCHk9IAhrc7JDsPdjpzlh4Lck6X+OK4x
         dfYA5Bp8VnwY58Z9V+sIo/6gX11D7H/LdkrRsQ81FqIDcayYlJJtOzIG6smKCMsbVlhP
         WnugamG7pGSJQltKWqapt/kIO9kUvQTACpCsLxPSxTzJVtUNW6cHETCnopDecYJg9mcX
         wPvmCOZ74eoowYSO3UJUD1pG0y02z9UY5IT4z7bdhxPipURiHjFDrc0GKUBIrPJ6KrAM
         vicRzD12ezPr6Ao+vzFGKGOmzmGHb+ZkeeTmTiqsb3L6xw2RlNJY2F/6SykAm3Uh9O/+
         Z6Bg==
X-Forwarded-Encrypted: i=1; AKwUvBx3om5Ys3NSDA3wi4cbb/s6eJjFdjViFWk8aIr4MW9Luwnziuv5PgrxmYLhDY71DhZdRhCPBCq6fQMbkMOk@lists.linux.dev
X-Gm-Message-State: AFq9FYJvEHzJrfzvCKPKidsctuuZLefDVZQlpq1i/BgJ60EI5viu5N7A
	8KrcTh+gk20SAtt8D/YHYfWwYAnsdVTRNX3MSaIgCv7ft/XoJibv6Ob4
X-Gm-Gg: AYBFou02vutu6mBdRwUErZg0viHo/Wxm5Pohi3Zy+gnkLWKQmO3YAg3QiPjCgNMZqx6
	wP/T9rgm941ENpaEsAUnOmoVbSfeP0PBGKIvSt4U5gzXw9VUpy+JfkOdlVKP7p35t/w/bxjrSfC
	jiiGS8ey+fOUnRYChURxILEvrMtmZXLTIZmHUVUxbYrXMuqlj+odkeoUR7k3IBI56LJ4/i3PE8/
	sqnPyLcs7fhKxdA1sRGnZ2Drz0JSxcnptwITYGOPA7BUeixR4fR5dxxUXa9WlWhvjjdRT3iytcK
	TBwRN1cZAZTrT3Z1xOrafQx8Owrx5by3cOICA6ASEq+A9MjxkEWBFICNc/w+WyljffHcFpC1GBK
	LMZ8GomZIhI3SkzpK+Snjlpx3M/r2j/Cge4j2kzs2lrgJADw3pTXtrLEMFehpG2CKxy7sk48R1y
	+P5CRxEsedPvWlOAtHdzjuEDkQtbTJXqdbIQ36+pxEUtR1Yo22Ln4OrEOYNM5SNGsLBcR3SVsob
	4WebQHOlEOCc6mmiBWza4pOe67FjQwMoS4RBpS1O4NsP2/lJyd084hrxyDUWA==
X-Received: by 2002:a05:7300:768c:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-361a18603d7mr3479430eec.17.1792212346779;
        Fri, 16 Oct 2026 21:45:46 -0700 (PDT)
Received: from samaritan.sole-larch.ts.net ([38.78.160.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm18561568eec.28.2026.10.16.21.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:45:46 -0700 (PDT)
From: iuseacosbtw@gmail.com
To: mohd.sohail.biz@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove comparisons to true/false in rtw_mlme_ext.c
Date: Fri, 16 Oct 2026 21:45:11 -0700
Message-ID: <20261017044545.251639-1-iuseacosbtw@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
References: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging/rtl8723bs driver is being deprecated and removed, so patches
to it might no longer be accepted. This is according to Luka Gejak, the
maintainer of the rtl8723bs driver.

I found one of his messages here:
https://lore.kernel.org/linux-staging/5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev/
