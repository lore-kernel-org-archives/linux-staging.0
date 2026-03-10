Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D2E36B076
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 21:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773177128; cv=none; b=JT3l9UljCz6p9B27fT6AFO/NwpcfyD7OTYhjXYumLyBzm4rR00r/53KMuquuiPYxSjHQMV+6uQVAl4ZkKSnPHe+kL2fK2Q3/e1sBUVeq3kgZzT5Z/rHfE4Y0PyuNvrOKDi1feCfh5turq9vYDQOXhalbeuj0AdRJinAVulekoEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773177128; c=relaxed/simple;
	bh=pehZhuiQQpthYsgXZoLR8NFfpxutBnuajwfJq5hQwx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6Uc4KSKIYwf7plPy4EQnFxIa/SYlLfOBFFNbVgVUdBR8qqhzvJlHKhlhY6NkM7EyOwUH4fQ3bOenyeb7kzPTIf3o5i7tGvKCGiu1hnpQ7N8rwXASkvvIj5tH7RQYsx7CVXD4G1n95yqNucQVLiHtoxCBTZzRlT4wpdKK9PHEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZ742tAh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZ742tAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773177127; x=1804713127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pehZhuiQQpthYsgXZoLR8NFfpxutBnuajwfJq5hQwx4=;
  b=RZ742tAhpuRUF5xMJzpNqTxJBFlW4nZ54vx/dmeOoTJHdFxe88OUVPaw
   z+fjCP40m9bSQ0+mJeOwN6Hk9qCQEsrEoaaDGcn8CwzJNK6Wk2RMt/SE3
   nAwR+xpWJfaFeyXFHM9/1QVyTZLfJ402Enn1xncgwWdJwBgexyRC/pMRj
   pJuJE2eJrr7x31RcYLYuZWh6uKwWFErL5fx69WAxBxqN26heobIJ2peFq
   QHIShjL3uXu/5F5OXQxsneED0c8/FO7A0AuWftyqXWmkD3RiRxMmpU0Vo
   S6+k5SM43hwirYCdqmwzkkaPyqGjMFVphZ7zno7AqZaiUu0ahiSBnzt/q
   Q==;
X-CSE-ConnectionGUID: DszW8PpqRpyBAnf11qlWGQ==
X-CSE-MsgGUID: bpwr65NgThOwnHZ2UQcrhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77841731"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="77841731"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:12:06 -0700
X-CSE-ConnectionGUID: ixppP8mBRc2aAsqY+2t1EQ==
X-CSE-MsgGUID: +u7wFx7eQXiY/mTugiKMyQ==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:11:58 -0700
Date: Tue, 10 Mar 2026 23:11:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	lukagejak5@gmail.com, ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
	sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
Message-ID: <abCJHOuBcPo4W2GQ@ashevche-desk.local>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-3-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-3-sanjayembedded@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Mar 11, 2026 at 01:35:08AM +0530, Sanjay Chitroda wrote:
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().

Why this is a series? You can avoid spamming tons of unrelated people with this
by sending patches individually.

...

>  	case SSP_HUB2AP_WRITE:
> -		buffer = kzalloc(length, GFP_KERNEL | GFP_DMA);
> +		char *buffer __free(kfree) = kzalloc(length, GFP_KERNEL | GFP_DMA);
>  		if (!buffer)
>  			return -ENOMEM;
>  
>  		ret = spi_read(data->spi, buffer, length);
>  		if (ret < 0) {
>  			dev_err(SSP_DEV, "spi read fail\n");
> -			kfree(buffer);
>  			break;
>  		}
>  
>  		ret = ssp_parse_dataframe(data, buffer, length);
>  
> -		kfree(buffer);
>  		break;

Now you can return directly.

		return ssp_parse_dataframe(data, buffer, length);

But also add a prerequisite to convert to guard()() et alai.

>  	default:

-- 
With Best Regards,
Andy Shevchenko


