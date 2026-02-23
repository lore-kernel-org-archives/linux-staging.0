Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110A28DB54
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771860243; cv=none; b=EqSg+n6Bn9f7d29M9nZqVPScTE4BceYJfxykqlHfvQ83jX7i/IJWfCktbRu7EmE0yNMwKLiNmymUiKUkDTVVmCyBJRE/obcNaVFyd9a+oH6bL+IRZeAzDNzlITeMgZ/pVuqvfq+ZWOEjQw+9LjczXaTeOxoiBKxVJYr6J5usD+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771860243; c=relaxed/simple;
	bh=uZQ/q45shpIHP8um1RNoNVIfOi+Xa4L7kQEnXL00K1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YG3+XpblBXGsxBZnd8nEH8SI1XVEYuEwSo9YdN8CosMQhpqjwWyHegLw3u6HXicJNUKqXiHZ/AFkg71MUZ660Jc1a9TB1by2U+2a8o6ZmB9J/lZJYkqoXu/3xxVxBsFWgl2nSoExbqtf28Z2dggMfgIMw0TU1e1XW9DjonztGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzxMFdzz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzxMFdzz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso20069465ad.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 07:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771860240; x=1772465040; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ly3i63vTZlJq8RbN/SeN0Gc5gVMXziAUej0ugffmJ8=;
        b=dzxMFdzzjg2qbZDASinh2Oc36WfJQ1fGhviB5N4fexVoU9O0qeYzj4fe76H/IaoQ3c
         q3IKG3VvB6IGHjRxHzoMH3C+vPPr/81AFC3KKN8jO9ZEkWiG3Kx/1Nl6ef4jbLI/jSGO
         KCw//GNcdBLfQMgS+2SrJJ0Y8YtgRjwxEArGgBdppmyEOCoxVS7/ytBNq2eut1zp5vJy
         JH0cwxTvzHCVeTWc2iWbBMhgk9yTisQKv/qHqvaHX1X3jxrvizItdLWF20Syje1vkYSm
         q6PQnh33gUJPsjjTdShzKjZ/hpcsWcNpppNR+vc9BtSH6M2po+3cOmY717f4fTd+0rBE
         ZLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771860240; x=1772465040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ly3i63vTZlJq8RbN/SeN0Gc5gVMXziAUej0ugffmJ8=;
        b=Mwg9skEppgcG6YoeBeoLB46oaru67X1Kf7c+wWN/u1Z/VhNpWjgZ880T8MA+vpJPHx
         4ANzG+YJBFWBbZGWi2xdfF4RZ5ENhdZlxK6enAZIdk2PjJo+onViqElzXRk4K5N2TtJl
         wRqxnKn7QEZnFzEo13v2STrA6deCld2DcPkV2MpMKFVDc9on2XnQ2XhiZ4uKNuYU62XN
         O35yCfB41OzbjPGBTy9KRzQRMsC5Lusf/PMEq2qnUCOzSRii5gGKkqTIEC+ES3212G9Z
         d0MgDpszO2tmzj9psi+LgtugJywgb/KDo4uzcIjZApsNrAyvpguKn4w1l2Yo/0R9IWhZ
         Sctw==
X-Forwarded-Encrypted: i=1; AJvYcCVwWf6WdN8vJpCEPPutl4vH5Jv+gvTSqpWmqlSqf9lKkqCv+98js5huAm7CBZEg5Vc4LfmTUviQ+J/k5KG4@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6taolcSs2BY8YJBTQowVdLrVEg0zRsLkrl+d/O9aiUdO78/MF
	cOP024EymVU4DN6IIUiie0SHjAAKsNsfoYJ4geNRsA309KJM1xG0cbJZ
X-Gm-Gg: ATEYQzzjcL1K6C0zFbIsMXU/qmdAq+KwqR4ysIy6kTgdaQzW7sDpNcbpe24dVqHlCaG
	Iz5XFyCF5QPLlqb5lepz6EV5lXr+mmmshcqW8oWqmo2mlOyXIfoCP6U1L5gBF+nlL7zgHd2xA3Z
	xUfxFBq8ADE2mxYwJfQvaoPN7E6/tRIiJa6jrnYtNa0C0+fwjlAiBM17n/4izPl8ScdO7lXuFdt
	s0Qw0yAh4fQlCuuuM2aieRmE46E2aJIlF6TuqfD/d/0nOLW1aF3WTbGmeN+V3grNGG/ri7D7FXH
	pceyvx169clQBCpA1po88ceO5RWf5fF5UHfUqE/xfTltZWyQz/pBpM0tvpgpaBOfC/uBf1c7MFr
	jkoPpkJN6sHHbIrVZmTcnOwoz4+MJa2iwpOOR3KDm9hrG2mWQ8DHqiLzp6b36dlQtQbqGSRPTIo
	565V50Ky6zoMjc5iW7g5HZ1nrTc+UHlqVdewRjqPNvvInmn9Nlxfo9w/a+NX4SDooQrCGcLT0HN
	/KbbZkDkKHy+03IyqrmsncVTtcEdbhkGg==
