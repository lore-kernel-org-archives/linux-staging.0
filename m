Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FE42206E
	for <linux-staging@lists.linux.dev>; Mon,  7 Oct 2024 21:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336749; cv=none; b=Bd6v3XVFpyVY6DOoeGGLGhHJZFB0shroHjQ4UWkOMQKAZAF0rlfDCYvJo9TNVce6fsivfXYosxhNFq4dajmul8M7dmSgXLIYpxRAvSXlMNTqlFQnBBHbz2Ycsnd3NH4YpqmseZdHeXoK1wNTqW2YwXYv0TZ36nNTxdDDd0Pt1m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336749; c=relaxed/simple;
	bh=gL5/7aoZZbjUZOM1kABtEgwg/a+SkrQ2Kv6ccoibTis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIjiM3iHgNvDnFOVxyOrNhR+pvHWytfGOCbqMKAirWkJfVa0PcAp+5V7G6orb2kcKvgSPlsLRHahs+IbsVS0qc/Vci1i1IRCT2O0AUAShGv4U6+IMKWpB+AyVq0lc5XpGoSsjM8jyrSsKB8NgysBELkAnIi5OxG+mKMA+dMslSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngQHRLFk; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngQHRLFk"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c883459b19so5797356a12.2
        for <linux-staging@lists.linux.dev>; Mon, 07 Oct 2024 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728336747; x=1728941547; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekm5gKz417Yao8spvCZDf7dM5FZumrXk9Uz0nUEH35E=;
        b=ngQHRLFkdXSuC4Cdukgckym3LYBQbPki72QpCN9NpkeTjYc0WQ/2VZQaXUS1uGwyUI
         G3RKwX/YD4bxPakOdQKkIlBKc24oUKgJZrRYDjRAUZlOmeArUXwnKz3l+SZJyloNecfp
         SE7cdf5gb8IfmfUtEso3xQ1xDNK3FkPpVfclAdIquolZev4Gw1V7E5O1BGyETHuBbC3I
         4/Sg4D5s4h/Pc7UolSn9Crwda6XdJWrri6M5VEf4xWIqb5g7sE7J2WoQw/GW4TyHWFiE
         ShnAayWtqgS8sXivwztyCUqFuAQZ0syfRwVpNCrAcgq82Xc6QA7b6ThS0yyOat2iiJaR
         iHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336747; x=1728941547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekm5gKz417Yao8spvCZDf7dM5FZumrXk9Uz0nUEH35E=;
        b=NNdoQz1adbBKkybABQFnwPIddBe+shaXjhybhuf+XVQbBw4I4a89jWUYKFU9twVonu
         kigeSdB/awPALAs/tS/Qj/ozWcZNYyrM2fpnBE0qHdf+2tURKPXe4SOUSkageufCqZtf
         GsmFfHoQAMfZRhlz56DSf6A2+WPCexlYstW0azifWl5A9su0+qS9i4X/5ZMQ9aPAqHZS
         TUkVqdG0M+25+DNLFBXRvzq4VEvQ6SE5NCFS0O2cxoRmegFHxXa0XAqPD747Bh86Ymcd
         oJNGV9VwN8VUCxBJCDR9m9cS6Temxdxq6VwFkvdBOnWd0jHU+7qYULUkSrDl9vakyUWv
         gOuA==
X-Forwarded-Encrypted: i=1; AJvYcCXFqvTUO8qQtpbl42vcAaBYHuph1InF89PJ75GuBlLqs3XjQW4KaCbYwLc19zCW4YT+/PN2JathWIuE/69I@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/khgz9pkcCAC8FJtHyR+a25ERF6GOU+mUxvPhv44BUF3kONYR
	l2SvOTuPK7zta8jFUC15MKiD3x9elwtIQ/nyVg3XdxCTlXaGVwF5
X-Google-Smtp-Source: AGHT+IGgR2EkpaGxTSdHmhGbKh+kRFvmuzoBYzdgJGsL0ZyNNvwMDINlinsWWqTJqdZxhuJ58Vq+Iw==
X-Received: by 2002:a17:907:318d:b0:a90:41a9:7c3e with SMTP id a640c23a62f3a-a991c0af160mr1376735766b.65.1728336746406;
        Mon, 07 Oct 2024 14:32:26 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994ada19fcsm270665266b.183.2024.10.07.14.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:32:26 -0700 (PDT)
Message-ID: <b6ff86e3-56a1-43d3-83b2-01818684f076@gmail.com>
Date: Mon, 7 Oct 2024 23:32:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] staging: rtl8192e: delete the driver
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
References: <20241007182706.66888-8-johannes@sipsolutions.net>
 <20241007202707.d0e59cdd2cdc.I8e4d74a6e1d09eefe1f5e2e208735ba2ccef1d4f@changeid>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20241007202707.d0e59cdd2cdc.I8e4d74a6e1d09eefe1f5e2e208735ba2ccef1d4f@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/24 20:26, Johannes Berg wrote:
> From: Johannes Berg<johannes.berg@intel.com>
> 
> This driver is using lib80211 and any driver that plans to ever
> leave staging should never have done that, so remove the driver
> to enable cleaning up lib80211 into libipw inside the old Intel
> drivers.
> 
> Signed-off-by: Johannes Berg<johannes.berg@intel.com>
> ---

Hi Johannes,

this driver is not only working, it is also supporting a form factor 
that is usable and is available on the used hardware market.

Is it possible to migrate the driver from lib80211 to libipw?

It does not have to be you who is doing this. How urgent is it to remove 
this driver?

Thanks for your support.

Bye Philipp
