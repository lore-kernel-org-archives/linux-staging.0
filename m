Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D483806C0
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068885; cv=none; b=lPeamPuL/8UJwlnmh8jFLj+8ZEa1d9bbuLs2eWHyjxfJC1p6xMAeuTFrk9AWEZJ76w8B+AE7XxHnQrUt18GvwhaLe6WddSI0gST6V0Wf4hF1ZYXFQGt6vQMs1kTS3pooUVnNVlvdezMobZQZWZzwSesuXDF89Hljmi2F5RfnEZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068885; c=relaxed/simple;
	bh=x/ArPEjgkRFmr2Ou75CLISSLQ+UM8la49trxVzEqOw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvo5Unzw1hSQhmAOFIrR0We0sjGeMNWrdraDi5vO9rvVz68PQdQz6/jHVfXt1pjRhlDcTEbOMi9yzGo+DF3GpiOBcfIcrOwTz0MOjt9m8qaTYGQJtnVygi5Tgck21vmOfwqg5RyxhWJTsFUS/oBF+SdtsB4bMCM2OrLjSrZWhpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuBkiAWQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuBkiAWQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso38667755e9.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 01:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776068881; x=1776673681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hgVK+xMFHenSVr8/JL2FgJGbiRTPeNjFrSjIxLFtmWA=;
        b=fuBkiAWQ0lPtoH8cEGvxWPAX/aWwAwoOluY1DkcO5cYG7V+Ah6Dhux0K9XH589d3ma
         ykPNa46uloekXcQGgWSaJsRWQLUkc6iCFj1qSedf8zs2KGk7Btm4C/p7qmkbQdEOz/m4
         6GlsZaDQxfhystRnjKudTJvQUwy/ZIGkIJCTqBE57cCbQiepI8uf6eQwAkk2TBjgITY/
         ui9yhqkFroO8JjgqAsGtHWkHoel+LRKxaSPc6+B4DGMp4GLv53yVM7vzsl6Ikl18ISzt
         XdNqJjv+g6yIFguqtNqk9OUFETbho1KYne3+CSKRLsha8grhulRSBttagX0TMKr7VYVB
         ZtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068881; x=1776673681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgVK+xMFHenSVr8/JL2FgJGbiRTPeNjFrSjIxLFtmWA=;
        b=ZDyfTzlXtvJ8XhpY+wbi5g9Z29SB549i+E8lAbLVQFNneo9EGigIVWhj/u6kMQhorz
         T5ISLbE9QXBVb5NHtatvp7TGxBvuAnxTWlNPDqSSwzWGzwZfIPpFEB+oOBgE2b9MAkXD
         wh7k1QlU+jE+rm+NRaN6vmKuSLVoGVJhLHWEJjL5iNqHOVHG85WEbPh8U/rMNWd8xczu
         uUh13crTrYJRGDPt1DyJTIVvuX6Q9e0VKCL6703bj0k6YJD30BUmZSWaDE52ZxarIrSC
         XJG9NPZnt2PSXNLbB6vL415hVSPYmeAQQjqkFXPRJi5RWBwN52eSvHnVrW4Et+nBWsaA
         WqWw==
X-Forwarded-Encrypted: i=1; AFNElJ9gipvK9pDTU38npSFUWtg6ujWcskkHzHM3TBi/KwpbuIQdH7UNuxXW7XqNzNXrDOVFOnjxA7Wy6erSAX6E@lists.linux.dev
X-Gm-Message-State: AOJu0YzPNpX3/zcTxoZEiZS/F2bDVrwU2ZhwM77F97ZaQ3k6pSqXq1XA
	z+Fof6lYg93HeDS4p/6+vXjzGg/thsjuXqwXlxRbMWByWCFcr772G0Rd
