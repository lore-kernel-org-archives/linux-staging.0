Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562234;
	b=HNMSEsYBAE/n8aIuxAzspIWP0f/p3xgrQbc1+q/syLFnJnjLi+PsVz5AYRt+D17NcRf4
	 o5IBhFmtUPFsVsi9J2UET6O6BqNfIHrPGqNVIfUrTSnCc27JolG5rfHrLQANTWHdeLyEx
	 nMzO/3VSCWFuleKuRH6YI2vrEHqUl32LkQC9dCyP//c9lS1RvTMcY4LYtEDzdjWNiTiwV
	 /H4Dw9Ofd1+EAiZsWcrbR3RcB6EbW0Mh6tMEMq6r0b5ypuGZAQE1txybvhhxYVJ3igkIo
	 4qX+ppBAV/Yp1p4cd+4j3ahIIjSbg/crM9H5bm04ki9yfpMmiq0usyts0oHzXhvNCzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lTBam0jinCye74oQhjo1li7sy5614NeZ+nwyBGOMSeU=;
	b=kXC9vKjvBrE/yU1hSalvN19+4GBMxCN/oEIyQWSVpLvvemVUGEM8ojDG+jIL7NYkPKGo
	 yfEWdLDckOBdwaJlcemHNXTGalQ2HwExv1Gxhw90HU/mS+AS3WPg9MmrgxfublCOACyyd
	 AXP5l8kgpcsLXwlt5boVtsTOP+MaLzCY9RfQ5NRGmPwVPNWMqNKWVMTl2fGFQMmcABLLk
	 XIOBvkMdI6cvukRgj1WhyZN8xuO63lZX7Ft9njC069VEGModP8GDqfqm/fA8GGT7SEj+L
	 L40axVaV+r0pHlSGo7qPN8DjdO8+BJQgVWayynEkxoaTJKxQO8VJ/vqxVfkIBxcZCJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OmsNjCZr;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7D9606A331
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 05:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B7D9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OmsNjCZr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c45111bebso180131f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 22:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562233; x=1793167033; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lTBam0jinCye74oQhjo1li7sy5614NeZ+nwyBGOMSeU=;
        b=OmsNjCZrVlkz64H56IbIdaAI7DD+v8LDNAOgFxdl8q2yas2hu/gNO5y6uDDDOxwhaB
         rkSQMKzjY/s7IFv8VmQzUItqVI+USqdYwy2v1s0mYiroiAGHHqXio4EE6O64mv9LynGA
         a/CkRfa/BGyElHFSBMO4Ui1kz4jRbek+lSx3KYuxKAOXzNCMhPFM8hdbRyIsANr1qK2G
         xnIE6WDnbqdyg8ApypeAQethIH8SoViSV2cM9+NHFhfZUZmFrNC1GzK/cOXyKXFAwkkg
         1OS7DbT06WXfCe+7iEftd0+Odn7SXYAghzvxgkkqj6G8DCuc9H3ha8ttFWpKpo9qa6sN
         8DJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562233; x=1793167033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTBam0jinCye74oQhjo1li7sy5614NeZ+nwyBGOMSeU=;
        b=riTv0AnWIb/AV6lXiQOE/295Sk5Manrsi8w6KeWKshIO2nuiSde37itpNuhqRIO8U0
         g1+m7E6A9JWGt3TkpLGdiid/PfFK8lYiHo94rW31cOCzWk2wu7DHmsFjCUnVW8rOKxQB
         toEgv2mA/p3SAVNrXjRSpC5ZhTlg8zNKp5d9/aou1CcZB0QGdfJ5p1w/nvPRdwNZKXs4
         wPJOnQRBMF8eKf2iBYty67thdnjC8n4e4+nnL9qnsgaLqB5D90FOPzOiNqW36H0jbbVX
         iZu5UQ80axXstjLQE71qZ93yzdygW29umIGwPLrXkqq4wHrsBr15CfPwKNou2/XVntNP
         BISg==
X-Forwarded-Encrypted: i=1; AKwUvBztKuuNvbZfRkQ59/RHaE6uTQKzMjRedwFS43um95j052PvaiXP8uywoQjRLh6JL8nRddrXbjcKq08Cyc9A@lists.linux.dev
X-Gm-Message-State: AFq9FYJesUyKNtMPKS6XnQMAdaLzSWwDYO5XosNLoT2TltADmydf5Ojt
	QkHwSqKSVtPHzOQspHlHDZs14giMNWflNIAQmVTYbhxO9KEGBB8VwOXm
X-Gm-Gg: AYBFou13/0a/1sfO1maP5YbqIUjmOnZbskT86Luqs+rtg2uG/WvB8/2LKj25IPXoEPg
	LL3+sqBqXEi9OoWsc7QjZRrPfoZWjQFdWPId93k7Zz+xH/iZuhOq3mMTwoWM7BgJbE3fqD+xUvK
	9OoGMCVrd85xs+GVfxF5JiRmcz4D7X6qz2y//iIY5Pk9TXa/QfPsuw9NBegOjEqFeADxSrThpgx
	SAgQpCto+2b4IBZ3SBzEAx5NJWpBvDWcwAyWwSEOcz4mKCPNi7cr/sSS3sWseTtOiw9fXHz18um
	49qrQ+yyOSGZIUh2UhA2w+5NbdhKJ+GUXfJOVKvzbi4XbIOf5VOOAY2iFPcsTEglrmYi4I0Vnpq
	2Kq0ZghXnNBD+gjx4UGLmZd/+vmHdpKs8qWl3TF1cHYPssiAjxUPzgTmyNDfgsJekhRoo0T64gP
	G0145kyX0/lba/Ivf3/bLY3YaNsYaZMlLNs4SX196E+zt5spoXceRf3ZHBALVjYXJkzVLixjHTq
	P0pIjmGEyDbqpTXTd6Im2Y1rkpQK8/eEtaKJAGVggVJsryi/648
X-Received: by 2002:a5d:5f43:0:b0:48e:bf0:352 with SMTP id ffacd0b85a97d-48e2642d37emr1773736f8f.5.1792562232722;
        Tue, 20 Oct 2026 22:57:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm3178383f8f.8.2026.10.20.22.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:57:12 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:57:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: fix crcsr_bus assignment on
 allocation failure
Message-ID: <athUNFUCEx4CJmB5@stanley.mountain>
References: <tencent_A9C3CCA9DE8FBE61A3F51944B22D1E7AC606@qq.com>
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
In-Reply-To: <tencent_A9C3CCA9DE8FBE61A3F51944B22D1E7AC606@qq.com>

On Wed, Oct 21, 2026 at 11:02:22AM +0800, LiuJunyuan wrote:
> Assign bridge->crcsr_bus only after bridge->crcsr_kernel has been
> successfully allocated.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>

The original code is done intentionally.  I'm not sure if the
new version introduces a bug because I haven't looked at the
surrounding code.

regards,
dan carpenter

