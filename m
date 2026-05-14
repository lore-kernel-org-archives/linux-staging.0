Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A853ABD8D
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747808; cv=none; b=uSzUKU9DdD5VMiMqMVBbTCkx70v6L56yZ0sKYiLUhTcHxJXkD4yDod03q2pE5Uh95dXEM0xH/HzVl/IS9zl/mYk85hD0pO2fgnAfP1DWhMlLrqUMSVF0q39jNvb6joIuFdHM4UUATShcEpork9cUSMIY/YhRKgr0X3xW+/2ohGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747808; c=relaxed/simple;
	bh=LZjFSiJMAk133oX14n4qPnTedQkFhR+lVpMPoTUdv1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9SZef303xkj576yboG2WuNSXsyHvpgdv/hiN0VODb2+sg7hMC52gfaxBCZKl9f3UjZxKQAzUzNhsD5YzudZqoMr2Q5jYDcraKF5fK2A/wfhAANmU0V2c4d0i+zYaIxrIFzW2udPVGwHucnnKTN3iQNhzt5WROtBF1d/rxIFvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVaeLfuE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVaeLfuE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4526a8170ceso4324838f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 01:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778747806; x=1779352606; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/SqpIK99SX2LQxq4P1qr8bITnns1XnWYW1P90iMrai0=;
        b=TVaeLfuEQ5k46dvR856m8pTw9mONDJ3qtB1gJ+7bcQMKLG1smVnKmkUoVIAy5wnngC
         R4X3yyKoMLPUF89pPBaslQfcW7BqlGQw2VURctfpZG7moX+CtKZKZn+78GmKXv2aOU1P
         Ezf5wofc11BFPwhCIj+cHKvLCRwp/6IETfEwtK6c4PwoEngCLGIbA4lBz2ofXXvUDl+x
         /FR+4vK+ASo+6VVsNlaIKHj3Xkc2PlWw75qjMH/9eyeR8p6nAn0zS56wzV/ZWOogSvQw
         HNRf1kqh5zSUDKpFBpJ8NOfQ3bW5NDMecqTuKhJfVN/BbLC1FBrsHw0btLKpZP8VJcDP
         wKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778747806; x=1779352606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SqpIK99SX2LQxq4P1qr8bITnns1XnWYW1P90iMrai0=;
        b=ZgzmceVr2wVpm7RYpEMDdRTAeIliTRHin/0ie6cVFiGPd9dkoWT9gLsx6mygaM0ImX
         okJPuo0cvgC0Eh+Nj0+Ri6i/nF1j4W/v6Y1JbYqoZh4aatacYcYEUlFwhDNfQe1YexrL
         TIrG97KpPgGKpneyyl/kq/eSELvNNrkU6y0gcQ00FkdCBULTD/k3oAybUYncL22+Qq1X
         rzf3FjbYSJOrzS+bXiY9DkZMdzbfocxl2i/ODtT3puQvdkuxctRTrQqcaEHcS9o4zdEk
         C/hEVJ5M2x3N4Fwbhiq8T00QVT2pEDcGW90pvNqmGS6dmPB8NDAWTiQJA+weRdu0Pt4j
         zwxA==
X-Forwarded-Encrypted: i=1; AFNElJ+R0W7RyFy+kwDpTabCI97624NdffrNzP3iEMB08tp9MTOMUt6ersmvud71Wrxym2/Zpw61xpZb4Efdq9XT@lists.linux.dev
X-Gm-Message-State: AOJu0YyvXpnrvO6qiLu2jqQW8wtlnmdKXJcrqb1vLc6Mdmgix13/RCMH
	Hx8rPFH0C/pSTpw0k80GaVQuPffelCRM6iGRkC9gu/Jr6GS7xt8eFOF9
X-Gm-Gg: Acq92OFNcTOQ6gh7h2M3R6NFMHK+eG1aKOryEfUkY8OZmPh1vVl48SpqT75S72BCL7Y
	caFIpyIHlfmQXfNHLsjZiGjBoRlasDWwijJ3kc9B571zb7RSxZD4cijkUa7GuHlGLpve4vSqIjI
	xzCiYYqGakQUxGL0etXx//ICgQHpt4SAay0AISqO4jzi6ICCRFtvyWerKYXasHHrI0gleJXdtOr
	9jf207GNYc0SZYFmmAaQZquV2I1g24jYPuyx7284Vf36OifZ1INIHYuQS6Xvj7de1LFHj6tW2dW
	ER6zMldNhp5hn/gOaKbeafLrKlsUMiUXCNBFlvV84CNchUuLNAN4qjhIGYVvInn51j0jpUZO1og
	YjatHcOgRmgxyXX2lBEpCvgDnvDhcabLyPOBtMxFHQ6y6xdUHqsIKEuxFzttWF685L31VUjd82c
	f3Shnqsv0gl+2UPHSwOYM=
X-Received: by 2002:a05:6000:2486:b0:439:c299:4d8f with SMTP id ffacd0b85a97d-45c57bf958emr11214469f8f.17.1778747805454;
        Thu, 14 May 2026 01:36:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm5145202f8f.22.2026.05.14.01.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:36:44 -0700 (PDT)
Date: Thu, 14 May 2026 11:36:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: add missing FBINFO_STATE_RUNNING
 checks in copyarea and imageblit
Message-ID: <agWJmcvuQYCY_15b@stanley.mountain>
References: <20260514080318.39332-1-yogeshdangal66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514080318.39332-1-yogeshdangal66@gmail.com>

On Thu, May 14, 2026 at 01:48:18PM +0545, Chhabilal Dangal wrote:
> lynxfb_ops_fillrect() correctly checks info->state before accessing the hardware 2D accelerator, returning early if the framebuffer is not in FBINFO_STATE_RUNNING state. However, lynxfb_ops_copyarea() and lynxfb_ops_imageblit() omit this guard despite using the same hardware accelerator through identical code paths.
> 
> Without this check, the 2D engine could be accessed while the device is suspended (state set to FBINFO_STATE_SUSPENDED via fb_set_suspend()), potentially causing bus errors or system hangs.
> 
> Add the missing state checks to both functions, matching the existing pattern in lynxfb_ops_fillrect().
> 
> Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
> ---

1) Run your patches though checkpatch.
2) Add a fixes tag.
3) Put a note in the commit message that you are using AI and have not
   tested your patch.

Smatch says that the state is always FBINFO_STATE_RUNNING so this patch
is unnecessary but I haven't looked at the code.  Please check again and
resend if Smatch is wrong.

regards,
dan carpenter
