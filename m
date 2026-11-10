Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286834;
	b=NQ46HVEoX5zw4ucXCxJFiIuxDK1tk0BbgAGmqGnslR4wmE0Ya9NbAfrh55qmhgz9QByE
	 IfBPUhsAt5zDOanZ0GMEDWG1MHKji59VcqWqO/D//ElZGF4sT1/UYdmM8oq3WQM9RByK7
	 +he8qqeI/O0fr8OH4pqO7GO7UGCZutmdJ78Q9g+jpw6kQ6BB0G+jJoTguzmcGD+ZKBPSx
	 bYhXiXNLfMn/vd1XKEPbZPBUGOJzyZMW6IbK1ofvKRBJ7H9jOYZpn2INGcPBpNLVw02J1
	 s3+xSGZiK83gwTf1HYIDacL+l8iYe/gFf5ieRLCCk0tJSVuZBzszZi3eX6+zqnH2ebQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286834;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4O0eqh0/2N6SuevRIz4jY1zAOHwLnJqMFnfAmlKu68o=;
	b=L3rURF1IsJtd7pHXfYJDBIDlJd5t0klWX9XT+7w8TJtghFmyZPp+XKtGkp4N1uuAneUE
	 Knkd96IsxQiCaDCOghgShWl5FqSQ8w9I06k+p1L2sr21zoZUQ2d5eOWWeKyBcd7kGrysB
	 rxHOoayrs8gN7CmOuLpiWn0sXQWoonH+uCuSNqVJB6eAiG+QdR9moT7rqgU+G1TFN94Iq
	 KBWuMzv+J3xEaiZQV/dWF3xi64t/ms9jPzJ40NMI6Lk1fi3cNSIeeRP8NK0K3ij47MxNV
	 r8+I2mjlhCy5lNgDz2pPlJuyuEbY6m2GYMsNU6ACk63epc4legQr4Lbut/x70tYD0Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F9606A32E
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 05:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4F9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c1d337d8so1085249f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 21:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286832; x=1794891632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4O0eqh0/2N6SuevRIz4jY1zAOHwLnJqMFnfAmlKu68o=;
        b=B4fvpLxQb3ZHt5DXH8nwnqsP1Fxze/FvNlZLW0g/TZAwhbTVVtNZSYex+kyTVZaRv1
         ZPCRprx70fTBh66YCthlpki3EDhFhFM1KXJTyf2syfU5RmHt0Z2nds+kuH2H9zzN2ue4
         Bi+MXr0Pwz7MMzXubGRFXwqZgDLkNQUhRVOPW2epQOoXCMfQMriUYW+woye9TEaUAmzH
         L8gcAGP+wm5/Psf5WVdmPAck3A/vpXDJaB7QoK009ZOH6AAic+om6Sni0SH6+UoDa+JV
         mcwi6tMl4EeaKCQG/NcHMFIHqtUOp/31K/r7BcWtRU1JGO+SSTJpvMEF3OSCayN2YoeA
         yWIg==
X-Forwarded-Encrypted: i=1; AL+hErGOUvMddZrDnks52lynVMqhTtqGvZ73rlsDd0a/YNwtiZYjMOI2+zjpByVimDMlIidngWaqGPZdweiuS8eg@lists.linux.dev
X-Gm-Message-State: APuU4Z8hNlFTcRESaJIND3ZBQIv+2LZQgDLoqrbganRUHJSZFs5q4ghw
	NhoAf4brnn+mjRmUWkVOsZ4TsxCgFWpiKpSnILEikl0qloyE++iRKw26
X-Gm-Gg: AYBFou2I0/9+J/mTHTOYlftrPUU9+zEUTblcxnMHiprmjL7CBoCjC583lpXPFcFQ+Jz
	Ixjr/B4Su7rMe7bQXrol9zDmXtTVmn9kBALadkS2Q7cd8c1pPS1uI3k/RAzH6ogYie+Zc+/CD3t
	+w9YBi0xvdZav//xd2EKGKO51wWr6OHotpQ94iJ33U+NF9x+Q+lD2CLKTgcpv7cewfeKPsb57Ex
	P50WSEZrLh9B6RcGRhsEKR+dur3nthUGue8d5RFmQBQ25M09KHNceutr6LgJlzJddSbwzCzcQEJ
	Yrn06FIdSsAH0jyzdl/5DbfqLFsjwGE1wNPLsTHkuzf/KpDiGdt0BFV1Si03muo7uqm0KQu4Zpn
	R9pacfIoCMXIDtzIy5d9uF6cfZ3XArrJP+3BIIbgjziH/QBDgJWQQQ+Tp38CV97xV3D2VDLlBLu
	Hfdie7K/YIPSHgNjnt7hFxWAEkYDx+3jL0eXX2ASNKp3dWZEKJUMsuzRVNxHDcMEh+sa1I7WATF
	LJr56VMgnyY8zA/f9XjslLY/6W/q0fV2zPB7RcDCMIcAUETNu5k6Fu3zzgSFdKh8ScvW3yoQyNl
	x7ptdXoAMhHrV3HOqnqxdHDcAAiBiHiHTFambJ654fBrDTP3Y6jT46qY2apCVGmniqit+PWZOrJ
	0TRdBAVbQT8wuMW9DYeEysvHY6jul5PCsEOlgltP+j1R9gG9SVXdkavepYAwRShso
X-Received: by 2002:a05:6000:2006:b0:48e:5e20:1371 with SMTP id ffacd0b85a97d-4982b28a89bmr2510103f8f.4.1794286832242;
        Mon, 09 Nov 2026 21:00:32 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498361f674fsm2715343f8f.33.2026.11.09.21.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:00:31 -0800 (PST)
Date: Tue, 10 Nov 2026 08:00:27 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Platon Miller <platon.ksenzenkokk@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove unused macros in sm750_cursor.c
Message-ID: <avKk63Z5_ofZZcGk@stanley.mountain>
References: <20261109231414.25021-1-platon.ksenzenkokk@gmail.com>
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
In-Reply-To: <20261109231414.25021-1-platon.ksenzenkokk@gmail.com>

On Tue, Nov 10, 2026 at 12:14:14AM +0100, Platon Miller wrote:
> The macros HWC_ADDRESS_EXT, HWC_ADDRESS_CS, HWC_LOCATION_TOP, and
> HWC_LOCATION_LEFT are defined in sm750_cursor.c but are never used
> anywhere in the driver. Remove them to clean up unused code as
> specified in drivers/staging/sm750fb/TODO.
> 
> Signed-off-by: Platon Miller <platon.ksenzenkokk@gmail.com>
> ---

Leave this sort of macro.  It documents the hardware and doesn't
hurt readability at all.

regards,
dan carpenter

