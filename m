Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E472
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 09:01:18 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id w4so40849977ljh.13
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=siiAMXMnOcYcUixi7P4UWut0ajuzZ/rlLvDcwhpsVN8=;
        b=T6W/S409kDF6euOFXYcn3jMOb11oSOhlNLY4877KSMn90D4JXqi9GCL4JEFrpU0Gh9
         UmistuDMNEXqklFJEN7XFS+/7vVT2m1EQlXJkPMDbgS76rmr2TiUCAkTaE0gWmc7/Y1e
         FXngZdcIy+PgEPmaCEgXs/LBcrUkHr2vFb3X2Qo+UdekMtBmzD8t01otcFUcJFr9FRVv
         UVrSb2Q3Q8cRhMg8kWlKT85lAT55+R73G1KxtExfEzkR+2e6f07W3hn1BoSgVPHUGLpa
         pJZdlSS01UEaw9JKcNg25zPk0DqulAYHiOBgURq1wiYJd69NCjKRWlFAxU3fmtFWqpUt
         8jbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=siiAMXMnOcYcUixi7P4UWut0ajuzZ/rlLvDcwhpsVN8=;
        b=dnhMgmmhoXbyd8e1er9qFBZaf/3sZnLy+314JYnHFhSd1dojokJxCUoWGWh97Wd5de
         dvQdYj79VIQSDZ20LcyIW8SuTBT4skFwaB9I1b24Ak4ki/JtPzPaAjxbu0HfsEzqRYKu
         iU9fsHCp0ppfdzTD8vOVQ491Ql4srv2Ol1MX8iDdTX9A+A2/24DtrSTbY4pZ8kjsfKQC
         DfmRvm3Ky0XzmL6Lyjbc/yeKpBBEhNoYN/XA0xnHOXj8xMow+L0M9Sv+zo65zY9GCC1W
         +ykxP7Scb+BFSnFYtgyG2bC2WrPsE1pJS+Xao8f2q5U36gexG51MnDO9DUIEwPNYJ6ge
         fJhA==
X-Gm-Message-State: AOAM533e90eMSwEh12IZ7NvCLjoL4ZtobKVuD0QxKOW8T4P8jzGnkZRk
	CxfQZhQfedFBRN2pSGmZt+w=
X-Google-Smtp-Source: ABdhPJwL6f9fMVll4vj4mAOF4Emm4RvgSlHl+++4R7LihmHN5mJX2b85jvac0GP219gpveQWOwnWEg==
X-Received: by 2002:a05:651c:1af:: with SMTP id c15mr12593575ljn.194.1629882075304;
        Wed, 25 Aug 2021 02:01:15 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id d6sm2005094lfi.57.2021.08.25.02.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 02:01:14 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] staging: r8188eu: Use usb_control_msg_recv/send()
 in usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20210825035311.8910-1-fmdefrancesco@gmail.com>
 <20210825035311.8910-2-fmdefrancesco@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <d1b3c63a-1dcb-72c1-451b-dcca5ea9b128@gmail.com>
Date: Wed, 25 Aug 2021 12:01:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210825035311.8910-2-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/21 6:53 AM, Fabio M. De Francesco wrote:
> Replace usb_control_msg() with the new usb_control_msg_recv() and
> usb_control_msg_send() API of USB Core in usbctrl_vendorreq().
> Remove no more needed variables. Move out of an if-else block
> some code that it is no more dependent on status < 0. Remove
> redundant code depending on status > 0 or status == len.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>


I cannot review the second one, since it's not applicable on top of 
staging-next :)




With regards,
Pavel Skripkin
