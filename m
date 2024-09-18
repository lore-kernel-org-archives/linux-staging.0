Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D71CA68A
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 21:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726693706; cv=none; b=OJ2KmyRBwQ+p7suJGRM5Op/8k44Zlq9nFe03oQ/CzboOUypSi4aMKx67vhY53vRkIzHFM9QJl4quIeB9feYm+EZRkvxjaAbzueZUrE4cjO75rPK2sQVKDFRSpzntfVh60bIHzWFK0upP0E7W7lWHIqxIdDT9BwZ+WrVo3Fkmqk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726693706; c=relaxed/simple;
	bh=ouui963+aICLxgwY9/zA41gtArKIiNf4aHjyfrJLHAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiBAzUALQEdaoRsKNNyQve3ceK5uNloemuZCVJqSDY2PhBIQgf1Xgde6XPkODiZTByQtbr8cIYXSkX6kxJ5Cm53998g5Z3CQrg27gzkVmXs3Pgg0Vgn1uyrkgcLmRR2v5I9kEK9S6w0ZJzsBXP4zox7L9NmjNbzytLClmF5nhVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmiHvuuL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmiHvuuL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso708255e9.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726693703; x=1727298503; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVe1RHJ36TdPZ0MCm1xGfLwPh1KD8ExatGy+oVbAu6I=;
        b=AmiHvuuL9il46Ci4v8VcYzB+SwHBt9nPsPjNvYx/vCyvx663VSOIcOlkYKELe2O69L
         GDaOT8NhXJeiHa+Yw8XbCotLtSk5GTV/cxVF4yM7/atOH2KtObEFsaFe4gXLXbQ/7vRr
         4cWPRXWV/BZ3N0p8Q27l3Qb8K7bYdCEwTVNs5Is42E+sHkm80cbFP7zosS9mXBzZOyjX
         33GihDVuT63rr8w5oJwEAK+UOA9uAqGE/qAPmE/KD6WprO2vkG3TfnWrDftpcFlNEsdl
         meRJxjbZw5VNunRYlSS2AFo/0A47+MObyVw5U3rNIy1g+26gdSkJlEM2ZWsYDz9NyKOq
         25LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726693703; x=1727298503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVe1RHJ36TdPZ0MCm1xGfLwPh1KD8ExatGy+oVbAu6I=;
        b=szWOOZLMEtVz0YYoMDDvmv9vk/wmumJYzOOixPnObZJ9UZfPhiXx/PZbFP6JIrQeBu
         2NswwLuAD0M5PcoVqi/J7PtMrepqU9IRXl30NXAjvAx9qjryQ8/gKGwKwpow1QxZx2Xm
         HX/rJUhmo1TVJIX7QaNOUakTBcUB915RwVf+EwFmNxSG/N2ry2cYcJxV2Dtmek/9UYVy
         vngFP0Jv6+/tjeOVnt8KXQnrlKgqHAwldomQ3WuFOXfEZFWkVmt2yHOVGB+t2SBCJHKj
         ummD1E1QJgpizcg8ci/9zKiEmU4GndX87iXgiFw4roHQWRbi5xXswYlUVx5EiGNHGa6X
         k/Gg==
X-Gm-Message-State: AOJu0YxuqErh557jQxQQtz/zFgeKaL8MgK/1UJCwE39K38C2w1SGIAB8
	+DK/lNTkf2itPxx5432FripPJ8Cl5fb1gm7mXnFIce3hrv9iRg3d
X-Google-Smtp-Source: AGHT+IEj07TGOzKUNv0vYVV7Wj31JNqmb6g5rnW2gUBrVO1CBVS0JrGUlrsQUTvBD8Ze7CtesBb98Q==
X-Received: by 2002:a05:600c:4709:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-42cdb59148emr180118345e9.30.1726693702418;
        Wed, 18 Sep 2024 14:08:22 -0700 (PDT)
Received: from [192.168.2.100] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75468790sm3074335e9.46.2024.09.18.14.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 14:08:21 -0700 (PDT)
Message-ID: <34860faf-b4c5-45ff-bbed-370a12c88187@gmail.com>
Date: Wed, 18 Sep 2024 23:08:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] staging: vt6655: Tidy up s_uGetDataDuration
 function
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240918191959.51539-1-dominik.karol.piatkowski@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/24 21:20, Dominik Karol Piątkowski wrote:
> This series tidies up s_uGetDataDuration function by renaming its parameters and
> variables from camel case (including Hungarian notation) to snake case, and
> fixing its declaration formatting.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@protonmail.com>
> 
> Dominik Karol Piątkowski (14):
>    staging: vt6655: s_uGetDataDuration: Rename pDevice parameter
>    staging: vt6655: s_uGetDataDuration: Rename byDurType parameter
>    staging: vt6655: s_uGetDataDuration: Rename cbFrameLength parameter
>    staging: vt6655: s_uGetDataDuration: Rename byPktType parameter
>    staging: vt6655: s_uGetDataDuration: Rename wRate parameter
>    staging: vt6655: s_uGetDataDuration: Rename bNeedAck parameter
>    staging: vt6655: s_uGetDataDuration: Rename uFragIdx parameter
>    staging: vt6655: s_uGetDataDuration: Rename cbLastFragmentSize
>      parameter
>    staging: vt6655: s_uGetDataDuration: Rename uMACfragNum parameter
>    staging: vt6655: s_uGetDataDuration: Rename byFBOption parameter
>    staging: vt6655: s_uGetDataDuration: Rename bLastFrag variable
>    staging: vt6655: s_uGetDataDuration: Rename uAckTime variable
>    staging: vt6655: s_uGetDataDuration: Rename uNextPktTime variable
>    staging: vt6655: s_uGetDataDuration: Fix declaration formatting
> 
>   drivers/staging/vt6655/rxtx.c | 110 ++++++++++++++++------------------
>   1 file changed, 53 insertions(+), 57 deletions(-)
> 

Hi Dominik,

now you have put quit some afford into this patch series. Thank you.

If we change the camel case variables this way we need thousands of 
patches to fix this driver. Therefore we typically change always one 
variable for the entire driver and not for one function.

The following is just my personal opinion:
You can keep working on this driver and your patches will remain in the 
git. But I think I will propose to delete this driver. Reason is that it 
supports maximum 54MBit/s and the connection is always weak. Its form 
factor is mini PCI that is really old. I use an adapter from mini PCI to 
PCI to get it into my Desktop PC. It furthermore is not buyable anymore.

I like to focus on the hardware that is really well useable and on the 
market available:

rtl8192e
150MBit/s -> 12,5MByte/s real steady transfer.
buyable for some bugs as miniPCIe Card.


rtl8723bs
150MBit/s -> >3MByte/s can be reached with the Notebook:
Odys Trendbook Next 14
(Fedora with xfce) (I would prefer the one with 4GB RAM but I have only 2GB)
buyable for not to much money.
We can catch this devices because they run on Windows 10 which will not 
be supported after fall 2025
The Driver has 146 Files with 70000 Lines. I think we can remove a lot 
because the bluetooth part is not used anymore...

There are more device drivers which need our attention...

Thanks

Bye Philipp





















