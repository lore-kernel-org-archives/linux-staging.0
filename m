Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D241228F
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376055; cv=none; b=u0f7JAA8KBu4z3zqv8SpkfmbC6krk8xmKgl1LnsfRurVyHy5KwpYOzeKIcDfeoy/Xt1akLx5DDfLuY4/Qzv0EseScHevMsek1fYDFEpy4UCtdxxY2rawbznhaFcGk9RYjFWBp0kS76tJcbzgdAP8pntx6iJybOCIdtTBWS9D9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376055; c=relaxed/simple;
	bh=qFnrZ7EQGr/Nuy+M5wyfqqYr8TfZ+ni22DbJJQ8c36I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfEP8IBqbBvYfSLfOXS/X7fvQ9mfaekscoldRG62Xpp/hULriGw0aRd1sSWmNPJbLgcTAN+9olde5MXn3olU2uhEF4GNqQAy1oEEQwVSyBdKPoM+KP2uZSAT8ETLCEBLWddH4b5LFV4y6sqwbvP5StKK7279ebuvfaghwBbBNBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+/fhaE/; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+/fhaE/"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so227029766b.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 01:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376048; x=1789980848; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wa0N9b93v2KYOcx/Yzu42GebihJotfz/VPHeWZU/2n4=;
        b=p+/fhaE/h2UBquEgQmnR2bRqdcOYOX5MY1EsSeplMO1iwbRe+lVYrNzlGqv1vBapDG
         GkcZQt579xXwl112/riwe758pNpRk7Z/FjecqT+cdFBGU0JzED+RiANXarwJQsW12EY7
         Lb6rlCUQd0fb9NgKqnCe3P8u2982Dd/27T6xnL08/8nvAvyfcuETTg7RYgU1fxfcGi/V
         KLswaCc3U7DmXouVhuMm4tkYQR+90RErGKnJoEqRe4xFQX/4xLojjqO3jf7iz6wn2m0G
         aRyvicORAxOVeVIK0lqbs2HBAMV3vUI06UEgvojQWsQcp3SYXX12v84YjvXGbOn0+IUW
         m/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376048; x=1789980848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa0N9b93v2KYOcx/Yzu42GebihJotfz/VPHeWZU/2n4=;
        b=IaAEe1S4h3+e/EEMn+vVozPnYAEBOEhJt4ZIGL0aWvluaKUwv+bOzHXdJ4o776CeMq
         R40WQFo53zFaUnlq3+Nxqu5yHUmT70peZVuxhAvHhgIgWsBvQjzS3f7IOIIhAAB90O57
         e+BsA6XvLorwaf39ajNUY850jrCJSqWa4lLVwWrRby7tS0Ruy3iHtkLDS9IJ214RmIvT
         GXv87gIuW3nPEOmMhvjVvV1e21rP+JfhSkNcdxffAgjOrfIpMcavBz9grpqqYEdIZqHU
         rvumP8q+lZCEfqcpnOBxRb//K0JR//9BYCmWQUsbzqoDiKyHnXnmXRQkEJJ7yFD7+QNR
         R8xQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgYxtG2bbueLvck3vIr2AmBs6i3ljbLrpUcuFtAcHeNvCLeL17vuoaVNs0TR1AeP1kbRTylrUgyLO/romX@lists.linux.dev
X-Gm-Message-State: AFuF++lsRYO1vxaqN92QDZEwJXHXpr5bfKrPnuvIR0BIsVcEeDOklYgn
	rhpm69Y8Z6mtMvlJdyE2j3FQhhMTMd4WTNTrTrC12c+ngPu8C/JrLa+N
X-Gm-Gg: AYBFou0+rGX4+d1MSlLoXEIGGLEzga38z28/VZ6F8Wgede1E5C5NgNk7/paOvwiUiqa
	Dtr8ozt8VU7v31V7c9uu5IjXDGWOneTOBxQYOqblYVLO5vVBYEU9xNK1LxekWnKZCiCTo5KmPUV
	jqKsOqEz069dYwsliZmYUB2CWJuy5ggYzQVb3m2OmmCK2F/tquEC2dBtRFQqlSA/QE8IcVBN5xy
	E+aQRCZ1qDsi9J5/DARQjUlpHiVxeRwtady8f7r3Nn2KwDJhGVd42erVnIhmu/LQnwjVFxZD2zX
	1KwbK22+1M49G2pnEn924kVUa3BtrCbG3J5rCw8l1PDOzLNc7pOfKAzzXtdcqetgmjyap7rbw/B
	rIu9SwuMrHrjYE8TdFZ7n8HvbohTwRzqkxNqcPKrZQQdROR4eCdivKRiBHuvDJvyx1UeKem9lLS
	yN4KGGQCmILWK0sjYxhAdrunUW5JqL6f7HCsE7V5+s+v//Rx6M+NpHuiYMkWHMQMX4b7c1
X-Received: by 2002:a17:907:7204:b0:c26:2751:3da4 with SMTP id a640c23a62f3a-c29b86141e3mr110973266b.13.1789376047594;
        Mon, 14 Sep 2026 01:54:07 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234dcsm394388366b.21.2026.09.14.01.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:54:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 11:54:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Gabriel Changamire <gaberashawn@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: sm750fb: remove unused definitions from
 ddk750_reg.h
Message-ID: <aqe2K0nVppBFSidV@stanley.mountain>
References: <20260913040140.4517-1-gaberashawn@gmail.com>
 <20260913040140.4517-2-gaberashawn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913040140.4517-2-gaberashawn@gmail.com>

On Sun, Sep 13, 2026 at 04:01:40AM +0000, Gabriel Changamire wrote:
> The sm750fb TODO asks for unused code to be removed. Of the 1203
> register and field definitions in ddk750_reg.h, 1046 are referenced
> neither by the rest of the driver nor, transitively, by any definition
> that is referenced.
> 
> Remove them, together with section comments that are left with no
> content beneath them. The include guard and all VALIDATION_CHIP
> conditional blocks are preserved.
> 
> Build-tested: all driver objects are byte-identical before and after
> the change. No functional change.
> 
> Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
> ---

These macros are just documentation and they don't hurt readability.
They probably improve readability.

regards,
dan carpenter

