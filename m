Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912793FC5
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 15:04:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id bq5so34286574lfb.9
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XLn7sgDWz0kSKl7seGE0JrPmtqOeAaqdB7dNuJbit7Y=;
        b=Cq+NekJp2eVMMzhLNKmP3cOl+Z0GAQxDr74nTZi/nrMHc4XWH/LzsxoqVpI5AexzZ9
         +iAt+8meK4PioUMpxb0lZQszkQ0VP+LJqrEapALE+9VSNUecTRoo9rNf+iWaK4yYmX09
         +szrqKjiISXeFVakU0tLxELkW2wgxYoLbQR2WsJSQOXP/Cf7JZB1qYB3d7mbY0qN3K3I
         pw8taThHKKXsG2T2MOLlWfqfWJUwnTv9lV9GCUIFDnt2miyHtbHGKsNS1vqHASxK9c0o
         9emVLT06Ny2LBo6bk7Wfha9Op+msyLuy5OlcvdB5rEcE5OTTBi/3qayrDZMgD2mtDkAN
         6IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XLn7sgDWz0kSKl7seGE0JrPmtqOeAaqdB7dNuJbit7Y=;
        b=YOC4QF1PRM0Tz/JxRoDpuxysC27NAEzbyujLWM7/9xIOPCYSuj1Ri1BtxAV6sTjTG0
         3WN/MsT2yZAyvxYGP26dWntCsZ92FYCnWcN9MsOZ49pK6tO4RHHtgkm5Mc1LGSYRjNIy
         xnMx96hs805QrBYOXkjQJWQQ9nNKR3NOK3A+8pfiLyJRS4hykUc6yNUFwleiDi5gHE2E
         idFOHoay21DElG3K7PRxlikj4ySh//wJaAYWJm42KsC93FLyX6tR8y3+FAGb90xBgWTI
         l1AXcSADRBIuKdYMGuCxqEPl0V809eZUj3SpqeMy/IrZ1GrhKrpnkswKL464Kp8gVRla
         qD5w==
X-Gm-Message-State: AOAM5301tpau5stLZGkInL66k+XtfO0rIO2FEmi8MtvUyUu8/qi+oH4Q
	RJR+l8tFUhZhXGu5PLfXMXk=
X-Google-Smtp-Source: ABdhPJynPO4sDVgaSrlIi0XCVAOfWgqxZV4J1Oua60QkOn+AIURakuPiR2+rdpVGpxFKfb9nJe3R2w==
X-Received: by 2002:a05:6512:2310:: with SMTP id o16mr8329541lfu.646.1631891034434;
        Fri, 17 Sep 2021 08:03:54 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.49])
        by smtp.gmail.com with ESMTPSA id u17sm725173ljk.124.2021.09.17.08.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 08:03:54 -0700 (PDT)
Message-ID: <ef2a89f5-f68c-e7e2-9338-78e70dc41701@gmail.com>
Date: Fri, 17 Sep 2021 18:03:52 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v7 19/19] staging: r8188eu: remove shared buffer for usb
 requests
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 David Laight <david.Laight@aculab.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
References: <20210917071837.10926-1-fmdefrancesco@gmail.com>
 <20210917071837.10926-20-fmdefrancesco@gmail.com>
 <YUSsa+3NjQVGD9gb@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YUSsa+3NjQVGD9gb@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/21 17:55, Greg Kroah-Hartman wrote:
> On Fri, Sep 17, 2021 at 09:18:37AM +0200, Fabio M. De Francesco wrote:
>> From: Pavel Skripkin <paskripkin@gmail.com>
>> 
>> This driver used shared buffer for usb requests. It led to using
>> mutexes, i.e no usb requests can be done in parallel.
>> 
>> USB requests can be fired in parallel since USB Core allows it. In
>> order to allow them, remove usb_vendor_req_buf from dvobj_priv (since
>> USB I/O is the only user of it) and remove also usb_vendor_req_mutex
>> (since there is nothing to protect).
> 
> Ah, you are removing this buffer, nice!
> 
> But, just because the USB core allows multiple messages to be sent to a
> device at the same time, does NOT mean that the device itself can handle
> that sort of a thing.
> 
> Keeping that lock might be a good idea, until you can prove otherwise.
> You never know, maybe there's never any contention at all for it because
> these accesses are all done in a serial fashion and the lock
> grab/release is instant.  But if that is not the case, you might really
> get a device confused here by throwing multiple control messages at it
> in ways that it is not set up to handle at all.
> 
> So please do not drop the lock.
> 
> More comments below.
> 

