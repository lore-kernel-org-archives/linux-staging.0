Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFC153A4
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 17:39:36 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id lz22so5694476ejb.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 10:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YYE++NCGFbuUF2VRzA5/5zW4q4wqIZcX3o/nGchQf8s=;
        b=LF9CkMRcwYnu3iLOXzLr032DkmZzSgLT96pDi2AwJiHj86cv81EKt7yAgp9qHQCoR4
         6L1I5/gsQwovsT8lChuRDdZjIm+PlbSEyOgxb2UouUon5sGvP1zKt7Ki9RtZymxK7yj4
         vP2p2cQijIjNkW5qd0bgufN5S+njF2cLdrtE369ChbMRpdibv+QO+fqIDJXuLTZX8HfA
         2GOE3J13yieXvjG1kDael2tUGGftpvcF1JeWU3FNXGuw7PanEl5Eydtwacrx+sjjdiT4
         oFZBtAk13qd/+NNtquNK69Hu2Vb6g+OsOqMWrIPNQW+jYbVWXoTvaIZ8ju0ewyXvFhPS
         bBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YYE++NCGFbuUF2VRzA5/5zW4q4wqIZcX3o/nGchQf8s=;
        b=nT5aRfHXoXVyL2J9sqYDoJ16aP62PQpAn3A95YA62YxsmL6mkLnlqfD5cmVCl3tFuQ
         Gncj2pDj7DbuO9gVJI1K8X6dDo+CpqNBmH/mw8edkkNlEBKUB/wr8+scAga5pkQ5TWLO
         WBUs6ndoSZqmts5hqFh19+EQvgVarsi+vueVFeScL/IywV/pC7IPNtTbMWlMpE70QYrG
         HwU0sckKIY8PVzUmmC+UBY1/QFUGx5o64dK3WAFWInB3+I/NKoxM1MP3/d2o1Hi/HgJn
         9yWxxvXy2xugHGg8tWG0DzIrM9adnuozLKtHg/ADrt7Ts0ZlLINcDSbct4S/Gv77APTs
         BxCg==
X-Gm-Message-State: ACgBeo0G1rrjsfTNFxiS2vwsIq5Adwr6knDasPqr666Oafyy15HMQQx9
	8h9am/ceMV6SKoYkXGjQJWM=
X-Google-Smtp-Source: AA6agR5lG99FI09JSlZ4ykqdQS3DTFfWyclk+sJJ6K/gynUXQIvBEOhw+spaW3nSBdDzWGQaNAjv3w==
X-Received: by 2002:a17:906:7311:b0:772:a5c0:1f05 with SMTP id di17-20020a170906731100b00772a5c01f05mr8029064ejc.77.1662745174317;
        Fri, 09 Sep 2022 10:39:34 -0700 (PDT)
