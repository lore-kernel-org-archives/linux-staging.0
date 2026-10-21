Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562475;
	b=vDra/vU9m+cgdDZXQmzvIh1r0V2dSr64rQvMkkRgvPOfimBS6qEhN5zM19etmbEjWGBm
	 SB8g/6HdWZC9mm4cIFgMsrecDYmHyb+ssbWSa1YS+pL2/7Uda5u1AKml8ri3beW2MLUvv
	 QY3wvAMbY1tZGrM8Ljq64l//hqzPya+JZYBezT7UT/3DDiZFpp6iEIG3mBsi4HYE4QSL7
	 NxcLSCwI2tEqS9PwJWhMkLiB/Pbnwsh1u56KOY4FK7FcgSi44zl3gpBTNBqehHOWqA83K
	 UMySxR1qiEXRUEIiuHdbAFiXaHXQLeZqOAlhLmahVn5Xn5TY3NDDcW0OGqJd1v6IqKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I6WEPKgW1axx4i+p1+sTBf7I2PMiYFAR/OFTSn3tv0c=;
	b=pCU7+B5eNtDCAF5F1hcxtAiYuKZnL7/z0nuQI0NrPKE5FcEJHgxiOzZTOfwKWISo5pMr
	 wu3p2aA8bgnjAqOlULIuIsSeOlAnDRHBoeImMe9ck31N03L2PKkvmySNl1XrF1Fd/ZbXW
	 piWK74ig573dNBSOtN2fIVaYhcJDSjueVgcRMWtuxalVa7G0xNo84oo6U0xq0fSva11cG
	 lD7o/3wRqnwR606o/ZtccMuUL4/LUeYu8xrydRqvX0n1QEM59P8TH4VSwvQJwkyr52k+R
	 tNOuWKmAOmE/D4DY9zjU1jGD8M5lPm6yW7oyAWGBsCFECYkCOAPa5AgUFAbAl6BTmXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WmGYGn1T;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77A4606A31C
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 06:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WmGYGn1T
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so616925e9.3
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562473; x=1793167273; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6WEPKgW1axx4i+p1+sTBf7I2PMiYFAR/OFTSn3tv0c=;
        b=WmGYGn1TERhU+F0lfYOHknS9S8ep9jSK77vhnW4DjubNJauRXli6CnL1FxK0rIdlya
         z/Z4Npf1Z5vGxGxyI/LdeiuCdUD+1xHwv8yLZ5ioeCoi9NZv0rChe/WK1T9PxS5aYjP9
         Pof8MokIuU5DuD/9YV8cse4maMLJLJe/PikyAROALUmYwqBB45gS3r4PvUE44Ost29qv
         XNljkChTAJp/sRr1Wvwk1/rsE+Ciws/Gk2xVKz6iWXzHzVvsKktyEQ+J85Sicn+Ciht0
         AV1EfbsDrJbcIHq6Lmkmsg0+/zA3azSLjwLaQfKrglpw8mLSLsmACBBEMLXrIDz7E16Z
         +bDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562473; x=1793167273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6WEPKgW1axx4i+p1+sTBf7I2PMiYFAR/OFTSn3tv0c=;
        b=R/MW5P3w2wyFTvpPZuhOkz+lvifDsvU37oIL1IlxPMbMQT/lktfr7vuTFCziXky4Gj
         B/HflQdc4G4ybT6vVWlepnh1zUAmMBGOC07S713Kup8ww9fDUm4Fwd0hbx/60LhDvsPn
         lcZkssTLAivuJvg5QBIKLOceTR5PmW07MFioaRuKTLZFED0gRddfiW4/aqPwpZBhj24J
         VlUcknq1bsgZqelRi/OF+qM6AXh+c1WF2jmOzHgzFy+N6XhIoWh6zG0QokqUXar/CMAS
         bXMNwAVmtTtrIOEA5KI+Jkt8qAcLLRRuyQtSRuvC5JcdZsxtS2mZ0DI+c7OeECgeOQQQ
         CqJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoNGcSqCDoW/Cb2gNY0tanRmpQNRoESGajW9s2lgY3Wu56pM4Htce0jwZ1f+ZMwAgZcGqL0Lowf32lD4pK@lists.linux.dev
X-Gm-Message-State: AFq9FYIPfowYzkfj9q8FZozFL12ekoiRRJoLEvgJqGcSLHY6SKj5Pt0n
	VxhqIQjmJF7xrs3RfbRpFsEZICmooSt4jtvVCRYd7UPT+ogTcY9Z+EhyVyxxhR+OG7vdvC7+
X-Gm-Gg: AYBFou0Mw7UwDI/fSQpE1ZMOhLKy7c0Sk7p68lZTFdXne4QV7vUUS/EATjGq43QfxSd
	2LvVEXNjXQ2IXcGosfGoKn01HG6kHIcCcvAJjUyX63voxHZRomasTjcNFMYvgEkf8W1ZVhBFYBQ
	yL3XUDpedHDrIPZQvEJR3ok52+xb2PZftD8eJ0iVDP8Na8T1GYAxFPrXwMIIpJh/eZ6i9aPmxHd
	mOWdxM+YHPnY6FNCYQn+JywGo/ItLj7bUGJlXT8qKnPtF3VxPuagJAUU5nc9Si8iNaoMNXsKcwm
	vvAXnxLhQiVJenjw/hO+2OYMdT6IT2gWe6bervcoU5xWPqInb7nJR+C8KnemGCGj4/4DkblxafT
	i0eVLFGBITqY8Ce83X8psL9bFluSe82RkRkoFUED/PWWlOuKq5kq3gPgElYn6X1UpdtleS6WVjh
	VqIunzpjSxTlJSMLaxK9gliJEUl3xvcfOMVKnPxQj7CCiC2JomrRdv5rJ2w5dlfmY871x3ghwUr
	NeklP1yenhsTtLjVXjkq/aXQDYZ8fDJC6F3hlwF7cx58oH/2RWj
X-Received: by 2002:a05:600c:3b1d:b0:4a1:d41b:5060 with SMTP id 5b1f17b1804b1-4a1fdb1358bmr16212135e9.22.1792562472909;
        Tue, 20 Oct 2026 23:01:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm63841515e9.7.2026.10.20.23.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:01:12 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:01:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: use scnprintf in tsi148_alloc_resource
Message-ID: <athVJV7ZbRM16Vd5@stanley.mountain>
References: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
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
In-Reply-To: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>

On Wed, Oct 21, 2026 at 11:13:49AM +0800, LiuJunyuan wrote:
> Replace sprintf() with scnprintf() when formatting the resource name.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>

Is this a fix or a cleanup?

regards,
dan carpenter

