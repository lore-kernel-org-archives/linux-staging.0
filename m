Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BB36ADB
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 18:48:51 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id cn12so67247373edb.4
        for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680115730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GrKgNBdgVGDd5tuVm5wP/QWfKRU7XwBSou05qKklH3k=;
        b=Q8B3J857qhjR2TSPbJ1IJc6AAGDDCJRITn7O9RBll+yoLHHqTAfQeLs1CutVvnaRk+
         w3pcaW+fhER4vIQa7gwgHeHXo1+ijAKhfYhPMpXsTMT1mNCFRYPcJjdt4vlPoJGl9JAn
         sgDwzuDzJBIzHxwb3lEiW4tTyYBBJKDFFg6G+l/F27R+DmfM9r98Zkh28N7o40XxNpY+
         bvBMoGsRKqixep5wRcgokXu402Q0l/sPF3Up7deagSnLguMdWcEtq+5GOy5eb4G0/Ye2
         fHSuulIFU5ix8lkw4hCK/sycBVePrhVHTSU4Fb1x1SoX1tt9qSHS2uD9iWCRscv511Hs
         dTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680115730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GrKgNBdgVGDd5tuVm5wP/QWfKRU7XwBSou05qKklH3k=;
        b=Su5V9Ubx24VrXHwgE5jvJH7KEvagwSilrDgkrJFqHHA0RoD2Uk3/8if82atxgjXzru
         0s4QIQNePMCu03QKdyvhtLuWT9tw1XfDAPSdYQiF2WuaNJRs2qXJk5U8xLdXEfTcSM8K
         +C9TV4ico5wwEhZGI3SrfeO4JGuVHhNoHdqiLDLMjS5lNLHl2+5/9GAy7bNm4rgwF+ug
         2nDWgbX6CORmx1xAghihz/HEdWWpK8Dx8bvIN8t/YP56r2mxPoAnv8OQoMCkp9qShsZu
         cYjbmYgcYPjOnFCWWTfXYdSrSeHYB/o+VEUOEKEaaYUyZmRg7Y21XP2cJYpLKL0gXK4n
         VVHg==
X-Gm-Message-State: AAQBX9fHsV6xcLP8VaFSA2F1NP3/LpuhjaCm/H36RZwiusST5S0XwonZ
	c3nS2HcsECHSI4pey3607Gs=
X-Google-Smtp-Source: AKy350Z17p+zY9Y3XDg1dbwXrWoAxNYu5kA+LGkZtazrsFODsTnCrhNL91vsa/MRE1g5Ap9lhF2JVQ==
X-Received: by 2002:a05:6402:2811:b0:502:92d:4f51 with SMTP id h17-20020a056402281100b00502092d4f51mr24946261ede.1.1680115729529;
        Wed, 29 Mar 2023 11:48:49 -0700 (PDT)
Received: from [192.168.0.103] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id r17-20020a50aad1000000b005024459f431sm4008559edc.70.2023.03.29.11.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 11:48:48 -0700 (PDT)
Message-ID: <e6da0b51-7912-8b8b-4e34-6ca4bafe0384@gmail.com>
Date: Wed, 29 Mar 2023 20:48:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/5] staging: r8188eu: code cleanup and coding-style fix
 patches
To: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>,
 Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <cover.1679988016.git.abhirupdeb@linux.vnet.ibm.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1679988016.git.abhirupdeb@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/29/23 19:01, Abhirup Deb wrote:
> This series of patches fixes the coding-style issues
> reported by checkpatch.pl for the staging/r8188eu driver.
> 
> Abhirup Deb (5):
>    staging: r8188eu: add blank line after declaration
>    staging: r8188eu: refactor block-comments
>    staging: r8188eu: remove redundant else after return
>    staging: r8188eu: Replace "<<" with BIT macro
>    staging: r8188eu: place constants on right side of comparison
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 61 +++++++-------
>   drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  2 +-
>   drivers/staging/r8188eu/hal/rtl8188e_dm.c     |  2 +-
>   .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 10 +--
>   drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  2 +-
>   drivers/staging/r8188eu/hal/usb_halinit.c     | 23 ++++--
>   drivers/staging/r8188eu/include/ieee80211.h   | 82 +++++++++----------
>   drivers/staging/r8188eu/include/rtw_mlme.h    |  4 +-
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  6 +-
>   9 files changed, 98 insertions(+), 94 deletions(-)
> 


Hi,

sorry this driver was deleted: Please read:
https://lore.kernel.org/linux-staging/92a9442a-cece-4179-fbdc-3c9188da073e@redhat.com/

Please also check on which tree you are working on. This seems to be the 
wrong one.

If you need support I will help you.

Thanks for your support.

Bye Philipp
