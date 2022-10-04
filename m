Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F71180
	for <linux-staging@lists.linux.dev>; Tue,  4 Oct 2022 21:04:01 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id e18so20480002edj.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Oct 2022 14:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=17w3gdHvImQEYtLTo5SQ8vFE2MjSARr+CYFp5Fzooes=;
        b=GHb7Ofl8yMnN/vxIwTzRT8sTY0WUq+TQVEs+yGpJbtH7/zl+0WSKjtBhwD1NDCfu5U
         uLjOZbSWxLyWgkTZaFw2Dyk/CY+Xtdi0ygJx0aYKdmZ3jiiC0oSxj0nDK1FKHi7YruA1
         Odoud72ffcGCfI4uJruEZhLKcCo9+gfyB1YuTH1XpLDbIPMHrqLaFWkgEpW3WNsM4Fiu
         gmk/6GrEQNhYL717E8s6IOeM0Etveygl90DXib4zvEplMgCz2PwNhq6YVT3kDlwa6hgT
         /uxnrV414lARF8+LmmaHdRipiSPrpf84RnAjyXGXiIQ95Sf4PFIVF2np+RCqH8HNwiep
         4bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=17w3gdHvImQEYtLTo5SQ8vFE2MjSARr+CYFp5Fzooes=;
        b=DWhxjM5CWYuKP89WG50bBsvmdylFkBPb0Jj2E5y9ybHi86XEf04kfrPYD7G8ZQPGTe
         Zsg8x9hXAee9NdkS6/rkvplKK+FU487CKeAjrPgn1kOe6e7PnK9HZPjeZ2wQnjtoPKZT
         Qd/OwQbhUVODyvO/FtiJEpzqLNE68wy1m1GDYHmbN29vFseq+BF+GjhQTAGMnPlqKxgi
         mn0HSbeIROo8/OAbrVy5+mgT6F1a36Gqom3tCSIRzk9UrYvCIs44MPpMNPtI4lB7fKGl
         BPWFmP7faEUPZPHZk2ebayrLp6ZHgMVBpAWkFIk/xTzCMNFyoU7bfviDIhtNFlMF8vUo
         yUGQ==
X-Gm-Message-State: ACrzQf1Ufh+AbSk/3yNIKsB3q7KaIIzKiY14njq3AS9F+D1QRjLxAbFV
	QhYS/8vQrSqzFHbbOLAlK2Q=
X-Google-Smtp-Source: AMsMyM5K66IblAN1jpbHfg21sihCNmcdP+aZKquitqQ9YNWO52AAaP05616LhU4KyLGcIOI+S1ocbQ==
X-Received: by 2002:a05:6402:4305:b0:451:7b78:f2e0 with SMTP id m5-20020a056402430500b004517b78f2e0mr26095713edc.342.1664917439394;
        Tue, 04 Oct 2022 14:03:59 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a06:125d:3a8d:82a2:428d? (p200300c78f3e6a06125d3a8d82a2428d.dip0.t-ipconnect.de. [2003:c7:8f3e:6a06:125d:3a8d:82a2:428d])
        by smtp.gmail.com with ESMTPSA id r17-20020a056402019100b00458c7d569f7sm2303977edv.60.2022.10.04.14.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 14:03:58 -0700 (PDT)
Message-ID: <6f452347-2fe5-71df-9d15-7ed71f319fea@gmail.com>
Date: Tue, 4 Oct 2022 23:03:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192u: Fix spelling mistake athros -> Atheros
 and fix grammer
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004150944.148157-1-colin.i.king@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221004150944.148157-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/22 17:09, Colin Ian King wrote:
> There is a spellig mistake, correct it and fix capital letter on the
> proper noun. Also fix the grammar.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> index b58e75932ecd..f142d0986990 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> @@ -1806,7 +1806,7 @@ int ieee80211_parse_info_param(struct ieee80211_device *ieee,
>   				info_element->data[0] == 0x00 &&
>   				info_element->data[1] == 0x13 &&
>   				info_element->data[2] == 0x74)) {
> -				netdev_dbg(ieee->dev, "========> athros AP is exist\n");
> +				netdev_dbg(ieee->dev, "========> Atheros AP exists\n");
>   				network->atheros_cap_exist = true;
>   			} else
>   				network->atheros_cap_exist = false;

Hi Colin,

often this type of debug messages get removed instead of being fixed.

I do not know what the maintainer will decide in this case. I tend to 
remove.

But for more patches you may want to use:
./scripts/checkpatch.pl --file 
drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c

Here just a small output of what checkpatch does not like:

WARNING: quoted string split across lines
#2079: FILE: drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c:2079:
+		IEEE80211_DEBUG_SCAN("Filtered out '%s (%pM)' "
+				     "network.\n",

CHECK: Avoid CamelCase: <SignalStrength>
#2095: FILE: drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c:2095:
+	stats->signal = 30 + (stats->SignalStrength * 70) / 100;

WARNING: Block comments use a trailing */ on a separate line
#2110: FILE: drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c:2110:
+	 * as one network */

Please also have a look at:
https://lore.kernel.org/linux-staging/
For inspiration.


https://www.mail-archive.com/kernelnewbies@kernelnewbies.org/

For further questions:
https://www.mail-archive.com/kernelnewbies@kernelnewbies.org/msg22219.html

Bye Philipp

