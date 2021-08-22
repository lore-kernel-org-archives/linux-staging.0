Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC003FC0
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 12:10:59 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id o10so31527503lfr.11
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FwE28qCAO/I4G1sxfZC/BWbPwcfWdl5s/1hKg0O/2oA=;
        b=Du3e6f2RmHJu3ztu0GzixlmFfUPy/hJimALfhJHQOQFydNfTTR4hKYMl8uzR6pwZMc
         yOHyJovk/jDrXVarj6+pM70C0OF4hT4ZxfBelaPHyeThuvZIpjf9nnes3xDj+wSIM+VQ
         J3K+mkPtvWx/wVp9Du5duy9UdO25gwclPL5FFLMZNDXCcHkA96CSRs9kZjvwCWOCQX8v
         ob54Add3fji71iyvOJQx5m3xzpOH2U4B5+pnrlEgstOqm3FHC3SQnsDzpggF0HVejjM0
         NzI/FdyTvlouOffQiKuIefLyWuMJyM56CV1g8ws4r6zn9MSzi3xlCQi/TZUyn1y35C9y
         nmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FwE28qCAO/I4G1sxfZC/BWbPwcfWdl5s/1hKg0O/2oA=;
        b=NOthXoVZJCzqc53T7llNMGXK5s5qNsmV132KEUwmCJ9K5rr6h2csVPcKfZNE6VJH7o
         55qG/xwGSDRafFRfmN1bs6sU04/UocF43vh3chIfdgA49QWnCgL9X8pg5XEmAYOUSgyh
         on3rwvCQEEhQ+WeeQJo1Ryj9+OV27tvT9znv9IXOwMJhn1wvpr1hrsZfFRJRhH3xFnAo
         wwcsL8Kaj86Pc0Dj0vFciyjHP2VEmk0qyknpTIUVxPN33Fwb+ywVf0BAv2BisVt/Zc+m
         nho2ghgsijyz/zqsd6GwjBtodkecaZLaB6Er9Kk/G4oIYxY8nEsu0/n15I4l0twf36rP
         zNRQ==
X-Gm-Message-State: AOAM532xdl9Ch8tRy5RHQc05uHkt6gXX4GbA2mhF5LNuxXzSI/MuZGa5
	ey8Q0o/OYq6KQY/6v2dLnQY=
X-Google-Smtp-Source: ABdhPJybLLSTOAMHTo2lFpCpGYC/H8cFj6Bei0RXb4ECT5OemVbsnt5BEuCXKK1lAc/JaM/lKIyoNw==
X-Received: by 2002:a19:e214:: with SMTP id z20mr21792085lfg.37.1629634257865;
        Sun, 22 Aug 2021 05:10:57 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id w12sm1181293lfq.277.2021.08.22.05.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 05:10:57 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] staging: r8188eu: avoid uninit value bugs
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Martin Kaiser <martin@kaiser.cx>
References: <cover.1629479152.git.paskripkin@gmail.com>
 <10584649.zhyk0TxWeL@localhost.localdomain>
 <ae27d6a0-dc00-459f-7b36-acf7f4c08d72@gmail.com>
 <2327383.5TodInGmHT@localhost.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <435eea22-da31-1ebc-840c-ee9e42b27265@gmail.com>