We have tested this change. I've tested it in qemu with TP-Link 
TL-WN722N v2 / v3 [Realtek RTL8188EUS], and Fabio has tested it on his 
host for like a whole evening.

I agree, that our testing does not cover all possible cases and I can't 
say it was "good stress testing", so, I think, we need some comments 
from maintainers.

@Larry, @Phillip, does this change looks reasonable for this chip?



With regards,
Pavel Skripkin

> 
>> 
>> Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> ---
>>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 29 ++++++++-------
>>  drivers/staging/r8188eu/include/drv_types.h |  5 ---
>>  drivers/staging/r8188eu/os_dep/usb_intf.c   | 40 ++-------------------
>>  3 files changed, 16 insertions(+), 58 deletions(-)
>> 
>> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
>> index 656f3a774e48..0ed4e6c8b1f5 100644
>> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
>> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
>> @@ -19,9 +19,9 @@ static int usb_read(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
>>  	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
>>  		return -EPERM;
>>  
>> -	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
>> -
>> -	io_buf = dvobjpriv->usb_vendor_req_buf;
>> +	io_buf = kmalloc(size, GFP_KERNEL);
>> +	if (!io_buf)
>> +		return -ENOMEM;
> 
> Please read the docs for usb_control_msg_recv().  It can allow data off
> of the stack, so no need to allocate/free the buffer like this all the
> time.
> 
> Note, the usb_control_msg() call does require the data to be allocated
> dynamically, like the code does today.  Which is why you probably got
> confused here.
> 
> Same for usb_control_msg_send(), it can take data off of the stack.
> 
> 
>>  
>>  	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
>>  				      REALTEK_USB_VENQT_READ, addr,
>> @@ -39,7 +39,7 @@ static int usb_read(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
>>  		 * exist or is not enabled.
>>  		 */
>>  		adapt->bSurpriseRemoved = true;
>> -		goto mutex_unlock;
>> +		goto end;
>>  	}
>>  
>>  	if (status < 0) {
>> @@ -49,15 +49,14 @@ static int usb_read(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
>>  		if (rtw_inc_and_chk_continual_urb_error(dvobjpriv))
>>  			adapt->bSurpriseRemoved = true;
>>  
>> -		goto mutex_unlock;
>> +		goto end;
>>  	}
>>  
>>  	rtw_reset_continual_urb_error(dvobjpriv);
>>  	memcpy(data, io_buf, size);
>>  
>> -mutex_unlock:
>> -	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
>> -
>> +end:
>> +	kfree(io_buf);
>>  	return status;
>>  }
>>  
>> @@ -72,9 +71,10 @@ static int usb_write(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
>>  	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
>>  		return -EPERM;
>>  
>> -	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
>> +	io_buf = kmalloc(size, GFP_KERNEL);
>> +	if (!io_buf)
>> +		return -ENOMEM;
>>  
>> -	io_buf = dvobjpriv->usb_vendor_req_buf;
>>  	memcpy(io_buf, data, size);
>>  
>>  	status = usb_control_msg_send(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
>> @@ -93,7 +93,7 @@ static int usb_write(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
>>  		 * exist or is not enabled.
>>  		 */
>>  		adapt->bSurpriseRemoved = true;
>> -		goto mutex_unlock;
>> +		goto end;
>>  	}
>>  
>>  	if (status < 0) {
>> @@ -103,14 +103,13 @@ static int usb_write(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
>>  		if (rtw_inc_and_chk_continual_urb_error(dvobjpriv))
>>  			adapt->bSurpriseRemoved = true;
>>  
>> -		goto mutex_unlock;
>> +		goto end;
>>  	}
>>  
>>  	rtw_reset_continual_urb_error(dvobjpriv);
>>  
>> -mutex_unlock:
>> -	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
>> -
>> +end:
>> +	kfree(io_buf);
>>  	return status;
>>  }
>>  
>> diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
>> index 626c6273be6f..499b2bce8cbe 100644
>> --- a/drivers/staging/r8188eu/include/drv_types.h
>> +++ b/drivers/staging/r8188eu/include/drv_types.h
>> @@ -168,11 +168,6 @@ struct dvobj_priv {
>>  	int	ep_num[5]; /* endpoint number */
>>  	int	RegUsbSS;
>>  	struct semaphore usb_suspend_sema;
>> -	struct mutex  usb_vendor_req_mutex;
>> -
>> -	u8 *usb_alloc_vendor_req_buf;
>> -	u8 *usb_vendor_req_buf;
> 
> I do like removing these buffers, and I think that is all that this
> change should be doing.
> 
> thanks,
> 
> greg k-h
> 



