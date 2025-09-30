Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FEF22172D
	for <linux-staging@lists.linux.dev>; Tue, 30 Sep 2025 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759220971; cv=none; b=EET/MJRvuyz/8gZvnccEzpAeBvYBoAq9zqEgpQmWpaSelTGCgGDo2W6c+OZ7j/2DJCzwRzHl2GTqhRhqvds8VeiCtux6vfm9TA/rkOK5vsu8jSZktk+eRTNiNfrbHEhZAiTS5JGieknAvlxQqtZ2pRInbQURsV9QG80ZFOrQZik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759220971; c=relaxed/simple;
	bh=Yig0DB5Nocvfmkfkz2eJd7bQ6VObcByu+V+o6O2P4D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lG50n9z8tqmqOdUImbZkWl0/vwis5P+xv/dAOx7bMfFyVYXScTt9zjBkWyAZoa3aSjEW4n3A3Kii0ZS3DueDel20YIpJwHIiQhF7zGZ5hAcAUsfqFJAlPUJE+lvkVuf3i+38HVUPS/6ETECdgr0aJMPciBfbpEXl7yLHQK62k/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjxUXRPB; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjxUXRPB"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-84dcf6f28e0so584930785a.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Sep 2025 01:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759220969; x=1759825769; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHrm3N7DMKd3ASATv02U79FutuaO95JHuxa5lXRIjM0=;
        b=hjxUXRPBiGBNFR3r+WwBJ9lNQ/kxODe/bvcylCh1UkN0nPHkUInU+z1Q+IEIQMTqrT
         N7tbWNvoW0qlV115uQXJ3YCYj3OnsasS2GYY8CxaUlKvHKkOJXeb5KGa9dmHzbtZ3lZs
         0SyxMmYutRxbCVJ6cj9YzPXEBOt3MT0nQaTbwRwb/ePcXxv9KFPM1DXtRrKcC1M8qf7a
         Utf0Dw+JCzshYsA161i6ya0TvmKx/VK9LC54XH2TkvQXpjSaB3VzVJhrcEuLKQ7ZiRxi
         c8w3m8FEerGOoK4uGk6g2bujKcbUT3e/xUrIzM1bGsL7a/q95tyq1YMwluvIqWdTW5NI
         qphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220969; x=1759825769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHrm3N7DMKd3ASATv02U79FutuaO95JHuxa5lXRIjM0=;
        b=rC8X55c1Z/Nv3nvPJa4MNMac+9/A1o4Ils1XhetYfp5L+aXNaQKbVX6kLcyE+jkwge
         89rp077tH6+JfDKaLag0ss67wVHKN7llAQEfqu4M7lP0lpUh8HOGsdDEfTWwG3ugmJYB
         qzK+2NsgC8Vpza1wZQoKCwZeowKihb3mjaYnsZBMQvdBUyGuyzCO+0zYZQGjfoNVzdL2
         f6piUXMQ6LRGztK86FSAJKIk2lP5aSbN8th0/OQx5HeRjw/GEHM4vMq4r4oK0jP9I2m4
         XRNJ6q443FgdgOf2txVHnHWEkUs50o52Ks/Z0xOA0c13RVFwET4SKL4YEV0Arl4R0My0
         dhAQ==
X-Gm-Message-State: AOJu0YycHHc+/wV2jHBzhBFq57EAtcLJ8nH+894HiRxBLdrYlDkn4HPV
	tvAhjotGPuLHOqJvrA8RvipWCg/yIxxdHAiHeXb07M9Q1cPQnSf85G8epncLpQe0
X-Gm-Gg: ASbGnculDxQ6+U7lvKWACP21pFMv3Qp8vKO9TccuHOmtcs4JYwnMzsifwrr1Sd62u+k
	94TAKJBiZfiVgrlWxutTJbSzX0vGY/5STEisPxoy8BoMdsmX/LI/9PXXmdFsN9HNhZ9oWSTnYB5
	e7MLzcqGkEqF7/9wAk+ZM0XNUk5iSJJL+7L2v9IDy3U0jpTnm9nG6607ob8E84GkgSuK6z3pcD/
	flcFKIu8GGeciJ+2UVX/DGghWewzVoOoSj3WDtiua48M7JT97JTOP0BJXeIvAsQi8Rm4MP2VABg
	6KFG/LEGG7PoZqMnYrIqkz9uXp/Zmi1QD+FWJu7infjJqmNSZc0YyWjYRfKSpE5MMDF14H+d1i2
	f5itOpcUq4ewBWQHuf7NhSiDJxu+/rq1ksc8rA5SwOTb9ou+EnSEWJIvsXt7nHoFVNiLsuPQi2w
	==
X-Google-Smtp-Source: AGHT+IFJN/IMothj+b6Fuwyvmm73qXzhC42sWbV9OgNud2Dt4rw0sbX9+PQTd+HPuLn6qy4LdETXUg==
X-Received: by 2002:a05:620a:480c:b0:813:7fd7:8726 with SMTP id af79cd13be357-85ae94c6c3fmr2394125785a.67.1759220968674;
        Tue, 30 Sep 2025 01:29:28 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c29ae247fsm979009585a.30.2025.09.30.01.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 01:29:28 -0700 (PDT)
Message-ID: <687549ed-7610-4bd8-ba30-854c99868cc1@gmail.com>
Date: Tue, 30 Sep 2025 04:29:26 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] staging: rtl8723bs: align asterisk in block
 comment to fix formatting
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
 <20250929065000.1010848-5-vivek.balachandhar@gmail.com>
 <2025092953-depravity-oasis-93cb@gregkh>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <2025092953-depravity-oasis-93cb@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for pointing it out. Ack. I’ll wait for more comments from the 
community for another three days and then will send the next version.

Best, Vivek

On 2025-09-29 2:58 a.m., Greg KH wrote:
> On Mon, Sep 29, 2025 at 06:49:49AM +0000, Vivek BalachandharTN wrote:
>> Align the leading asterisks in a multi-line block comment to maintain
>> consistent formatting and improve readability,in accordance with kernel
>> coding style guidelines. No functional changes.
>>
>> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/core/rtw_mlme.c | 40 +++++++++++------------
>>   1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> index 3eeea832dcb6..cd41f713a52e 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> @@ -869,8 +869,8 @@ static void find_network(struct adapter *adapter)
>>   }
>>   
>>   /*
>> -*rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
>> -*/
>> + *rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
> Shouldn't you also have a space after the '*' and before the 'r'?
>
> thanks,
>
> greg k-h
