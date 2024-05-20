Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B10FBF6
	for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716230370; cv=none; b=djNid9OypOCN45aKcbmW0CzBRrH5VUL1ja6rmFgc0E8ZK4DaJCv1qZ7a6otPy/2G0kKS++XieaCh3hpgR58qcKbAKs6e8S48odft9QrPDqrfXEqNqUslcwl1BmJW+GdopKVL4wIpcOJENDGVrj7jIzlJ99+gajRy3TiGKmwUJoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716230370; c=relaxed/simple;
	bh=riKvgZ8PmrYw2l2iaXL/BmS7souBplnqNokWCweAC4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5xEG3Zrd4zX/W8ALtZHviSNPz9gPdecWpcdpDfwjop1aKPr9Lz5NYDwcgHgGC5ThwKnwH7KuDlBCBwbt/Y7o2HK2TJt31W2LQ8xoFmY+Sj+g1coDse1yI2RdDDf+Fi2QAQnHsJNpwejmlnX8DHuYq1hVzAIZoPF30BLVJNgb6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WILSiJjH; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WILSiJjH"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-575070cff74so1108598a12.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716230367; x=1716835167; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PuNSzGjhogueYScZ//LeIbyJSH+S3XLhUJDLk4IO08=;
        b=WILSiJjHtQHbcohlMnBs2Sea183WvT9lshqQOYSWCWfDccq+aWRI/hQUcCzzGyxcFr
         QNLPn6r9PDpxtWlku1ufxF7hRJ9OfMgcA8SYOSJ+DIpvGCnFa5tERdIMgPiQhjjVE8qh
         vhWueordRiOOVT6GBBC8Kf+bhZwT+uwAJ3tT6ovVmG/PbPZlhNL5yA1VNtgb2juJj7oY
         Aokn//N4tmgsgMfybWxiDaiPe75z11W7cuaGKpUdroGR4tGKRT0bWsuulOPckcdX4tV9
         U5aEyUQ6OjGJfKwDlbXyhj5ewc76+Oqtkx08sjpafc4bL5G82T6S9Gtq8W+oIgLJl+HX
         eOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716230367; x=1716835167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PuNSzGjhogueYScZ//LeIbyJSH+S3XLhUJDLk4IO08=;
        b=hA7t7mvcaPnwJ35B/BZ/9oeiLO9cjoimu0abf8EVGg52EXxzpQBZdEYflvs1wVIwKT
         vcR09/Z4F/9tfd+yU64WLy3/E42KwRN2gVu/1LIhwsUqrqmbpyMtmggN8ghOQboU4yVb
         4D03DcQB0IIDOCg0IuJTLOPr0O7UrdBkQSt/UlL/OGQ5WLkQIWXk/+Bc6nkobtIQbOw6
         ugO8rcp2KEF5eA6CErQQA3kLyq8D1mkBlHEK7ojYLxnK/5OgL6T0cmzsA99jLQaTAON0
         02xtMerYy12tLTvIiyJGKujUr4Fv+ZMfNangQbl+JY2LvQUYChjauEo1xfN1mfbiq9Cv
         gfhw==
X-Gm-Message-State: AOJu0Ywl4UPA0POhd7ZTyg/iy6Y1yAIOZr+HsiZwu/b9JXiWLBLBV5R/
	6zTYfdF5jxTsqP4/B8LldjpDFC/iLKT7wGg0mqksor4+N7v6ph8V
X-Google-Smtp-Source: AGHT+IFNKRCLE4JVZIDmnHetVUMxMLgUnr/T3dRuolRB8r9/2nqR9RmsH2G54rfHf79jKCtCQYUpqA==
X-Received: by 2002:a17:907:50e:b0:a59:a0b7:1850 with SMTP id a640c23a62f3a-a5a2d6871dfmr1944871066b.5.1716230366766;
        Mon, 20 May 2024 11:39:26 -0700 (PDT)
Received: from [192.168.0.102] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17cc5sm1482258566b.205.2024.05.20.11.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 11:39:26 -0700 (PDT)
Message-ID: <e26f09d5-0a04-4392-bae6-d619008b3d9e@gmail.com>
Date: Mon, 20 May 2024 20:39:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: Fix spelling mistakes in
 rtl871x_event.h
To: Roshan Khatri <topofeverest8848@gmail.com>, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 ayushtiw0110@gmail.com, dan.carpenter@linaro.org, namcaov@gmail.com,
 linux-kernel@vger.kernel.org
Cc: linux-staging@lists.linux.dev
References: <20240520064750.48912-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240520064750.48912-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/24 08:47, Roshan Khatri wrote:
> codespell reported misspelled joining in rtl871x_event.h. This patch
> fixes the misspelled joining word.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
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

Hi Roshan,

Subject line looks good to me - but it is only one mistake and not mistakes.

Patch description: Omit what you are changing as this can be seen in the 
change itself. Do only write why you are doing this.

You can find examples with
git log --grep=codespell
or
git log --grep=typo

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

This is just my opinion but often I am right. Any response from Greg is 
binding.

Bye Philipp

