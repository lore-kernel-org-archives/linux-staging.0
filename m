Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192F91AAE24
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 21:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726002317; cv=none; b=nS6GdB551avtdxuPIi9tYMTAE3qbRE6eEt5PCL/l/DNpP4Ib5wLx0NeVoiufIE1sKZFcxPsRTOpZl6lZrYDxwoDqXEl1YSSkooXCNdT7PqLxjouUJtveT3QEhc8yudwU0yaaEWakGOyUQyDB7NZx0rI9DOrZk9G4eIxwPEi7MWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726002317; c=relaxed/simple;
	bh=0mIWHubNFp5R0R+MS85zdpzK9flIImlyi1RzZV7yFn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZ5D11Q6mzg08GhRZGfYJGp3Eo2OBVUE2/uQQeV2yqhvF3TAwaBzRwamOeyBHcLa7UIueKzlbBgth5gOXJRpuDNG/eFdSD60ZjEuHcfRasa4VLfDdsuRV22uyznCi7tIvbkgLHi7T00TRRbjDyk9saGWxZbSCN9wESbgMpVm1Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=GB6HqcJc; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="GB6HqcJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1726002301; x=1726607101; i=wahrenst@gmx.net;
	bh=nKi6Zs5itMuZj0R7ssE/Y46CTiFv+ahJwUU8i1AL+uI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GB6HqcJcXHgUMP8A3nH4aeyZK6onWLINrBqbQGQggJukiK0jjSMhMdIBfnkzzRzw
	 O16+34/GvDoBczhNKSfRmcgyH+KCzbcyIuYz4gQ5BXLT6T1e/ZZ9Fncq/nOR+2vbY
	 5LlZ+/k7MnwyTjvvN+GMQgQMZhgICUoxLxiUSfEpOiTsPyxs61VwtmsIDgP+4aLgt
	 19dpjA6pGHTe/+Xnwn3J55dw8UEl3ls80VT6Yqhz71slBccTk3gAdt5ALxdWctDMu
	 t0l/EdzIcIOVVQLlL9HgxLQih6X97Ru7i6CXafYEVlBDM4jWik0OVqJdBemio1SXF
	 unITNAcdLJrWVuB39g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.128] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbivM-1sIeNG402o-00k88J; Tue, 10
 Sep 2024 23:05:01 +0200
Message-ID: <170ed65e-8701-422a-9e68-6f262fb673b3@gmx.net>
Date: Tue, 10 Sep 2024 23:04:59 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] staging: vchiq_core: Remove unused function
 argument
To: Umang Jain <umang.jain@ideasonboard.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240910051007.297227-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240910051007.297227-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3KO2Q4MUiKISxf3F6jxuLncTtmCijItaYKwydgwshQYhzLtnO2z
 2UXHAMDbQGwZvdClWeY+uID5GC4zlsx2egf3pJvgT4hkyRB0sfucs2TY/p/CJLN7hjKGtT7
 ZLIvqnFZcNLHg/ffYmp1sTmaLxdk+MzQY8dGk48zaNozYRtjeaX/qlpjqb1L/8gfZMYLkJW
 xoyWwRjCEcDQV7LF0Ax2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PJdw/oLfUAc=;HjjFQcUn+0QG6fpdiqwnXy6B+hD
 CF2vOGU9r+Hoo8nxf+JiRS8eRnFYQcV0vqPn3lN5m9WVbeZrpFm3xZBm6RxyBT8Z5WndIgiHI
 VubvT+P8g8OKtPNxsYQdfPLqVjhlir+FogZi5KCG4NJREXiK3DkT4PRQUuIdrxvFm9FZwL4mN
 Jpm8ATvjX7yxzgaXxZtcm+kUzcRbIO8GRUbkHLtwZNyUD0KmQJKH2c07HlLihE/NEi+x/CqcH
 Nl3sZpZaiUa8gJDg1F7o+PYNMmqO/v31cjUrYSIvatLACMTg0xd1VeOBD3UDJg95pMrLSXHbh
 GYW9uVYwJs9j6Gqfa/xVgDUI1lyNR8NxOV3SWpTwwBbZIHWnGRI/qv+iR48ojvkw9yXcM+2hU
 yWJwGp/MjbDDaT1N5AncxfnfMA4g7M4YHEzJhTVXpy4iXay52iDGJOCseypJY9WtI2oof8EBS
 z06zAFrGpJauGq2JkgJtizs7r1Gd78SBbk+BqlaxuN1EgXbVxaXdHTRK1TfjeMDkk/MnssL4e
 TKjX8NO4B/g+zRFPQ/b8ulQd2PtVWRbGVO7HRiJ/kqfzo/lXoro6XRmI7Roc+guLLhBj+EKi0
 cfQpEFqdKqbWumHcBrx00+dANapZCJ99A6OPpOG3jDFQlTlpoz8Ib8L4fLexg+tNt75RlaUAw
 DDsBk5PuDH/NnD0bkUq0c4kC3bgxy7ONcggBpGoREyOgYBQjIuIwQW8XHy/urnubP34nquHoA
 iTozfdQ3oHzoCOn+XwdJ+p3pujiHn5aQDDojJmTiZywmlmzKvqyYo53Aa4OAjHYq1w4zttlMV
 F53sfkKqrkQGosSdcf0eT08w==

Am 10.09.24 um 07:10 schrieb Umang Jain:
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
The whole series is

Tested-by: Stefan Wahren <wahrenst@gmx.net>
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

