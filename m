Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65183FC1
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 14:04:45 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id g14so11535934ljk.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 07:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z66n7Klv98ugqFOF5GUDxxDBgLweu1M8Wtpm3iZu2pU=;
        b=pyoBGjP2KlMAvkfNzkOaOTVl/6MmW1ctP9c0Z09ut+tciH6Up98jF9/On32+ziYb6y
         OLtgbWXH5Y9yGUKq1qx6AQuWQNFmOwcKw2J7nZ47kHIlfFL08uGQkGToC1DiVG9dsy3g
         vDkDlTyKqGw/OrV/zUvAsIXiBzP+vYvOXfBgn4Bwp7FnTqBUCoAVxwiiYTowqJ1+s0zp
         3kCiHeXY3oESNMO00NzXYsHOFb5YMHHiSsAYotf4xBU2fDrj4AoYXXID25M2fGLrRrzR
         t23+rMaXe4Kmwj61AFfWUtD9yUv35FUwgUzInw7aFQlhZsJF8wzNYpqnti4AYw71Gp5r
         v5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z66n7Klv98ugqFOF5GUDxxDBgLweu1M8Wtpm3iZu2pU=;
        b=aPcAQnQjv062MArle/F7CmkJfGGX6PwCS/mEreAt669BxVjWwQKf/p7yJ2ztTJ3nro
         XxqQNCVgMigZxfR2MCKDLBfbzXHhVuaLOmx4UUrV1s2tqqtmMLFJh7Gd/I+rAB+goKr9
         MPdWwOK5atp/BUUra9DQ2RmRjlz6JBED1WdO7S7HONZRrAlMEdRwwrFW0LsyujlLa1rE
         RBUeQUaETyWE9ZohowmEcgWz1QjmmBAEqZrU2Z/odVaWvJpsI35eQarSAxRLyCjJ6yrf
         xmvcPTc0in2PvihvRhibcNH2qUbbdTvCfAmWRQcDUTLrhILaihx+bq6ZACdBpw2c5XLb
         gyQw==
X-Gm-Message-State: AOAM531XNpedYOS3Y/MJwDS+Dd5nn2XSyY+wHtS41dDPY9Z9U0BDXdpm
	DL6+2B9zfHnP0Dn34Q5/0Sc=
X-Google-Smtp-Source: ABdhPJycvZ90BGex/QMFxYA45cl3Cr2egPrVoIDho5a0HnrXAvlphkwcnx3O+RleIzImvuPWSlftVw==
X-Received: by 2002:a05:651c:211c:: with SMTP id a28mr10859531ljq.8.1630937083627;
        Mon, 06 Sep 2021 07:04:43 -0700 (PDT)
Received: from localhost.localdomain ([46.61.204.60])
        by smtp.gmail.com with ESMTPSA id q189sm1035298ljb.68.2021.09.06.07.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 07:04:43 -0700 (PDT)
Subject: Re: [PATCH 1/3] staging: r8188eu: remove _io_ops structure
To: Dan Carpenter <dan.carpenter@oracle.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210904150447.14659-1-fmdefrancesco@gmail.com>
 <20210904150447.14659-2-fmdefrancesco@gmail.com>
 <20210906074910.GG1957@kadam>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <aec7eb51-721a-d2c1-4eba-c4adbb8265c3@gmail.com>
Date: Mon, 6 Sep 2021 17:04:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210906074910.GG1957@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/6/21 10:49 AM, Dan Carpenter wrote:
> On Sat, Sep 04, 2021 at 05:04:45PM +0200, Fabio M. De Francesco wrote:
>> -static int usb_writeN(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata)
>> +int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata)
>>  {
>> +	struct io_priv *pio_priv = &adapter->iopriv;
>> +	struct intf_hdl *pintfhdl = &pio_priv->intf;
>>  	u16 wvalue = (u16)(addr & 0x0000ffff);
>>  	u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
>> +	int ret;
>>  
>>  	if (length > VENDOR_CMD_MAX_DATA_LEN)
>>  		return -EINVAL;
> 
> The caller treats this negative return as success.
> 

Oh, good catch, thank you so much for pointing it out... This driver 
uses unusual approach for error handling with private _SUCCESS and _FAIL 
macros and I forgot to call RTW_ERROR_CODE :(

>>  
>>  	memcpy(buf, pdata, length);
>> +	ret = usbctrl_vendorreq(pintfhdl, wvalue, buf, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
>>  
>> -	return usbctrl_vendorreq(pintfhdl, wvalue, buf, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
>> +	return RTW_STATUS_CODE(ret);
>>  }
> 
> [ snip ]
> 
> 
>> -void usb_read_port_cancel(struct intf_hdl *pintfhdl)
>> +void rtw_read_port_cancel(struct adapter *adapter)
>>  {
>>  	int i;
>> -	struct recv_buf *precvbuf;
>> -	struct adapter	*padapter = pintfhdl->padapter;
>> -	precvbuf = (struct recv_buf *)padapter->recvpriv.precv_buf;
>> +	struct recv_buf *precvbuf = (struct recv_buf *) adapter->recvpriv.precv_buf;
>>  
>>  	DBG_88E("%s\n", __func__);
>>  
>> -	padapter->bReadPortCancel = true;
>> +	adapter->bReadPortCancel = true;
> 
> In these functions it would be better to rename "padapter" as "adapter"
> in a follow on function.  Keep it the same for now just to make review
> easier.
> 

Ok, will bring old name back in v4. Thank you for review :)




With regards,
Pavel Skripkin
