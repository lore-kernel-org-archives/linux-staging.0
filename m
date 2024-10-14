Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13E14D428
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898020; cv=none; b=axwcxVS7sAy88TaLpJajG6BYeVqL+5i8MpLh4igzBorvVyY2KMNlz5UhCSo/AMyFhhKl6Cr9VPLuOnbdRjO+6hYnkd8C8D4Rwz+UxKDcjksfm3J/BFuZde7DdKbN2mFaOuYo91QoYXzX8xEPU9Miau6BWzjW7U1w00yEPmOA94g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898020; c=relaxed/simple;
	bh=ayWkFEgHtTpVIQyAnV0gua3gCdIq0DRPPTgdC6M4laU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Th21TEQ4ZwXmn/Y/uRsxQt69XjNFYZAqgsBj/WIqq8aZ8qjNMxTz/9oPk5S/NXHpunByV70X0PeOZW/hA1c1oUlda//JV89FWFruOyOIVoiWXAWpa/IF/zeB26ARPi72wr5IDfCGqKc7ZPpYdcLL/r2SV71VQrb+rbFgk7gwOuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QAu1f+KT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QAu1f+KT"
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 864998BE;
	Mon, 14 Oct 2024 11:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728897916;
	bh=ayWkFEgHtTpVIQyAnV0gua3gCdIq0DRPPTgdC6M4laU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QAu1f+KT/UlsfUQkjNRpDnS2at1ZOu5rFZSX1vIkGmP1vqVGEwA7BpbA3AIrpRPvZ
	 2RgBhkQj8f5u5diVXumv4S0eFz/4DJ/L1f5bk4rNT7W/9KrOLQbJbnxET+6J2PayTm
	 bucPPn1pQRzFww18VCZ2bFg5HV0uILs/eK7mWPMI=
Message-ID: <21116939-a868-4df2-8824-2b56f7ea68c1@ideasonboard.com>
Date: Mon, 14 Oct 2024 14:56:51 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] staging: vchiq_arm: Fix missing refcount decrement
 in error path for fw_node
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <wahrenst@gmx.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241014-vchiq_arm-of_node_put-v2-0-cafe0a4c2666@gmail.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20241014-vchiq_arm-of_node_put-v2-0-cafe0a4c2666@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Javier,

Thank you for the patch

On 14/10/24 2:26 pm, Javier Carrasco wrote:
> This series refactors some useless goto instructions as a preparation
> for the fix of a missing of_node_put() by means of the cleanup
> attribute.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

For the series,

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
> Changes in v2:
> - Refactor vchiq_probe() to remove goto instructions.
> - Declare and initialize the node right before its first usage.
> - Link to v1: https://lore.kernel.org/r/20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com
>
> ---
> Javier Carrasco (2):
>        staging: vchiq_arm: refactor goto instructions in vchiq_probe()
>        staging: vchiq_arm: Fix missing refcount decrement in error path for fw_node
>
>   .../vc04_services/interface/vchiq_arm/vchiq_arm.c     | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
> ---
> base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
> change-id: 20241013-vchiq_arm-of_node_put-60a5eaaafd70
>
> Best regards,

