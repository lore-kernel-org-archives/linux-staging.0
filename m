Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113643FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 15:43:30 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id p38so46560936lfa.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=822Hg/zQKXlZynQ1+LBiGkBeYND5KDukoOwmd2Fca1M=;
        b=gR9zHjSevUTGeVgjWogjvaVGn9pr2qT4Vc6+Yt3OuBJ/I68hKvsCnqrIAlreoyOJPz
         gA6Jo+cKG3ncQb7whxm0NNw9Yi8nWwZFZJWY9Y58AzFSMt8HKtd13EE6ad+FugIzpHD+
         qP1FFcxKNlfQOS6KsosGt6rEyKmWxzx6GQU2nQsF2R9jV+4xEHV1cclinLOecSykHStr
         Rg1qG9o0RCI0chY7/69PskPKVKrv3IBHUSGX1jsnHsijSi/q7yS9cCMXND0Gj18o/PII
         rU2r+UlSQ5gMlw3W6c70MyYboZtn6XgBKr/Z3AOzjr7Mx8X8l1m5vAl+DcLggaNE9iwr
         ahbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=822Hg/zQKXlZynQ1+LBiGkBeYND5KDukoOwmd2Fca1M=;
        b=rKAj6SNCAe3pX5yjeNFdyzBljJKJ2+8BT8S2bWfUewnm5zAConNuZ8LShXgfRXeN3Z
         0+tfPlqqzn9sDH3CIsj2zQfYYj/Kq9Tz9cX1GWVAbSsMgHlSYllk5atF9+mfIFehLnF3
         J/pg0b5a997YmI55TvDwAFE7NNFfOETbryqeoc19tBGaZMTOx1RH5XVK7IbZ2q19I/ob
         TsHXuLFoSXCD+iv64oaOZonriEhG7NJDlC5bSA+gMpO9s9dhT63fclv8xZA8G03Fi2wX
         Bo1swoQlrE86VhRSm6AqiatwpDvHDaBBBY0xpyW8FaEkmnrJ9obG/wRvChibvHLeA/WO
         Mfeg==
X-Gm-Message-State: AOAM5333qMWyvhCUuWI4V0I81cNC2+mScWq4i4V0Oc8GdPSOxF8HZQ4+
	hfcE57wncQ6SsIRvCXNFXI4=
X-Google-Smtp-Source: ABdhPJw5teytKpr2hE7vg6p4e1EaFdts3r8hfFLR4GzPioV4ATVxFy9juwmdgMWumLP03pT3KsJQRA==
X-Received: by 2002:a05:6512:368c:: with SMTP id d12mr27391742lfs.64.1629819808212;
        Tue, 24 Aug 2021 08:43:28 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id l28sm764654lfj.202.2021.08.24.08.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 08:43:27 -0700 (PDT)
Subject: Re: [PATCH 2/2] staging: r8188eu: Make some clean-ups in
 usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20210824142823.16845-1-fmdefrancesco@gmail.com>
 <3740714.KPokl01s95@localhost.localdomain>
 <17234f07-debc-5b6c-244d-472a3f33bc3f@gmail.com>
 <2327592.S5L5zkRU50@localhost.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <a5bfab84-16cc-52ad-5cdb-038765bf0b36@gmail.com>
Date: Tue, 24 Aug 2021 18:43:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2327592.S5L5zkRU50@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 6:39 PM, Fabio M. De Francesco wrote:
> On Tuesday, August 24, 2021 5:26:23 PM CEST Pavel Skripkin wrote:
>> I found the problem:
>> 
>> >  	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
>> >  
>> >  	/*  Acquire IO memory for vendorreq */
>> > -	pIo_buf = dvobjpriv->usb_vendor_req_buf;
>> > +	io_buf = dvobjpriv->usb_vendor_req_buf;
>> 
>> 
>> I don't know from where mutex_lock() comes from. In staging-next I have
>> 
>> _enter_critical_mutex(&dvobjpriv->usb_vendor_req_mutex, NULL);
>> 
>> instead of
>> 
>> mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
>> 
> Oh, I know where it comes from... :)
> 
> It's a patch of mine that is in the queue, waiting to be reviewed and applied.
> Please see: https://lore.kernel.org/lkml/20210819221241.31987-1-fmdefrancesco@gmail.com/
> 


oh.... there are _a lot_ of pending changes :)

I guess, we need smth like public-mirror with already reviewed and 
working changes




With regards,
Pavel Skripkin
