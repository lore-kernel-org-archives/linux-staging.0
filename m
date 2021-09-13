Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97E43FC4
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 20:35:27 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id t19so23734537ejr.8
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 13:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SgXnoSQcAEqH9v+dYj27OqeP8dsCLRRfwu3WgTI42ko=;
        b=Ok/xbnGSe2rgiIoBmcrRfcVYoHXt5wdvgFrbgU6tT4+1AcorngG8oYzRGoiDiBdNWv
         /jOboQ1xht6O8+AzO14iRZBlxvCKloeW6uFvtyhW2+XDzSRd3z0tSIImpUsZJtkzvT9+
         gNYbZvjOqpQiyJFeiEVPbp6+fPtDzL28q9NnjRv2OlqS8axlHKV0e4XLfOzitoaxcygC
         CRYcbrljHFSJr2MBQUTiNuTB4RjdsJORbElKVfjH58+6OSLq9H9Nn6WWvY0vdH+d6qi+
         a9Sxwd9gFInPSs5aFVPUNw0Z0R3UlGHW75rYsRGNyQaNW2dgqYjifvR+ecFlb2BYyJSY
         26NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SgXnoSQcAEqH9v+dYj27OqeP8dsCLRRfwu3WgTI42ko=;
        b=BB3XV+4dKzfQqctBP6wNfEHEQSMdPBfmyQksDGg7kN7lbO5CQEnTliEgBIrqgk6mX6
         X1HKBnSWheHSAdO0kAvnObOXV//GbnSP28EqBp7Zc4NJptgX/KlBMukmL3p1TMImICM5
         kylAnV1vOns3DMahM7jxRXGrMHkq9sGBTrqCAjQgjShDJaqb/04sfF16954Pl6priipu
         NEc8lltIYl5VK29b0VzqRQ4yjUybyQps2uy8A0/9rWPqFWDxphOWblqPo/2dfWS35r89
         jkHKUk7qy0JYhW9fWemonf0MmNlfBjO/wbTu2HklKx6O4GWMtvAqOrckbtkUrt1BaJC3
         r3aw==
X-Gm-Message-State: AOAM532GO9IwbirPSW1MW4dBeTrMAxoBsuhbPcLdl0UkMjMHf6Lx6OaQ
	gx/6Zj7j3QKGtYVYUHdVM9U=
X-Google-Smtp-Source: ABdhPJyGDNRU3xn+hzVVzl3+h5HmcuWIv18YW5/6T0fOvKTBb2aOrNbdvM3jXIt2/bixZhrO8lrp7A==
X-Received: by 2002:a17:906:2655:: with SMTP id i21mr8898921ejc.15.1631565326093;
        Mon, 13 Sep 2021 13:35:26 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id q9sm3914785ejf.70.2021.09.13.13.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 13:35:25 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH v4 00/18] staging: r8188eu: Shorten and simplify calls chain
Date: Mon, 13 Sep 2021 22:35:22 +0200
Message-ID: <3628124.EQXE2LdQPN@localhost.localdomain>
In-Reply-To: <20210913181002.16651-1-fmdefrancesco@gmail.com>
References: <20210913181002.16651-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, September 13, 2021 8:09:44 PM CEST Fabio M. De Francesco wrote:
> io_ops abstraction is useless in this driver, since there is only one ops
> registration. Without io_ops we can get rid of indirect calls mess and
> shorten the calls chain.
> 
> Shorten the calls chain of rtw_read8/16/32() down to the actual reads.
> For this purpose unify the three usb_read8/16/32 into the new
> usb_read(); make the latter parameterizable with 'size'; embed most of
> the code of usbctrl_vendorreq() into usb_read() and use in it the new
> usb_control_msg_recv() API of USB Core.
> 
> Shorten the calls chain of rtw_write8/16/32() down to the actual writes.
> For this purpose unify the four usb_write8/16/32/N() into the new
> usb_write(); make the latter parameterizable with 'size'; embed most of
> the code of usbctrl_vendorreq() into usb_write() and use in it the new
> usb_control_msg_send() API of USB Core.
> 
> The code with the modifications was thoroughly tested by Pavel Skripkin
> using a TP-Link TL-WN722N v2 / v3 [Realtek RTL8188EUS] and by Fabio M.
> De Francesco using a ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano].

Hi all,

Please disregard this series. I've made a mistake, so tomorrow I'll send v5.

Pavel Skripkin made me notice a logical error where the code checks errors in 
17/18 and 18/18. So, two lines must be rewritten.

Thanks,

Fabio


