Received: from msa.smtpout.orange.fr (out-68.smtpout.orange.fr [193.252.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094B714D70E
	for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183287; cv=none; b=UEBLJtnkP4doLW5MyHkZUHYRuzToEPMRrrzYp6ntBfVMONgPtFGj5xxeO5baEG99oSzY76oHEN2AUsMRibn0ug+9dJ35hEQu/3VRO7A6mPgZohi33KgR8flLFVG6Ow8XNpOa0nz4lHp6SdJF/migKFc7DPUqcyhzZewQZuMyu9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183287; c=relaxed/simple;
	bh=i0CsVAVNg6mFCh0+dev4hO4WQyvGoe/wPJjjY5VtOk4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ruqtLDWO4WCbhGeY6YFoFHSt2H/HZtVobutNoQsy2uw3umSBWkXbFeBFNRi5X/oWs/Y7fFuXu0fZ9jTlbUPGVBOacXAnNU2c4DlEadFvDNoA3/CPXlf7Xf8q1GYxMkVZmHLe1KrxuNp5RvhTbkJe4cC1Pw7PF9IZrzq7rz8DDq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=bI+NW17y; arc=none smtp.client-ip=193.252.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bI+NW17y"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gUgQsMRgMyTq2gUgQs5xkP; Tue, 20 Aug 2024 21:38:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724182704;
	bh=NlO7mLF+NT33sRpCRl6DO3FkKqiceX8jbHbbMHO1dVk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=bI+NW17yUjQTIlOmVgdhuGiGsxyDADnPI4CkQaxmJlPyZPijVpOBcR2wtR1BYKO6x
	 GkYgvcYhwowQ4XgPlw+x/pZME81XyOU+LBy6ai7kqsIO/+OuhmhW5rSNf/6kkj1EiX
	 hOoaeIrZ6sR7r5NVnFyb+xMzvsCE3DvPpn3itzieZxoINMARcuBJD5Htb4HJOJfPJf
	 TNg3cGhsTemICqAkkbAqSg54e7UoRJ2Gr2imPebcfR3vKRpnPNm/mWi9J651rRWxpt
	 oY+GBk6JJRqbKnx2p/0AbvfLyKvdo46OJJ3GqsyX3frXsv59ULQRyDBPujQt8bQtiT
	 hUa0obIJ8UmEw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 20 Aug 2024 21:38:24 +0200
X-ME-IP: 90.11.132.44
Message-ID: <2348e646-e1da-4deb-ab55-c438a42e25b3@wanadoo.fr>
Date: Tue, 20 Aug 2024 21:38:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, gregkh@linuxfoundation.org
Cc: tdavies@darkphysics.net, philipp.g.hortmann@gmail.com,
 garyrookard@fastmail.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
Content-Language: en-US, fr-FR
In-Reply-To: <20240820184216.45390-1-abhishektamboli9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 20/08/2024 à 20:42, Abhishek Tamboli a écrit :
> Replace strcpy() with strscpy() in rtl819x_translate_scan()
> function to ensure buffer safety.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtllib_wx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index fbd4ec824084..970b7fcb3f7e 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -61,7 +61,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>   	iwe.cmd = SIOCGIWNAME;
>   	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
>   		if (network->mode & BIT(i)) {
> -			strcpy(pname, rtllib_modes[i]);
> +			strscpy(pname, rtllib_modes[i], sizeof(pname));

This not correct.

sizeof(pname) is 4 here, but the buffer that is really used is "char 
proto_name[6];"

6 chars are needed for storing "N-24G" (see rtllib_modes), so 5 chars + 
ending \0.



When you will send a v2, here are a few others things you could give a 
look at:
    - is 'pname' really needed or is 'proto_name' enough?
    - what about the "*pname = '\0';" after the loop?
    - if a "mode" matches, do we need to iterate the whole rtllib_modes 
array? (have a look at wireless_mode)

CJ




>   			pname += strlen(rtllib_modes[i]);
>   		}
>   	}
> --
> 2.34.1
> 
> 
> 

