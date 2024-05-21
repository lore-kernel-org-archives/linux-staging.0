Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349801EB40
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716321713; cv=none; b=hQE/feNqtE2qv8yXt4hapjWB0ZdqqkHZLFcz9YWw/0axSG/Ov8AUMJJyZJIK5HGaF/Dtfqjc71gNicNppf0r8FPShutGSWTXuMY5xmGc32krynSCHduQq0OYlXNiDj+mb1sGB0ElUJxeWD2tfsKryOmCoZZxY99YaZq+Ipx8GXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716321713; c=relaxed/simple;
	bh=jYfrh6IB/H70cLPJ13z6qCmeOQJxG2Z02ywTH8Uaon4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VglKG5NI79h57nImLryon6MZzrSCz+nzZ3IjfXw5HjwRDmMWhHte207poQZzGnZ3Mwqw0ywEt7RcdhG4pmWWvhha+YBdfImBpGvcWWP1EoOvkQPsrs7L4RvheGbNtjbarxATUC/T/d2b3vhnw3lAne0P/HD50FymOPL4LfA2640=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdhU5vKK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdhU5vKK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-354cd064810so8343f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 13:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716321710; x=1716926510; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4lo6fagN8cZt1RfD02V0z/UoOAxB4b8uSr30hJTpAk=;
        b=NdhU5vKKbdnAgYv14CA3rXFwH57jrSG/I4IQai7otyM2XyDRBwqPmzaj/2qjK1r21A
         upzwKJRQUk255aVcCH8XzHwV1fLPCmqmETwAZeNElfF0kO6KyqXKKuTeMmWb2zK3PAgz
         0BZY94aa57e2JvomiuLmkjwQ/62fa12YGuOqA+XATdrI9qBJZWvb58QAcuJdGe0WcBQN
         RQEPHFxWHRyMUyCAZABqN7UtiEilsdMBvDzuJa7rDvujxrwTXFkrqURjWp0np8P4LCi6
         uragSgDuoKh7U8j+iDCfLoZq9Fb/UlTDULgrkoM8VApM6zdtAzqB0vnwfVeij5MRh1cD
         7J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716321710; x=1716926510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4lo6fagN8cZt1RfD02V0z/UoOAxB4b8uSr30hJTpAk=;
        b=NBsG6DZtXfiyUqGK1kAcZdppch0JzVf3J8n/ZEhRbF/ASNvRZTiaPhpS3u8nl5LU8r
         RTsjsm7yBFr3DpYdH1Vh1nEQZoXxdxojAOxGP2LsEUFRNh0FLqFTeQE9w39kZc3RZi6u
         bFMm1lsfCZWJspcEmoDlvdU/1JLi0bu3wk8EADfAiBVQ3G018Srl1gD1AI5vaBpsJekz
         MhYncOHr3xVVaVoHcIYifuMAHv4skSLMCQd9T9sJ+yTbPRn+PrLIeTCtOW9AeyOPDPp3
         gCc3b1yjbhxu0ZveTCrAZKA/uVpUPJ6JWC9WlVZVUL2Lta7UGDf5yNTZrA1aqRoH6dqZ
         pWbg==
X-Forwarded-Encrypted: i=1; AJvYcCURNu/sI9xtaYD3hVOwkoHM0SwAqMYY+YG96m99uVQHr1AQfgge0ltGveXOna+BybFLuyD/+O4stAW3t/gOuuYJj0xHOTy2sI90eDJENA==
X-Gm-Message-State: AOJu0YyKiW5/7UQrzhBm01gjZO52z9DrT6cXaIDrGe5zyuBKhOAkNKSX
	O49uVsLroTfb9it4HOljs6pUQPz31Cc4DyvUcbTGGMZ02eYGnIU4
X-Google-Smtp-Source: AGHT+IFf9EV4pdgf2JoYXUwaxtj7mjO46NJ2dbIphTXFEA9mOZZTuIrx01dLF7aYH5Hz/LYaEuqYQw==
X-Received: by 2002:a5d:4312:0:b0:354:b55e:654c with SMTP id ffacd0b85a97d-354b55e675cmr9425318f8f.1.1716321710209;
        Tue, 21 May 2024 13:01:50 -0700 (PDT)
Received: from [192.168.0.102] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b1771bsm1640748366b.215.2024.05.21.13.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 13:01:49 -0700 (PDT)
Message-ID: <ff5e9e62-f2b0-4229-9afe-68e0ae467674@gmail.com>
Date: Tue, 21 May 2024 22:01:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/31] Staging: rtl8192e: rtllib_rx.c Rename camelcase
 variables
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/24 05:16, Tree Davies wrote:
> This is v2 of series renaming camelcase variables to meet style
> guide requirements. Thank you in advance to reviewers.
> ~ Tree
> 
> Changes:
> #16 Renamed plist to list
> #17 Renamed npadding_length to pad_len
> #19 Deleted ChkLength variable
> 
> Tree Davies (31):
>    Staging: rtl8192e: Rename variable IsPassiveChannel
>    Staging: rtl8192e: Rename variable CountryIeBuf
>    Staging: rtl8192e: Rename variable CountryIeLen
>    Staging: rtl8192e: Rename variable bWithAironetIE
>    Staging: rtl8192e: Rename variable bContainHTC
>    Staging: rtl8192e: Rename variable MBssid
>    Staging: rtl8192e: Rename variable MBssidMask
>    Staging: rtl8192e: Rename variable elementID
>    Staging: rtl8192e: Rename variable rtllib_rx_Monitor
>    Staging: rtl8192e: Rename variable rtllib_rx_InfraAdhoc
>    Staging: rtl8192e: Rename variable IsLegacyDataFrame
>    Staging: rtl8192e: Rename variable RxReorderIndicatePacket
>    Staging: rtl8192e: Rename variable RfdArray
>    Staging: rtl8192e: Rename variable Decrypted
>    Staging: rtl8192e: Rename variable AddReorderEntry
>    Staging: rtl8192e: Rename variable pList
>    Staging: rtl8192e: Rename variable nPadding_Length
>    Staging: rtl8192e: Rename variable LLCOffset
>    Staging: rtl8192e: Remove variable ChkLength
>    Staging: rtl8192e: Rename variable WinEnd
>    Staging: rtl8192e: Rename variable WinSize
>    Staging: rtl8192e: Rename variable IsDataFrame
>    Staging: rtl8192e: Rename variable bMatchWinStart
>    Staging: rtl8192e: Rename variable bMBssidValid
>    Staging: rtl8192e: Rename variable bWithCcxVerNum
>    Staging: rtl8192e: Rename variable Frame_QoSTID
>    Staging: rtl8192e: Rename variable CcxRmState
>    Staging: rtl8192e: Rename variable IsQoSDataFrame
>    Staging: rtl8192e: Rename variable RfdCnt
>    Staging: rtl8192e: Rename variable prxbIndicateArray
>    Staging: rtl8192e: Rename variable bPktInBuf
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   2 +-
>   drivers/staging/rtl8192e/rtl819x_HTProc.c     |   2 +-
>   drivers/staging/rtl8192e/rtl819x_TSProc.c     |   8 +-
>   drivers/staging/rtl8192e/rtllib.h             |  36 ++--
>   drivers/staging/rtl8192e/rtllib_rx.c          | 183 +++++++++---------
>   drivers/staging/rtl8192e/rtllib_tx.c          |   4 +-
>   6 files changed, 116 insertions(+), 119 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

