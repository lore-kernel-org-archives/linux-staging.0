Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772233;
	b=yuiyOyADDbMKzmxzNn/IwXz7EKDX2BOTFPfsRpzpvHxu7GbE/dM0Xsy6MTJ5krEYg91o
	 3H9xrq9BTCRv3WDI2qO9W/3ipIrZojdcgwfZ6PrbtlpGSU+cribSTBCmoTMvb0s7EM/Wg
	 JSsSgGIRDEh4HufnCbSfMmfDLPlHXlIeZ1wTjLLVI4slqItT7TIy1it0SgkN9sCS1tjEf
	 zDcSEYEVH7vsoymf6pgF48/L4pjDbV/djm/BhOMtuy7sMFChqVBDpqCqAABo0Jlij15dY
	 VejleKLIkioh0uzTzL8PqJnyfaYt4bNPw9zq9TdF86CuICO5lnxy5JnEyw3a6urSrNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BzEMw2qyVRDMO4EXZ9qN4crrCxVYQEBm0VZTnBXODc4=;
	b=xdywHdeO94qkbWu172ykd4MXuGkWg2sGNNt6NCRPTlQOy92bridcfbu9PUEFDDfetqIR
	 oqoq08xCFpaMk0FO2hUq3ooNAz6DD3l8lC/YUZK8QRGKFJLUBjQAS29aVn/slzSB6Hr8q
	 qFxWHefgdVZjWxWhccr5CDnfBOklXFckvM4V0KJtixVvHRfBVlNewWI0wOnVXigLoVIvy
	 ZeAwtrrohNBGce/uWb+we5tGQoCBpd9V0BBf5ZPUkVCNvByD8QHE/+EdHL133iJvGKlUP
	 Yc0qiixa9FWYsifWo15ZpIhUA0EWa39BJ48672eSsuZtfNv5xhX4sy3h8Cqc5YHynGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="DmJ/RXN3";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8204606A31B
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 16:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8204606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DmJ/RXN3
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1df146015so7760855e9.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772231; x=1793377031; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BzEMw2qyVRDMO4EXZ9qN4crrCxVYQEBm0VZTnBXODc4=;
        b=DmJ/RXN3+BcwI2ofcddm+iDXhWTi61UtUmX0TL0Zi9xLRnf+pqc69rYydj+Nx6nL1F
         mvulVjVUGw2VkLSXPLa05eVXfLArjoxxc137c2hQ78RctxoO4nGtsU29MLpqQ1YLzzRE
         r222mPyHMjvVVEi3CtIF+/MWx/NIlkUUEgZ1O1zofaxD25vg3Fgx1wyiI88/+1BlF444
         nB2I/pSDhDUbWTMWbAsvHs3pI8Juweu9CK4ObbpO/W19VYSPpU4RtOKHpQ8rHVBM0lKU
         D9EVPQSHNVTXxi2BEaKPmra3WtmRuhpXH6ZzLPuL63og7BXlEE5JnVbSiYwkxR1KwIBG
         E6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772231; x=1793377031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzEMw2qyVRDMO4EXZ9qN4crrCxVYQEBm0VZTnBXODc4=;
        b=sMW7of5xAeSmi6QQBzsf7vNJGh5eiXKJbVr0avUiPGC6k8VYtSpvOqG1rfVl+3cyLm
         cUUEvG+EBtz0aXAw/nslFH3wNzoEkY2zi1baQwr2jbycnrzuvj7Ra8OGIEOOK8QDilG1
         +axaEw55Rcv9/pbcDwmtiilQlzLjcfG7x8vg3w26Q4eP85YP0uVKw1LV46ALOISXWZHq
         Z2vDVN3/xJ+p3XCVpFxLvSjeCYtaDmRP9wQ2eS/JDLGkNMKe9xsnpXNM+bPdSFH9cA0t
         UE3HoAsTrpNH2at5xwRXIQcgM0HGX5oqJ51FI9MXnRiI+6JbQAyAIiEs/TskY0VA+p02
         fYXQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9mGbBlzSEvem9HybiDvzdCbrfCZceWP+1BXeIZwptZn1xxlZlUoMvH+yzSS2jObFRxbE+nWGRRree5R+0@lists.linux.dev
