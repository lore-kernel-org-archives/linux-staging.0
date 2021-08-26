Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704DA72
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 17:20:01 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id n27so7914855eja.5
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gKDMhXdQnvrNiUefbL8YYDU0RU2rIxixwkrpgN6Y9og=;
        b=oE1G+X2nBsCr3jel92P+uJhIg6GC6JURdrcpUlOYAanMiifujQEaChfXsR4XBBs2lW
         e0exiqokL3IWOkpp4VqLUfYy7tHIHZc+8xXFwnU9GW3GrVcJ7qAhSTwjvtxpP1iUv/fo
         M04fzyzdvnBKod9BN2cfbNuDVF77rl9GGTlXoERqvCzrATYz9r3hV9IFY+n1a8QAb0pN
         SzUJ3YhXNlDDS57g6P2C5fghN6DWv1/9HytOK2T2RT5q/OWk/btDDrTugYi3yg1ExLrX
         9+IUqyhVjoNqOtOjDzgDOkxdKQO9kXlLKUmyoShoDfSyWqdbznGxdcZlkao4785HB950
         OhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gKDMhXdQnvrNiUefbL8YYDU0RU2rIxixwkrpgN6Y9og=;
        b=mhXh2fkkD+IIPcEMbmTvr48HZho6gpO0iGL9seuQxOX1xRAonMGXx3WX+lebOgmIXj
         d14IC8N5rpiO/FTcvqWsw/QjoG/RvgaZFyJvoehCjkhIy+Wh7gSIQXNBzHKEkFkHKyIG
         rSLVguMXSbOP91C35DtGXGHXn/cNz2ZdgUpvqhvXAKruxfnojkj8nphsCVv7U6X1hav3
         9vK4YSAfh2nUQjwERXmxDh4/uzzgx3t7jMstOYUOFjKj5Hmwi/7pu0/6O2FrxDAI59jE
         TwiVe5ZfGpm2Bc8aadybboUBZOCI0F7Rm+dj+dd6uo22qq2vMA87urhiVtnoIMrjwi4R
         B3fw==
X-Gm-Message-State: AOAM5302UCo21kcbLQI3igKWwVTOU+N+RD/p4h9M+/jxjWudA3G3n9Iv
	oaIJfmQ9zcSoT5siCeNWwRg=
X-Google-Smtp-Source: ABdhPJxHJE+7Lidd55kajB/jmfZrqjn2YoeEFEMX8YdUhYVQoZsAIJZJARLqAtKPhPoe9Y40ulN4sQ==
X-Received: by 2002:a17:906:39d5:: with SMTP id i21mr5428615eje.529.1629998399796;
        Thu, 26 Aug 2021 10:19:59 -0700 (PDT)
Received: from agape.jhs ([5.171.80.9])
        by smtp.gmail.com with ESMTPSA id lu4sm1594568ejb.103.2021.08.26.10.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 10:19:59 -0700 (PDT)
Date: Thu, 26 Aug 2021 19:19:55 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Wenlong Zhang <yixiaonn@gmail.com>
Cc: gregkh@linuxfoundation.org, ross.schm.dev@gmail.com,
	marcocesati@gmail.com, insafonov@gmail.com, cyruscyliu@gmail.com,
	yajin@vm-kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: prevent ->ssid overflow in
 rtw_wx_set_scan()
Message-ID: <20210826171954.GA1423@agape.jhs>
References: <20210826154622.55361-1-yixiaonn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826154622.55361-1-yixiaonn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Welong,

On Thu, Aug 26, 2021 at 11:46:22PM +0800, Wenlong Zhang wrote:
> Commit 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
> fixed up the staging driver rtl8188eu by adding another check 
> to prevent writing beyond the end of the ->ssid[] array.
> 
> Resolve this by properly fixing up the rtl8723bs driver's version of
> rtw_wx_set_scan() 
> 
> Reported-by: Wenlong Zhang(iLifetruth) <yixiaonn@gmail.com>
> Fixes: 74b6b20df8cf ("staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()")
> 
> Signed-off-by: Wenlong Zhang <yixiaonn@gmail.com>
> 
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
> index 902ac8169948..6fc1020cea11 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
> @@ -1351,9 +1351,9 @@ static int rtw_wx_set_scan(struct net_device *dev, struct iw_request_info *a,
>  
>  					sec_len = *(pos++); len -= 1;
>  
> -					if (sec_len > 0 && sec_len <= len) {
> +					if (sec_len > 0 && sec_len <= len && sec_len <= 32) {
>  						ssid[ssid_index].SsidLength = sec_len;
> -						memcpy(ssid[ssid_index].Ssid, pos, ssid[ssid_index].SsidLength);
> +						memcpy(ssid[ssid_index].Ssid, pos, sec_len);
>  						/* DBG_871X("%s COMBO_SCAN with specific ssid:%s, %d\n", __func__ */
>  						/* 	, ssid[ssid_index].Ssid, ssid[ssid_index].SsidLength); */
>  						ssid_index++;
> -- 
> 2.15.0
> 

today the patch which removes wext handlers has been accepted
in staging-testing so maybe rtw_wx_set_scan is going to disappear.

thank you,

fabio
