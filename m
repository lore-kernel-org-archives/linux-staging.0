Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A607629CA
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 15:07:05 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id cn28so32195373edb.6
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+hULPFAkyAPdS/vngzljMkYnL+FEm5rIj4ZI5jqPlpo=;
        b=EQMJ6qdHjnSDnKUPsqFMI4lpIr9Q9caVjs/72KugI9xSH+BHi/jHdSbMCsgPIBrEel
         TCAtD6YIH6ZvJ33I5Ni2ctlyYq3AxXcBvO/XjBRQk9sTwK+RfM2BIJkSkyYm/9tMY7lW
         kreBho9k+nyZjW64sCqq6IVidV3QuSTFjuotJrC+6KykAsQQpGw+ThHRQXrYgOarCstK
         r/ZF8WnylnD2H7sZGLSAOYFu/Kankea2T8qNGRoboy2ZAww3ALoN8nHH7RE+7d4qV4h8
         BkFXKj6xGDM+kIabXDEgUxZT2XzC6b182ilrNMzhmfpMIsEvFVKpHWpB4SUS4vNWgt0v
         FUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+hULPFAkyAPdS/vngzljMkYnL+FEm5rIj4ZI5jqPlpo=;
        b=hjPcciMhbO6kcqp10lkbKTktEyeN4MUQmRpRlTifLuNGgFVeT9QOUnRCjnm7shpy8t
         z1ovdaEHw2JWM7BZl07Kl95Aa612n9TWJZ+CQmPQNoclrtG0Ku5WrAx54hN4oq6sr6ia
         4wHFAMzyZQxZqIKhvPCCIJcjtuQALLjNZCjHS0xDaGcsWFnvC0XcZCszn4NkiY1cjFL1
         6V+RmuwRUwq0+iBoCWcip207zY7MQz7WdHiBCP1I78h22y58rci4SGNXh9FbT/Y1OPVl
         muFxRDIn17Lc+8qL1EEMkfu3Tp+l8N4Xls4q02ullj9RS+z3E/JA1G7VkA6ptm7ypg9S
         eu9A==
X-Gm-Message-State: AOAM531OhezyO16yFEWhLGNFEy8HfL1AAJxDAmdPYbVjCHUdknrw8esK
	ScROONSTUSKKFazBN08OAbQ=
X-Google-Smtp-Source: ABdhPJyumdBm7YK5jEmH4azn80w0E4VFSOF6bI5Lr3EDch3FLSi1/EZ8WpwYJMRTTUvcNcJKuDLZTQ==
X-Received: by 2002:a05:6402:8ce:: with SMTP id d14mr43765546edz.228.1629817624076;
        Tue, 24 Aug 2021 08:07:04 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id n23sm11971876eds.41.2021.08.24.08.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 08:07:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 5/6] staging: r8188eu: add error handling of rtw_read32
Date: Tue, 24 Aug 2021 17:07:02 +0200
Message-ID: <1655559.bbUi69aIZD@localhost.localdomain>
In-Reply-To: <e50d266f-410c-34cb-e28f-f27dc429ef37@gmail.com>
References: <cover.1629642658.git.paskripkin@gmail.com> <20210824065825.GL1931@kadam> <e50d266f-410c-34cb-e28f-f27dc429ef37@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 24, 2021 9:01:23 AM CEST Pavel Skripkin wrote:
> On 8/24/21 9:58 AM, Dan Carpenter wrote:
> > On Sun, Aug 22, 2021 at 05:36:01PM +0300, Pavel Skripkin wrote:
> >> -static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
> >> +static int usb_read32(struct intf_hdl *pintfhdl, u32 addr, u32 *data)
> >>  {
> >>  	u8 requesttype;
> >>  	u16 wvalue;
> >>  	u16 len;
> >> -	__le32 data;
> >> +	int res;
> >> +	__le32 tmp;
> >> +
> >> +	if (WARN_ON(unlikely(!data)))
> >> +		return -EINVAL;
> >>  
> >>  	requesttype = 0x01;/* read_in */
> >>  
> >>  	wvalue = (u16)(addr & 0x0000ffff);
> >>  	len = 4;
> >>  
> >> -	usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
> >> +	res = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
> >> +	if (res < 0) {
> >> +		dev_err(dvobj_to_dev(pintfhdl->pintf_dev), "Failed to read 32 bytes: %d\n", res);
> > 
> > Add a return here.  Try to keep the success path and the failure path
> > as separate as possible.  Try to keep the success path indented at one
> > tab so the code looks like this:
> > 
> > 	success();
> > 	success();
> > 	if (fail)
> > 		handle_failure();
> > 	success();
> > 	success();
> > 
> > Try to deal with exceptions as quickly as possible so that the reader
> > has less to remember.
> > 
> >> +	} else {
> >> +		/* Noone cares about positive return value */
> > 
> > Ugh...  That's unfortunate.  We should actually care.  The
> > usbctrl_vendorreq() has an information leak where it copies len (4)
> > bytes of data even if usb_control_msg() is not able to read len bytes.
> > 
> > The best fix would be to remove the information leak and make
> > usbctrl_vendorreq() return zero on success.  In other words something
> > like:
> > 
> > 	status = usb_control_msg();
> > 	if (status < 0)
> > 		return status;
> > 	if (status != len)
> > 		return -EIO;
> > 	status = 0;
> > 
> 
> I see, thank you for reviewing, will fix in v3! I fully forgot, that 
> usb_control_msg() can receive only part of the message :)

With the use of the new API I think that you don't have anymore
partial messages. usb_control_msg() returns the number of bytes 
transferred, while usb_control_msg_recv/send return only 0 if successful
otherwise a negative error number.

Regards,

Fabio

> With regards,
> Pavel Skripkin
> 




