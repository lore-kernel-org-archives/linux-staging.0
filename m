Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862855;
	b=bQ9eYMERZPwNBTCUoKzXbtQ5yOyySghLJJ5BbNOQzI/MWu4NtRy3Gz9ICVtq8LfYQ4B9
	 S5f4xkuYlzJn+zjpdPQD6zwQVjmJYioMVM7uwjHjowOWAQFCT/TXL4JrjfbuCdacNzVed
	 9jhuompP+aLMGgNBphT0U8a7nXkASN2iU9XeYD1pW8XMz/JQ7JKWgE+wxt2m2PLTkl+YI
	 aPdo/U55ueFyaJdkCzHOcUWbxjjpQ1JXhsGDuLbRJXflYOUAEgBmnntRr38mWgQ7rUU+L
	 jmtbc/VZS+s1NtdyNRH5Gzez6QHOfqCLX0LDsiIh+c4ggQZYdL71MwhZ1R/bFobkpIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J1v8pdYNRUM0gZGGjmkBVmbbvzgTfWcGoYiulTdSvFE=;
	b=qlAgGRMJEGSjJ+H5baiiqaH8Nnb+PjpMyytv4Gveqv+bEDJLnK8ENjiWSuVBc8eqEWiA
	 9vQ5ffjQHVFviDvvEeWL72askbfLtP/rpEW/DWrnhoxxIFIyy2hAaV3bg7C7hGclbzz3Z
	 km90E4uNw0H/B5mQYsMiLWJrna6J/bf+LzBAgnBzgBzXBK3v1HDo4A9M8+y2t4rAEnUu4
	 FTLZuPvQ7I/DfWsfvT9VyE2jVkPQ/dtN3i/24ScEtAzbVqXPW1Vji5j+jU/QiKBtwusR/
	 kMK2VAhhM/G06teqC+Lfiuq2ui6AFcCgitcKmgl24p/CRLrI5qGCYypd9mZBqvNjO1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GR/HGOVU";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8120606A328
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 07:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8120606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GR/HGOVU
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so246599f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 23:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862853; x=1794467653; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1v8pdYNRUM0gZGGjmkBVmbbvzgTfWcGoYiulTdSvFE=;
        b=GR/HGOVUKMLl9OXBj7Z2WxcwquPqJ9f7eKpU+jBAVc+s1HW6kucjf2Rslmn3+yFSuY
         qoE9mQIfbaA8WrJtimvzDSTnTKdn3AKjmPqHTn7GJ1Emqvqt7OqeWppDvhbqZx3raqmL
         8Kv7LlWG3TBmjZ4+HGEKpf9hE5dpSCI5e0bIYwE6GpA8AkRilHfA2NvIh18v/y9VGs0o
         DNtWrMCWc/M7IBWn/41FK7q3sbEOc8EaUrAv2tMN1Z2MRdSXtbJuz6NW76YE+ETDEVJq
         UW6ydHjHrpbxOCV+3b3NwM+nt/2xPZOuHn2Ia5dlhTWvFPgoRrDY+84LqEe39BO2790u
         D4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862853; x=1794467653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1v8pdYNRUM0gZGGjmkBVmbbvzgTfWcGoYiulTdSvFE=;
        b=tuaLOHmCb/Efv/04nGFzuRaVKuKf2eO/e4TkYXFhGI70Yx71uNFs8zmrKbqKdkhxVV
         86Ewfei3tntx0h6aRP4C+pHSaFpQXklIF0aKytY8VRPerOblMe8Kv9BN5n/Mt3S7EZEH
         LtkbG1zEC4dcmVotK4hkgVThrwI5+n5BOaWQsiOUlFGouqrgkxwPhIs3iV7nYxP6yB1i
         UOeKuVgrV05Cc93fdsU/C91BQfPUG7cpllcWTwJA0KvaYhCXFhysCVWkxecbMPe5IiY+
         HuOw1NAKvLG5Hnbo4Lxu1EwMGyhPsGqZUY0uqrFL1Q6yFaUw7LCCVaPL8zMVBCFj/C4R
         hFvA==