Received: from [192.168.1.102] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906340200b0073cc17cdb92sm544733ejb.106.2022.09.09.10.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:39:33 -0700 (PDT)
Message-ID: <d8e32b2a-380c-842b-cd9e-2da1bff1909b@gmail.com>
Date: Fri, 9 Sep 2022 19:39:32 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: make c2h_evt_read() static
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220909100232.8305-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220909100232.8305-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/22 12:02, Michael Straube wrote:
> The function c2h_evt_read() is only used in rtw_cmd.c.
> Make it static.
> 
> This addresses the TODO item:
> * Remove the HAL layer and migrate its functionality into the relevant
>    parts of the driver.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c    | 60 +++++++++++++++++++++
>   drivers/staging/r8188eu/hal/hal_com.c     | 63 -----------------------
>   drivers/staging/r8188eu/include/hal_com.h |  2 -
>   3 files changed, 60 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 4be83807405c..ca1f2cc52470 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1277,6 +1277,66 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
>   	return res;
>   }
>   
> +/* C2H event format:
> + * Field    TRIGGER      CONTENT     CMD_SEQ    CMD_LEN    CMD_ID
> + * BITS     [127:120]    [119:16]    [15:8]     [7:4]      [3:0]
> + */
> +static s32 c2h_evt_read(struct adapter *adapter, u8 *buf)
> +{
> +	s32 ret = _FAIL;
> +	struct c2h_evt_hdr *c2h_evt;
> +	int i;
> +	u8 trigger;
> +
> +	if (!buf)
> +		goto exit;
> +
> +	ret = rtw_read8(adapter, REG_C2HEVT_CLEAR, &trigger);
> +	if (ret)
> +		return _FAIL;
> +
> +	if (trigger == C2H_EVT_HOST_CLOSE)
> +		goto exit; /* Not ready */
> +	else if (trigger != C2H_EVT_FW_CLOSE)
> +		goto clear_evt; /* Not a valid value */
> +
> +	c2h_evt = (struct c2h_evt_hdr *)buf;
> +
> +	memset(c2h_evt, 0, 16);
> +
> +	ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL, buf);
> +	if (ret) {
> +		ret = _FAIL;
> +		goto clear_evt;
> +	}
> +
> +	ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 1, buf + 1);
> +	if (ret) {
> +		ret = _FAIL;
> +		goto clear_evt;
> +	}
> +	/* Read the content */
> +	for (i = 0; i < c2h_evt->plen; i++) {
> +		ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL +
> +				sizeof(*c2h_evt) + i, c2h_evt->payload + i);
> +		if (ret) {
> +			ret = _FAIL;
> +			goto clear_evt;
> +		}
> +	}
> +
> +	ret = _SUCCESS;
> +
> +clear_evt:
> +	/* Clear event to notify FW we have read the command.
> +	 * If this field isn't clear, the FW won't update the next
> +	 * command message.
> +	 */
> +	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
> +exit:
> +	return ret;
> +}
> +
>   static void c2h_evt_hdl(struct adapter *adapter, struct c2h_evt_hdr *c2h_evt, c2h_id_filter filter)
>   {
>   	u8 buf[16];
> diff --git a/drivers/staging/r8188eu/hal/hal_com.c b/drivers/staging/r8188eu/hal/hal_com.c
> index 8416a65ba47b..33967eb3c0d0 100644
> --- a/drivers/staging/r8188eu/hal/hal_com.c
> +++ b/drivers/staging/r8188eu/hal/hal_com.c
> @@ -137,66 +137,3 @@ void HalSetBrateCfg(struct adapter *adapt, u8 *brates, u16 *rate_cfg)
>   		}
>   	}
>   }
> -
> -/*
> -* C2H event format:
> -* Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
> -* BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
> -*/
> -
> -s32 c2h_evt_read(struct adapter *adapter, u8 *buf)
> -{
> -	s32 ret = _FAIL;
> -	struct c2h_evt_hdr *c2h_evt;
> -	int i;
> -	u8 trigger;
> -
> -	if (!buf)
> -		goto exit;
> -
> -	ret = rtw_read8(adapter, REG_C2HEVT_CLEAR, &trigger);
> -	if (ret)
> -		return _FAIL;
> -
> -	if (trigger == C2H_EVT_HOST_CLOSE)
> -		goto exit; /* Not ready */
> -	else if (trigger != C2H_EVT_FW_CLOSE)
> -		goto clear_evt; /* Not a valid value */
> -
> -	c2h_evt = (struct c2h_evt_hdr *)buf;
> -
> -	memset(c2h_evt, 0, 16);
> -
> -	ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL, buf);
> -	if (ret) {
> -		ret = _FAIL;
> -		goto clear_evt;
> -	}
> -
> -	ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 1, buf + 1);
> -	if (ret) {
> -		ret = _FAIL;
> -		goto clear_evt;
> -	}
> -	/* Read the content */
> -	for (i = 0; i < c2h_evt->plen; i++) {
> -		ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL +
> -						sizeof(*c2h_evt) + i, c2h_evt->payload + i);
> -		if (ret) {
> -			ret = _FAIL;
> -			goto clear_evt;
> -		}
> -	}
> -
> -	ret = _SUCCESS;
> -
> -clear_evt:
> -	/*
> -	* Clear event to notify FW we have read the command.
> -	* If this field isn't clear, the FW won't update the next
> -	* command message.
> -	*/
> -	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
> -exit:
> -	return ret;
> -}
> diff --git a/drivers/staging/r8188eu/include/hal_com.h b/drivers/staging/r8188eu/include/hal_com.h
> index e8007295cd79..cd3f845e146a 100644
> --- a/drivers/staging/r8188eu/include/hal_com.h
> +++ b/drivers/staging/r8188eu/include/hal_com.h
> @@ -143,6 +143,4 @@ u8 MRateToHwRate(u8 rate);
>   
>   void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg);
>   
> -s32 c2h_evt_read(struct adapter *adapter, u8 *buf);
> -
>   #endif /* __HAL_COMMON_H__ */

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
