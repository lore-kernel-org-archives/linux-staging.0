Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBB730E853
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 06:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783752162; cv=none; b=PtZYimJptKZUS0sAJ34AAAODLSQyVtLv3sGCztYXenvvIXfqr1tpNbQrdMxCsZpfHLv7RfbVGVZPcBSwxfNZPPYCkgXvLRfi7fxBXSJlfcCa3PdTKbzSQXt6MyuqF0Y3j9JLGMcQ1TLGwsKojIubX7fw5vhi57+KcEF1GA/gDdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783752162; c=relaxed/simple;
	bh=loroDMZU+n7SMrWqE5d9BScW7RJVKj3q4enj/fl4Ojk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXrTw17bZIDIL4cUMtVIqPhJHgzzRbvSFxOELfcymubwvxPj8KXqYgX71J+NaYE94CrzEm0rSYywf2eKY1wzZ0tfUSdTFF3DArDyFR+T7NGysrvGnrA9XrgRY2T56z1vHW9RSatu2E8EAP581oSJkq6yNIp33Evv8OwU9PqnmpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJVB76Ar; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJVB76Ar"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so16080895e9.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 23:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783752159; x=1784356959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ezINNweKUyPIgvxpWdPRkOeMqoIqysLDCxIA7CJpvqQ=;
        b=OJVB76Arvd+MJqEf6AOC7jwvwd4GBMzwqmerXk1gQYQ8p5ROQlf4dWxOAq7C9//YyE
         dM1v6Uqi8yLjM2Y9vEOhZCbyUjL3KsXrV8q3uV6kLYziJ1g+mWJuwMcLNPGUqLIdeCmO
         gA5HHiYYfaOImWGln9t5+hbdUszoiySuwTz4zonADTvKV3q79SaL/VJFEqEFzn4fsrvM
         fGtMYMctHogSR/f9RkvXIdeE0pVG0d/LooUXxV3Y5IBQ/CngvPCyQGP7GZTQxN1GXy2D
         yIjrlvb/B3Xn37idZrIzFdjsaM+OYY9E/l91hshvPzsS/J0/6xnH1hl4voGtNH2v1TKT
         1crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783752159; x=1784356959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezINNweKUyPIgvxpWdPRkOeMqoIqysLDCxIA7CJpvqQ=;
        b=aKQxXaqbHdyUiYjkmsCvViSkxiLMVgPqP9nLWCcXxdJmncVu2Y68QyxWnclcYGajqk
         Y+KpxIi66s1Hm/g5IzKDEIDoDYRAEXRUEV504rhKtITyZqZA68XaWJ2aihglWxTO+ITQ
         nORxyP7mK2zprnofjKEIlQuzXg+zruzgYFXYFn0sHWz2NfNAQ7yStDYGKQ7AFXJYQ/PG
         rcT2OkDpkbaQ7gEZMpj/5UaGiOF+uGlEohfvuwrsCSADRYjhJ/t+ZJ13M60FO1z+Llqd
         e+7R+0xGzj5xrIW6ABLPXfHfwWeK7WT1kvNYrwjtImcQia2UgvK39G4cNud/t6/sMopb
         6SIA==
X-Forwarded-Encrypted: i=1; AHgh+RqkhAzQv+U3rujUyeMixHPoyT/ZjI6Ps4UQsbePWmmS6gfiMEbsKT2u6nhQruQgSBdxpUZbCxgT2vJoEwHI@lists.linux.dev
X-Gm-Message-State: AOJu0YyKrvg6+qGliP+r2NikcJOI0JO98Kkg245mkVPUTM44CYsimp+j
	u6+iNd8IA89q73Y4R9khHhX9HHAHkqCm018hsIveBCltNlFo31KBVBHi
X-Gm-Gg: AfdE7clJHcVFq75FH4mox/UwIlEilTSF0Jm7xNvrkEwaJnXUAxwHsw+jUY3KRUpO1uO
	aETP00d1/IiAwael7pn2VJn8dHAppDKnq0Egf98e1RJki3G/EKCyDBQ8O8JNY7TC28dDrQSuX4t
	5B3NSQ51ytv3EAZminckyvWmr03H70Zo/N3je5rdR8ncJRJc1B965O95FyL17czSta68gj69cjp
	9rCgwHJjToEnokee2WnM19E7qIKv4caDLu8VVG7IG7h/l1qRdJLcWVKcW+pskQDiUgTPxB8Ycul
	Zlac3DowZcQsCfztJXU6TpZAZyY+DVyyHsMwQKkslYtlWnqpTpSGkSfQr/5auviV3G2X2jYtl2p
	oAznWT84GIZM8c6kttu+sM8v3KrQo5t+SFPyQ3nkSFIS0P9KqfKFG5v+Se2iJTj3g8T0alpPpRX
	6aJFBSU0mC
X-Received: by 2002:a05:600c:46c7:b0:493:bc92:ba9a with SMTP id 5b1f17b1804b1-493f87e4983mr16522745e9.13.1783752159354;
        Fri, 10 Jul 2026 23:42:39 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f16cfsm193109485e9.12.2026.07.10.23.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 23:42:38 -0700 (PDT)
Date: Sat, 11 Jul 2026 09:42:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Anantha Krishnan <ananthanr.off@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace magic number in
 InitBeaconParameters
Message-ID: <alHl2nsrGPQE-7sN@stanley.mountain>
References: <2026071157-ovary-property-4427@gregkh>
 <20260711063901.30828-2-ananthanr.off@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711063901.30828-2-ananthanr.off@gmail.com>

On Sat, Jul 11, 2026 at 12:09:02PM +0530, Anantha Krishnan wrote:
> Per the bitfield comment in hal_com_reg.h, REG_TBTT_PROHIBIT packs
> a "setup" time in bits 3:0 and a "hold" time in bits 19:8. The
> rtw_write16() call here only writes the low 16 bits of that
> register, covering the full setup field and the low byte of the
> hold field.
> 
> Replace the magic number 0x6404 with two named constants
> representing these fields.
> 
> No functional change.
> 
> Bit-field positions are documented in the comment above
> REG_TBTT_PROHIBIT in drivers/staging/rtl8723bs/include/hal_com_reg.h.
> 
> Signed-off-by: Anantha Krishnan <ananthanr.off@gmail.com>
> ---
> v2: Use full name in Signed-off-by and document the source of the
>     bitfield values (comment above REG_TBTT_PROHIBIT in hal_com_reg.h)
>     per Greg's review.

Please wait 24 hours between resends.  Otherwise it feels like we're
holding your hand while you write code.  It's overwhelming for
reviewers.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

