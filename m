Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF956443
	for <linux-staging@lists.linux.dev>; Fri, 19 Jan 2024 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705686499; cv=none; b=WUjcomn2DdkH7TBGDAxSOeHeLlu9XbZmJyyM+QsiaRH6YxI9zjYKmd3knk/j4uoBZIfmGKqYKy+08sTDX1RVlrdeikyOzR8gpUfZMLw0+dgGQWzwYIvtdxcKxiotwtZaayrQknZOrAnufXyDENZkrsX6Oxg077myg+gOe1sPVzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705686499; c=relaxed/simple;
	bh=y4LBLPPTJpu5+EwWMUKYiqKP9RM/o03Y/rjuQjCk1cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4Pz2ymPssWi4Nn7Gdz9WbamswG58MmRTeO69oQ+axV4DXsInsIcM2Jdtd+FbC8jeCulhxs9ZCiqfwLqtjnGxtRE/boXiolidsiJCrx7M/yRQ/cvIzoU10829PC9vqcJvA4RLOL8kvYi+V+0SemuljhNEQB1lM+3WusZvUFQiC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=u6Dcez6G; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="u6Dcez6G"
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id QsxHrOFpH8uLRQsyXr4dHj; Fri, 19 Jan 2024 17:48:17 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id QsyWrezeLL3AmQsyWr6VAc; Fri, 19 Jan 2024 17:48:16 +0000
X-Authority-Analysis: v=2.4 cv=Sdrky9du c=1 sm=1 tr=0 ts=65aab5e0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=7YfXLusrAAAA:8 a=EIiQeHuflohXdkK9GqgA:9 a=QEXdDO2ut3YA:10
 a=9cHFzqQdt-sA:10 a=PUnBvhIW4WwA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=SLz71HocmBbuEhFRYD3r:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zGuUORij185LGbHOnPZInu2/axHj+8J4C5foPE1ZNXA=; b=u6Dcez6G4LqXN82z8mdiqJc3dJ
	HLt0YUYlxU9me5CnBrzjwJAHIwSl4xc6v2rV4+nv7gXS1Xp8Mg2s1j4z6qkYcjmsoupnKxJwubp3Y
	KZu1bMTPhJwkNRAQV4ddTunxw4Ps/XIa6ctcE5u4ENGYVKiozxwhheYC+J1coVoZmC1HOXhVTHDsI
	Vo6o9W/31rkPWWXMAB0m4hNa4qMBKRlJ/fO3tpgf4aPx7pIM6klcewU49EwE0Mkt0i49kKJPIMrsQ
	hy7k2m2m7Lg6frtM8H/VzvcslH10vkDdyeUUdXU/qN6mB3qplk6wcQ4PYSIuVd++jr+MylZ6NZg7s
	l5YTw0kw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:41082 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rQsyV-001HCM-1D;
	Fri, 19 Jan 2024 11:48:15 -0600
Message-ID: <d5cde9b6-5f20-4a10-91b1-037887ec79c2@embeddedor.com>
Date: Fri, 19 Jan 2024 11:48:13 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: Use kcalloc() instead of kzalloc()
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Franziska Naepelt <franziska.naepelt@googlemail.com>,
 Hans de Goede <hdegoede@redhat.com>, Johannes Berg
 <johannes.berg@intel.com>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Aloka Dixit <quic_alokad@quicinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240119173900.11035-1-erick.archer@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240119173900.11035-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1rQsyV-001HCM-1D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:41082
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfORnj6maSv2PHR1MtIx3VSKxaOoffKFAs4sDyu8nhxclr2YlX+QOurw8LjgGTsS78yYZYMvhXVY7L7D6Rm7fpvBKgyysYpkhGSe6WIdw90ile2vRN+7u
 ZV4LP7tanpt04cje888aDI9t3kZ4Jbm6HsKAsvDPbjwZy0ALYCiL4xpfcXriZg6DtzwO5Gn37ZOiDfN1CJx2r20Kcc3Pnrtip9RDr9uqCSqcxzBv9xMGDTpb



On 1/19/24 11:39, Erick Archer wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the purpose specific kcalloc() function instead of the argument
> count * size in the kzalloc() function.
> 
> Also, it is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not change the
> former (unlike the latter).
> 
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
-- 
Gustavo

> ---
>   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 1ff763c10064..65a450fcdce7 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -1259,8 +1259,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
>   		goto check_need_indicate_scan_done;
>   	}
> 
> -	ssid = kzalloc(RTW_SSID_SCAN_AMOUNT * sizeof(struct ndis_802_11_ssid),
> -		       GFP_KERNEL);
> +	ssid = kcalloc(RTW_SSID_SCAN_AMOUNT, sizeof(*ssid), GFP_KERNEL);
>   	if (!ssid) {
>   		ret = -ENOMEM;
>   		goto check_need_indicate_scan_done;
> --
> 2.25.1
> 
> 
