Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3351E87B
	for <linux-staging@lists.linux.dev>; Sun,  1 Sep 2024 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725179772; cv=none; b=oE/7G2osDjLorGrO4q5atoi2a1igLp3i5if0Ms4hS5bg2qREwmry3bXK3eIOl4QqT3XfOGjuIO7bOPSM060Hf4mEok97+EKn3fU5FdtOSSTnUbrfeY+0q9V5nj1Sz4IGWCuvhdO50zYldAlHYSPvmOOuxj7g/5xWHnFA1s4D0Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725179772; c=relaxed/simple;
	bh=QbBEdKifS2tOI33APgnmB2ZcsdBfFO56TLOize1XCwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4L43RL7PYllviIEMFI0IBuqqkUAIaVavFhDbOV2tYalbRf0Bnm4W3JvGRr8pAcbPO1bAIrgcYd1vTey83pdTT86o6QPVrjLlba9C+wc4eCb3gMv519rbK4EZ8O5lbbR/48YzK0HpDrUBC6Utzyp0Lj7rW/+zRlwPftaFnaVm3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm1ScS70; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm1ScS70"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-715c160e231so2813683b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Sep 2024 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725179770; x=1725784570; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Azs5s4P25m/mANSWWi6d6fQJ0c1WDqmoYZPZDMGlZO4=;
        b=Sm1ScS70zV8SMnDkKbd1BQI0UFzjrcMY5jS7HjFRe0fmd0UEQKp/Bwomwz9mak0+Gr
         Vi6HN9Q0ulGbY0n9qo+zmxpKf1roSOcUa1Adn9nCucbVxhFiMj61LbQ1U3sRHlof4ao4
         FLiG3brf/Z2m0GU7PgnamGhol7VH9glY9kErG3qIg84CCkTybX0csZWmHNkbuvWN0zvk
         reWbAnyyc3MAK2LNWPPEFNYpgMr88u/Ytn0EpmCXSHVauTgOz8XhNEJdvVwpyes5A5gZ
         YcFM7qTTTk7Rf3uYsXPnyv9o9wUTObtWIoZ6b+Y7GtEpGI+EeSDUYldlIrJbRikhCV8V
         aaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725179770; x=1725784570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Azs5s4P25m/mANSWWi6d6fQJ0c1WDqmoYZPZDMGlZO4=;
        b=i2qIbld+Zes4QUKwB2GRxQBvaftZBWCoxozUIjbiISMBEuhbDu6fenyX6NfsQhPg5T
         jGOz8/SHxSkLL8Ax1Dml5Z7h/jVQ8xBy/7ZAEC/xgNIsjYILG/wLo5R4hmtba9g/LG/9
         M7DhHuKjRSdh4+lKMlCqlDViFqgDRU3KcmQSRxE4Xbosgkt65AoH2T3xYco8L98/6kLG
         E+fYT2QcaSoKoKkD0SoltkELTJ0LTilCRL3+05XOzpe8U2IAib5HnOcvo9n0w7FYjru7
         s5dyqHwH9MwTSGinf3JuU8HXQxx5Tw2zio1LOFVubKB1nOU6ikbCy2pPCoXE1gAQw7Xy
         IZtA==
X-Forwarded-Encrypted: i=1; AJvYcCV62FvVN7JttHSE/4Tm3feOI+iUpE9YoqiEjVoCM/mWtWLjwWF8NiEjEd2XKmz3addHEB2sFcm8JjbqVP7A@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6FpcnQjvMVdJGuzY8nNxx/HbfO2F6wG1HDkjsQK2bgyj8rx4E
	v5wkDXzqKHftofDDWaXYSnU5Q4p21K8CsmS+2yUHVGSOj36cnzUx
X-Google-Smtp-Source: AGHT+IFCabq3SaDSGwkEcIuRRxq+D+GB2U4aejlXDGAtojy5j031ba9+t5HzVNjZ5pxACQXwGMY+Fg==
X-Received: by 2002:a05:6a00:9165:b0:705:6a0a:de14 with SMTP id d2e1a72fcca58-715dfbab54amr10851686b3a.1.1725179770112;
        Sun, 01 Sep 2024 01:36:10 -0700 (PDT)
Received: from [192.168.79.9] ([49.207.51.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55b9d11sm5248804b3a.90.2024.09.01.01.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2024 01:36:09 -0700 (PDT)
Message-ID: <16d3e588-b092-47ff-99e2-ec943524d2d2@gmail.com>
Date: Sun, 1 Sep 2024 14:06:01 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] staging: rtl8712: Fix style issues in rtl871x_io.c
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240828204552.26790-2-masingh.linux@gmail.com>
 <607b86cd-d89a-4072-af36-ce2ce5c1f7fe@gmail.com>
 <daecc634-4faf-4dcb-b03b-f57f24673a88@stanley.mountain>
 <01183b3b-b8af-4451-8b52-e7acd0b4a9a5@gmail.com>
 <497fbcd8-2984-4be5-b877-1dec6a8d7bba@stanley.mountain>
Content-Language: en-US
From: Manisha Singh <masingh.linux@gmail.com>
In-Reply-To: <497fbcd8-2984-4be5-b877-1dec6a8d7bba@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan and Phillip,

Thank you so much for your guidance; I really appreciate it, especially 
as i am new to kernel development. I will make sure to consider all your 
suggestions in the future.

I apologize for the delayed response.

Thanks again,
Manisha

On 8/30/24 01:04, Dan Carpenter wrote:
> No no.  The v3 is also fine.  Let's not stress too much about minor things.
>
> regards,
> dan carpenter
>
