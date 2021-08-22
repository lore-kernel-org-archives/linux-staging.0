Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D3172
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 10:09:34 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id q21so25583738ljj.6
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vcNozNLiELsOkaLftabobubDY4L64Yc6cQ2FcWqWBwc=;
        b=AFzTJUh5WbeVl60l5ScI4OD/h0pdCopHPcUgEUZFjjGFgIUG/Am9kwC2//d8jRsMb/
         GVLUwObKjQdbGvKU5v8p3ppN93tPqUg5WnEjut7KYGes8TlQXaM9pt5bzOQc0wnPbpwo
         +b/EopIXzIfVaKKOyj1uXR/2Khby+vAOi/opmcmKS43ZF3HOGtpgcv3lBLimPVIHs+nf
         WQXJwN+XFfMSoM+gfyo1RnFom70IC9xk45tWGwxJL7aO/s6g81QEGBQjMYGFCmeYSMVu
         IPwvvu55HKOO7asNeVUUU2gCr3y6Uafq2TqczBMWjNCPYwZ2lPj4993N8S+nxeSAoHjc
         W8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vcNozNLiELsOkaLftabobubDY4L64Yc6cQ2FcWqWBwc=;
        b=tPxiVgWJQOya1lhOPlzgmynpVFaKVFCF3FWosnrWTGFQYWCdh+OH2uWDfavvNguWfN
         VUZTWZAmL0QqVItq2icQ8tRJeTE8RA3wE+J2PAOJ2ELe/Y+a2xPozZKpEP8xmxHFp0gn
         9evwuHSj9njhAh3Xvsy7a2+x48M2kIOKy7FYzBljjxS8DltoM2By4ZPxAlhtRTXpjZjT
         YO0N/JjMpv/3HJe6OB3RFnLT4ZCKOojtNW5OvhBOP5UldC4o3dSUU6f6e9zdC7ckHpwt
         KcJ5K1Ev4vJX7Jk39RkL4DEDCujzXd8RxtGIuyqQwKHDcmrDrFHWxhvYxAR7O5RKKITq
         rXeA==
X-Gm-Message-State: AOAM531DK+m5km04i3iB29ayqZAvp/XCjiPAc67Ru1A7Tdi8sAXWGK2J
	WmUADH9rc2p5jO0Ke7hKouM=
X-Google-Smtp-Source: ABdhPJxptblskllBGDsN7QLRA5pwdqKM080g9LWwy7oYDzbKhQBq+unHX2UY758PcBm36jHbvncoZg==
X-Received: by 2002:a2e:a288:: with SMTP id k8mr22538870lja.315.1629626972669;
        Sun, 22 Aug 2021 03:09:32 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.67])
        by smtp.gmail.com with ESMTPSA id o6sm1268933lfo.110.2021.08.22.03.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 03:09:32 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] staging: r8188eu: avoid uninit value bugs
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Martin Kaiser <martin@kaiser.cx>
References: <cover.1629479152.git.paskripkin@gmail.com>
 <10584649.zhyk0TxWeL@localhost.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <ae27d6a0-dc00-459f-7b36-acf7f4c08d72@gmail.com>
Date: Sun, 22 Aug 2021 13:09:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <10584649.zhyk0TxWeL@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/22/21 12:53 PM, Fabio M. De Francesco wrote:
> On Friday, August 20, 2021 7:07:28 PM CEST Pavel Skripkin wrote:
>> Hi, Greg, Larry and Phillip!
>> 
>> I noticed, that new staging driver was added like 3 weeks ago and I decided
>> to look at the code, because drivers in staging directory are always buggy.
>> 
>> The first thing I noticed is *no one* was checking read operations result, 
> but
>> it can fail and driver may start writing random stack values into registers. 
> It
>> can cause driver misbehavior or device misbehavior.
> 
> After the messages I wrote yesterday, I had some minutes to look deeper at the
> code that would be changed by these patches.
> 
> I think that it does not look like that the driver could return "random stack
> values into registers" and I think this entire series in unnecessary.
> 
> As far as I understand this driver (though I must admit that I really don't
> know how to write drivers, and I'm not interested in understanding - at the
> moment, at least), all the usb_read*() call usbctrl_vendorreq() and the latter
> *does* proper error checking before returning to the callers the read data.
> 
> Please, look at the code copied from usbctrl_vendorreq() and pasted here (some
> comments are mine):
> 
> /* start of code */
> static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void
> *pdata, u16 len, u8 requesttype)
> {
> 
> /* test if everything is OK for transfers and setup the necessary variables */
> [...]
> 
> status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
>                                           reqtype, value,
> REALTEK_USB_VENQT_CMD_IDX,
>                                           pIo_buf, len,
> RTW_USB_CONTROL_MSG_TIMEOUT);
> 
>                  if (status == len) {   /*  Success this control transfer. */
>                          rtw_reset_continual_urb_error(dvobjpriv);
>                          if (requesttype == 0x01)
>                                  memcpy(pdata, pIo_buf,  len); /* pdata
> receives the read data */
> 	} else { /*  error cases */
> 
> [...]
> 
> }
> /* end of code */
> 
> So, *I cannot ack this RFC*, unless maintainers say I'm missing something.
> 
> Larry, Philip, since you have much more knowledge than me about r8188eu (and,
> more in general, on device drivers) may you please say what you think about my
> arguments against this series?
> 

Hi, Fabio!

Thank you for looking into this, but I still can see the case when pdata 
won't be initialized:


pdata is initialized only in case of successful transfer, i.e len > 0. 
It means some data was received (maybe not full length, but anyway). In 
case of usb_control_msg() error (for example -ENOMEM) code only does 
this code block:

if (status < 0) {
	if (status == (-ESHUTDOWN) || status == -ENODEV) {
		adapt->bSurpriseRemoved = true;
	} else {
		struct hal_data_8188e	*haldata = GET_HAL_DATA(adapt);
		haldata->srestpriv.Wifi_Error_Status = USB_VEN_REQ_CMD_FAIL;
	}
}


And then just loops further. In case of 10 ENOMEM in a row,. passed 
pdata won't be initialized at all and driver doesn't do anything about 
it. I believe, it's not good approach to play with random values. We 
should somehow handle transfer errors all across the driver.

If I am missing something, please, let me know :)



With regards,
Pavel Skripkin
