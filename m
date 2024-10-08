Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4537212638
	for <linux-staging@lists.linux.dev>; Tue,  8 Oct 2024 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728411171; cv=none; b=ZwNt1agA+sCIvnZHzSQimqZrJxYBir/MP0yOhGj9Wnlp40MGjYjPQ1/qeYM1mBfefpDrRELWa0oc9TOC1rdxDh3BebFNwCOZppfDXZvVsNELDIyKCDgxw2p53e9i+cLlQYbmYo4Rpi/G7Jfb2B42nEWXJv+i1TfkCKgUrqkc2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728411171; c=relaxed/simple;
	bh=q1B98cCZ67Fnkh/XQ2VC6+w5nCSr6WHrprubAeMB/5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kH+q05Ywcg1jhdoPJAhtXuz6eWam/V9Mo7ejAEPn1iQ7iE4NYLHYjiP1tvDxp1kN6X5bvC15+qEikVOUSAIDUbwIzVq2ef4JYRmtdStFLNL2zBZG0LRwpPWUDbJtq+jshcPTzDI3/jZBzPj8hsTfbExenH53m4/uEI+V9lRYc/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PP9+MP5H; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PP9+MP5H"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so52511335e9.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Oct 2024 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728411168; x=1729015968; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuFA5j3K6m3lSSbRwdOiQAd6W6LANH+t9PO0kqru65Y=;
        b=PP9+MP5H4fPz8EOb+jdPRxOZFlYsWIdbLvWsiIJMHCCzkk7Fddraz8a5qqwrp+l7Et
         gALvAQ/kuGtKJ2lRt+1optDQU2dY+Chxt0hG4ANN8E+Q2V/Zi7LrYMo0LJiQEO7D5Vu1
         OGqp5UbnJbb1jyRwXD47dP9P8X7jK8XJ0j9bmmITgZ9Wn0L61u6vDNsjyEjcX0Vu+JVF
         reU0gYD0JKGV8pTkj1kTVCABcd3Ogh7o82/vUcx7mLhErdT2bhD0Bl2L57v6b1/Tx6mT
         /csJG0W5aF4lbOJqBVnmjP7V6UtLIH5jrPM/+/y/LCU3NGCYC0E1YOqK+/V28fafdGrT
         sr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728411168; x=1729015968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuFA5j3K6m3lSSbRwdOiQAd6W6LANH+t9PO0kqru65Y=;
        b=DMvA6xeyymIrUxWuUsNeF2moG9RJozGnGHof7SWHMql4U3zLDT5Hh5nHrisL/EoIFf
         vDLr5d1ohMGJmCL4v23ri9t3JBMP/l6uJ2Ntm2sGALuRfoKKkNYycUlSg82prJMmHRIL
         Cf1KL4LVcHZyOS1Ca0IqfAaekhbbIjPs3cxWe+oYw72wjGCwsnm1AIWmUEbewm9uOd/B
         QSXQHeoo5mbq8xNBkST41bKb87+Y7D75Hp4IsqYtfuttI66A1YDD+VNGPC8+s1bYwksE
         y62KIj6X59NIO3jqcqWK7NOcTnNjRBkcM8ELZ4rF4NOZo9fLzMeo1trV1JhD1pct38bo
         xB0A==
X-Forwarded-Encrypted: i=1; AJvYcCWy0WfvKPNrMP7yQzrO8F+BkLlv2cPDqXKh8nZQ6OpOeG94g75UxAVqcTvISf/Q1QHoc/dpXGMAw7PeGpJG@lists.linux.dev
X-Gm-Message-State: AOJu0YxiXKGdKuGKjjxTQ3v4lMT4C4lDOwGKzEPYigb+yfx4ITkl56im
	Q1aYyAvoqUiQsCWeEuzslV/s2ezAL6/AA36NWpOSVUpcH8gatVI6
X-Google-Smtp-Source: AGHT+IHAhQsN8E22JqPe31C5J5hHO4ciK1+XEy/v2gYO5OeltEasJGb6wY0dvfpOFiUkyuoIWRFOkw==
X-Received: by 2002:a05:600c:4711:b0:42c:d7da:737b with SMTP id 5b1f17b1804b1-42f85ab3accmr125546075e9.9.1728411167824;
        Tue, 08 Oct 2024 11:12:47 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89ed952asm116343845e9.45.2024.10.08.11.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 11:12:47 -0700 (PDT)
Message-ID: <7855de70-1942-4cbf-bafd-d19e148b7e8b@gmail.com>
Date: Tue, 8 Oct 2024 20:12:46 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] staging: rtl8192e: delete the driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-staging@lists.linux.dev,
 Johannes Berg <johannes.berg@intel.com>
References: <20241007182706.66888-8-johannes@sipsolutions.net>
 <20241007202707.d0e59cdd2cdc.I8e4d74a6e1d09eefe1f5e2e208735ba2ccef1d4f@changeid>
 <2024100825-badly-smartness-cf1b@gregkh>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <2024100825-badly-smartness-cf1b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/24 08:42, Greg Kroah-Hartman wrote:
> On Mon, Oct 07, 2024 at 08:26:54PM +0200, Johannes Berg wrote:
>> From: Johannes Berg <johannes.berg@intel.com>
>>
>> This driver is using lib80211 and any driver that plans to ever
>> leave staging should never have done that, so remove the driver
>> to enable cleaning up lib80211 into libipw inside the old Intel
>> drivers.
>>
>> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 

Hi,

thanks for the explanations. I am fine to remove the driver.

It would be good if the maintainer would find the time to update the 
git, so that we see which patches are accepted and who has to rebase or 
change his patches. Due to merge window 3,5 weeks have passed and I have 
lost overview.

Thanks for your support.

Bye Philipp
