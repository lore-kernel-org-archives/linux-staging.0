Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373486;
	b=fdQ+YBrdpjL+NbVtDT6yKaqFjoBj5hEm8JNhGI2bhE0UBZJzSuHgmOEgVzWTDISK8Q3Z
	 b09VPHTY6EmQlgUKbJ6BBq1wrQzR3o8d5ieHytPQEgSq/Alr2kJ5bJOo2o+hecsCOAXMH
	 MfsG2m3D6lWrdNaDXM/m61FIuLfemGUSUJVQnDyjSMIjbrqJOf4j5Yy//++tPAz3n/C0E
	 dLgw1Nnc1hioDkNr5fe0G+uN5nkpWPj/nqMxmdOr23CmW2jg2GTmkt7OA69gTYXPBhpgs
	 cwPPZuUgkQq3i3yCVpyw49hUULtos9bV9OT1Drn5v6+lIqQ2QL8Jxf3fa2w4e1L2dWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wg7J0kRkDkaIERBv6F6MaX7gjPWqfUPz/HBXjTx6FxM=;
	b=XiFOpFjVDN/a+703trZzVS+dq0KiDW30kDnZ6SBouy2we8pQDRO60nFmXmKEw6JG9hxk
	 hYEaYljJHNcM82zxq2dO/GSsnU+K7buHDbhApalCz4xOZH9idWcYBqf0CDRAiHfh4XZTS
	 WlOuhiR7ZFD/zpORUkivqAfNL3CJhVGI5MCprK6Jv5w86ooewdHFCBA4LgGY1MYQhAh50
	 ajRUtgamGukZ3T7mfOa1xGl1nfAQuExwE/8bCvV/nhcBzRbtIolbyi+RYPNAUviBUmym1
	 /Eokilgvrp97MeqXmJIx5eeUbjGG0L6cUSXKpjxV84sKOcvpqPPYy6M0Wq4WZS39xQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nD8smn/6";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB06C606A31D
	for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 15:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB06C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nD8smn/6
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1da913so633344f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373484; x=1793978284; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg7J0kRkDkaIERBv6F6MaX7gjPWqfUPz/HBXjTx6FxM=;
        b=nD8smn/6mTkSf8BWsBFLRzerLE7QZD3YnLjrfLsS9yDHBWPfOWu6Qf8ZyyoRcERhhZ
         KkZSgN5oaSPINEm63Q1cTV4V09XjPDS7tbDey6myLoW/mOuLsaFULFpntO2fnh53G2s1
         BxjNmrFOvigpEvvHmsGH+XaV5Gp37xTHGfvptQtzhR7lQDg4Bzq+Sl9orViRoaGaobET
         iMCiMi7F9T9tWggyYPQLS1Wuvl6fyWHl4OtYPi1tuLhc9wO6shwkAi7Ya03tFEDtsV3u
         blcLQ4ajJqcA4Uq6Gk8W8amXOOKDh1svLc8tWkeVY7WNgVs2pOerO0ZWEoMLjoaDpQL8
         KIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373484; x=1793978284;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg7J0kRkDkaIERBv6F6MaX7gjPWqfUPz/HBXjTx6FxM=;
        b=vC576ddwNysk97B59/xSptPdU2hWgHj16LRcgrDcksBNvnh/GbLL1VjyiIh1Za/LIr
         IO7zcf+F2ytNJPuaA1/4zJfpgakxWVUVaQ8xEziL2nGC2+UCDfdrzJIHYw3pE+/ei4jh
         mOez3XP22GMNW11pW1yc7onQ1UDBHa3T+e3P6IArPu+ojNgRYNw6IDhQbGqOQp229j+2
         S/tAO/kFpSTRuMxZK+JcfvhEFB0U4YEC4KPb9Vo/JLIdHRL7N7RZBIG9rzx6labnssVw
         mA8DWHDaZY1FAljYsJoK+qS+jSnHQdtOxma/wW3ZDE7JQMwIDkWM9RHLMsR347cCfxsL
         FVvA==
X-Forwarded-Encrypted: i=1; AKwUvBx5ThN9ER7oS8fdXUR6+up3P6HgFC3mAWkRNfKTuwb6Z8Y+rNnMkzmYs/8E2Hgmge/fvALvKvoEfHqiErNA@lists.linux.dev
X-Gm-Message-State: AFq9FYIa53rrzSGTHPxlKgqAp5ohj3fs/EBgVQOy51J+waKsGA0qHZVQ
	zysrax9JFY8Ve4LT0hoBkRIgKg7/XyfksFNZd6X112LPEkzjEXmaNs3l
X-Gm-Gg: AYBFou2Ffcb7bvIUaIrBp8HdXtZQmN7PNeToZJwyjbtWQumBgF0vig6/K3rCJ3zDZwI
	rotZuy1KJo95W7tqTN4WbfwTPAf+HjEuqU24ooVJNiHx9ruB6y9V8ZFyp4co5KuO0A3oLNVaulC
	Hz3Lakb0/pO4I8hfn7/4JNQ2f0kVqudbXheyYLpD0OdS1PDmadpbpCgwPPJ6+TYv+7i5YH5vj5n
	NkVAehMwfRUeNx09zF3bODyPI7yV3xem66FlCi16+eIQ9SlY+2SyHHTwsmNEsB6R9iUG5xQDNgr
	5nDnBjT4E/UIXNu1eCcWXsu1s0WiFe3TbRApW7FKvhfhbwx4bnR4ZjlF6UgVDsnNS6VN0yURX5i
	E67dLEFpAtcY7YqKcO4WI1f2J59De4GfcT4ghtFdUSwku0+rBkA45oWfH0gXyhtUP38T/FhxrYj
	2OuSYfdhxJ44nD/5k/jeMrbfgGpaZgDELLfiW99OMBsENr78+Gqd5ZXnbYJ1iGBr4PF3sRtRHiT
	2Z4G3f7rXvPTD81Djw3hSxWIq8pzaeS8fgCfD7HENxUrEJ/0DtLBmawx2qmMQdq0qavFGLge4Sp
	9J/9V89ToYds8gHhhGr1Ow3c6P3lqpzLbS9KQonQGClhFXnNNd0ICJQXvHU6Na4BE/CgAlpBwCC
	c6zmKCuUuu+O5GuHAIsix8sY+lYbK9WZdH647+Z3htfy44AE36nYask0NQysFC5YIvOQ=
X-Received: by 2002:a05:6000:178f:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-48e64d038c9mr13914876f8f.29.1793373483805;
        Fri, 30 Oct 2026 08:18:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9a3b1sm4006308f8f.44.2026.10.30.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:18:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:17:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: linfordWu <linfordwu@163.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix use-after-free in dump_module
Message-ID: <auS1J5RV7VEL7iYs@stanley.mountain>
References: <20261030150355.1809319-1-linfordwu@163.com>
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
In-Reply-To: <20261030150355.1809319-1-linfordwu@163.com>

On Fri, Oct 30, 2026 at 11:03:55PM +0800, linfordWu wrote:
> gb_audio_manager_dump_module() drops modules_rwsem before dereferencing
> the module. A concurrent gb_audio_manager_remove() can free the module
> between the lookup and the dump.
> 
> Keep the read lock held while dumping the module so removal cannot free
> it during the access.
> 

The patch is correct, but it needs a Fixes tag.

> Signed-off-by: linfordWu <linfordwu@163.com>

The Signed-off-by line is supposed to be a bit formal like signing a
legal document so normally people would use capital letters.

Don't resend patches until after 24 hours and follow all the other
rules.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

