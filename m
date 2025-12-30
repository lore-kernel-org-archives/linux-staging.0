Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0658E244665;
	Tue, 30 Dec 2025 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767119023; cv=none; b=R4j74R5/S4400mbhpkcp5+LP9FZthi4a4uPESnyzIrm1I6VED7J+L1HelNFJ2VkrTUn6epnow/WapiVcOfmFZk39YeybOY2yqrcAhq06bSTQ+sYWbFhb3IKQbRqHL7sWhxGNYMf0Br9ZDfvteEPAaPvWgLFSJJM7K8wo9LnxJ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767119023; c=relaxed/simple;
	bh=0qq39jsh4G8H5GtxKynbUmQs34VYxa7Rus7bOHH9r8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpoWWfSU9vQcJsm6jW3MJ4QAuF80GUgcPNUUl8sBrZvq4LQQDye6UM5fMEHUpRydpuv2OShB2s8LawZLm1+hVUBknSleD7PsKd6Z6CIv6cotT4ztD+tCjHANcquUcYdf/gohYEs/i9wUhZJqS7wQ4p0rYJHVwE/7Oi5cXYRZijQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nvTAMZvN; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nvTAMZvN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JnY3XN2wfgcZU7+W+qNtOAKo8yxoBI9VfLo1kAlBBYs=; b=nvTAMZvNdEXCUvz0C01DYl9MtH
	iHnYHQZ3BuYkLJi6wsG0S0NeWYpnWK5ywuiAID+Y2Yh3DIwOP8gSBvA80uL6p+is/FQxU9sWW1GSy
	gBSduZKPGd79N03mYkYUJ3VG3XZVPTAMI8slbRzbSOoi9WzNxTeHLnpgr8eXfspCcNW6G4nXatcTg
	iqaKZhvMdSS6YF7MOuBVeAaqLucvv5JFxoivuA1HHFgpoVowWJ4RN2/ZIUbsvW1ZP4s4ZdLD8cNE4
	DxX8mXk+oiZ+jM+VJLYuzDejZ7Xt0QcOlfl6Gxz8rwACui3ZESUWc8PCqhZm0++vPWdN6c9akPVd8
	ezuanZFw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeNh-00000005B4K-21D1;
	Tue, 30 Dec 2025 18:23:41 +0000
Message-ID: <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
Date: Tue, 30 Dec 2025 10:23:40 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
To: linux-kernel@vger.kernel.org
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <20251230062704.3339404-1-rdunlap@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251230062704.3339404-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/29/25 10:27 PM, Randy Dunlap wrote:
> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>  
>  config GREYBUS_ARCHE
>  	tristate "Greybus Arche Platform driver"
> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>  	help
>  	  Select this option if you have an Arche device.

Perhaps I should have left COMPILE_TEST here, like:

	depends on COMPILE_TEST

?
-- 
~Randy