X-Gm-Message-State: AFq9FYIJPvAn/EW3ltoRwkFON459toxEAVow4Lc9NeNIL/6KJJouydnx
	UU8oGb0FyzUeMTp7+Pb6rk/ZouVW+RelcddLdCTXQkCI1kfU5fF69ryY
X-Gm-Gg: AYBFou0jRMq+IG1QhPO+lJOuXwDtgPMAlKJi9jNmVGd8eIyTV4qnwqGNgs4xmCiZ6in
	d03e2pykd/I76oWFLztA9ChqCfo89cVe+5/R91T6euML4n/TnAE4Ap2C201pM3MJkN4i++Ap7hk
	zpK9CvQDxlEbYWrif0FC87V/roEg3qTlvPwc60UHsQ6nAUfg98HwI5XJ0qus5lgrw647M2fvY3t
	qlGOc0qa3Y/+oPdzEk3u0I/LveW1zDiQhV/g2PycSFPXrUbjOqkE8bkl7G2fLTwIr/EAZBm9Vc/
	H7HI9JUnM/arJYTyJ1qFmxdndzHB+Dd9F7D6B1WvPGjB3j3GgGRyBDVmYypH9RzKRAOORluPivL
	jN2yCU2aAKauPnEgwKP/dxBgh+wWKdMZOFCEwe/fDn/kvkdEAm4BSDr3Mtvc+GTjD4HhSPOHs6M
	W5cDWRP/mmZdJVf+TU3ZRHUKSnW+gU2TfyFNPggFK3AlnuHn9i42GQteZGVtE6K7QZ+HEl21W7R
	jochwsTc7B3xzYRWqXvNcKKUZDVJMHAPN3UjpmfhZZZWV2J3ovP
X-Received: by 2002:a05:600c:1d07:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4a211ecec0emr46659165e9.35.1792772230469;
        Fri, 23 Oct 2026 09:17:10 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2958bf25dsm20075165e9.2.2026.10.23.09.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:17:09 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:17:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Lorena Tanase <tanaselorena3@gmail.com>, hansg@kernel.org,
	mchehab@kernel.org, andy@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Fix double blank line
Message-ID: <atuIgtYbgUsmfgkp@stanley.mountain>
References: <20261023123158.6176-1-tanaselorena3@gmail.com>
 <attnVU9A2GvgYuy9@ashevche-desk.local>
 <09d70600-10cb-4626-88ab-f9e10f4dcdf7@nxp.com>
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
In-Reply-To: <09d70600-10cb-4626-88ab-f9e10f4dcdf7@nxp.com>

On Fri, Oct 23, 2026 at 05:09:55PM +0300, Daniel Baluta wrote:
> On 10/23/26 16:55, Andy Shevchenko wrote:
> > On Fri, Oct 23, 2026 at 03:31:58PM +0300, Lorena Tanase wrote:
> >> Removed blank line to ensure linux kernel coding style. Found using
> >> checkpatch.pl script.
> > 
> > Cool, but is this the only problem in the driver?
> 
> Not the only problem but as a first patch for a newcomer we want
> to learn the process of submitting a simple patch so we keep it simple.
> 
> Then will expand to send patchseries. 
> 
> > 
> >> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > 
> > Please, put the Cc list after the '---' line, so it won't pollute commit
> > message.
> 
> Didn't know about this rule, there are thousands of patches in the Linux kernel log
> with the Cc field added there. 

It's the more modern trend.  It's was never clear to me what the Cc tag
was there fore...

regards,
dan carpenter

