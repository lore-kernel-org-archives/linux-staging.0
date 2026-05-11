Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC55377020
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508000; cv=none; b=l77hpRTuyI7+3cPqhQWtiZnattOQNFXuwt9PKfwngj0GW8rChM78nGvxAoT/GkVRx+kSmVP+tyckPhJTMuwyBURHMpnxeNfMe9+U/K+VLfNqypoqU3CjYNkwtGW+NIoQFxmN+oPjiRH64Jj0ZCXBMaScvqCcf8avSV7psk4ksTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508000; c=relaxed/simple;
	bh=q+Ct7Qvgsqg4MV1eNClwAdRYtvLKeSzCI1kDRN1WOqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qsr1b1kPwgC/Xh1OELwRUG4H0bapI8pPWjNnDQznzG22Nmrc+e5RDtnhcb4PioswlPCrtS0a3x0tx3KlYNSoNwLKJAB7EjPDwTHDlAIa8iF3u6lNKFB8j0l9l0WYWhneUpypXUjXmSdppS7tBJLtpu3TzSjnXsHGXbYP+LRkAYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUBetwFn; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUBetwFn"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a8738c178dso2977623e87.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507997; x=1779112797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7OSn/Kr0TD2kHEq7dup3SvcK8cZ4Xw83Zc6Rxbq2l6Q=;
        b=QUBetwFngCMuaabDdCBNiFYyrBpTx3PNkLeds/VkPutrQWookofk3IDkmaAdbppUxV
         1vYeMXZVHfcQkM2n5tWx5Ye0mrHSZ11VWn0m6az7hNSOrLJJ4MX5eJNdqlT0AGVS2Gj/
         JbUF0Lhg1wzlXiCXHrZ+OK0KoAoLyXDexWf4jP9BtKHvNNmf56ZfVdUMOWVh6KrhJfcx
         CFHVRc7IXTbijVt0/lWEAMjsaggzd0J0vDp0wEGv0rd/AsY/V+/dTwlJgD963ibuyvt1
         e3Nk69djLdpj7T5nUwkBxTAQfhKwVxkYFeTC2+j8p9blxl0EkwGZkj5l9YbVgrH6KV2V
         3D7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507997; x=1779112797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OSn/Kr0TD2kHEq7dup3SvcK8cZ4Xw83Zc6Rxbq2l6Q=;
        b=HWEOhNiDmV4zLsCR5olcwjt9Lx8XFV84cn2d8nevBCHoLZaLjBTV3ICtf6ql6qrNOO
         hRq3Txbvol2BBilOAgdfvOFdsWGpaFfJjzYAolM5uk/lbvVNc/3aRdvZQgF+FPqr69kO
         VInJwSpFDF7+CB0TvZkc0j2Li4rpfbOPYBaFroFtHtyv1ldSWd1YxSb0Pm2fzy+9+Agb
         eME8YIZqSFxUAR3OeS8s81894oajv9l422G2W9NPl8ExJ7kelRKuMxe12LRzu8cNAlKX
         w+6BZ/JdD8o8Y4aiRrpaXPSRyzZGB+pxGWdYWhLmiOdd0GKEyumxFtjrDTwic4fdSRZx
         udXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fMFCD0cn0ibb0Ik5b2cOgJr4aU1KBxhROSG4Bsl/MKz4XCO/i8iRkonywNPTkJgj/H0fd6vDXEIRp/ZBX@lists.linux.dev
X-Gm-Message-State: AOJu0YxigouuT2/5ZATBnCs7q+V+1Ra4gYFwV+Y+/2yLlM+tizuox4CW
	1FrBIyFZsqc4kkjq7e5YwnK1dG1a4VuL+Q+3fUDTic/h1zo4OBngHOAm
X-Gm-Gg: Acq92OFhartWYGf8biT0CJ1Q9QmCWxQ3+GzhVMXvHeQAyjbXn/IfqvIw4laWKthnWmH
	zrsLfJBSyVtc4RIV3ApOpZrc+EPLq/yxEFbmNjcLR/ekjlFi0fhvU19qbCNiyPaJw4JNwdoyPLR
	HFgrspN21+TImY/2rkzHD5bhzclpX6irwNw99i7X7eHK/EnSwqrw7bP0mjiu3tb5iUymdEpyrXZ
	akbIHSe4nG8NSowJlcoklmzmBamqBshFzlatrwqYp+Gtye3RF2QkQ7Nuc6nBtbBVgrcMRQCVLOe
	mJPAl2TGwu66QkVQoEiCnC/q2/EuP8h2lq7nTWsYWtuDw/bWwvRs9bE2O+ffHsytp1/VGpFhQUm
	JM098SJEmASr7WY84u1gczyLDbBi71S553BmMAziqRhqgeyl3bQFNKfxJBArX3Wo2oXN/0SnSAQ
	r1RrQ6lG8nq4/b4EJNiez/fc+f
X-Received: by 2002:a05:6512:1088:b0:5a8:8222:7fc9 with SMTP id 2adb3069b0e04-5a887ae0273mr9840306e87.13.1778507996504;
        Mon, 11 May 2026 06:59:56 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9515444sm2600082e87.9.2026.05.11.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:59:56 -0700 (PDT)
Date: Mon, 11 May 2026 16:59:48 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/4] staging: rtl8723bs: remove overwriting of current
 IMR settings
Message-ID: <agHg1J88_vHg2FWC@archlinux>
References: <20260511075651.11637-1-nikolayof23@gmail.com>
 <20260511075651.11637-4-nikolayof23@gmail.com>
 <agGfAqihe8DHqTPp@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agGfAqihe8DHqTPp@stanley.mountain>

On Mon, May 11, 2026 at 12:18:58PM +0300, Dan Carpenter wrote:
> On Mon, May 11, 2026 at 10:55:30AM +0300, Nikolay Kulikov wrote:
> > The code reads a 32-bit value from REG_HSIMR and writes the result back
> > to the same address. This operation does not change the register's
> > value.
> > 
> > This code does nothing and simply performs unnecessary SDIO operations.
> > Furthermore, if rtw_read32() returns an error or returns an
> > uninitialized value, writing it back will have unknown consequences.
> > 
> 
> This commit message isn't very useful.
> 
> There can be times where reading from a register and then writing the
> exact same thing back to it is how the hardware is designed.  So it's
> not obvious at all that making this change is safe.
> 
> What you should say is that:
> 
> Originally, this code use to Step 1: read from the register,
> Step 2: add some bits to the value and then Step 3: write the result
> back to the register.
> 
> However the problem was that the bits in step 2 were always zero so
> I have removed that code.  Now this function just reads a value and
> writes the exact same thing back.  It is unnecessary and can be
> removed.
> 
> It's not 100% safe to make this change without testing, but it
> probably is safe enough once we see the explanation *why* the code
> *used* to exist.

Indeed, it's much clearer this way, I'll fix it in v2.


Thanks,
Nikolay
