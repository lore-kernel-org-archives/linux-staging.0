Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5EC2FAE
	for <linux-staging@lists.linux.dev>; Tue,  7 Sep 2021 10:17:05 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id m4so15661596ljq.8
        for <linux-staging@lists.linux.dev>; Tue, 07 Sep 2021 03:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ByxqDJoNSKwEprYR76zP4whjJer5vtw08GNWxCQ8n/Y=;
        b=PZXbFfG0SOPa/2i8YDrkhKdhxnszMwNNorHNDijKwyKoWDzlkakgrFijc5j6EgmEbB
         YXFW0l692qR3vxgbsnkuyvKVLZ+ZSA/2NC32PV7H2W3cZ3dtz5jf0I9wIlw3HQ6sjwa0
         gzOevyKT7mqXW5vLlcDp/tnx6X07G/SdNHgo2x+UbxkHm3DNwYkKlaaSOd3bPT7fN4Fd
         kK2fk5RpkW3nx/UUa1FR+VXRaNXwCSuNHxjizrzWSwSRFpDh10nxKaSVNuhBhGeAtgw6
         IPwUHQ0iU+W5GG8eeDHto1kRNKq6T0bh+/i9wc+zdC87fR8KtTzZAviDe3rhTmOb+gr5
         56oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ByxqDJoNSKwEprYR76zP4whjJer5vtw08GNWxCQ8n/Y=;
        b=irwJO8RJlbIG7wUv4fOE3DoaJSFwOPAWPsQzM0w/3FpcPNUnREyTH+bqcuEu/0/ZwF
         6TlCqGr4MEM4DOgQ/c1fpLAQYMlyKK/6bw5QQwce5ff+hOhiS9l1v2RJwkmyhDwLwwI9
         /QJVaF79Gc7t1fb4CkHQnMgbnGXo3RNa//eT8w9QerKBRv/Qg36+Z7ULUygeq6CZqe0U
         aHQuNf8WyW0rFQruKag45cwwafywZFmG8fvIas32CVJyRjzum7Cw5kS9yYhIPvoB3WCB
         3iiszizjDFNS/OxnDaowqWG4FtcOCcroSbLZ24jtZV56lKitYNCmWI3+pKDqxfRleEQy
         pZ8Q==
X-Gm-Message-State: AOAM532mgqXnv5mhxEJclU+j5suylUJO/WSa27EDg9VsubiJUfJ2RTjn
	HJA20Hdcrp1g366c5grdS80=
X-Google-Smtp-Source: ABdhPJxEuF4/Bq75l3xzrrYQIU/VAtYZiJgOy4M67nKlZctxGqE+aGi2JBiQkKtR0hyQH22D/K46Sg==
X-Received: by 2002:a05:651c:88e:: with SMTP id d14mr13865894ljq.472.1631009823347;
        Tue, 07 Sep 2021 03:17:03 -0700 (PDT)
Received: from localhost.localdomain ([46.61.204.60])
        by smtp.gmail.com with ESMTPSA id k17sm964080lfv.285.2021.09.07.03.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 03:17:03 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] staging: r8188eu: Shorten calls chain of
 rtw_write8/16/32/N()
To: David Laight <David.Laight@ACULAB.COM>,
 "'Fabio M. De Francesco'" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210904220048.12822-1-fmdefrancesco@gmail.com>
 <20210904220048.12822-4-fmdefrancesco@gmail.com>
 <5a359f20e80341c9910ecc6286eb0aec@AcuMS.aculab.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <17d78a9f-9eee-1085-20b5-62fcd700965f@gmail.com>
Date: Tue, 7 Sep 2021 13:17:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5a359f20e80341c9910ecc6286eb0aec@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/7/21 1:10 PM, David Laight wrote:
> From: Fabio M. De Francesco
>> Sent: 04 September 2021 23:01
>>
>> Shorten the calls chain of rtw_write8/16/32() down to the actual writes.
>> For this purpose unify the four usb_write8/16/32/N() into the new
>> usb_write(); make the latter parameterizable with 'size'; embed most of
>> the code of usbctrl_vendorreq() into usb_write() and use in it the new
>> usb_control_msg_send() API of USB Core.
>> 
> ...
>> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
>> index f9c4fd5a2c53..e31d1b1fdb12 100644
>> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
>> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
>> @@ -8,76 +8,51 @@
>>  #include "../include/recv_osdep.h"
>>  #include "../include/rtl8188e_hal.h"
>> 
>> -static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata, u16 len, u8
>> requesttype)
>> +static int usb_read(struct intf_hdl *intfhdl, u32 addr, void *data, u8 size)
>>  {
>> -	struct adapter	*adapt = pintfhdl->padapter;
>> -	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
>> +	u16 value = (u16)(addr & 0x0000ffff);
>> +	struct adapter *adapt = intfhdl->padapter;
>> +	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
>>  	struct usb_device *udev = dvobjpriv->pusbdev;
>> -	unsigned int pipe;
>> -	int status = 0;
>> -	u8 *pIo_buf;
>> +	int status;
>> +	u8 *io_buf;
> 
> Some of these changes are whitespace or renames.
> They ought to be in a different patch.
> 
> I think you'll need 'reverse xmas tree' ordering as well.
> 
> 	David
> 
You are right, thank you. We will revert it in v4 in all patches in this 
series :)




With regards,
Pavel Skripkin
