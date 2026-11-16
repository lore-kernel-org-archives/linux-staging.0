Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832732;
	b=AkcF0whcBOP2ZpWFXsv0bmKTgiC3b8raBMhz6SiUHphmsoAZKin9QUNlHgDa1C7exC56
	 kmsPuZiWwJZg38tk6kkRZ+f2mFg47+R3sbabHYfALmhZ3Vs2y0rGedop1mkL5047Yz7Fn
	 wEkvtps0pNBs8P03nO3IhXg1rLZVFN7ZfqtdQ7r5+gqDn3TytXT8YAEiUBlFk8mBDeNaw
	 dNlNQr9YbMQw/FKcQ/VkqRydCrVA6bdv1L7QqRc63cIEmRAg6d34R+BF7UtESeFW8ozXO
	 9ddYW6YpG4Jnx1PbkzbMqsK873Cw+U/30vp2PbSA4jl5MYC7cpFzcU4i5Xt86w2g4wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3PZYt1daQSeYExHxoL5A7mAZahkiXN58Qu2cjjFDeCI=;
	b=UwYCOKIJrWPcH7rJ0+X6KxDi1hpy98SZBCXq5hkCJNFQGItMmWGyjEohLI2DwAAXW2AZ
	 uia5EoRJ22bhkMYhFTyUgt45j5V2vN1U3TnCxRyuCOVQyjeT5nz3uNMwrxT0a+1HDAESq
	 KPFQOPLFXvyDhjH5cdKm5saRa45iYKvBpK23jSYNXElB6txIyLRTnzBJQw1rpdv/uTePf
	 TkPw1Lembe4PuPD9koWWPTa6Y6JUEgwd4j8PweerJyTMuwl9Z6zfDVRUcxDw8O9rdjQns
	 yKclnK/tHk5Cobe8xJnbIEWaFA6yTzZ36AuuYOlXCDClVhz+y7JIsHoNxA+BSzww1+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i/UXIpAj";
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73403606A323
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 12:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73403606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i/UXIpAj
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so5001891a12.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 04:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832731; x=1795437531; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PZYt1daQSeYExHxoL5A7mAZahkiXN58Qu2cjjFDeCI=;
        b=i/UXIpAjV18MYd1iUyEC/BXrhtDuyHMUATGVcWk8CFK/pUNldOPw/Lgz6gRbRSRHFy
         QKFC5EhsOgzDiShChOJuGKxAPNSvkTh65L15bOTGANfI3Sn2jkdVKp9THAnBuDNmkYzg
         /Z15xjhCqUvqJMcJMTROTzrXS5oqI9VhWiDTl0Fv30qx+m5ofKZ+TKMgzgatB16Q5Nqj
         VEZlNrObthiVJTAK7/tp8aiaV0wOoTrAj3hw/Yc+OVnhQGjTocW6vLGKAObHeu3QO3bb
         qg+XY1iYVcBj5ix+WvzshBcVQnOu1AocTFL+QjKZdYiUEOMJVCVTb8t1yY1wWL3oPEYm
         1Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832731; x=1795437531;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PZYt1daQSeYExHxoL5A7mAZahkiXN58Qu2cjjFDeCI=;
        b=o6YmYEL1ZEtHJLqM15GW/JkU5rOLxDzxw5wsR0n31XqOhSsB2RZxp7Wiq4mEwihW5I
         bqCXtawgVvD1krDbJPM9Ru+A9KEs6QTdW6noqhjIf53wGXRfoYbqel9F6hpfeBPkjni/
         XZh8XBIUtWdbLXlI0Zhz4a0T9FZEFwBWmh2YkupA2YTmNhJoEEbANyditpvXT7cniacx
         CHnN5mMVgwvvuww/Zhhuv9QwBV4VuC+qTpScbHyeCHMnBaZrYZ8gb9LHq83iHe/bKmaj
         nTQE6mv/KfxFpZmTNq5XNSzug2E3NeIF4rYT1LNWUbwTXXh32J9ywk3xnXxNVfs/SjS1
         voDw==
