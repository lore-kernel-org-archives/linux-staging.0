Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FB12C0F69;
	Tue, 28 Apr 2026 01:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777341536; cv=none; b=gm+dgXyOUOXWJG2hjPw4umVJqjFHHui0jJ+F6ludYfDTXp7n9bw0dTOXwO1bPZhqxgD1EOdTHaDOav38+RBUIq/6heC7P5f2YeHgAih1H+FoISVwUeTuLwbyknEFZePAWoreyyNdPYyr3cZEluWUtEygf80bK3Ke96fr0an7z08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777341536; c=relaxed/simple;
	bh=p6TwhnyFdL+YCmBa1aUDfnObxWIkDDbB5DfzqgVrtow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6ZdHrmSdqyIDyQSL67MmhG3nz8epJUyCGXqByiF9Y/8FI8v3aTMYuFghCK6tg9Oxv8fhgFw/ZVib2xgQqH5j7IZ185u9nTS1hmkFVOaeYGOtv/RyTStVuCNGtH2ztIp9Jps35JhAQEZmkGwvBgNO5XUXz72MUC6KA+DnKYdgoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ROMuvAvP; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ROMuvAvP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xKsMHfXpUNSTsQzDjlxd9LBKdBey3BJ1dZihz4dzf0Y=; b=ROMuvAvPzVfV3r7BKIbXM/3TW+
	gk4+0AOHEefHsmU5fAEZGb+tsjyxawdx0/01UxsLlZgBe6fHhHBPyEluzbiZXNLPj3LpHFhNpTzwS
	6pMGpkTdxmSxTbXdQA+02MZ38CU4wYCXGJjQQFfrzHncBl25r9QvYgOMfk21zBXDI1m4NpLjqsy8C
	xuiqLCCjd9keOJ+nsqpK56SD3q09VDQRQczFM4t7Z6VjgmQJ9CXw8W0lfDIiW4tBrvhdn0Zj12Mcl
	9hLeUhw8xq2fJfe6BL7xA2+haM2FO21soJSiZT+D73UAq17ux0vI4YTMRMf/JPLN5iQlI8JPZKtlb
	2x3IEysw==;
Received: from [179.221.49.249] (helo=[192.168.0.108])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wHXiu-003BUd-Lu; Tue, 28 Apr 2026 03:58:52 +0200
Message-ID: <81082476-d3e4-45c9-bb2b-28344dc5612a@igalia.com>
Date: Mon, 27 Apr 2026 22:58:46 -0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: Remove unnecessary function return
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Everton Colombo <e.rcolombo2@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
References: <20260423183814.84729-1-e.rcolombo2@gmail.com>
 <aeswGWHvGTOxmu7a@ashevche-desk.local>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <aeswGWHvGTOxmu7a@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Everton,

Thanks for your patch, please see my comments below.

On 4/24/26 5:55 AM, Andy Shevchenko wrote:
> On Thu, Apr 23, 2026 at 03:38:14PM -0300, Everton Colombo wrote:
> 
>> ---
>> Hey, this is my first patch! Any feedback would be appreciated!
> 
> Please, start reviewing others' patches for the same driver and read other
> reviews and learn from them first.
> 

fyi, you can check previous reviews on this driver on lore.kernel.org, 
for instance: https://lore.kernel.org/all/?q=atomisp

> I'm not going to repeat what I said already several times on a patches like
> this over the very same driver (atomisp).
> 

You can see in the previous reviews a few comments to not fix just a 
single occurrence of the issue on the driver, but to fix in a set of 
files or in the entire driver.

This same error occurs multiple times on the same file, and also in the 
entire driver.

My suggestion is for you to fix all this sort of errors under the folder
    drivers/staging/media/atomisp/pci/hive_isp_css_common/host/
otherwise it might become a big commit for a first contribution (unless 
others think otherwise).

i.e.:

    ./scripts/checkpatch.pl 
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/* | \
    grep -a3 "WARNING: void function return statements are not generally 
useful"

I hope this helps.

Regards,
Helen
