Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994548;
	b=wPSq1Z16cHTCIPxi+IkR4/nZAN3aX2eXdlYDCtIfum6F1JQfa97GN5/TTPQGCQXYuc97
	 HBZw1qSjA3pdXg2aT/e/yx0ERJg4VbDAAhYM53PoQge+hJtY3gyiJRUyQDMW/jqqoXn8B
	 4WteKErjT75ArOn0UIPpyA9dmiwtPkDEI5VbJJST53n1yO9WVqJkLB7Rvpjwm2ib3aP8d
	 QNtYm2u2dHEDjVKKqkKIqjzODjYyjURXIycoqANjYkIAwuX1ComFx3eAolIynt4enXz1H
	 rn+uOyDhjK7Ch4O4BAdklNE57AAf0h9KCsT1Q5MXSsvMY7YtQPp+kllu0zYVj1LEKEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3yaOxFuIZbizNooBA1VEmbpRjVSQUGZB/XbbboKN0bg=;
	b=Qd2pf2X2V7McIx+kSNv7eNJJaBs1D4Zh4EiK+W07ZaC3yahDTSRYM1l2u3Az0LcB7j9p
	 US5JnFMa0D7w3mHqs2i4RobiKm/fc+Txy6WmEm2nwkyVtry6UrPSlPE0Gp+oaYgmcPrGK
	 XEb38DimR9ZNU5SM5DxBuUqQgJGDIJuzg8R/zXHIuCMPgIMZGp+t8sVLMWU9t/A0VIZKt
	 1lFdzTQQj1dq3PceEu60eD7A1xAwfAWsnG4FRMUq8jtSP88pTqdxjd7J5BujM22u7RToH
	 +yvLjVCl97d3DzSSNIjc73EEe9OCTu9zt5TK/Gk267O/eturZ9GQplpmV2AD5KZDHcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="gc5hqaJ/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F97606A321
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 06:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F97606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gc5hqaJ/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so16094035e9.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 23:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994546; x=1793599346; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yaOxFuIZbizNooBA1VEmbpRjVSQUGZB/XbbboKN0bg=;
        b=gc5hqaJ/DObFt9XWI+NtWNMniIBLVu28mEGbFqQxHqX5pF4tO8lBdSE+B6ATRkR5/A
         N7SH7o1gLYJMEbckI58vfVu765BJm6wRI7vPerphx4a97azavOBfEeJnlXLXknYjY/JV
         eEHyRsQRDT2ojDES6riuhZ83zYrpchFsx1m2eA9fiAHv5bahcuDNtiItfPgUTI8OS97N
         XLt+rY3dnJU/o8yXXU/RwgSCE99O1gxGYjxP88j6lhM5IrXgczHJ9+jFj4H5tt1JHlLk
         4/+ryr6/YyLaVk3qxN3wWYQIapFv7EK9VC892jVJzl13F2VP6DwnYZ6fq76Q0F+PMrtw
         4HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994546; x=1793599346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yaOxFuIZbizNooBA1VEmbpRjVSQUGZB/XbbboKN0bg=;
        b=knyCV2FVpRkJb1azFe6ucK6XVHLqpM4U85KoCRArMOS6nTCNcbzO/ihFPIKfGq7Xjr
         3SOJnnLgknBT3NIVIvX6p/XTs0rEzIzAjWaSpwGHcOJxu4VD4jb5yVEjb+pp+x1cGkLx
         6OlE6HsoYN7CsDQ8eMEWq+jOSdiCyY6JyLeJQRqUejkX8mzvZPC63qakApq6BnYYxbSw
         Exkg1em2uXftluW0ju3+q5GpTcJ6yiNVyHvm7e1VV8N9AmI8+R3btBjEdBgSqZ94v00A
         zvCilIxYYh2FcrGfjhOH/X02PCPinIiPZauz2hf0hIth1jrjkDLkZ4MjCDfsa1fXezqH
         IHRA==
X-Forwarded-Encrypted: i=1; AKwUvBwRVKnK7EUeH4lBqrmeq+ZWQO0x6+Jhssfg7pRy3rIDVBhbU2459sAc5xHp7Gq2oKaenHvI6q07rZvWWu7H@lists.linux.dev
X-Gm-Message-State: AFq9FYKBf8iNR8ETRaurTEXHPeXfAB6vMLZAOfoAeKyKwc7V+ZxXvRol
	Umm2Ljjkq8O/N3hWSqD729x4z6qFj8XykqZQU8ogEU0Qag0hXBp34ykR
X-Gm-Gg: AYBFou2bWDe5vhrTgMSyj2ZUC7YKztwWJgvbi/67+On1LEf4JQFvtNQQeiMmjyasBku
	xn+TzQuOcUoBz0AXgiN1v5aaaLsWXt0i612bbVl79lFsTss7juwFh6AvT5Z/Xuxn44Jnhu0mXFf
	3hCoWJTLjiTLAknqpsyZvl3Sw+WjN0zBJuucgLrC7lSYT4BM69cHUpQmw3Ne2HR1QcqgSeutbYL
	KhXa3JzCo6iUz1Wnj66aMeH/KvYmwlCHLgCDubO/sIvO0g/yy+r4d8QYsAyrSLhsMAy0BYyh1AE
	KHJUoh4VsEnk9CQs0L13nngRaaPADUM+vSmpSybsBfbfGo6CvTHtEfDu812oAH2ZaDYy/QaF/j2
	e+SlURVNjPd6N9MVtzBck+r9PROYTgSSOL7Ae4nJ9TlK/dViaRBaC6ZI7QvZ1ErjPENxhslQsCT
	km/2fz8nIumHCNWQMMRD8I7Y4d7S4Wag3TaU1wvziNLpJT/1Iz/3KEvJqtYrpbFc7BlmSEHWM3t
	m3A3qsIL2FjnipsK7RTe7KMu285RBYym7f8gavXTDhTwpmnHzgu
X-Received: by 2002:a05:600c:4e8b:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4a35ad01256mr111335215e9.1.1792994545819;
        Sun, 25 Oct 2026 23:02:25 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm454920995e9.1.2026.10.25.23.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:02:25 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:02:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
Message-ID: <at7s7We7bxdmmmSM@stanley.mountain>
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
 <at7pu4hldDTgZtXy@stanley.mountain>
 <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>
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
In-Reply-To: <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>

On Mon, Oct 26, 2026 at 11:23:21AM +0530, Himanshu Bakshi wrote:
> Hi Dan and Andy,
> 
> I have sent over the comment on the v1 message chain and
> also sent over the revised patch separately as v2, I will be glad
> if you will go through it.

The subject here says we are already discussing v2 so I'm confused.
You can go through my response and decide what still applies I guess...

regards,
dan carpenter

