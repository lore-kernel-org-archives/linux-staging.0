Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC3019D07E
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 05:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782882288; cv=none; b=YkH/iSiOk2LNKWNlmvZ1De8svGCozn0FXoH2DgGaawwgs50SAY583+FbA3HlHHM97v1ZuA7Oa/PCuOq63uCxTKkHycMrI40eX23f5JVd/SOzoyQqWXg/12k1WbT7GDFEoxIEenggpR/9Qqj94dYNaOLPcmgt05f0XOS72m0iCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782882288; c=relaxed/simple;
	bh=rvm+4uEtAJwTSt2QHnNUd5p40BFoClhDEOgDK5i6ytI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIgRKi1w7IwWvDEHO/6kyVU/0ev+1yCIREqzQ7FAPGh3MEx4yjggEzvgx71Ys8IIth6tCi6ZEo2JyUuNCfnFog8NEXJPOF66KPo57fMwgwWXNPyNYpLEnEDRIcmpGBNfRt0xufPBM0+wRcIPLm5bCsHc20H99/FF5KXiWsvCES8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdHVV5kW; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdHVV5kW"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9ed64d490so95835a34.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 22:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782882286; x=1783487086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fGkBqmWMziFZfQZQE69AV18F0fO02fbt3lLS7uXpR/w=;
        b=GdHVV5kWJPkyxOo5aDxW5EjTK1K1uVLKkNuTyTDo0Sn37/5i51k17FgX6TmJMk2z9Q
         9A1QdSUnf4j2fHfxKeNJFHbL3DaTeIfclvSqTaqIqOryqfjsFsfzg/nrhzx+rJ6aichf
         nRUZG4jdbJiAd7XnMPr0a2xPimrCVNLRlCr9b2VnxPUCKociS77ARm+tOoTdw8qg886L
         TT83moh8Y5FLx7Z8eta/2TU8wHRHyN6pD/hPnswWbSdnmKjK5CStQhchnwnj2WdVvWo3
         090QL4qaiLfuU+ErSkHasL8/IdMuZuEEJXn5aRLkkiezO0AZFehukJ7rfdJYlHM9TaIq
         W40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782882286; x=1783487086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGkBqmWMziFZfQZQE69AV18F0fO02fbt3lLS7uXpR/w=;
        b=cEt3JdNJtq5emoefTtrUiJPR4SAFLtOqe5mQuztWkBEOR3eUk1jbT6juoQNSieVRYH
         CDDq4k7kgOQf2S5uLfcui8EssVBDfkmeuZYyA+LT2vUgxWDoRLb3yNr6SmuRlNyY0Dw1
         KRsAHOLtCTzkwK7kRpErCPA+T8+gB8j8VJUSfCqfqvwhCoT5/LB5AZULP9t3o4mTCAgw
         GbZKChNXrdeKhxS8qQN722BcXNkKcI2K8cqEnpDZb84NQh5j7ylffV10rFlLUCwyMzjS
         rKPXUxH7uV1s+h5QxTMoWCSSefwAwn3iLy/GKU33aPnQF93cn2oG5gfihtD0v7Att/Px
         z3Tg==
X-Forwarded-Encrypted: i=1; AFNElJ94rfR1FuyuHZGstZcO+36W372raTbQsOpDlKQFYH6hC4q27aU/Z4bK721ZpHO7+QyC4PtxUadiog2KXnZD@lists.linux.dev
X-Gm-Message-State: AOJu0YwJdCvWbAbeHaNVFXbH5LWQUgvyfPqxPltgWPRx6dEuf9/FEU2G
	HAKVkybwnd+4uy8bLgt94Dh7eNyyRG35OKA2530IT1JohRnTQlwzZwPj
X-Gm-Gg: AfdE7ckMkiKk+nYNgfmFULSPkYtnCNN6O9vrUqeanQqhLndbhFY4Npr4gyaFS0g17Lu
	MKcD6DwqHSGtBVyI+hoWowWVQnBz6LutV9j1m9rlfSwz5PcljaWtLFguGrLRoGDO0JnTjrOY+38
	/pnB3SYn4SEOO83xCtbnxRlehtbRPM4N9Vs8+AnCp/vaWwV0BVMPBZfFU/LZoZGm3Lub3aBfu3p
	69O98xNphOmT6SQ1sqW119Wam//zajtwyP58ji6W1tPAxZnFVJAAUKc0WmzGA9sLZexMZn2iudV
	zExx7GNhEwlDMuSjgTh/Cqtgw3VmXI2zRQOrP1afcEAYwL1493+vNaLD7uhGu0NGz/sRbA8VCEI
	+geOyyI/6OHTukCN0F/xRoxGSJF+VhbLQ7sxJ2BiwKuuzWqu2dcDGAYZy0WdmurH7xnEv1Rm7/Y
	5UDfPX
X-Received: by 2002:a05:6830:82a4:b0:7e9:e1ec:c818 with SMTP id 46e09a7af769-7e9fc26b827mr2264128a34.25.1782882286053;
        Tue, 30 Jun 2026 22:04:46 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2e200asm3974254a34.19.2026.06.30.22.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:04:44 -0700 (PDT)
Date: Wed, 1 Jul 2026 08:04:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: adi25charis@gmail.com
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: audio: split topology get into size
 and data calls
Message-ID: <akSf5lCBOSU1Crxy@stanley.mountain>
References: <20260629144941.33818-1-adi25charis@gmail.com>
 <20260630204908.40206-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630204908.40206-1-adi25charis@gmail.com>

On Wed, Jul 01, 2026 at 02:19:08AM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> gb_audio_gb_get_topology() combined three separate responsibilities
> into a single call: querying the topology size, allocating a buffer
> for it, and fetching the topology data into that buffer. This left
> callers with no way to perform any of these steps independently, and
> forced the kzalloc() allocation to live inside the protocol-layer
> driver rather than the caller, as already flagged by a FIXME comment
> at the call site in audio_module.c.
> 
> Split the function into two:
> 
>   gb_audio_gb_get_topology_size() - queries only the topology size
>   gb_audio_gb_get_topology()      - fetches topology data into a
>                                      caller-supplied buffer of a
>                                      given size
> 
> Update the only caller, gb_audio_probe() in audio_module.c, to query
> the size first, allocate the topology buffer itself, then fetch the
> data into it, freeing the buffer via the existing free_topology error
> path on failure.
> 
> This resolves both the "TODO: Split into separate calls" comment
> above the original function in audio_gb.c and the FIXME comment at
> the call site in audio_module.c, both of which are removed as part
> of this change.
> 
> No functional change in behavior for the existing probe path.
> 
> Compile-tested with W=1, sparse (C=2), and checkpatch.pl; all clean
> on the three changed files (audio_gb.c, audio_module.c, audio_codec.h).
> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> 
> ----------
> v2:
> - Fold in review feedback from Dan Carpenter.
> - Store topology size as size_t instead of u16.
> - Move topology size validation into gb_audio_probe() before kzalloc().
> - Use -EINVAL for invalid topology size.
> - Drop unrelated dev_err() formatting cleanup.
> - Compile-tested with `make M=drivers/staging/greybus`.
> - Run checkpatch.pl on the updated patch; no issues reported.
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