X-Forwarded-Encrypted: i=1; AKwUvBzGvfWtzG6MiTRxqf3viEgQLo5pCgIx+bgo1hfkVV1i6jPJH7rPU1eLGPgMaOnIDDB5PRAoh1oJE3ja/n/G@lists.linux.dev
X-Gm-Message-State: APuU4Z9HbsaHhHcZA8QXz8z+kbQa52rzFJ7QbhPglMLpauy+EMkX1lBT
	RJU2zwfVvyo5J9of1uiv6kql493iLQSYNqwcWnU/rcsW1ga2yi2SsmRJ
X-Gm-Gg: AYBFou0YycCEGimb3L7nBx1T7IMm+CdCz0+SNvCKE13KmU6Tq7AgLwTFcJ8NcGMn/JO
	Uwy3VFp9NZFuhztXKBWkFn4jaKn77o86FW9yMgHB7eWfkA0wH0XzHInisYehsKw3xjYlXN73nwk
	SWGNnQCgGY4+YertKeh0ISMPtMrxaDKdn7PkM8g9Cynzo1HiVVQ99Czt+PH1plFVBZqtIiZlPAF
	j7d9FbGbZwBcYccsCgOk+aEWOkdaJygUHmCVNemcdn8tZER6AddqKtLBg9EIv3OdTh3tBqgr4R2
	fn7yO+PcNUL2ewbwayN55jVV7OlaQuGimIeCcoRqt87nJ6i/L42MOEP3GqT4LOZj30uA/4mc+xH
	SC4aqH2Pf1LozQCHFP0Rzd+vYHaxgORe3UV9+dyVzb6WVZRvqecnCEQsjA+COH+E1s8hDFGLzD8
	9zk32VeptAMs5hvvl3MO7PfnXpEcIXoZYMEvGg6TpT4IzU8XZh1uVrUcqZK8HJw1/XJzYHCYPFJ
	PmcnwudEyQSdjoCh4lZ/teqWL88nQ+tafJG7QLvLqBTuEpakEe2U+DfWidt0K+rkDXxt3RX69Rg
	X0WFzJJ6G/locQ1fbIEXHHuuRQINvkmL1loclL4Pv0EPmxjCKKcCpyM2dWzWWBndc+NGJWvyyh2
	SwR7PfpuBS9ndVxDLi511A0MUFiYEEVNjzE68Is94jb+SAE3EU/puSXxVsjh6NxQYzDQ=
X-Received: by 2002:a05:6000:2284:b0:48e:678d:396e with SMTP id ffacd0b85a97d-4911906d313mr2976092f8f.9.1793862852953;
        Wed, 04 Nov 2026 23:14:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm8347693f8f.46.2026.11.04.23.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:14:12 -0800 (PST)
Date: Thu, 5 Nov 2026 10:14:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Laurian Iacob <laurian.iacob@yahoo.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: use guard(mutex) and simplify retry
 loop in buttress
Message-ID: <auwswLdxTSjA5BTL@stanley.mountain>
References: <20261104222832.32471-1-laurian.iacob.ref@yahoo.com>
 <20261104222832.32471-1-laurian.iacob@yahoo.com>
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
In-Reply-To: <20261104222832.32471-1-laurian.iacob@yahoo.com>

On Thu, Nov 05, 2026 at 12:28:32AM +0200, Laurian Iacob wrote:
> Use scope-based guard(mutex) from linux/cleanup.h in
> ipu_buttress_ipc_send_msg() and ipu_buttress_authenticate() to simplify
> error handling and remove redundant goto unlock paths.

Unfortunately, you didn't remove them all.

> 
> Additionally, replace the backward goto retry label in
> ipu_buttress_ipc_send_msg() with a standard for (;;) loop to improve
> control flow readability.

I don't like that you got rid of the try: label.  How is that related
to locking.

regards,
dan carpenter