Date: Sun, 22 Aug 2021 15:10:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2327383.5TodInGmHT@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/22/21 1:59 PM, Fabio M. De Francesco wrote:
> On Sunday, August 22, 2021 12:09:29 PM CEST Pavel Skripkin wrote:
>> On 8/22/21 12:53 PM, Fabio M. De Francesco wrote:
>> > On Friday, August 20, 2021 7:07:28 PM CEST Pavel Skripkin wrote:
>> >> Hi, Greg, Larry and Phillip!
>> >> 
>> >> I noticed, that new staging driver was added like 3 weeks ago and I 
> decided
>> >> to look at the code, because drivers in staging directory are always 
> buggy.
>> >> 
>> >> The first thing I noticed is *no one* was checking read operations 
> result,
>> > 
>> > but
>> > 
>> >> it can fail and driver may start writing random stack values into 
> registers.
>> > 
>> > It
>> > 
>> >> can cause driver misbehavior or device misbehavior.
>> > 
>> > After the messages I wrote yesterday, I had some minutes to look deeper at 
> the
>> > code that would be changed by these patches.
>> > 
>> > I think that it does not look like that the driver could return "random 
> stack
>> > values into registers" and I think this entire series in unnecessary.
>> > 
>> > As far as I understand this driver (though I must admit that I really 
> don't
>> > know how to write drivers, and I'm not interested in understanding - at 
> the
>> > moment, at least), all the usb_read*() call usbctrl_vendorreq() and the 
> latter
>> > *does* proper error checking before returning to the callers the read 
> data.
>> > 
>> > Please, look at the code copied from usbctrl_vendorreq() and pasted here 
> (some
>> > comments are mine):
>> > 
>> > /* start of code */
>> > static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void
>> > *pdata, u16 len, u8 requesttype)
>> > {
>> > 
>> > /* test if everything is OK for transfers and setup the necessary 
> variables */
>> > [...]
>> > 
>> > status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
>> > 
>> >                                           reqtype, value,
>> > 
>> > REALTEK_USB_VENQT_CMD_IDX,
>> > 
>> >                                           pIo_buf, len,
>> > 
>> > RTW_USB_CONTROL_MSG_TIMEOUT);
>> > 
>> >                  if (status == len) {   /*  Success this control transfer. 
> */
>> >                  
>> >                          rtw_reset_continual_urb_error(dvobjpriv);
>> >                          if (requesttype == 0x01)
>> >                          
>> >                                  memcpy(pdata, pIo_buf,  len); /* pdata
>> > 
>> > receives the read data */
>> > 
>> > 	} else { /*  error cases */
>> > 
>> > [...]
>> > 
>> > }
>> > /* end of code */
>> > 
>> > So, *I cannot ack this RFC*, unless maintainers say I'm missing something.
>> > 
>> > Larry, Philip, since you have much more knowledge than me about r8188eu 
> (and,
>> > more in general, on device drivers) may you please say what you think 
> about my
>> > arguments against this series?
>> 
>> Hi, Fabio!
>> 
>> Thank you for looking into this, but I still can see the case when pdata
>> won't be initialized:
>> 
>> 
>> pdata is initialized only in case of successful transfer, i.e len > 0.
>> It means some data was received (maybe not full length, but anyway). In
>> case of usb_control_msg() error (for example -ENOMEM) code only does
>> this code block:
>> 
>> if (status < 0) {
>> 	if (status == (-ESHUTDOWN) || status == -ENODEV) {
>> 		adapt->bSurpriseRemoved = true;
>> 	} else {
>> 		struct hal_data_8188e	*haldata = GET_HAL_DATA(adapt);
>> 		haldata->srestpriv.Wifi_Error_Status = 
> USB_VEN_REQ_CMD_FAIL;
>> 	}
>> }
> 
> It's up to the callers of _rtw_usb*() to check return values and then act
> accordingly.
> 
> It doesn't matter whether or not *pdata is initialized because usb_read*()
> returns data = 0 if usb_control_msg() has not initialized/changed  its third
> parameter. Then _rtw_read*() receive 0 or initialized data depending on errors
> or no errors. Finally _rtw_read*() returns that same value to the callers (via
> r_val).
> 
> So, it's up to the callers to test if (!_rtw_read*()) and then act
> accordingly. If they get 0 they should know how to handle the errors.
> 

Yes, but _rtw_read*() == 0 indicates 2 states:

	1. Error on transfer side
	2. Actual register value is 0

> Furthermore, we have already either adapt->bSurpriseRemoved = true or haldata-
>>srestpriv.Wifi_Error_Status = USB_VEN_REQ_CMD_FAIL. Depending on contexts 
> where _rtw_read*() are called, perhaps they could also check the two variables
> above.

Yes, Wifi_Error_Status can be used, but it's set every time an error 
occurred. For example if 8th usb_control_msg() was successful 
Wifi_Error_Status will be set to error anyway. It's can be easily fixed, 
of course.

IMO, we should switch to standard way of handling these type of errors 
to move the driver out of staging someday


BTW: syzbot already found uninit value bug in r817xu driver:

https://syzkaller.appspot.com/bug?id=3cd92b1d85428b128503bfa7a250294c9ae00bd8

The usb related code in these drivers is the same, so bugs I am talking 
about are real.

> 
> In summation. if anything should be changed, it is the code of the callers of
> _rtw_read*() if you find out they they don't properly handle the returning
> values of this function. You should find every place where _rtw_read*() are
> called and figure out if the returns are properly checked and handled; if not,
> make some change only there.
> 
> Larry, Philip, where are you? Am I missing something?
> 

I am waiting for their replies too :) I have almost ready v2, so...



With regards,
Pavel Skripkin
