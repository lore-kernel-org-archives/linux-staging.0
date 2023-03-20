Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524D1846;
	Mon, 20 Mar 2023 10:14:58 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id w9so44542764edc.3;
        Mon, 20 Mar 2023 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679307297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvoaCsxD8j+MlDGCUL2UcBhM2jG+i14Rfbl7/FhMycg=;
        b=FGb8HHAG4Qm7kRI4qls4jY8N7C0C3sZoNOglCJSYipb2PSMj0u5OmqG0XkuwtkDTPj
         HsYq9S5eyOAp5gfinLuagefvgsF+M5bKbstRIeSUPryos57DD2b1FItRrRkEzbkeWlia
         UBMoBKr2hAo/PoTmaJ+42Iex9PVKGwSmU88IbvpTz4TRk4ozmNPgLvufiF2PSOl3gxJE
         Wvh8kmTukLMkTgxeoqtk6My/+wmJIaXioPxeLKmPqc7DQM8RgWaJXrkEvm2n/EjoK5Qv
         ey9FdKDove8Mc6WHwEMWmtIcbcL5UbKlUagRhxLcGuzQbEVXLqRMXZXsH+QVSJCNLelD
         wFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvoaCsxD8j+MlDGCUL2UcBhM2jG+i14Rfbl7/FhMycg=;
        b=k/zOrQfWy0GXXJJZ4TtnRM9uk22UZ0ywZrLFY9awQuPIGBJfFHDm6w7jRPZbCDbSrS
         hLyNt45WKc0k6NKqnF1n/V/0uyudX7xKM3Jjg5y6cILSmmI+0q2o7AFfClp+oXnXX3n8
         JyU4bcFYPzUFWLcZ2/ZecI4tJrHYazy8alpRxEqW2Xb3ZXWSzp/DhgnsHrlAw9U+uhfz
         cMrTLB74DBPUzXcb239+UaZ2CRRJ65wjPXO12J1Mi14mg4B+d+AJZ66s2BH42salvw0q
         +VN/uKQ7bEV8IStNd/AoaLrKli72ZnNrriVgYtKS4iutZZ+7SES/jLfjtewRewuMKg80
         iwmQ==
X-Gm-Message-State: AO0yUKU6+/ZF3RHMGVR1uEVDcgphKr33FVojhDOz6rCMaaHUaxqWnVPC
	k8zDv/a96zicWqRAnDwoOhs=
X-Google-Smtp-Source: AK7set+TM0hC3s6i6HZiMrQ7bJN49IFKhhZ+d/Yhr4dJenpButGzu2Z8VUe+Szsa7sAlNsUVWBjyEw==
X-Received: by 2002:a17:906:51d0:b0:885:a62c:5a5c with SMTP id v16-20020a17090651d000b00885a62c5a5cmr9709042ejk.46.1679307296787;
        Mon, 20 Mar 2023 03:14:56 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709064e0100b00931baabe36csm4150848eju.63.2023.03.20.03.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:14:56 -0700 (PDT)
Message-ID: <3c9e2fd0-fec8-2aa7-0e68-601b13cc86dd@gmail.com>
Date: Mon, 20 Mar 2023 12:14:54 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: greybus: use inline function for macros
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230319201324.253874-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303192121170.2867@hadrien>
 <0f02a3ff-801b-1e1f-5c03-009a05708709@gmail.com>
 <alpine.DEB.2.22.394.2303192151330.2867@hadrien>
 <402ffcbe-bb29-7035-68f4-2741532a6d67@gmail.com>
 <alpine.DEB.2.22.394.2303192225590.2867@hadrien>
 <649afe06-e069-e046-21ec-0d86243a4bfa@gmail.com>
 <alpine.DEB.2.22.394.2303192303130.2867@hadrien>
 <8e9724a0-226d-eb81-69c3-d59889e37e1f@gmail.com>
 <alpine.DEB.2.22.394.2303200659280.2940@hadrien>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303200659280.2940@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٢٠‏/٣‏/٢٠٢٣ ٠٨:٠٠, Julia Lawall wrote:
>>>> and version that I have submitted, should I do anything about it as you
>>>> said
>>>> it is wrong solution?
>>> My concern was the blank line after each of the structure definitions,
>>> which is not in Greg's tree, so he can't apply the patch.  Other than
>>> that, if the code compiles it is at least going in the right direction.
>>>
>>> Please fix the newlines issue, and then send the patch again.
>>>
>>> julia
>>
>> Okay I will fix it, but will send it as a new patch not v3, right?
> Why as a new patch?  The change is the same as in v2, and sending v3 makes
> it clear that v2 should be ignored.
>
> julia


Okay, thanks.

Menna

