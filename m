Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DE335EF0
	for <linux-staging@lists.linux.dev>; Tue, 14 Nov 2023 20:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRRWvUdr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9e28215db77so139179666b.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Nov 2023 12:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699992585; x=1700597385; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjVE7g4gLV36CCD94RH1v3GPVVRu0rmQH9p/wSPfCGI=;
        b=IRRWvUdrWK5Rtgk+gyyFG349YF3lqflhGxSnPFzMt5X41s7riJIjzRKQz2Jbh3CvTf
         BwIKj8MoOjO5bRTRh14BhSsHrpbRYWYTZCI0f0fgrboN4wN50+Idm1VTK12xjaayesxE
         a00T3SoNG4v8bdnpkLrbzWt14TiuwGKQUXFdavRJoLAOB1ordY64ZluZhSwHTA6Nmw6k
         Jdpc+uTysJzoUGCbgjsVXfJ2vTR3gCfOOhW0vtspJO9MIwykN0R22La4aUhHM+Oex1n2
         MSnf/QaTpJUVuqNAwSS6TdPpkoQk9zepFoBTnRAIVaghx80XySoqRfrfvx/0N9J3KF2d
         qPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699992585; x=1700597385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjVE7g4gLV36CCD94RH1v3GPVVRu0rmQH9p/wSPfCGI=;
        b=rLzcCIBNzYUQVzN3MxdQLvHKS+Upe7P3LCkP0bZueQv9zyhCPrnUIn68XcfzUVQVZQ
         GmcAE/q5TAcy+QHmNoSSuOgkVb4gMbR+EGx8zZabSli71tBjcPd2Nz0RZGwzw3KeDYBQ
         PuGKP4awaLLYhV/emZdFzMwukeNYeLtG/N32wvAtAQjXGguFPd7X8yA4gJxNxvhm8cv9
         jFxtKRd3nDvv3UY1HJL/bPZgpdgbjFEt6FqhKaC7tpOV/fM47o0p11Cvp+C0q1ds8ZjN
         +m4vtr5TXT2HJTj7SGVQWzwFgKNixhubPM8OHkmiKMhkD68ZM7taav3lh8IgpEjVl2+7
         Wj0g==
X-Gm-Message-State: AOJu0YxOT5f7RXnNUIdUTXo4LtjMrPzWZdy/8DuT7D/pa81TOelk7e80
	FZ1BnFGB7e8c6GCxvLcgmp0=
X-Google-Smtp-Source: AGHT+IEssApvIbQKpflYjf6NlHMo7r/dIDUj6kFmDMDIp8yG6Cl4/TVje9dZ8ZzLBwbPRsNpHuD0Yg==
X-Received: by 2002:a17:906:1da:b0:9e6:dfee:8154 with SMTP id 26-20020a17090601da00b009e6dfee8154mr2249304ejj.3.1699992584387;
        Tue, 14 Nov 2023 12:09:44 -0800 (PST)
Received: from [192.168.0.102] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id fy15-20020a170906b7cf00b009e5e1710ae7sm6077032ejb.191.2023.11.14.12.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 12:09:44 -0800 (PST)
Message-ID: <c464f4a8-753b-417c-97bb-7aa29ab5bf59@gmail.com>
Date: Tue, 14 Nov 2023 21:09:43 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Staging: rtl8192e: Rename bool variables
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231113195910.8423-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231113195910.8423-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/23 20:59, Tree Davies wrote:
> This series renames bool variables to fix checkpatch warnings
> Thank you in advance to reviewers
> regards,
> ~Tree
> 
> Tree Davies (7):
>    Staging: rtl8192e: Rename variable bSendDELBA
>    Staging: rtl8192e: Rename variable bCurrentAMPDUEnable
>    Staging: rtl8192e: Rename variable bAddBaReqInProgress
>    Staging: rtl8192e: Rename variable bAddBaReqDelayed
>    Staging: rtl8192e: Rename variable bUsingBa
>    Staging: rtl8192e: Rename variable bOverwritePending
>    Staging: rtl8192e: Rename variable bDisable_AddBa
> 
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 40 +++++++++++------------
>   drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
>   drivers/staging/rtl8192e/rtl819x_HTProc.c |  6 ++--
>   drivers/staging/rtl8192e/rtl819x_TS.h     |  8 ++---
>   drivers/staging/rtl8192e/rtl819x_TSProc.c | 14 ++++----
>   drivers/staging/rtl8192e/rtllib.h         |  2 +-
>   drivers/staging/rtl8192e/rtllib_tx.c      |  8 ++---
>   7 files changed, 40 insertions(+), 40 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
