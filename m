Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2961B68
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 17:44:09 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id s24so14369426plp.0
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 09:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xjl9+CEP43AsYHfS7KL6O6N3m1KhqAGplZ+XQFg3jQo=;
        b=YWgefyqzxxBD3rlgz3CG3XU0eq36CTeZVt//aHpCohfr2fHrU6xTlvDRaBnWh0bbPT
         PxrI7M/8IWvYBznnoAIo8IKWUMVES0sQDjR5772kxkrTs03I+VEcttQh5UGSJKibWImf
         /Ezx8ZN/hI72TV1W3NVEZfyc2bKX8wF1AJ8mPdtFXlgiSSzkfEdeQNjq7bQLYnTqz5km
         wIqrKtgFVk0s5BwVw5K99KC8e0oag8BDBUfFq7n7ymT7UkPuOiD1xkfCM10F+DN4ILFY
         pLBoVne4VcRixznWYrhdy+4zRDOTbkfVR647aWPF4dVzPIvN/cRTN2Ko/2XPNpr/i36K
         US5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xjl9+CEP43AsYHfS7KL6O6N3m1KhqAGplZ+XQFg3jQo=;
        b=sIgaI6/gPB2FPoV30RLwZOEf8u3y/jYgiymzszBQnTbfyUJtZ0R6g6lWnQCNbzoJV4
         9Z0X5wS6IRMxSeyvbp0f5XH4RJm0s5Jx9WfLbXxSQNJVyB23FF0wvUzrq6Thl99yA2MC
         eeKTUH33dpPN6BnyQV3AlUXFDc5Rtneqi9gyJ7V0FT8fvtGZWy8f47F0PVERNnWCmMen
         S9HYjyOY4OTOxiShQV46Kh8nbeqi0K2dSTAKKy4ED2dhrTxV81kX+oaUf6ieZbYuR+/N
         Vrw2hX47edFguEXt8Za4Zg56ZcPG7sBnEln6MPtMjXI80I4dXFbp6HRN+SPJkSHmGr4J
         AwkQ==
X-Gm-Message-State: AOAM533nxdM8VqH+n8txCT+AT6eQqafoX+SoyFg0yJ/lMEkbOnXvqN0G
	J5j2td1umT86hprb4Y/jLo41R7ffBGYF2odLyOotcQ==
X-Google-Smtp-Source: ABdhPJxINONf55fxJqdllPtpzr8XTcFEY4Av/x9s8kcehhAWTNeEb7kHflA42J/sEDupZtwyCOKhgDCJakICmgVRxMo=
X-Received: by 2002:a17:902:934c:b0:13d:c685:229b with SMTP id
 g12-20020a170902934c00b0013dc685229bmr64444159plp.25.1636307048598; Sun, 07
 Nov 2021 09:44:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211107173543.7486-1-Larry.Finger@lwfinger.net>
In-Reply-To: <20211107173543.7486-1-Larry.Finger@lwfinger.net>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sun, 7 Nov 2021 17:43:57 +0000
Message-ID: <CAA=Fs0mCkY4_5PJg++EWDcJaaTPjN6q3d6o2ZU_ZW4HBDPU4XA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: r8188eu: Fix breakage introduced when 5G code
 was removed
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zameer Manji <zmanji@gmail.com>, 
	kernel test robot <lkp@intel.com>, Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Nov 2021 at 17:35, Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
> In commit 221abd4d478a ("staging: r8188eu: Remove no more necessary definitions
> and code"), two entries were removed from RTW_ChannelPlanMap[], but not replaced
> with zeros. The position within this table is important, thus the patch broke
> systems operating in regulatory domains osted later than entry 0x13 in the table.
> Unfortunately, the FCC entry comes before that point and most testers did not see
> this problem.
>
> Reported-and-tested-by: Zameer Manji <zmanji@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 221abd4d478a ("staging: r8188eu: Remove no more necessary definitions and code")
> Cc: Stable <stable@vger.kernel.org> # v5.5+
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> ---
>
> v2 - fixed use of () rsther than {} - found by kernel test robot
> ---
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index 55c3d4a6faeb..5b60e6df5f87 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -107,6 +107,7 @@ static struct rt_channel_plan_map   RTW_ChannelPlanMap[RT_CHANNEL_DOMAIN_MAX] = {
>         {0x01}, /* 0x10, RT_CHANNEL_DOMAIN_JAPAN */
>         {0x02}, /* 0x11, RT_CHANNEL_DOMAIN_FCC_NO_DFS */
>         {0x01}, /* 0x12, RT_CHANNEL_DOMAIN_JAPAN_NO_DFS */
> +       {0x00}, /* 0x13 */
>         {0x02}, /* 0x14, RT_CHANNEL_DOMAIN_TAIWAN_NO_DFS */
>         {0x00}, /* 0x15, RT_CHANNEL_DOMAIN_ETSI_NO_DFS */
>         {0x00}, /* 0x16, RT_CHANNEL_DOMAIN_KOREA_NO_DFS */
> @@ -118,6 +119,7 @@ static struct rt_channel_plan_map   RTW_ChannelPlanMap[RT_CHANNEL_DOMAIN_MAX] = {
>         {0x00}, /* 0x1C, */
>         {0x00}, /* 0x1D, */
>         {0x00}, /* 0x1E, */
> +       {0x00}, /* 0x1F, */
>         /*  0x20 ~ 0x7F , New Define ===== */
>         {0x00}, /* 0x20, RT_CHANNEL_DOMAIN_WORLD_NULL */
>         {0x01}, /* 0x21, RT_CHANNEL_DOMAIN_ETSI1_NULL */
> --
> 2.33.1
>

Reviewed-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
