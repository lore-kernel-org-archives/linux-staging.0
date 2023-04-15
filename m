Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF772103
	for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 12:43:27 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id kt6so14163886ejb.0
        for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 05:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681562605; x=1684154605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/U1EVhvmioxEWIZgOSAGDZ+lg8zKWYdBXw2nRcSafA=;
        b=XdjZ0ecoe3m5GeprHd2E/skpAQs49TAHnmG5JRrbqT79yKHwlx0WppkOsNO0w3GrfQ
         of0bdSWPjwrH7HgQXc4a9+alX6mpY8O444oxwYYRkYCiv7m5q2OtQWnxHKQApsdV5bDF
         UA6sS5HVCw5Vffyib2DLyQjmWqXmp6Wm5PQVjZWASBdrxfXmDKqAdwB/jZ6ct8rTgWRq
         xO6+OwSxwl4vRVIY+6cppz4+7eAvwEPABG/UCZrnAbCmHRkN05d+FC9FH7l445+4Rp2S
         Yvk5FAMEOKjOyM8MA5N/Z+AIZsDLr0r7c8MpIMmPyD5iC7O+8NHMRv1Zh5A4erZ0kDCR
         csHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681562605; x=1684154605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/U1EVhvmioxEWIZgOSAGDZ+lg8zKWYdBXw2nRcSafA=;
        b=boGtGPigBhvjAoFlvWOGkQ1aSFmzX+1UgNHXzxYuuNpHQLK2xK5D+0MXU2EpG//jyX
         2k0UZqh3/TxD45wsmDX1aRGwy8Ve0k0POFxIwdgwrBdawHXrcx+x4f8Hnh1v5pDtRoJJ
         jNdMFF5r8jxKphivENuoqefd+p524ugmQ6NOEIl77LuLfBtm8VAnLgArPcIWb6OkrbcZ
         d0d+0TjQaMm8WsOKSaWlUcHVCX5GgO6zgjQUbYANbSU+XiD+XH9welMZN3T4VYRQlJQU
         JLul5cdhwmOM8clcj6KsdO8zfS1cYhxiWacmGzkaumxosLp90M5fOA29x1e+ZDhmG2pW
         yXNg==
X-Gm-Message-State: AAQBX9dnJtxhc3RWKb+1HAoHPfIw7kk6RoU3awOXXHIbjWzO39Br+JAQ
	ssxsXSbwCCc4fJmnoZjQmmbs8Xc3coo=
X-Google-Smtp-Source: AKy350bpAeF1kQWWtp+NVI6jLeI+pEP8H1bmjGpmwhUF0/v/EjW29kjm9IGnzOKQGPIdU/IxKvu7Ew==
X-Received: by 2002:a17:907:77ce:b0:94f:3d8:3d80 with SMTP id kz14-20020a17090777ce00b0094f03d83d80mr2054728ejc.11.1681562605528;
        Sat, 15 Apr 2023 05:43:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id qc27-20020a170906d8bb00b0094f364b36acsm138665ejb.165.2023.04.15.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 05:43:25 -0700 (PDT)
Date: Sat, 15 Apr 2023 15:43:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luke Koch <lu.ale.koch@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: replace rate macros
Message-ID: <714c5d3f-438a-4633-a46e-127f876ffec4@kili.mountain>
References: <ZDqKb1iuoSQTYXJM@kernelhacking.kernelhacking.example.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDqKb1iuoSQTYXJM@kernelhacking.kernelhacking.example.com>

On Sat, Apr 15, 2023 at 01:28:47PM +0200, Luke Koch wrote:
> Change p80211msg_dot11req_scan_results rate members to struct arrays
> instead of individually numbered member structs.
> Replace macros to set rates with loops to avoid checkpatch warning
> and adhere to linux coding style.

Writing every sentence in imperative tense makes people sound like space
aliens in human skin...  You can if you want to but it's not a
requirement in staging.  There are two maintainers who have that
requirement and the Outreachy people.

