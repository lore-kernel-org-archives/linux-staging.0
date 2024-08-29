Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D431B81AE
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 18:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724958001; cv=none; b=K7VSpOmun9ZNQSPRSovq0bV4ugcLMFuxY87UMTbCE6VQtY+anj5zODmhtsvTwr5VzUfA6AujPuV+5DGG3j7lRUgf0Qx7JyPUsLZb1dPnbph1VkUXpmeqUKqR28bbRjNkC3LK9Vp0yOMedZkdo8SGU0cSneQ4Pq5q7PCwbSMnd1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724958001; c=relaxed/simple;
	bh=jH0t4VZbwa/Xy2qTSEn80pEHMdwnC1wtRiFc89zs02Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uD1GAQWZPH+PQWZBWLXn+xY6DXUcPsOTja5p43FyALkG5j1DvIFNSa/HP+9pnQ23wD8eipXbS2nd/BwVBtozY3lSYo8h83miwSW6K9U+/73VQF5KLcMWuJfPcmk+rIU8yCVQlulHxLebTY7waYupK+PaDC3VkJcDg4kGBKqyp+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSoaJ5Vm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSoaJ5Vm"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a86984e035aso123844666b.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724957998; x=1725562798; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZMQTozCrsrYba54kkd5qEmVlAdSlAeyQmwu6GCVx6lg=;
        b=LSoaJ5VmHXUVeG0weicEX0PrRSsCG4kvjgIYyI9ViEbrlTK4LiWQdmbVDcuf/Ul5/Q
         Daxw9PAP27qLvFwow38M8O+nTwaqSl39gTRIc5hAMyAmrOhaOmtZXJ0pz1Va7oRolSoG
         sOg2vTMMMxJAOkBUAP6mI06NIJdrQkIzRy95aV7SLGxiHrnGVinVl4/C4XtPkZbUqGRz
         vLlu3pAK0otScu2f64Dd/e6bPSAtTcmjA95GhgyDLjUhUzeAYBOFwlDccngbps/PP/sV
         pZQb0HiZ9eCpZAkf6cOeIffsEr8esRekm8CDHCY82Vqu7pFZ/pU6j0BLgmpikrEPw348
         PYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724957998; x=1725562798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMQTozCrsrYba54kkd5qEmVlAdSlAeyQmwu6GCVx6lg=;
        b=nr830Zjk8XxXM4qcVQ8hjgm/HFhUGbGqgni86uR3u426AjZv9VjBZco3X3Ql5zMlTq
         QfsWJEzTP7xdBMQARD1nNqGz5gP5JxyoKKSxDmhipsTKQuUBh73WQPKk/DNA6p4Nv44y
         IaC6FwJ2spu2UnRdyIY0k3QvGvDt/alBYfVD+hMhwt6bXZCdxRBSMbGO0XnCFaZvfN0l
         vZujCioGc5Gf7hkTrCtohSqgu7U32HAmTS9lRT07eQCx51a92heXqnmlx4sjcaA16tnK
         6HXjmQH6NFc9MjmNxGd+7Is6h40ehDjpIH6cTGVXPrMeXPdSxA4/Va/Kg7PL2C8knmdf
         7tYg==
X-Forwarded-Encrypted: i=1; AJvYcCX1AVL/WMk4AxKrrAgk+cxtCkMp84oeYCBMMLaxQ+H0fm8+yh6Uf9NRzNc04sF804hCC4k0Tci2Xtx3KlDO@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0bNDeyWI8xy6ZgbjOzFaZL5kwFEAwi9/XsA0jIRey8rcqLLcO
	wFtSJn90TaVFXmMDS8SMoKsv5SJmJTFnqtuWd9crVsXVkyCKy1HT
X-Google-Smtp-Source: AGHT+IGryv3/DL550LtcMK74t04rhPGfTNrqI3KBHZ/MKYlkn4J+I8rKow4BgIPHqeCJcsUqn0Fsrw==
X-Received: by 2002:a17:907:d18:b0:a86:7a23:1284 with SMTP id a640c23a62f3a-a897fa74b89mr264958566b.48.1724957997171;
        Thu, 29 Aug 2024 11:59:57 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8508:ea23:888c:e220:647c? (p200300c78f2a8508ea23888ce220647c.dip0.t-ipconnect.de. [2003:c7:8f2a:8508:ea23:888c:e220:647c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892220e5sm107905166b.195.2024.08.29.11.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 11:59:56 -0700 (PDT)
Message-ID: <01183b3b-b8af-4451-8b52-e7acd0b4a9a5@gmail.com>
Date: Thu, 29 Aug 2024 20:59:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] staging: rtl8712: Fix style issues in rtl871x_io.c
To: Manisha Singh <masingh.linux@gmail.com>
Cc: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240828204552.26790-2-masingh.linux@gmail.com>
 <607b86cd-d89a-4072-af36-ce2ce5c1f7fe@gmail.com>
 <daecc634-4faf-4dcb-b03b-f57f24673a88@stanley.mountain>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <daecc634-4faf-4dcb-b03b-f57f24673a88@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 11:36, Dan Carpenter wrote:
> On Wed, Aug 28, 2024 at 11:08:31PM +0200, Philipp Hortmann wrote:
>>> diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
>>> index 6789a4c98564..6311ac15c581 100644
>>> --- a/drivers/staging/rtl8712/rtl871x_io.c
>>> +++ b/drivers/staging/rtl8712/rtl871x_io.c
>>> @@ -48,10 +48,10 @@ static uint _init_intf_hdl(struct _adapter *padapter,
>>>    	set_intf_funs = &(r8712_usb_set_intf_funs);
>>>    	set_intf_ops = &r8712_usb_set_intf_ops;
>>>    	init_intf_priv = &r8712_usb_init_intf_priv;
>>> -	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),
>>> -						    GFP_ATOMIC);
>>> +	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
>>>    	if (!pintf_priv)
>>>    		goto _init_intf_hdl_fail;
>>
>> By pushing the below statement after the "if (!pintf_priv)" you change the
>> logic. Is this really wanted? Why do you think it is better? I would avoid
>> this and it would be a separate patch anyhow.
>>
>>> +	pintf_hdl->pintfpriv = pintf_priv;
> 
> I liked moving it.  And I feel like it should be done in this patch, not as a
> separate patch.  But it should have some justification as you say.  The commit
> message could say something like:
> 
>      Checkpatch complains that we should avoid multiple assignments on the same
>      line for readability purposes.  Generally, we would allocate, check and then
>      assign.  It doesn't matter what is assigned to "pintf_hdl->pintfpriv" on the
>      error path.  For example, on subsequent error paths "pintf_hdl->pintfpriv"
>      is a freed pointer.  So this code is okay as-is and it's also okay to move
>      the pintf_hdl->pintfpriv = pintf_priv assignment after the NULL check.
> 
> (Notice how I sold this as one thing, moving the "pintf_hdl->pintfpriv"
> assignment, not silencing checkpatch and then moving it.  Notice how I avoided
> using the word "also".)
> 
> regards,
> dan carpenter
> 

Hi Manisha,

I like to give you an order of importance.
Greg is the maintainer. You need to fullfill his requirements as it is 
his decision to accept or reject your patches.

Dan is a very experienced developer. You are well advised to listen to him.

I am only a part time Hobbyist. I try to support Greg and Dan by 
responding to patches. Typically they will correct me when I am wrong.

Bye Philipp






