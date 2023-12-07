Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6A481A7
	for <linux-staging@lists.linux.dev>; Thu,  7 Dec 2023 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebDkKjP8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a1c6dad2dd0so33274966b.1
        for <linux-staging@lists.linux.dev>; Thu, 07 Dec 2023 09:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701970647; x=1702575447; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaPW6iG2qBLLizRIc7bjpL05yaqfcnLXrnwA/boxXcA=;
        b=ebDkKjP8/4a+k7+7JUtNuBU3Eo3O/QzPHyokB3veWocn7kTlIttOFA8x5NWQh5Y4lp
         nYp6furmi5FgpV/pBs0v83jiJxmnK0MLZXYgUtgCGHz447X025iFhj+zCevAaTi0oiA9
         u9I9RvvI/Mf0NRL4er20iVtuMIoQUYz0cmlt6dh6sFsmDC6dj9UFBOlJ1/B5YfgwmRVd
         3MWrcb3rcjDl6Egt5/jPbG/QR8MTMzXQsgbqQ644LTA5dXSjx/BYi4KR7aqQbqGqblfE
         PAA+J0JF97pmNpgph2AGLmnLcgvzNHFWHT57mZa6jUeL21IgND5dBK5KvBVkyzbwqEDd
         38yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701970647; x=1702575447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YaPW6iG2qBLLizRIc7bjpL05yaqfcnLXrnwA/boxXcA=;
        b=uDuuffiQ54aeD7W2QkKc4cGIXKEJdQ8+gvrbftcUPEA39staSKNKpsd9YUasBukRBh
         yKmp/T7Z/pFd6jzcjBQMuxZuIDSvz5W2qQs9vL98DsrDy+jpvFz9C46cNeD0OwDhhMF0
         3eESGzcW99rxHM+miAePxR92U9fKBZNNJRLbHNdXTZoyXRjx06Cc7En28TivLqRUaxpD
         RfILYq/g2XYlfD8JGr19gUQOou2KJAiVOTnQPqj+jMBmPL5GM2+1Kzn3LAdg+dJX9HKf
         Qm94J5LcjC/gdfDLbBq+5q+rMAcuiXJdgL9OhtNMTjEiZxbM6ve60yL6ulSLDAHQH0sg
         Cx6w==
X-Gm-Message-State: AOJu0Yx2Rtist1bAtC9RhPb3nu5B2TkmvV4CoZKXdnH+L1NnNzIEyAEQ
	41J/7QdngVcIQFKusirVydQ=
X-Google-Smtp-Source: AGHT+IFFG7xc8N6UrPAk1y6yp7QjjpA3oxUsdABpDY6ZiwM4RCQjP1vO0co33O5D2wXojC2ef1kJeg==
X-Received: by 2002:a17:906:2295:b0:a1e:1afc:4594 with SMTP id p21-20020a170906229500b00a1e1afc4594mr2795696eja.0.1701970646835;
        Thu, 07 Dec 2023 09:37:26 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id kw20-20020a170907771400b00a1dc4307ed5sm6035ejc.195.2023.12.07.09.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 09:37:26 -0800 (PST)
Message-ID: <0541b225-cc2a-491f-9631-212455c0098f@gmail.com>
Date: Thu, 7 Dec 2023 18:37:25 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] staging: rtl8192e: this patch series renames (5)
 different variables
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231206230404.1721-1-garyrookard@fastmail.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231206230404.1721-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/7/23 00:03, Gary Rookard wrote:
> Hi,
> 
> This patch series renames 5 different variables with the checkpatch coding
> style issue, Avoid CamelCase.
> 
> Patch 1/5) renamed variable bAMSDU_Support
> Patch 2/5) renamed variable bAMPD?U_Enable
> Patch 3/5) renamed variable AMPDU_factor
> Patch 4/5) renamed variable MPDU_Density
> Patch 5/5) renamed variable bTxEnableFwCalcDur
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> 
> Gary Rookard (5):
>    staging: rtl8192e: renamed variable bAMSDU_Support
>    staging: rtl8192e: renamed variable bAMPDUEnable
>    staging: rtl8192e: renamed variable AMPDU_Factor
>    staging: rtl8192e: renamed variable MPDU_Density
>    staging: rtl8192e: renamed variable bTxEnableFwCalcDur
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  4 ++--
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  2 +-
>   drivers/staging/rtl8192e/rtl819x_HT.h         |  8 +++----
>   drivers/staging/rtl8192e/rtl819x_HTProc.c     | 24 +++++++++----------
>   drivers/staging/rtl8192e/rtllib.h             |  6 ++---
>   drivers/staging/rtl8192e/rtllib_tx.c          | 10 ++++----
>   6 files changed, 27 insertions(+), 27 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