> 
> Reported by checkpatch:
> 
> CHECK: Macro argument reuse 'N' - possible side-effects?
> 
> Signed off by: Luke Koch <lu.ale.koch@gmail.com>
> ---
>  drivers/staging/wlan-ng/p80211metastruct.h | 18 +-------
>  drivers/staging/wlan-ng/prism2mgmt.c       | 52 +++++++---------------
>  2 files changed, 18 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/p80211metastruct.h b/drivers/staging/wlan-ng/p80211metastruct.h
> index 4adc64580185..e963227f797c 100644
> --- a/drivers/staging/wlan-ng/p80211metastruct.h
> +++ b/drivers/staging/wlan-ng/p80211metastruct.h
> @@ -114,22 +114,8 @@ struct p80211msg_dot11req_scan_results {
>  	struct p80211item_uint32 cfpollreq;
>  	struct p80211item_uint32 privacy;
>  	struct p80211item_uint32 capinfo;
> -	struct p80211item_uint32 basicrate1;
                                 ^^^^^^^^^^
This starts at 1 instead of 0.

> -	struct p80211item_uint32 basicrate2;
> -	struct p80211item_uint32 basicrate3;
> -	struct p80211item_uint32 basicrate4;
> -	struct p80211item_uint32 basicrate5;
> -	struct p80211item_uint32 basicrate6;
> -	struct p80211item_uint32 basicrate7;
> -	struct p80211item_uint32 basicrate8;
> -	struct p80211item_uint32 supprate1;
> -	struct p80211item_uint32 supprate2;
> -	struct p80211item_uint32 supprate3;
> -	struct p80211item_uint32 supprate4;
> -	struct p80211item_uint32 supprate5;
> -	struct p80211item_uint32 supprate6;
> -	struct p80211item_uint32 supprate7;
> -	struct p80211item_uint32 supprate8;
> +	struct p80211item_uint32 basicrate[8];
> +	struct p80211item_uint32 supprate[8];
>  } __packed;
> 
>  struct p80211msg_dot11req_start {
> diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
> index 9030a8939a9b..069c39c36753 100644
> --- a/drivers/staging/wlan-ng/prism2mgmt.c
> +++ b/drivers/staging/wlan-ng/prism2mgmt.c
> @@ -437,42 +437,22 @@ int prism2mgmt_scan_results(struct wlandevice *wlandev, void *msgp)
>  		if (item->supprates[count] == 0)
>  			break;
> 
> -#define REQBASICRATE(N) \
> -	do { \
> -		if ((count >= (N)) && DOT11_RATE5_ISBASIC_GET(	\
> -			item->supprates[(N) - 1])) { \
> -			req->basicrate ## N .data = item->supprates[(N) - 1]; \
> -			req->basicrate ## N .status = \
> -				P80211ENUM_msgitem_status_data_ok; \
> -		} \
> -	} while (0)
> -
> -	REQBASICRATE(1);
> -	REQBASICRATE(2);
> -	REQBASICRATE(3);
> -	REQBASICRATE(4);
> -	REQBASICRATE(5);
> -	REQBASICRATE(6);
> -	REQBASICRATE(7);
> -	REQBASICRATE(8);
> -
> -#define REQSUPPRATE(N) \
> -	do { \
> -		if (count >= (N)) {					\
> -			req->supprate ## N .data = item->supprates[(N) - 1]; \
> -			req->supprate ## N .status = \
> -				P80211ENUM_msgitem_status_data_ok; \
> -		} \
> -	} while (0)
> -
> -	REQSUPPRATE(1);
> -	REQSUPPRATE(2);
> -	REQSUPPRATE(3);
> -	REQSUPPRATE(4);
> -	REQSUPPRATE(5);
> -	REQSUPPRATE(6);
> -	REQSUPPRATE(7);
> -	REQSUPPRATE(8);
> +	for (int i = 0; i < 8; i++) {
                 ^^^^^
Now it starts at zero.

> +		if (count >= i &&
> +		    DOT11_RATE5_ISBASIC_GET(item->supprates[i - 1])) {
                                                            ^^^^^
This is an array underflow.

regards,
dan carpenter

> +			req->basicrate[i] .data = item->supprates[i - 1];
> +			req->basicrate[i] .status =
> +				P80211ENUM_msgitem_status_data_ok;
> +		}
> +	}
> +
> +	for (int i = 0; i < 8; i++) {
> +		if (count >= i) {
> +			req->supprate[i] .data = item->supprates[i - 1];
> +			req->supprate[i] .status =
> +				P80211ENUM_msgitem_status_data_ok;
> +		}
> +	}
>  
>  	/* beacon period */
>  	req->beaconperiod.status = P80211ENUM_msgitem_status_data_ok;
> -- 
> 2.34.1
> 
