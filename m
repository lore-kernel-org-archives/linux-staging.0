Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8553FC5
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 14:55:05 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id i4so34238080lfv.4
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tbIaVgIRborS29ExnenuQtKkgQzD/aCW5doVvSOFCmc=;
        b=aagdDOhuPclEjLm5C4TkOkVlz9trZPPvc9n3R9GmHO7f4j7h1KX0X2WwZF4B8hYrmk
         rYurw59jw/ouyZJuSOj7aNBDd6FktOJTCZtp6nl/p0rHCm0hJwnDjc6dj4HL6FY/xoKt
         5EKySJ3x/klahyohycj5tqYHjsZW1XCFLZZYM0g+lmwE7aFNIAmlKYV6K3nGEaNBZG75
         jWQkA7vj5FNH5XLWlzHorlycdrtTgJ7Pjz3HtXLSpfuRcd40VZKLsAnMeia0cdJdyQa5
         aW7dp6dmcdycKtbyRR6Pv4JKn1OAorp+vl5EXz+gQf7GyAj3BV4ypRJpGJDKUBA5U3vJ
         kViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tbIaVgIRborS29ExnenuQtKkgQzD/aCW5doVvSOFCmc=;
        b=SnS1fI4OkDDNaCo+V8xwXcGeiyiAhDrHImbDJWzFe1T0SsLXM4sl2tBizLYqT7GzUU
         7E5su0wHz26aojcKZJQuz5x7OlGedX8XcoRYAGz6MPr0HoH9w0W3+ExQ5RZQ/7wYwScT
         0gS5PT2QhwfIz2P3EgymksTIZjvttrnPCo1UmvNX1ibJJ2xHlDXDQ5f9G6KA5MUWfmiK
         Vo2lLmNf5lBvNW9518SaipZTIgLlqoiAWzcpAEZiUukyXdtBNtIOBSC3NsavPdUC13XI
         jFrXyZuDkghpbo3KtnAvcZXdKW0CVaxia9qXlHHuLPnK/dw39sfoAxIhSTHi9+lLNOKV
         zPSQ==
X-Gm-Message-State: AOAM531kIkG9fXSWNQ5nP1nETUIWEVkIzXXWtvh7NLHbFQHYCYb1wUsG
	E8aDGWhvyzV4qV2Y0MvuPeo=
X-Google-Smtp-Source: ABdhPJxkYs5E1dpRkNK2q8894HjghqnPnN1fTHuic65dcyegIqw0lLOTMKTECIT2u772HKx/OZ+9CQ==
X-Received: by 2002:a05:6512:1383:: with SMTP id p3mr6408059lfa.447.1631890497077;
        Fri, 17 Sep 2021 07:54:57 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.49])
        by smtp.gmail.com with ESMTPSA id t133sm546399lff.58.2021.09.17.07.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 07:54:56 -0700 (PDT)
Message-ID: <80bab0d7-1d6b-39d1-c1a9-ba87f51f03a8@gmail.com>
Date: Fri, 17 Sep 2021 17:54:54 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v7 17/19] staging: r8188eu: shorten calls chain of
 rtw_read{8,16,32}()
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210917071837.10926-1-fmdefrancesco@gmail.com>
 <20210917071837.10926-18-fmdefrancesco@gmail.com>
 <YUSrIqW5WSYuoa14@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YUSrIqW5WSYuoa14@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/21 17:50, Greg Kroah-Hartman wrote:
> On Fri, Sep 17, 2021 at 09:18:35AM +0200, Fabio M. De Francesco wrote:
>> Shorten the calls chain of rtw_read8/16/32() down to the actual reads.
>> For this purpose unify the three usb_read8/16/32 into the new
>> usb_read(); make the latter parameterizable with 'size'; embed most of
>> the code of usbctrl_vendorreq() into usb_read() and use in it the new
>> usb_control_msg_recv() API of USB Core.
>> 
>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> ---
>>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 59 +++++++++++++++++++--
>>  1 file changed, 56 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
>> index 2d5e9b3ba538..ef35358cf2d3 100644
>> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
>> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
>> @@ -89,6 +89,59 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
>>  	return status;
>>  }
>>  
>> +static int usb_read(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
>> +{
>> +	struct adapter *adapt = intfhdl->padapter;
>> +	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
>> +	struct usb_device *udev = dvobjpriv->pusbdev;
>> +	int status;
>> +	u8 *io_buf; /* Pointer to I/O buffer */
> 
> As you "know" size is not going to be larger than 4 (hint, you should
> prboably check it), just use bytes off of the stack here, and you can
> ignore this buffer entirely.  That will hopefully allow you in the
> future to get rid of that buffer as odds are it will not be needed
> anymore.
> 
>> +
>> +	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
>> +		return -EPERM;
> 
> How is it ok to check this outside of the lock?  What happens if these
> values change right _after_ you check them?
> 
> Why check them at all, is this something that we even care about?
> 
> I know you are trying to make this just the same logic at is there
> today, but why not just do it right the first time?
> 
>> +
>> +	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
>> +
>> +	io_buf = dvobjpriv->usb_vendor_req_buf;
>> +
>> +	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
>> +				      REALTEK_USB_VENQT_READ, addr,
>> +				      REALTEK_USB_VENQT_CMD_IDX, io_buf,
>> +				      size, RTW_USB_CONTROL_MSG_TIMEOUT,
>> +				      GFP_KERNEL);
>> +
>> +	if (status == -ESHUTDOWN ||
>> +	    status == -ENODEV ||
>> +	    status == -ENOENT) {
>> +		/*
>> +		 * device or controller has been disabled due to
>> +		 * some problem that could not be worked around,
>> +		 * device or bus doesn’t exist, endpoint does not
>> +		 * exist or is not enabled.
>> +		 */
>> +		adapt->bSurpriseRemoved = true;
>> +		goto mutex_unlock;
>> +	}
>> +
>> +	if (status < 0) {
>> +		GET_HAL_DATA(adapt)->srestpriv.wifi_error_status =
>> +			USB_VEN_REQ_CMD_FAIL;
>> +
>> +		if (rtw_inc_and_chk_continual_urb_error(dvobjpriv))
>> +			adapt->bSurpriseRemoved = true;
>> +
>> +		goto mutex_unlock;
>> +	}
>> +
>> +	rtw_reset_continual_urb_error(dvobjpriv);
>> +	memcpy(data, io_buf, size);
>> +
>> +mutex_unlock:
>> +	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
>> +
>> +	return status;
> 
> No one cares about this value, is that ok?
> 

Hi, Greg

I haven't yet read your previous messages, I will do it right after I 
send this email.


Ignoring return value is 100% bug and i've fixed it my RFC series, that 
was posted like month ago. As you suggested, we firstly cleaning up 
usb_ops_linux and then I will rebase my series on top of this series.

Goal of my series is to add proper error handling of USB i/o all across 
the driver code.


Thank you for reviewing our patches :)




With regards,
Pavel Skripkin
