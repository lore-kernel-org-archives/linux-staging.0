Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793454614;
	b=YUXEbdMyEUfJWIizm7LuaZxpWTGZH7/+C+J6+H5BcdkoKliFm1j/Nct8uNPzez/UOy6f
	 xHxPeBjf2z6CMeI2xeG+L50ZOufYaVsGR+WLD9a5gjcqrjXYsxPNZcSMy92AiVDk0nROK
	 IBR+rRhyzJPXZkz5nHWR0dimkSlJYAjGqdmZskJeg2VVe5DzS70bLK9WO7hI1sYyrhvXm
	 UMI51J2HVQ08HCrY0GqqTqmcY6v5ggZ1VtZwM023qeBUtPjx5pa0iZ/gYSDb7IHibuyxF
	 ljg8RwnkX8n/92w+0HwQS++wbMIGr4rKm6yTL9M0ru8QZmEVRoZJYhO36cegYdEQvFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q8xXFgm02QuTQ9KygADKrC85zWxCKIT0/FsOPIPoUtQ=;
	b=2pgFIWajR/MYGXCVf6WLz4QJZV4FnF3kK3z7NIXx373XhYzTlrYoBylhhqPAHGfdC8tS
	 Ua4wIzooRjipHMlrxEdYGU6TbxCCOtFfVgwJbJFn9dgsMHqCcBO9xTnjgCVTOYRBwAjaa
	 BgtgcDtFTYZB+3P0lAxA7bBRkNwHtybtd2PAOYpMnwRbZW9g72Cb1H5m1JaJ7/R9dgyqr
	 0oHoByH56A5oPuNlCqfwhX6AuGV94gZTLKP+zTy+fmgK2zo4SGYWf8Zp8CObfIXSmi3+4
	 HXRQUyfLwCWY9gXyyElfFeq6ooWyhwJRujI9aHZa0iSWN86Skh05Gw4nGaha/gW3TeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MPO2qo6Y;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40467606A31C
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 13:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40467606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MPO2qo6Y
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso14278935e9.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793454612; x=1794059412; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q8xXFgm02QuTQ9KygADKrC85zWxCKIT0/FsOPIPoUtQ=;
        b=MPO2qo6YQezICALfUyyjK/avrd0Aw/L1/llwWeR6/38SheJBI5mGBUWCqKuB5Dp+Kt
         dNWLjhhOXlyafeMwMVl27JyArul/g8y08ozxq+scRANDTbJUlEiHtqd64p3iJjQBhGu9
         Duwd7V1HR0W94f7JrV6CUnaCW2j656VpwIfp8FdB1A5Uvsl4SC0D8Cq1Ba2LWWasVQDM
         wP4enaTv6qzCDhUe7mDm9JagACVeJcz5jKy/nA4dvJ7MWlQRuDwv6FV0Oa7lP5YchYOS
         oRy/QLl7QfTm5a4BvHBOYLOhwLjY6DFt7B3w0DpFjPpcrRihsOFgi8trVOQJy80ImR2W
         6dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793454612; x=1794059412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8xXFgm02QuTQ9KygADKrC85zWxCKIT0/FsOPIPoUtQ=;
        b=dFcwzQoR1RKYT7XGZdqhrc4hK9Ghgxtn/cgVzW10/qkaxyzeocwT3A0wwLXNVJoL2U
         DzqGouROI60zheH8pXIDpuRygFuZOG0lno6PMIZgkyrg2xGEKTeDP5kij0/iNOwvfNsv
         V8x+Gotrf9mb9/f7a6hK09foJDi3xB2h+L69fJOxNvd3gN+XDi47MqOpSmmK/CIV3GLW
         yIXBZ1e8Dr6p344DEqpPr8P0oLT5kyq3AMpoD9JVeX4WvlarRJO1RoILj/fWPMDEDEs2
         fvJF2SBsGo9+uH8lhZuAa9RbQ3gS6fo6a0flztYl2PcNmkTvXDdnLX3KDDDEgbl+ZVMF
         gSBw==
X-Forwarded-Encrypted: i=1; AKwUvBwMBeogkmTmdRhI9RkxZFpfzAbvVEklnh3AN2ECSP3fxUQfwgv3X1Kxdbr45NkD1oBhpyfeXoUmcWYE+BVM@lists.linux.dev
X-Gm-Message-State: AFq9FYI/uBRQTgOKbGnQ86NjOSq3ZDf3Xi2/1M3Bh7Vu2LYQELv4XwPH
	o7wqIt6mCc6cc5crKXT/BRGHMesuLnJeJ9z/XvgMNpBFzfElJosXho+t
X-Gm-Gg: AYBFou2rsMqCZc4PHuNqgXJsx2sWOZDE5S6Kebd+rHgw7IvAmCBA+JOXkRk8SdXzauQ
	POTxqNJgEU3TYg4/cSdzPuaEovlPMuDAfB6PnuHN5/7oQx/IjPLiBUd88PzFDUCxVNuYkXer1Fd
	8cn/JrpikHA3UyQ89s5ipPIOATpMM4P9m9dy4btZsU4Knu9DUChbRO0+jBg2/Y4XSnbH05vY807
	0HEaYBMdkNO6aoeRM9ZCuwFIzCbJlvJa4hzqbfbJYPS4v/qS7i/J7qjpYEITR34cgzSzy5oC5b1
	t3U0w1wjHFKzx6yhyqXd//Nn3UgduC7fuMPTadxM4+KXyIem9vZTOUKGZ6odrGw+IGVD4TndU4u
	h8IoMEoPCa6DT81z36c8Xx+QDMAqcOvP2my/3ttmeSpNa8nRT+zVlfOnxTbujz6RJ5nKpAfsc6q
	N7e8lNzBEYXYAeA5+YR7qp4JKCUkZGKDU69yJWTX89DPq5ID3ZzbBPVE98Z+SD8/PzcE6nDeqLY
	RY26p1UBhnt1PxEaUS7N/np4yRfgK3ZQ57SREOGnJHVcMkuwVNiyGPU1+Gmm5scUU8Zkm+UWiU/
	OwgfwyT+Z8lGBThejNv7O6EbKxbrnlEdh0U270MqjYnSaEQR2a9DQgW7e3YMGhCQtjd9mDf6npc
	0eh67UKQ9RQCd5rWwI31Te+veA3d4g9pO/+Yuaa5JApEgSeMgNexenE5iBlDejEKUbAo=
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr127440445e9.31.1793454612490;
        Sat, 31 Oct 2026 06:50:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm234950815e9.11.2026.10.31.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:50:11 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:50:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: linfordWu <linfordwu@163.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: fix probe error path resource handling
Message-ID: <auXyEB82y-I-j7Zc@stanley.mountain>
References: <20261031133433.1826133-1-linfordwu@163.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031133433.1826133-1-linfordwu@163.com>

On Sat, Oct 31, 2026 at 09:34:33PM +0800, linfordWu wrote:
> The probe error paths free the current master or slave resource before
> jumping to cleanup loops that free it again. They also pass NULL
> resources to the VME release helpers when window allocation fails, and
> pass a NULL buffer to vme_free_consistent() when buffer allocation
> fails.
> 
> Let the common cleanup paths own all resource releases and guard the
> resource and buffer pointers so each failure path only releases objects
> that were allocated successfully.
> 
> Signed-off-by: linfordWu <linfordwu@163.com>

This driver has been removed from the latest tree.

regards,
dan carpenter

