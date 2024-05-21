Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812D1142916
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 19:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716318232; cv=none; b=tHM8/sOf30yjR3HkMKl03XAl80/pu7VjZ3M7t5s6zYmu1v4edP46FL0az5A+UrUOcBTqdZ9U26E6y2ZF1LdHaWrjThykbv3LEqyEfzCy0qUkFvF0HDKzoU68N/KIJloP/Xl2yCypbGamO+lzRVRwCkbSjLs0YG9kHijnw+vhJh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716318232; c=relaxed/simple;
	bh=j93r0x2LLl5DrCShcGy1ILGc6pv/qMlYGnlPMpRuj10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dUofNpdlQNMLYbom8Jd6lQg5UH3OJ/dhBmh4IvCjcyty03Z5JkMuN0MjJP86XiCqH1yaku2mPBi6MIs7y+x8JABERMqbD6jRqpcDkzx3P8MVVlCUyPTFCjPGev2Ce8QbLVcI/TRRleyp91k7+LFuEPp7qck/34spd/QYq96YK88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvJ2NB7+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvJ2NB7+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59bfd29165so129219066b.0
        for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716318229; x=1716923029; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yP70HlVsmQBP1saZ9APp+m5Pne5zk0a5fTtAUISwyBw=;
        b=RvJ2NB7+e++p0ejZ8PX6/aL13b9qSkHbRQ5/fWGoD2gObSQQIMeEHZuguf2aH58nmv
         McY7u45UpBDYkAmKF/09GMZgrgd964BTHyIRMBqFpTiaU5OOwyGSMc3TH+SdBB9aziZV
         X/2IOOOrwYT5gzazA4ocqPWyGCVyGJZrR+aOIt9/xRP4z7l7RjgonSv9wu9DcWj/Ehx4
         SfwAgfh7REkKauDIOMjrqJzmJGG407fd645+TM3WXRo7CkMsTzoxltTI3pjCrDl/NgqV
         Js3c1rGYfM05gYrB8n+zWOCxlTAeXk3vDe26RYTKjpegIXAVwDJW9rWgkVsAXf4TB3Ri
         DLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716318229; x=1716923029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yP70HlVsmQBP1saZ9APp+m5Pne5zk0a5fTtAUISwyBw=;
        b=HK1iekbhzDJQnEGC8ZoUrBaRH3c9zvNKvE3oz8Ui40Qmfhrk1zY+7UQhAf9gsqoOEl
         j8WYU3XheIXyzDndzCRqQEjhXK7wlQyqejGXKlOIl1Ks29b9TVa0KSfIzaRK9wIVM5ke
         bEG/4YaIjPcn19q4FN78hwJpx5ARoPOXsfphzS974s/srA+XP/JK3W5waiCnAgqNsHbC
         xfKei+7j5Hb+wqvbc7lwtFcxqUEwXbkWtL/TIlrPe67pir6YQntzxw/9QxVJN7U9y7T/
         AtHpb3TSlVeqgE0iJG0ADi1kXyRl9PoZweDY4aXrmj6El/9jhazysmuuIWIzpX+U62kJ
         lJ+Q==
X-Gm-Message-State: AOJu0YzANLL6catSERNlFRUBoVuujWDgRkik5hWZw+/i4htUaq+eHgBH
	+lBSh9DnM53aGBIMdHSxv0xiJDF0RqhMd1+SHNSHJjs8UzjbDtpx
X-Google-Smtp-Source: AGHT+IHPmmhK06HEQmbWaGAFGJKH6vmoFuJ+phNwATanBst8AWfKvLNvPwHhyc5tKZ8r5UKkqCBB7Q==
X-Received: by 2002:a17:906:5a53:b0:a59:cb29:3f9e with SMTP id a640c23a62f3a-a5a2d508447mr2094984866b.1.1716318228601;
        Tue, 21 May 2024 12:03:48 -0700 (PDT)
Received: from [192.168.0.103] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c814dsm1639029066b.118.2024.05.21.12.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 12:03:48 -0700 (PDT)
Message-ID: <1aefa708-b1fe-4246-bb67-36f25919c766@gmail.com>
Date: Tue, 21 May 2024 21:03:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: rtl8712: Fix spelling mistake in
 rtl871x_event.h
To: Roshan Khatri <topofeverest8848@gmail.com>, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 ayushtiw0110@gmail.com, dan.carpenter@linaro.org, namcaov@gmail.com,
 linux-kernel@vger.kernel.org
Cc: linux-staging@lists.linux.dev
References: <20240521095633.50753-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240521095633.50753-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/24 11:56, Roshan Khatri wrote:
> codespell reported misspelled joining in rtl871x_event.h. Correcting the
> misspelled word improves readability and helps in searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
> v3:
>   - Fixed misspelled word "readability" in patch description
> v2:
>   - Changed "mistakes" to "mistake" in the patch title as suggested by Philipp
>   - Updated the patch description to reflect why this change is important
>     as suggested by Philipp
>   - https://lore.kernel.org/all/20240521082510.50422-1-topofeverest8848@gmail.com/
> v1: https://lore.kernel.org/all/20240520064750.48912-1-topofeverest8848@gmail.com/
> 
>   drivers/staging/rtl8712/rtl871x_event.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_event.h b/drivers/staging/rtl8712/rtl871x_event.h
> index 759a2d27d8f2..0cc780cf4341 100644
> --- a/drivers/staging/rtl8712/rtl871x_event.h
> +++ b/drivers/staging/rtl8712/rtl871x_event.h
> @@ -37,7 +37,7 @@ struct surveydone_event {
>   };
>   
>   /*
> - * Used to report the link result of joinning the given bss
> + * Used to report the link result of joining the given bss
>    * join_res:
>    *  -1: authentication fail
>    *  -2: association fail

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
