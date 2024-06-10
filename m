Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC2979DDB
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718015134; cv=none; b=DM952Ga60k8+e2Zbq82TJ+vM4sLD+WUfWo7W6Lgs47jfY/LME5lPTTE7cDhj11OAXOppKGiNtaZ9XA5ujQDhiHbcPjhhhN2OfqyoI1+8IzYceKQOHJG2ZJLf4/G68WPe6N1mQh6e8qp6Adm5m1b06wB4sfX6dpQxL8e4MBiXA8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718015134; c=relaxed/simple;
	bh=NzTnEhfuaJwdt5rz44K4VDSdL4GnCx7M9WpQ9MoxEr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E20WdDKX4PilLa3GgHLdRUdP9pqnhjYC/bRj6ubzwuxcV0kMxmrjPa40m5SzvyHAJaYQEgHDFMF6IS9brFY/1pcpBkYrauBJauTWprDK6kxMc/TJnJmWuCVTjjstOGXUTEX2XWU59eLH+xh7AxgRmehLZwDPQPJcIWeXCSeqaS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65D7112FC;
	Mon, 10 Jun 2024 03:25:55 -0700 (PDT)
Received: from [10.57.69.222] (unknown [10.57.69.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46E523F73B;
	Mon, 10 Jun 2024 03:25:29 -0700 (PDT)
Message-ID: <04b1276d-4db3-41a5-9960-15e96b779b13@arm.com>
Date: Mon, 10 Jun 2024 11:25:29 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING:
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
To: Phil Elwell <phil@raspberrypi.com>, Arnd Bergmann <arnd@arndb.de>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Stefan Wahren <wahrenst@gmx.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-staging@lists.linux.dev
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
 <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
 <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com>
 <20240610091534.GO18479@pendragon.ideasonboard.com>
 <28495bd5-41af-41b8-b427-6b6fd36a2740@app.fastmail.com>
 <CAMEGJJ30ffMSd40YpqGuMWOeazoT+oiDvzkYEc37jOTx4fZBNg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMEGJJ30ffMSd40YpqGuMWOeazoT+oiDvzkYEc37jOTx4fZBNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-10 10:24 am, Phil Elwell wrote:
> On Mon, 10 Jun 2024 at 10:20, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Mon, Jun 10, 2024, at 11:15, Laurent Pinchart wrote:
>>> On Mon, Jun 10, 2024 at 11:00:12AM +0200, Arnd Bergmann wrote:
>>>> On Mon, Jun 10, 2024, at 10:26, Phil Elwell wrote:
>>>>> On Mon, 10 Jun 2024 at 07:00, Arnd Bergmann <arnd@arndb.de> wrote:
>>>>>
>>>>> Why is swiotlb involved at all? The DMA controller on BCM2837 can
>>>>> access all RAM that is visible to the ARM cores.
>>>>
>>>> When a device is not cache-coherent and the buffer is not
>>>> cache aligned, we now use swiotlb to avoid clobbering data
>>>> in the same cache line during DMA synchronization.
>>>>
>>>> We used to rely on kmalloc() returning buffers that are
>>>> cacheline aligned, but that was very expensive.
>>>
>>> Could we reject buffers provided by userspace that are not
>>> cache-aligned ?
>>
>> My guess is that this will likely break existing applications,
>> in which case we cannot.
>>
>> It's probably a good idea to take a look at what buffers
>> are actually passed by userspace today. That would also
>> help decide how we allocate bounce buffers if we have to.
>> E.g. it's a big difference if the buffers are always
>> within a few bytes, kilobytes or megabytes.
>>
>>       Arnd
> 
> vchiq sends partial cache lines at the start and of reads (as seen
> from the ARM host) out of band, so the only misaligned DMA transfers
> should be from ARM to VPU. This should not require a bounce buffer.

Hmm, indeed the dma_kmalloc_safe() takes into account that unaligned 
DMA_TO_DEVICE does not need bouncing, so it would suggest that 
something's off in what vchiq is asking for.

Thanks,
Robin.
