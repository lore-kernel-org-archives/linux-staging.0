Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C0D2C8B
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 02:46:09 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id t184so2415985pfd.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 19:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=y8CVbuJdv6pcQlvqtBOqCo8DJXJOq4fCIL+NtdfhBGM=;
        b=cftdgf3yXhUa5cMUgwewdt14ugyS+jkcnj2eELRaNzj6L8DX2rXdE65uRu/ZEWExJS
         aropop8bBJ0KYZyaAu0zj+4CeQlTp7FHbIfwqeit+uM6GKxwfasRcx4zhPuyRS+mwOww
         BmrDYvbhwFM5Y7eTF7QW72dFy7/cIjwnP6eoxJeXBIYA4Vm91a7xL8ZLeupdfw3VJK1F
         79ysaUnW8BOvRj5il1bkkD8fextqBA/okoI19VmYTcRGEZKVvZxGWXoiec5GfIwLCT9f
         +XcF1BhJyNnd1s4tIyy38XYNa1VzJ/EJ1zOgNMMGkZ1lD9jQiPQK90aMI4VLkUEslt5M
         n/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=y8CVbuJdv6pcQlvqtBOqCo8DJXJOq4fCIL+NtdfhBGM=;
        b=n1k5wmKb21JR0QvZi9kwu1utS9NlNCrtJM0eLZWAmoU0+2SrB0HiWjyObRu7scwz4f
         TgA9VlS7Yc1Wd1VKGpYoSDpxA2LzbDfmQw0pkoKw+91khFIMk64UkW8MYTIRxPVzHGQq
         znhKVksLBaB3fqEQHWAXjZEtgmLJNJExXRKBb2QJpCsbF551vffw+2YIHCWV9vhjJqB3
         VvT8ECXOySAbSVK8J9Mhk3KkKCD7ndYBYWu39lV3iI5Z1YJrFhoCh64Huegw2BhCfdu8
         Mf8RNutHT6DBI3WUmhn5JQmjvznWBIFjvIwy48SszzcOdtG/XmtHNAE+JV/8rMph1uuX
         CF6g==
X-Gm-Message-State: AOAM533IEIvVvOZ+jj6dVntwhEd+mWJ9oSntwlzC+r65w5PmoesJDlbr
	8zwsGtm2n5VgJ1Yj0Oqfx/4BHDBESYM=
X-Google-Smtp-Source: ABdhPJx9EcbcCW71a8YRsTc0x4Qwz1p6/OkqR6GKBaDKwAiEYKD21xM2xRzjGcxZYWBd1RovCW1G5w==
X-Received: by 2002:a63:ef58:: with SMTP id c24mr7225301pgk.299.1634870769622;
        Thu, 21 Oct 2021 19:46:09 -0700 (PDT)
Received: from ?IPV6:2405:201:d007:e827:d9ab:a6dc:54b8:e75d? ([2405:201:d007:e827:d9ab:a6dc:54b8:e75d])
        by smtp.gmail.com with ESMTPSA id x20sm7138393pjp.48.2021.10.21.19.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 19:46:09 -0700 (PDT)
Message-ID: <9f205c0b-2684-eab3-caa3-8222060723ad@gmail.com>
Date: Fri, 22 Oct 2021 08:15:54 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Outreachy kernel] [PATCH 0/4] staging: rtl8723bs: core: Cleanup
 patchset for style issues in rtw_cmd.c
Content-Language: en-US
To: Kushal Kothari <kushalkothari285@gmail.com>, gregkh@linuxfoundation.org
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, fmdefrancesco@gmail.com,
 marcocesati@gmail.com, straube.linux@gmail.com, philippesdixon@gmail.com,
 manuelpalenzuelamerino@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, mike.rapoport@gmail.com,
 kushalkotharitest@googlegroups.com, outreachy-kernel@googlegroups.com
References: <cover.1634845504.git.kushalkothari285@gmail.com>
From: Praveen Kumar <kpraveen.lkml@gmail.com>
In-Reply-To: <cover.1634845504.git.kushalkothari285@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22-10-2021 01:27, Kushal Kothari wrote:
> These patches make changes to clean up style issues identified
> by checkpatch. 
> 
> Kushal Kothari (4):
>   staging: rtl8723bs: core: Remove true and false comparison
>   staging: rtl8723bs: core: Remove unnecessary parentheses
>   staging: rtl8723bs: core: Remove unnecessary space after a cast
>   staging: rtl8723bs: core: Remove unnecessary blank lines
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 75 +++++++++++-------------
>  1 file changed, 35 insertions(+), 40 deletions(-)
> 

Please update the history against these patches and whats new in this series.

Regards,

~Praveen