X-Received: by 2002:a17:902:ea04:b0:2aa:d5e5:b12d with SMTP id d9443c01a7336-2ad744eec7bmr63336785ad.27.1771860240205;
        Mon, 23 Feb 2026 07:24:00 -0800 (PST)
Received: from [192.168.1.38] ([103.165.20.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75027b0asm84344745ad.67.2026.02.23.07.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 07:23:58 -0800 (PST)
Message-ID: <4fa1f4f6-3abe-4acf-938d-abc49a14b6aa@gmail.com>
Date: Mon, 23 Feb 2026 20:53:54 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: properly validate the data in
 rtw_get_ie_ex()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, stable <stable@kernel.org>
References: <2026022336-arrange-footwork-6e54@gregkh>
Content-Language: en-US
From: Navaneeth K <knavaneeth786@gmail.com>
In-Reply-To: <2026022336-arrange-footwork-6e54@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I don't have the physical RTL8723BS hardware on hand anymore to test a 
live connection, but I was able to verify your logic thoroughly in 
user-space.
To be absolutely sure, I extracted both the old and patched functions 
into a standalone C harness and ran them through Asan and AFL++.
Feeding a crafted 5-byte allocation(with a lying length byte) to the old 
code predictably triggered a 47-byte heap-buffer-overflow right at the 
memcpy.
Against your patched code, I ran that same payload along with 20 other 
edge-case tests (1-byte buffers, empty bodies, OUI boundary mismatches, 
etc.). It cleanly rejected all of them with zero ASan errors.
I also compiled the patched function as an AFL++ target and let it 
freely mutate the EID, length, and body bytes. After over 100,000 
executions, it reported 0 crashes and 0 hangs.
The logic is definitely solid. Changing the loop guard to "while (cnt + 
2 <= in_len)" guarantees we always have at least 2 bytes before we touch 
the EID and length. Reading ie_len once and explicitly checking if it 
exceeds in_len completely stops the memcpy from reading past the end of 
the allocation.

I have the raw ASan logs, AFL stats, and the C test harnesses saved if 
needed!.

Tested-by: Navaneeth K <knavaneeth786@gmail.com>
Reviewed-by: Navaneeth K <knavaneeth786@gmail.com>

On 23-02-2026 19:01, Greg Kroah-Hartman wrote:
> Just like in commit 154828bf9559 ("staging: rtl8723bs: fix out-of-bounds
> read in rtw_get_ie() parser"), we don't trust the data in the frame so
> we should check the length better before acting on it
> 
> Cc: Navaneeth K <knavaneeth786@gmail.com>
> Cc: stable <stable@kernel.org>
> Assisted-by: gkh_clanker_2000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Navaneeth, any chance you can test this or at least verify my logic is
> correct here?  I got a "hit" from a tool that the work you did in your
> commit also needs to be done here, and I _think_ I got it right but do
> not have the hardware to test this with at all.  Thanks!
> 
>   drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 6cf217e21593..3e2b5e6b07f9 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -186,20 +186,25 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
>   
>   	cnt = 0;
>   
> -	while (cnt < in_len) {
> +	while (cnt + 2 <= in_len) {
> +		u8 ie_len = in_ie[cnt + 1];
> +
> +		if (cnt + 2 + ie_len > in_len)
> +			break;
> +
>   		if (eid == in_ie[cnt]
> -			&& (!oui || !memcmp(&in_ie[cnt+2], oui, oui_len))) {
> +			&& (!oui || (ie_len >= oui_len && !memcmp(&in_ie[cnt + 2], oui, oui_len)))) {
>   			target_ie = &in_ie[cnt];
>   
>   			if (ie)
> -				memcpy(ie, &in_ie[cnt], in_ie[cnt+1]+2);
> +				memcpy(ie, &in_ie[cnt], ie_len + 2);
>   
>   			if (ielen)
> -				*ielen = in_ie[cnt+1]+2;
> +				*ielen = ie_len + 2;
>   
>   			break;
>   		}
> -		cnt += in_ie[cnt+1]+2; /* goto next */
> +		cnt += ie_len + 2; /* goto next */
>   	}
>   
>   	return target_ie;

