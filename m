Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBA7368
	for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 18:53:21 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id ft34so14523239ejc.12
        for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 10:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Otk8mMjWhP9DLN5d04ys6Qw0wyz+Qlbt0TZMhHiZLrs=;
        b=jYEQ9glMNmp8OBCEGJspOp9zgHKuGx0SKsRbwChWx3NOxOZUTrbMv+KkTlinfUg/sc
         20MHHxYI3pQKZXKiQGiXNbbyDc1sDC+hKrx9qjhVm32DLiHI0j2Wgp6i2y4JjBntzCht
         gR46cqaxkeAPK0hELx4HmyHuwBjhDrf51b5sJUmqk5333VRILYxF0p/a3pE+mh0LlUdQ
         1oodn7sC1Bk150w778TAcVf1xE51OOA6KaDATSgYrku3ntb0n4Xiq7c07mRoV/PvQ0io
         lETwuYHeqbmad4cm8iYorRDEQZJDwXN6cHO2kaGFIOi0vTXcCLdpOHIi8ay66EfsPGJV
         ScYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Otk8mMjWhP9DLN5d04ys6Qw0wyz+Qlbt0TZMhHiZLrs=;
        b=ciEDi0pVe06trPkrd42dfyI/punijODyMCL9RxqFveMyZcierkmVnURwC6Btq40fJ7
         hHqhNyhI2TRnezK4CtsfVCsxZS/3w9PXKZncC57+R6rqlCykUFRnGM80veRIN2SG1YiH
         DObouKt4JfFjswHpWE1023jfFQ33rZCkGg72Iyy2SHYgf2mROed+oSH3cGURxkG9f1be
         t1sjgYY8f+Cpxpm3iRrVMY8UkBJeyoEO8Q0DcXEW673USj29kP/TWXCh3fGJKna1NQAn
         gjRZ6Th5b4Rqcf0iGIeLiFGvJz8uiEbRah/8bSmmn37T41DL/11QzKnJDk76YNniaBBo
         a+5g==
X-Gm-Message-State: ANoB5plokM4S7vw3vn5NqIkm0c7UiiWSDNHrRUPWyXdyLXTPwtYFkk3+
	IyJ9sF+IjLjIqDdTqVZhPiE=
X-Google-Smtp-Source: AA0mqf40BqoLTnaMe7KKepcHRy+3CALc0i0fU1Ofeht6BxJh1xbaDrCqLfgMaEBr7aJ5vOrZAZD35g==
X-Received: by 2002:a17:907:8c09:b0:7ad:a2ef:c62 with SMTP id ta9-20020a1709078c0900b007ada2ef0c62mr2996712ejc.126.1668192799561;
        Fri, 11 Nov 2022 10:53:19 -0800 (PST)
Received: from [192.168.1.101] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709060f1500b007ad9adabcd4sm1135078eji.213.2022.11.11.10.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 10:53:19 -0800 (PST)
Message-ID: <b96d81ae-0314-435a-f1f2-e553811d2ff5@gmail.com>
Date: Fri, 11 Nov 2022 19:53:13 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] staging: r8188eu: some _FAIL, _SUCCESS removals
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221111083733.3144-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221111083733.3144-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/22 09:37, Michael Straube wrote:
> This series removes some more uses of _FAIL and _SUCCESS.
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (4):
>    staging: r8188eu: convert aes_cipher() to void
>    staging: r8188eu: convert rtw_xmit_resource_alloc() to common error
>      logic
>    staging: r8188eu: convert _rtw_init_xmit_priv() to common error logic
>    staging: r8188eu: binstallGrpkey is set to _FAIL
> 
>   drivers/staging/r8188eu/core/rtw_security.c |  4 +--
>   drivers/staging/r8188eu/core/rtw_xmit.c     | 37 +++++++--------------
>   drivers/staging/r8188eu/include/rtw_xmit.h  |  2 +-
>   drivers/staging/r8188eu/os_dep/os_intfs.c   |  4 +--
>   4 files changed, 16 insertions(+), 31 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
