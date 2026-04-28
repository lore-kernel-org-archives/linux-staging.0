Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136232DCC01;
	Tue, 28 Apr 2026 01:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777341544; cv=none; b=DvoBQayEZT9ARW3D4p4Q1KdaVMeWyJEWdTlZdLf/jJGvnabOum9zVAwszvjK3+cFpK3pm8MGFD4MkmmmhBO96i/0jbj+qdvxNq3FRbQLRWf6wlnZPv+NLnjqZWWlaqzMibZ433BrRCsIlb5mCXtpjPAGt/4oTVrryWPUHfkM3mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777341544; c=relaxed/simple;
	bh=ulugzyyZ4Juohsz3NCD/yDYypvw6TrqTRBGBItgYFRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7zLyb6QluYpthZtj/OcIDbBUnlCG1cpqPsaVFhMqshJdPn+hqThwApN8KRw2N5iV2khDyYK5ZbOJnzd5qyJ4x41fHxSwEyCCxXqTMD7sadwfBFO1O5J9XneZu6sTLrF/nsJp2QICflQokDyrylLnkjj9U2zQ9BtkJv5DgFIhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=liAEQTbL; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="liAEQTbL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gpFZQvqHVkx7Smho58wEjFKNPxXZX+2ShrDemC19SJ0=; b=liAEQTbLzSzriuigsg03nuczTQ
	We8LgUYNSO1BL3BHb4rs3ll8m/txe+jSHJgZT1IeKwrx3BfU+ZfJVPuSQKaSvO1X2z/lDYnd7rzio
	EObv+L+XatEgBBJfh60G41FFbdMsHLn09hLuWN5Ww9iCY3SIrVI1K7US6ZgxETxhheCASIV8qA7E2
	+f+i9+pwUpW8qtr5ejqbXeqRf7ZWVbN8gRD6wh5xjMJrcmMh1Y7BlhqKcm7BF5qlmBbja33TMRQAD
	OoHbsucRL/xDGtWrBJwjaJrM+IoRUI0xmAbFfldVHhLgTBa66DnJxrHCvJDj6Ln9ZsuAlIwMOnC3V
	o5To0scw==;
Received: from [179.221.49.249] (helo=[192.168.0.108])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wHXiy-003BUd-Kd; Tue, 28 Apr 2026 03:58:56 +0200
Message-ID: <486be12c-fe80-4078-8b98-2d7949fc680c@igalia.com>
Date: Mon, 27 Apr 2026 22:58:51 -0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: pci: hive_isp_css_common: host: vmem: fix
 line ending with '('
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Mylena Angelica <mylena.asf@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 ~lkcamp/patches@lists.sr.ht
References: <20260424010008.325784-1-mylena.asf@gmail.com>
 <aestsiuGrr6-AEws@ashevche-desk.local>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <aestsiuGrr6-AEws@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mylena,

Thanks for your patch, please see my comments below.

On 4/24/26 5:45 AM, Andy Shevchenko wrote:
> On Thu, Apr 23, 2026 at 10:00:08PM -0300, Mylena Angelica wrote:
> 
> ...
> 
>> Hello!! This is is my first patch,I appreciate any feedback, thanks!
> 
> Please, start reviewing others' patches for the same driver and read other
> reviews and learn from them first.

fyi, you can check previous reviews on this driver on lore.kernel.org, 
for instance: https://lore.kernel.org/all/?q=atomisp

> 
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
    grep -a3 "CHECK: Lines should not end with a '('"

I hope this helps.

Regards,
Helen
