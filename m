Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A28D1B815
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725945318; cv=none; b=oGhog8PoT2e7m/6xCsr3B8JnfwCoSveiE6AcOzKn0tA5qLaAy+klloXlqzLd4+EL11wXgbWHP1S17l8GaOEU3XCA8WuMC1TlxXHn67V5/HhXh8v5HnIyUiNRHgNytRhndlj2J+dbGnHd1g6phQCfs2/Ys0d0/jASnrIOvkXqrRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725945318; c=relaxed/simple;
	bh=+6BNk10BXFOvf1ZNUKadlL1Cddtxa1du2mNygVp+HqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxfkswWYE/5ccvuhuJqtXYazSZKzq7fwrwV5nrAUvlJzSpugRIjxCULF1EsUYNrD8sHMgm1uelnTyaoiUsRyKzOVPaKfjeOgV8pXG2cko67we4XrSOoOHxcBJEPvaOrERZTbgDVIIKtSiYepT91/M/1LK+M24fKc1Hfg5qlAqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G12umARk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G12umARk"
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B57A741;
	Tue, 10 Sep 2024 07:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725945238;
	bh=+6BNk10BXFOvf1ZNUKadlL1Cddtxa1du2mNygVp+HqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G12umARkAHkr4wxkQVcmzQMjSimLrt8A05Y8r/4nS4cW52mYyHsl5DxOXFno2wEJb
	 KpYItsAGo9GvV6VCqIiXL82DcoJhlJ0AJ0TGJnR8e3aJuVCPJtx3vFRHkdexO70UOk
	 RlB3r0E5yhqp8HB1wYRrgG8OJpNM0hKF4/u6VpMA=
Message-ID: <07e9a608-b09f-4d25-b94b-b092da7576da@ideasonboard.com>
Date: Tue, 10 Sep 2024 10:45:10 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] staging: vchiq_core: Remove unused function
 argument
To: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>, Stefan Wahren <wahrenst@gmx.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240910051007.297227-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240910051007.297227-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Oops, messed up cover letter 'Subject'

It should be :
     [PATCH v6 0/7] staging: vchiq_core: Refactor vchiq_bulk_transfer() 
logic​

On 10/09/24 10:40 am, Umang Jain wrote:
> Series mostly refactors vchiq_bulk_transfer() code according
> to Arnd's review comment from [1]:
>
>> You can also wrap vchiq_bulk_transfer() in order to have
>> four separate functions based on the different 'mode'
>> values and have them only take the arguments they actually
>> need.
> I didn't wrap vchiq_bulk_transfer(), instead created four
> differnet function, one for each mode.
> This will pave the way to address his second comment:
>
>> Ideally this should be cleaned up in a way that completely
>> avoids passing both user and kernel data at the same time.
> which is not part of this series and will be done on top as
> arguments shuffling will have to fix the sparse warnings
> that exists currently.
>
> Patch 1/7 first moves the VCHIQ_BULK_MODE_WAITING logic out
> of vchiq_bulk_transfer
>
> Patch 2/7 then moves the core logic to vchiq_bulk_transfer()
> which can be shared in subsequent patches
>
> Patch 3/7 and 4/7 refactors remaining bulk transfer modes
>
> Patch 5/7 finally drops the vchiq_bulk_transfer() as not needed
>
> patch 6/7 and 7/7 are drive by patches, noticed during development.
>
> [1]: https://lore.kernel.org/linux-staging/3d3b7368-93b2-4c0d-845e-4099c2de9dc1@app.fastmail.com/
>
> Changes in v6:
> - Drop forward declaration vchiq_bulk_xfer_queue_msg_interruptible()
>    in 2/7
>
> changes in v5:
> - Fix regression for VCHIQ_BULK_MODE_BLOCKING in 3/7
>    (Fixes strange hang from v4 with 'vchiq_test -p')
>
> Changes in v4:
> - In 1/7 return 0 direcly instead of assigning status = 0
> - In 3/7, fix null assignment of bulk waiter
>
> CHanges in v3:
> - Directly return if service == NULL in 1/7 and 4/7
> - Drop set-but-unused variable from 1/7
>
> Changes in v2:
> - Directly return if service == NULL in 3/7
> - Prefix non-static functions with "vchiq_" (appropriate driver prefix)
> - Use typed argument for 'userdata' in 1/7
>
>
> Umang Jain (7):
>    staging: vchiq: Factor out bulk transfer for VCHIQ_BULK_MODE_WAITING
>    staging: vchiq_core: Simplify vchiq_bulk_transfer()
>    staging: vchiq_core: Factor out bulk transfer for blocking mode
>    staging: vchiq_core: Factor out bulk transfer for (no/)callback mode
>    staging: vchiq_core: Drop vchiq_bulk_transfer()
>    staging: vchiq_core: Remove unused function argument
>    staging: vchiq_core: Pass enumerated flag instead of int
>
>   .../interface/vchiq_arm/vchiq_arm.c           |  20 +-
>   .../interface/vchiq_arm/vchiq_core.c          | 323 +++++++++++-------
>   .../interface/vchiq_arm/vchiq_core.h          |  16 +-
>   .../interface/vchiq_arm/vchiq_dev.c           |  15 +-
>   4 files changed, 232 insertions(+), 142 deletions(-)
>