X-Forwarded-Encrypted: i=1; AL+hErEx2n+5DHS1LPymCs8gdzuPLJd8wGbioqyob8xnUUIEHreqX3DxOC65FhFdhjUwIpRP8Zxqo3fJEuSMe3VR@lists.linux.dev
X-Gm-Message-State: APuU4Z89BQ3V2TeCHcusWRc5zWLsHTuedQdkDGHSc7MM7ee8kN62BbvM
	ZiUPC70PriipsHuJMa4F//mesGYiIZRAUQNkD1/6IKJRFuxi1s5xi8+B
X-Gm-Gg: AYBFou1xrW3/4bU8vkm0SAdqD8OLxcQfZ4zufjiOQK3hHsiTH0yV/1Zwfgn9fijTRVd
	Ig1RUKSY2AZ+9FJS5X3pBj6pBIjvv75UE4wpzZKwEeZSqV+N7B+WEyn5QYZGnkLeddAHubzXKPq
	jr56ouioDgTYerPMI7q3xhMGUG3rtdaiwR86EaDm+z5zShnArysbAoduSIEBlgksR8nD24/16wZ
	k4GVOgek1mK2eJnRhv2yLqngb28vx4zZ0dFbjiDt1r0MSOw2GP55QEF0k2ftj8UTwdwUNLNwvqI
	HqpIfa8DPg5rM7q6BUkyTyD+az7nBzQTCsYjFSb7tEQMQZXwVEIFNGHl3MwsFaSANaVQ3bXxw3B
	VvW4hAc3kd6WtqyrohDkvezvIeKI53CcWXRvyelnsMCTzhUg8BK6rwT5z/rQrnbNcsedaZQmfeb
	4YN5WaWEOKpnU+DB83gaxKhdDtoay8WgqiMEhq5E++4PcRrz7bMa84O/2HYQ3WkAe5Y4G19btfF
	5/7BGftxk+mcROmXFhiM38Esq8hb8suLEp+62I69jNaU3MFGW2Vc5pzlckiDSLZTxLGha45Zjio
	2tZzRWYPYsnuDItYJ7Iq8KkIEQfEW99W2T3KUQHFWLYlqkoe4I420AaHh5p6N1vQH7CzVLvLBE3
	nJlUwtc4VxvUyZuCcBCBjc0pODu45OqthLQTy9jpXzhsEF+vHvhMvAzfeXXKJPG2pBbysrgYObw
	WzzQuHsD+bnzwE
X-Received: by 2002:a17:907:7b83:b0:c41:b4e4:7958 with SMTP id a640c23a62f3a-c5095dd7931mr810371866b.0.1794832730779;
        Mon, 16 Nov 2026 04:38:50 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79d19sm408995966b.71.2026.11.16.04.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:38:49 -0800 (PST)
Date: Mon, 16 Nov 2026 15:38:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: atomisp: Remove unused get_sp_code_addr()
Message-ID: <avr5VoP2Xtc3Chpe@stanley.mountain>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
 <20261116120703.6681-2-chaulagainavishek14@gmail.com>
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
In-Reply-To: <20261116120703.6681-2-chaulagainavishek14@gmail.com>

On Mon, Nov 16, 2026 at 12:06:57PM +0000, Avishek Chaulagain wrote:
> get_sp_code_addr() has no callers anywhere in the tree. Remove the
> unused function and its declaration.
> 
> Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
> ---
>  .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h     | 1 -
>  .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c    | 5 -----
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
> index 3cd69284f..e00308818 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
> +++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
> @@ -26,7 +26,6 @@ typedef struct {
>  } ia_css_spctrl_cfg;
>  
>  /* Get the code addr in DDR of SP */
> -ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);

Dangling comment.

regards,
dan carpenter

