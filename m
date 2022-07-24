Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF02C179
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 18:20:25 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id t3so11494421edd.0
        for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 11:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uI1N6WkK/h63C9rbKNyx+SGUibFjnftNpfGsKc2oH1Q=;
        b=XXkwpGt5kj6PscZBJ5obVoPrx6Khm099P26pavsm+5SvelQcnuyTe2TOSdGaIa6rw0
         2IoTEh1HkDAg9Nv5oUwTUAeO25qChm/gvwWOhj5MYG8rgigGAF7GbOo72tXHD+iTNHvW
         w03e5o1awpe9Nu3m0g3IajFFqLPTHJDK9mxMixpJzl4Rflj1OQ600FPtSZtIl5Ikrr+W
         lo+lSiqwZxuWy3jd9siVlab4Q5n4lqaB5JCH2ORV3THW9rnoSzsVlEPRxKC0Y2EX0gss
         L/qktS64GKASTr/Y+pAU/n52ebNLru2WMqKWVybvA9ARj4cLZEcbWFnIkUDDpl9cVEn5
         eJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uI1N6WkK/h63C9rbKNyx+SGUibFjnftNpfGsKc2oH1Q=;
        b=Ax+eASTj/tk74qF7xBoyLozbCwHSKiieIdC61eFH8bxDm+YYpvulGA+HxL5c+H46uG
         8S3cDvtnaBc46ljZjiv1mAFrzIaf6fKMDiRJe0jHbx51Pg/peGNq1KGBFShtZXdWvh9v
         yNlv4kcMOQ0iiC5/XPyEGYRKveuNvf+4vxZMYYw4IEi+YuKgn5YS2FhQSUW+f0NiMBt+
         DfOiq69VuKRkpRsfLggDsHcnz9s1MPXKIuORyFAaY+vn2rLnmT7Un4rbH9baIN18dKrh
         DyNzM/TpDTuEo5UYFTCXMX5Ab29w53zMTYL3+eNk+guufPx3yjks+JiB+l1t4PSzQbqm
         uuMw==
X-Gm-Message-State: AJIora/kRcTjSz1G1ML3Dx5uOyyY/ziF2s8FirZgfdbpWN6gyNc43Fvi
	fQwZPx9JhMLW0FSIb+l/0sQ=
X-Google-Smtp-Source: AGRyM1uhS3lZc04a86/lX8TdJ9u8aqBpF7GFqNmQt+8e0DoCpX1UTzgQD3N0PptBdINUUSroom56Mw==
X-Received: by 2002:a05:6402:3217:b0:43b:dee8:4cb6 with SMTP id g23-20020a056402321700b0043bdee84cb6mr8378680eda.157.1658686823971;
        Sun, 24 Jul 2022 11:20:23 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id o22-20020a1709061b1600b0072b14836087sm4419955ejg.103.2022.07.24.11.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jul 2022 11:20:23 -0700 (PDT)
Message-ID: <03a784f3-660d-60ba-e921-03f676b95fcc@gmail.com>
Date: Sun, 24 Jul 2022 20:20:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] staging: r8188eu: remove two unused function
 prototypes
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220724153349.138741-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220724153349.138741-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/22 17:33, Martin Kaiser wrote:
> I forgot to remove the prototypes of OnAtim and DoReserved when those
> functions were removed. Here's two patches to fix this.
> 
> Martin Kaiser (2):
>    staging: r8188eu: remove OnAtim prototype
>    staging: r8188eu: remove DoReserved prototype
> 
>   drivers/staging/r8188eu/include/rtw_mlme_ext.h | 4 ----
>   1 file changed, 4 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
