Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84122322B
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 19:42:39 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31c3f574ef8so236779f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 12:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692992557; x=1693597357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApTGyFrrfdw4KCGyPawOGnPGZS3+fq14dxevncgYpHY=;
        b=QSxZ31vMqZPyeawNGOHHwLl4e88qNVwEZ3i9PPe4URN7RIx+B4NH7NHylClv1LoGZp
         OSQBt1lgf+UAcMoteLaWiAGW6jDk4uBJ3B2kwFl/3fouGDvriSEXQYNJPmVkScMo6VCo
         YE4ogUcWumTUg32GBFQecW1GuDso/AgEvzxwloA78qmDfU23NYAcvgGmq8hJVv2S29YG
         19d2/u0v0C1taghQz4RqrjhVJbFCNiMVRsJ6iFJpMAXeMq//obrga2LLvfUgnrYYDdXV
         9PFZ6xsIMMNTY215FSrdw71/iYZm6r+gatP2Sg/MiYKP2lpwA7NAEnDOOcNNt00BuSGU
         nMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692992557; x=1693597357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApTGyFrrfdw4KCGyPawOGnPGZS3+fq14dxevncgYpHY=;
        b=Qk79LSLolvUfC65draqghpitxJcKVtB8OCT9R4jGZm6HUe+T6fAbU2jyCjaL+3iMvZ
         3eMhBODwVQAEawNEgWeye7UbTD0Tnvgx90MbgC2j3mVmUmMcYGovbm2UqSZ+4i0TuDLP
         Zq2qU/CsrLSIRKw4+Gz0M9zmiFAXdS33hr5Ki1PEFr9pcmkLmO0BT2+NOUDRpuS7YnI5
         WwPWmDCdvdy6kVCVliuiD6j/2bno8AvO7PTkAdz+R5j+/g8ZdgsYxGUdUdqIxrD89IJ1
         1hZBkgjFbyEOtGnMRJk6+Up6divdj7Tmrrh87JI9hJmxcCx1zgmz8THvUzz8gSW4JGTZ
         +5Dw==
X-Gm-Message-State: AOJu0Yx1THpuXT96bhmxl8V+EZYyVIvNIn9FvXcTf681Sr8DnM5JIJNK
	ywRZDe0afj4W5ISYdSWVENnBXyO9D1I=
X-Google-Smtp-Source: AGHT+IG8X3HXPt4LbR41Ai+BpFfpAUFOECjvlZrKloM8fMcxozZ6I58ZfRSVrkyfXKQfFr1MUmy52A==
X-Received: by 2002:a5d:60d2:0:b0:316:ef5f:7d8f with SMTP id x18-20020a5d60d2000000b00316ef5f7d8fmr13973286wrt.3.1692992557352;
        Fri, 25 Aug 2023 12:42:37 -0700 (PDT)
Received: from [192.168.0.101] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id e20-20020a05600c219400b003fe539b83f2sm6118788wme.42.2023.08.25.12.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 12:42:36 -0700 (PDT)
Message-ID: <736c8159-90e9-4575-3c22-5a62515d5c03@gmail.com>
Date: Fri, 25 Aug 2023 21:42:35 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/16] Staging: rtl8192e: Rename struct rx_ts_record
 references
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230825140847.501113-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230825140847.501113-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/23 16:08, Tree Davies wrote:
> The goal of this series is to fix checkpatch warning Avoid CamelCase,
> for all references of struct rx_ts_record. In most cases renames the
> references to, ts, to make the naming consistent.
> 
> Thank you in advance to the reviewers,
> ~ Tree
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
