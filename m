Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8413D98
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 19:35:56 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id rq15so7778394ejc.10
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 12:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=znMiuLtPPIpLgWBCzArU4bLlFvXoiSKJfPgx/vuRq3Y=;
        b=oGiQ19fmM36ySn6hnM/Kc3RBnM+VyBrBGURWcFUC3e1Xcky6/UxMxltKXyYK0QMHXC
         DpxfY7NiRu9fFBkBtPmNB7qZkY9Yk2jDIIn96P9B4dhdZdXQzAuUMze6NlDfr9G1YNxE
         ZbOFT8jStPcPqiENo1YFx9V+DwiqSoxz+tyLs4wahUCFaNhCI2hp+yCUzKccQzPc18Se
         EYNL7DF2X1D4WCjLmraOcP0Z9sAZqus1fMWlzHcsmmnwIMURpkVXSvCwqSvCrCVZc66a
         NuddmHClYUlKLWRZW2k11Not7djZIpEBmSkPjPWeN9fjDwHXtNFtnns+y7Q6Dls4cHm+
         tBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=znMiuLtPPIpLgWBCzArU4bLlFvXoiSKJfPgx/vuRq3Y=;
        b=h40hAz2iYx/PeoJGEpcFr7jmnU4NuZb43i8puqojQCx8m/jFbJ7++W3ddBIf/y8frM
         7t6tCnN3hKE8RYrgwPf8Hxe1XtvTaJRzycoYwLlxfB68YfGRghICsMGdbYnq3UgLb6EM
         nNOxYhkefYnGH0ZgW40HGSETSEKWPQLNbGVdlX/JdEBQMW9BwoNHg1BGmU2j5fMvlZvj
         PfC1zoY12pj1E6YFRCP/prlv+aShHrRLnv9XW3VeRhYhOK4+6Bc93bnBSNSGnxuyeAj2
         UPNqNLPQhCc+Xj5oCIR47Ty84j0ssUHLz4MXMlvP5kfcILmBDw0JjOgD0HhaSrrHKnsj
         J2pg==
X-Gm-Message-State: AJIora+2T/lmFruqcM9dWM1ydH8zwW0kfXtiNiAYVzlq6KE1AQCgqxLI
	MApvMtBdMPtZhm7M6NfBr2U=
X-Google-Smtp-Source: AGRyM1uHP719Ybc+4zG0bI975OB3+ZffJMtmMa47CoQveZhyDa8+b+XFiSDi+Jk35PLiRXZriKNiRQ==
X-Received: by 2002:a17:906:ef8b:b0:72b:45a2:2232 with SMTP id ze11-20020a170906ef8b00b0072b45a22232mr6947078ejb.484.1659209754774;
        Sat, 30 Jul 2022 12:35:54 -0700 (PDT)
Received: from [192.168.1.102] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id e6-20020aa7d7c6000000b0043a61f6c389sm4265368eds.4.2022.07.30.12.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jul 2022 12:35:54 -0700 (PDT)
Message-ID: <749e2a31-cde9-ef80-f290-3a7a36c92636@gmail.com>
Date: Sat, 30 Jul 2022 21:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] staging: r8188eu: report errors from
 ReadAdapterInfo8188EU
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220730143939.671951-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220730143939.671951-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/22 16:39, Martin Kaiser wrote:
> Update the ReadAdapterInfo8188EU to return an error code. Change the
> calling function to relay these errors to the driver's probe function.
> 
> Martin Kaiser (3):
>    staging: r8188eu: handle errors from ReadAdapterInfo8188EU
>    staging: r8188eu: make rtw_handle_dualmac a void function
>    staging: r8188eu: return an error code in rtw_usb_if1_init
> 
>   drivers/staging/r8188eu/core/rtw_wlan_util.c |  5 +-
>   drivers/staging/r8188eu/hal/usb_halinit.c    |  7 +--
>   drivers/staging/r8188eu/include/drv_types.h  |  2 +-
>   drivers/staging/r8188eu/include/hal_intf.h   |  2 +-
>   drivers/staging/r8188eu/os_dep/usb_intf.c    | 49 +++++++++++---------
>   5 files changed, 33 insertions(+), 32 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
