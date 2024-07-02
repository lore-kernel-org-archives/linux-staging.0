Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E152F4A
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943789; cv=none; b=XflKylAIFLCLQpW9g1/7PjJ+SktTuO2r9lsw9LdGzuO4Vdw7M99B9GtHWoXq0r57GDZggUTlbcAPTnt24o40DYGJ1XxyNr4H/mAkYV150qgUdOboDk9bNqSb2Xu34ShglCLzJ+HUGcpJUVuiyyKAKGD+RxuKBCGpEjCWosv8oJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943789; c=relaxed/simple;
	bh=/pPHxBv2OSiL/WO4TqNykLLsVUtNnpRsNGnIVG/DdXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hd6tdanoJ1gc93Aca+PQHRGpsUJnOr+KwO84JSftEBmJPT1s6Vlwu8IgWDnmzUUJTakgir2xV6a6sL8J1w3N0+nt5j+muV5iGKQ5rTVSGWwPrMfHfjrGoLk6ojtq3PRkhzsh/D4ZHAutLokL0WMzia0Ag1dzHFyasdnwrmOj9xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kip9neEM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kip9neEM"
Received: from [IPV6:2405:201:2015:f873:9278:2c85:fd02:c5f5] (unknown [IPv6:2405:201:2015:f873:9278:2c85:fd02:c5f5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AE71836;
	Tue,  2 Jul 2024 20:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719943757;
	bh=/pPHxBv2OSiL/WO4TqNykLLsVUtNnpRsNGnIVG/DdXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kip9neEMPX4NMd6y+onF43LHWhyp6hzWwaTHIqoJYNcPtZDXR2OQlVBE2WXW80RX7
	 +eTRzKYDdn6M6dktJ9gEO120Rnj/cKMbr/pKPUPZ5SnKzeoNfOFhJP0dwEb1lSKmL1
	 E0x83HxD+FaynFdxpvAH2BotkWMim9V+HMf/M+D0=
Message-ID: <08a89ba8-8e9e-4767-aaff-627d9d81d663@ideasonboard.com>
Date: Tue, 2 Jul 2024 23:39:35 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] staging: vchiq_core: Bubble up
 wait_event_interruptible() return value
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <wahrenst@gmx.net>
References: <20240702164256.754391-1-umang.jain@ideasonboard.com>
 <20240702164256.754391-2-umang.jain@ideasonboard.com>
 <6134b9a8-cfbd-4f4d-8487-1e01ac5d4b2b@suswa.mountain>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <6134b9a8-cfbd-4f4d-8487-1e01ac5d4b2b@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

HI Dan,

On 02/07/24 10:23 pm, Dan Carpenter wrote:
> On Tue, Jul 02, 2024 at 10:12:55PM +0530, Umang Jain wrote:
>> wait_event_interruptible() can return if the condition evaluates to
>> true or it receives a signal. However, the current code always assume
>> that the wait_event_interruptible() returns only when the event is
>> fired. This should not be the case as wait_event_interruptible() can
>> return on receiving a signal (with -ERESTARTSYS as return value).
>>
> I'm not sure I understand this paragraph.
>
> In the original code remote_event_wait() returned true on success and
> false if received a signal before succeeding.  None of the callers
> cared what it returned though.
>
>> We should consider this and bubble up the return value of
>> wait_event_interruptible() to exactly know if the wait has failed
>> and error out. This will also help to properly stop kthreads in the
>> subsequent patch.
> Now it returns a negative error code or 1.  Which is ugly.  Make it
> negative or zero.

I am fine with remote_event_wait() returning 0 for success, yes.

>
> regards,
> dan carpenter
>

