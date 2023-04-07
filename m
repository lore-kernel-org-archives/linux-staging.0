Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273D2582
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 21:02:10 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-947a47eb908so89715066b.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Apr 2023 14:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680901328; x=1683493328;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPcKdBRSdTG+FoVQj+kLiPvFB7VrPFru5LsqZmAmx20=;
        b=l4F/ErgZZ6pMP8I8zZc3yQHipp9CKB7I6l//amZdnTi84bFTdEUpePK+nAZnoJaHto
         UJhhWFDiuAXIaRrUy/NIlHF5V+JYyNjuRo5irbhxvTIPbo+kJB+5iKce2VKMAhSf/5Ij
         hKnIdNnBPw6IJU+xwM264fRHWIrOO0KirRGIyvDYyklVvbdVnHM7dVk0KiyHhc/9WRUH
         sJqoAPmrFe7mFgUMfkEzycqRDfLE/JAijMXKMenueVZ81YCRkL2zwNsdBSE+yB8rM1ga
         0TerRYP+/lp96gMaFWbz7yT3TGsXmzmz2f/A13SgyNFw1gDZck9Tid7+VeUvRHKRyvgY
         dlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680901328; x=1683493328;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPcKdBRSdTG+FoVQj+kLiPvFB7VrPFru5LsqZmAmx20=;
        b=CyAmPju+McyF85u4D1kZXkenQX1R/DExzPQVL1QS5LHAbzI6vUHZl3W9+z1lOg4tn6
         AScQQHBmQxxG8xQnyf7PimYQBTFUBTsCDYB8MY7o1/t+qktJZcQQGVr9EmzNah1JNyle
         fXGMJ/VQ1jgxndtynuPZQmDLjNgFDpnODWbEKkSZhMfkbmC0pBfms0RMs0GqN5fQpAov
         epe0GQFkHAc90SwmjgDDRF62b0M6E16DthHrNyVyirFRWpn81vQtucYve1TH3Vso2C6G
         xluHzvP5sz6kx1Xa9WvQKS3pcgCZQlFMvx1FDPvlGVURF/Hip6N1ScTTYgkZqkf1YC9a
         8NTg==
X-Gm-Message-State: AAQBX9cE+/5z+XH991QAkBGEXeKwUph+HekvSaffv3s1ET/74W5VpV9R
	DXt4bNZ+uAULYila2LxOTho=
X-Google-Smtp-Source: AKy350YrQLmUc4IVssaOzvjGV2ceDC4ifXsiXlT8LRI7cfgURUDQWMNpPVC1cttXrVeZZq5SPi5PRQ==
X-Received: by 2002:a05:6402:4413:b0:502:465:28d4 with SMTP id y19-20020a056402441300b00502046528d4mr763142eda.1.1680901328081;
        Fri, 07 Apr 2023 14:02:08 -0700 (PDT)
Received: from [192.168.0.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id ek14-20020a056402370e00b005028e87068fsm2228219edb.73.2023.04.07.14.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 14:02:06 -0700 (PDT)
Message-ID: <248ec330-b4c3-aa7b-61eb-69ce8d333b69@gmail.com>
Date: Fri, 7 Apr 2023 23:02:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [BUG] staging: rtl8192e: W_DISABLE# does not work after stop/start
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <39dc735c-fd6d-e405-856c-788a52704d63@gmail.com>
In-Reply-To: <39dc735c-fd6d-e405-856c-788a52704d63@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

When loading the driver for rtl8192e, the W_DISABLE# switch is working 
as intended. But when the WLAN is turned off in software and then turned 
on again the W_DISABLE# does not work anymore.

Reason for this is that in the function _rtl92e_dm_check_rf_ctrl_gpio()
checking this every two seconds is an conditional return.

	if (priv->bfirst_after_down) {
		priv->bfirst_after_down = true; // PH: useless line
		return;
	}

	tmp1byte = rtl92e_readb(dev, GPI); // PH: GPI for W_DISABLE#

bfirst_after_down is set true when switching the WLAN off in software. 
But it is not set to false again when WLAN is turned on again.

Thanks for your support.

Bye Philipp

