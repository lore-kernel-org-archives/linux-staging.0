Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9CC41C72
	for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724481312; cv=none; b=Sj6eZLzhFyaLwu6FBPAVtYTZm1qVLvH7PaxkzCrwtok1CEviuPkk3j/i/ShG0p9CedGz261hexRrUmuhPchMJLduALHXTqYT5bF/1xrcPUZB8VJFiBBYOBmKwjDgigbp6Y6mqUZnNMY2Kz+ZNiRDdqnAxZcomjAwjA3I0h7znec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724481312; c=relaxed/simple;
	bh=TMgOLqfm30b86e4ts78f85wexaylim5TyQN7MaiIe6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kd4g6gqEdPZvWk6DMp0dlK1/MelIRLPwwESuDwf32tP1HiM+emNgVl3wCcmy/aMeZHR0GA86BDKzcAX6FuN4I/6lpw6kpnYadiELPP68G49kVi+aSUyQp3REaOcraphKlnJO759ZGTeo9G3MQ9Xa8UtU5C1YzIY2V1oEn6grVvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=FvkssMyK; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FvkssMyK"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id hkMasExHFZ40ahkMasoNh6; Sat, 24 Aug 2024 08:35:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724481306;
	bh=IQiQE8ZAQ9sR54pSRg1laMkFOYw/GV3RVSf0chmw70Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=FvkssMyKKbtvTjFBaVy3HTS8GkfFynWH7jhyv0nUCxq4+Cy8a9bkg+bnysYnxnuC+
	 0czd8gSL3fy1ukfiyFgvVTixm7V2dEbapg0Egi2/WeP3o+yYZozDZlIeCDuwZ94RS3
	 qBFYCG58IarylkSwnP5Z6eReAtzDW6NQ1GUKvbsj7ehe0jfyberviSh+WqhUV2EPdF
	 MZYzGlOBTQw1+sq8nFKJfCqtrfZGVoKBvbKc6LVMH253McVgnjKEPvUkjxCTCsOvTb
	 zV9fu4DpW8hNBF3brwKK5QjLCV/y9dEu6E4sEkivkSara13O9dprMRpwbJmBm/brB1
	 aEXRTXlIhlrBQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 24 Aug 2024 08:35:06 +0200
X-ME-IP: 90.11.132.44
Message-ID: <77e4dd0b-2c82-4f00-92a3-069526a5f795@wanadoo.fr>
Date: Sat, 24 Aug 2024 08:35:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 gregkh@linuxfoundation.org, tdavies@darkphysics.net,
 philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
 linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <2348e646-e1da-4deb-ab55-c438a42e25b3@wanadoo.fr>
 <510b12b8-91d5-43ce-a191-9ee0a6c91460@stanley.mountain>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <510b12b8-91d5-43ce-a191-9ee0a6c91460@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/08/2024 à 20:23, Dan Carpenter a écrit :
> On Tue, Aug 20, 2024 at 09:38:22PM +0200, Christophe JAILLET wrote:
>>     - if a "mode" matches, do we need to iterate the whole rtllib_modes
>> array? (have a look at wireless_mode)
>>
> 
> Can only one mode be set at a time?
> 
> regards,
> dan carpenter
> 
> 
> 

Hmm, apparently several can be set (see [1])

Base on a few lines below, it looks that WIRELESS_MODE_N_24G is 
exclusive from the other ones.

So the 6 char array seems to be sized either for "N-24G", either for a 
concatenation of a few other modes that won't exceed the size of the buffer.

CJ


[1]: 
https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/staging/rtl8192e/rtllib_rx.c#L2200