X-Gm-Gg: AeBDietWunEfyQ7Ia7D2L15PV+TPNFcS8THHOQBMSOYCU5RlnomhFwcfDEkXj6p9ey1
	yiWW2WHqfGOEPzmx2aOrUJxKQimkMjEtd847vzCuvuNIHcr54U2AENiDhZ4VkrZlpN9T4yKIYjr
	WCFQU/s3FVU8PpqRdN2/NMJbfgHjQ6/AKybDPTwIOlwutvfxmiEM/YCLqDTjyFb/bXuHDXxCVHk
	8QJB8pg9EOE56kqz5ioVeZwKUMBF6xmKnPpSoH6RtHjzSIb4VP/YFMaYEdkUVjLwOd6EFElXxE/
	QZXCiuy11L8eonlBLPVtck9k2lRVnWKcVhy61fZ6EICcNNXVgYVy/xLTvtTmGnW0thW7hVJVYun
	PnTgeq+WDt5YEihVZR93UOspz1Z+NP8OASUZMkMf3jCEIN16LtR/hnHRO//RU6qZkNWyDN3NspR
	KzIaFVtHrFZp+2xTWYlLg=
X-Received: by 2002:a05:600c:a010:b0:471:700:f281 with SMTP id 5b1f17b1804b1-488d68af20cmr173109845e9.25.1776068880612;
        Mon, 13 Apr 2026 01:28:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d68479b2sm88460975e9.25.2026.04.13.01.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:27:59 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:27:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: media: ipu7: fix double-free of pdata in
 error paths
Message-ID: <adypDC2I8pjekoPJ@stanley.mountain>
References: <20260412205128.387234-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412205128.387234-1-hossu.alexandru@gmail.com>

On Sun, Apr 12, 2026 at 10:51:28PM +0200, Alexandru Hossu wrote:
> In both ipu7_isys_init() and ipu7_psys_init(), pdata is allocated and
> then passed to ipu7_bus_initialize_device(), which stores it in
> adev->pdata. The ipu7_bus_release() function frees adev->pdata when the
> device's reference count drops to zero.
> 
> Two error paths incorrectly call kfree(pdata) after the device teardown
> has already freed it:
> 
> 1. When ipu7_mmu_init() fails: put_device() is called, which drops the
>    reference count to zero and triggers ipu7_bus_release() ->
>    kfree(pdata). The subsequent kfree(pdata) is a double-free.
> 
> 2. When ipu7_bus_add_device() fails: it calls auxiliary_device_uninit()
>    internally, which calls put_device() -> ipu7_bus_release() ->
>    kfree(pdata). The subsequent kfree(pdata) is again a double-free.
> 
> Note that the kfree(pdata) when ipu7_bus_initialize_device() itself
> fails is correct, because in that case auxiliary_device_init() failed
> and the release function was never set up, so pdata must be freed
> manually.
> 
> Remove the redundant kfree(pdata) calls from the two affected error
> paths.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

We need a Fixes tag.

> ---
>  drivers/staging/media/ipu7/ipu7.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> index c771e763f8c5..043b67dfe19a 100644
> --- a/drivers/staging/media/ipu7/ipu7.c
> +++ b/drivers/staging/media/ipu7/ipu7.c
> @@ -2172,7 +2172,6 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
>  		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
>  			      "ipu7_mmu_init(isys_adev->mmu) failed\n");
>  		put_device(&isys_adev->auxdev.dev);
> -		kfree(pdata);
>  		return ERR_CAST(isys_adev->mmu);
                                ^^^^^^^^^^^^^^
The put_device() frees isys_adev as well so this is a use after free.

		ret = dev_err_probe(dev, PTR_ERR(isys_adev->mmu), ...
		put_device();
		return ret;

>  	}
>  
> @@ -2180,10 +2179,8 @@ ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
>  	isys_adev->subsys = IPU_IS;
>  
>  	ret = ipu7_bus_add_device(isys_adev);
> -	if (ret) {
> -		kfree(pdata);
> +	if (ret)
>  		return ERR_PTR(ret);
> -	}
>  
>  	return isys_adev;
>  }
> @@ -2219,7 +2216,6 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
>  		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
>  			      "ipu7_mmu_init(psys_adev->mmu) failed\n");
>  		put_device(&psys_adev->auxdev.dev);
> -		kfree(pdata);
>  		return ERR_CAST(psys_adev->mmu);

Same here?

regards,
dan carpenter


>  	}
>  

