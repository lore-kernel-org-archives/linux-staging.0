Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F043FC5
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 11:51:17 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id m3so15580153lfu.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 04:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4hpTBly87CJvdUmFguNKgkL3zMg4fhjWobSldTLWtEQ=;
        b=LiWk/ERskfbepSnqhc/N37YQ19GF9KcB9vqrXQUtk/RwXRAaTtNtuCpRM17UWhStg3
         ZIWZvWD+m4hDMMYxhhzPLIwjWM3LfK5oSXe1FlWzfvwxOORux2Xz5FRPlP0+/iXPWKYE
         eMfYHU02EFDO/pWpsI+Zzt9DeFKlLgcZdGwKcp1/U0bXkrIzKmMvC0po8+8ixuMjRNGy
         vVGVy5KozQYdLCe/xys8Pf/s2DFmYAf6cKioCsUSqE03kJ78pDoXUdVbDkpqXE4n5Qx+
         XtLukTzT9sOd+02KAkMdnBtI9pnfc9KfbGFJezraFDgrvP6pE/nl2WON/Kh2IDszfmt8
         yB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4hpTBly87CJvdUmFguNKgkL3zMg4fhjWobSldTLWtEQ=;
        b=03lGGPgomsbezqT7vadF8Ao9TjeiU8CYl4P6RoVZZMkphoBw1jZZH+DhH5CYqj5FFJ
         DZr03a1/I/poJwcEFE91RrPIXJwUih3f8GuPJAI7Uw2BdWDPZe/7lLk07hs0V7GfRIFM
         K44KcVOAGZjcSD22HxSE4Fgh6lsyeCsjeBtMYcVjxfPTTjruxhwoTzBjf4kQReW6kMKq
         DtIDPfiZ90S33A/1ahsHCKx/e1Cs3qGF830+e6YWKMWIbS6C2xXvRYUe65Hpp/esn6uV
         8tR8/Ln52HZ3oro+2DzG6c9qgVLryS2RLYRqBvLXRuOn/4DPRuGWYPl4grFzvdP4wlkB
         Cojw==
X-Gm-Message-State: AOAM531ZK/6kKwfE9wIixteEkPLocDXxz3Ky6xVfqW+S4X4VtuocRpDp
	y2kPKW74uqCbHGGmjGtZtZc=
X-Google-Smtp-Source: ABdhPJyPAR8oSRuJy3exZ0vWjQuCgJJ9IMX6KLUOrYcJ8nfIuAhWqA9Qd4KipZQm/S13+VXwJL1DYA==
X-Received: by 2002:a05:6512:21ad:: with SMTP id c13mr3950932lft.27.1631793075072;
        Thu, 16 Sep 2021 04:51:15 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.49])
        by smtp.gmail.com with ESMTPSA id o21sm240463lfu.4.2021.09.16.04.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 04:51:14 -0700 (PDT)
Message-ID: <fb4e88d9-8e1e-4964-8361-085f5a6ee9f1@gmail.com>
Date: Thu, 16 Sep 2021 14:51:10 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v6 19/19] staging: r8188eu: remove shared buffer for USB
 requests
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 David Laight <david.Laight@aculab.com>
References: <20210915211103.18001-1-fmdefrancesco@gmail.com>
 <20210915211103.18001-20-fmdefrancesco@gmail.com>
 <20210916114928.GK2116@kadam>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20210916114928.GK2116@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/21 14:49, Dan Carpenter wrote:
> On Wed, Sep 15, 2021 at 11:11:03PM +0200, Fabio M. De Francesco wrote:
>>  static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
>>  {
>>  	int	i;
>> @@ -158,9 +135,6 @@ static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
>>  		DBG_88E("NON USB_SPEED_HIGH\n");
>>  	}
>>  
>> -	if (rtw_init_intf_priv(pdvobjpriv) == _FAIL)
>> -		goto free_dvobj;
>> -
>>  	/* 3 misc */
>>  	sema_init(&pdvobjpriv->usb_suspend_sema, 0);
>>  	rtw_reset_continual_urb_error(pdvobjpriv);
>> @@ -169,7 +143,6 @@ static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
>>  
>>  	status = _SUCCESS;
>          ^^^^^^^^^^^^^^^^^
> 
>>  
>> -free_dvobj:
>>  	if (status != _SUCCESS && pdvobjpriv) {
>              ^^^^^^^^^^^^^^^^^^
> status is going to be _SUCCESS so we can delete this if statement.
> 

silly mistake :(

will be fixed in v7, thanks so much for review


>>  		usb_set_intfdata(usb_intf, NULL);
>>  		kfree(pdvobjpriv);
>> @@ -200,7 +173,7 @@ static void usb_dvobj_deinit(struct usb_interface *usb_intf)
>>  				usb_reset_device(interface_to_usbdev(usb_intf));
>>  			}
>>  		}
>> -		rtw_deinit_intf_priv(dvobj);
>> +
>>  		kfree(dvobj);
>>  	}
> 



With regards,
Pavel Skripkin
