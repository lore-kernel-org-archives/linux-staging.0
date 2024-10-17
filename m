Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D91D5ABD
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 21:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729200888; cv=none; b=HOKBDqWGBcbm9cQn2xi6Ah6ltWkxwLJrxM1srab8RgpHn8PgQfT9FAP9QAmB9YwMdwK1XjCUKx0OtX4WklW99oP38iq1HZfKw9wWRXj2lvjn6a9Becf8Ns6FMXp9aWlbCpTTtxRlxMIeZuD2aaYK3WY/c0G5zZskBIXS8A8+81g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729200888; c=relaxed/simple;
	bh=Zf6DjL2Oqi5stebiREiVxK9KcJ50P6aC0CQSSOsMHME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXCgAh9hW0Lre12xB2OT07N3qSBv2CgbdpYOE+sT+NEKmFS4X/QWoPeh/LfBZ5VZsXMExWqe9S9FFRSnrBm6EHGPq+Z8ybI/8DM70EtoBEi8DbVnBbK1Y5B1mZeFJTWybKBqKm2uIJv1wdy6zM+ML7rOHXuN7I+TWcj7xby/PZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=s3cN6Gc+; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="s3cN6Gc+"
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id 1Td0tC19jVpzp1Y8otKVVi; Thu, 17 Oct 2024 21:34:42 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 1Y8ntE6lCWvXp1Y8ntFhbg; Thu, 17 Oct 2024 21:34:41 +0000
X-Authority-Analysis: v=2.4 cv=LtdZyWdc c=1 sm=1 tr=0 ts=671182f1
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=OKg9RQrQ6+Y1xAlsUndU0w==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=7T7KSl7uo7wA:10 a=AkGtarxNAAAA:8
 a=aHQUVwZJVZeAj9SNTk0A:9 a=QEXdDO2ut3YA:10 a=L-2wMNMeb4n_4ejf4qEn:22
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aKFnCViuhROBXox7sQTEK4oddNhPwXqzUM4KXEHLyKw=; b=s3cN6Gc+1DncZKseg2AkDMwTB0
	2V0LFOkxFSq9jqIqQGmDTqJPYM26ZmHgmcAC16NaxVlZuphPuqyjaaV4v/A8i9E4VwDajtiRlrEQ4
	kqqpcCjPJWFJ6pjd0o6H189DWFelnHoysVIH75bvtR2QUrugzrqqEEb+tmsuOPgWBfmH4ZirZdDkY
	bfFKMk28GQx1lHzmx7XqZL5tcWXy31miWzPnR7eVmzWM0zskS2Iyc6EP9QBvFL2C0mhGGcqkXPY+N
	8rtmNHBPhPQYEovzceQEYD3GpkceD+lOmh11oBlExqK8bdGz0l1JxsMVMUfFuJ+qDoEJYvVFlnIph
	ZIUeEmkQ==;
Received: from [201.172.173.7] (port=32908 helo=[192.168.15.5])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1t1Y8m-003TXC-0t;
	Thu, 17 Oct 2024 16:34:40 -0500
Message-ID: <188cd230-4d22-4299-b10a-a2c307b23c35@embeddedor.com>
Date: Thu, 17 Oct 2024 15:34:29 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: avoid unintended sign extension
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
 Linux Staging <linux-staging@lists.linux.dev>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20241017195551.04E1D18DAFF@bout3.ijzerbout.nl>
 <7ae5cfc6-2298-4895-8016-eddf57bab245@stanley.mountain>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <7ae5cfc6-2298-4895-8016-eddf57bab245@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.7
X-Source-L: No
X-Exim-ID: 1t1Y8m-003TXC-0t
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.5]) [201.172.173.7]:32908
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKEdGQJCVjzSWersLINbi77vaf1vAv5hnPrQwnB71ryTdxCQU9flPnGG73f3CZ7/6V83iT9qMQT51DVSjTb0WFOW6qtCmKTjkAEszHWE5/D7k17ooLaV
 TdH/rU2GXs0G0ukwCY4bDdfAzJ98SaP1i3jUVQt6azLEfgZ8eJq2Yyv0Fuib9WfEBnS3t54lyEAF47ktL9wOLMlAPZpr55S3Sk1cY+5YSmH7kgm7ply9NNKr



On 17/10/24 14:51, Dan Carpenter wrote:
> On Thu, Oct 17, 2024 at 09:54:47PM +0200, Kees Bakker wrote:
>> The code was basically like this (assuming size_t can be u64)
>>      var_u64 |= var_u8 << 24
>> var_u8 is first promoted to i32 and then the shift is done. Next, it is
>> promoted to u64 by first signextending to 64 bits. This is very unlikely
>> what was intended. So now it is first forced to u32.
>>      var_u64 |= (u32)var_u8 << 24
>>
>> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> 
> Very good.  I'm trying to figure out the impact of this bug.  We'd have to write
> more than INT_MAX bytes to hit this.  And I think we're pretty screwed either
> way if we manage to do that...  Still, it probably deserves a Fixes tag.  Could
> you add a Fixes tag and resend?

Plus, if this was "caught by Coverity", don't forget to briefly mention that in
the changelog text.

Thanks
--
Gustavo

