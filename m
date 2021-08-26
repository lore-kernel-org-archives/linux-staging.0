Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE783FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 20:03:08 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id b4so9257112lfo.13
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 13:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3zAr+cyoXevrt8A+DyLi9G7nlDrM3xPW3HSqFrbuWPs=;
        b=Icip//QmnD0NfBJVT3jKI5SpPllcAFbvQJPqcqAi/lHASsMeGAYEwhsLQR1iq41S45
         jOzXGIyTUMc62f3JOHJTfpjSW5XWDpkfcUfBeITDpzkUaTuU/1q9ATb8uk3E5i8CN5T3
         0AzphqxcD6CPlGJHUvhLW9FDkqc46Omn/SmjptA5Qxix8Nm7rgrf0L4sWvYVA+l5Tp0i
         g8bmd5FMM7T4LTuKvUSwuM32w7/mA0jDmWIxmcwUsXaOwnk1fTLA2XK15KaBdJgArb2H
         A5vS22SK2seRm8qqMYfJL3pU6v3Ci4+zwOypaTIvI1o/RIMOTYZ7RkJv8xG1H3WfB7uh
         BYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3zAr+cyoXevrt8A+DyLi9G7nlDrM3xPW3HSqFrbuWPs=;
        b=XMSrLh2JRFIlIsNUymF0Oblnf1HcfOcjgquKUthcO2F2Nb7AQP8r3++ZVGde8CT8jI
         M5e/IWVFfbMZVHJaxVIyscVwGutyWkCovARfWD/wKhIMox5DBzd40tijpd+Gy2dyVJRM
         NWSeCDD4uvBjMk6ecLfmYrgixiYHD5Cm0aHsV4qsRyh7DPVgr1qTBJzQ/L08hSzQNr9T
         F13t+5oTUC3jzeAGqN1LH3Rti7wr2/mPVjbpkXT4nHgdCTod1GIrqOmtRj0XB3vI2l4X
         FgYKIM0iR99D//NBXWJtRdfIIwkBIuOSqlmhwjCm9I1PuSB6eI3Kep7/8cWBH5K/gb2N
         rKwQ==
X-Gm-Message-State: AOAM531tlc8ap9YqWK5LWXbH8bGiwIh3jnb92ECGQt4Q6uV48p5LTekD
	Y6D08FNO2GS2Y+wuiSAhkC0=
X-Google-Smtp-Source: ABdhPJzFUVFuXxfr49qDXFQHyBkAbZDK+s8QKVlAGiVJEju4KP3Zu+mi5R4agrFlZpcWYZPZOxqXCA==
X-Received: by 2002:ac2:41d9:: with SMTP id d25mr3921380lfi.386.1630008186989;
        Thu, 26 Aug 2021 13:03:06 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id b4sm397722lfo.94.2021.08.26.13.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 13:03:06 -0700 (PDT)
Subject: Re: [PATCH v3 5/6] staging: r8188eu: add error handling of rtw_read32
To: David Laight <David.Laight@ACULAB.COM>
Cc: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
 "phil@philpotter.co.uk" <phil@philpotter.co.uk>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "straube.linux@gmail.com" <straube.linux@gmail.com>,
 "fmdefrancesco@gmail.com" <fmdefrancesco@gmail.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1629789580.git.paskripkin@gmail.com>
 <93bf46ce2d0ce12e94672acf28b64dc341fde038.1629789580.git.paskripkin@gmail.com>
 <27f5e52d520b453cbcabb3d72f0f5d15@AcuMS.aculab.com>
 <20210826122221.5d2b0f37@gmail.com>
 <685618ac-8de1-4eb1-57dd-9d43b96e872e@gmail.com>
 <64112dfd8e8b472ab78ca8b4837dc9e9@AcuMS.aculab.com>
 <0eb2bbc6-9d35-9ff3-acde-fd89bbe0ca27@gmail.com>
 <6e864f9d133d4db3923190f5acacc32a@AcuMS.aculab.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <fb29e9f2-3662-c365-7427-a91a298ef10f@gmail.com>
Date: Thu, 26 Aug 2021 23:03:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6e864f9d133d4db3923190f5acacc32a@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/26/21 1:59 PM, David Laight wrote:
> From: Pavel Skripkin
>> Sent: 26 August 2021 11:55
>> 
>> On 8/26/21 1:22 PM, David Laight wrote:
>> > From: Pavel Skripkin
>> >> Sent: 26 August 2021 10:28
>> >>
>> >> On 8/26/21 12:22 PM, Pavel Skripkin wrote:
>> >> > On Thu, 26 Aug 2021 08:51:23 +0000
>> >> > David Laight <David.Laight@ACULAB.COM> wrote:
>> > ...
>> >> >> ...
>> >> >> > -static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
>> >> >> > +static int usb_read32(struct intf_hdl *pintfhdl, u32 addr, u32
>> >> >> > *data) {
>> >> >> >  	u8 requesttype;
>> >> >> >  	u16 wvalue;
>> >> >> >  	u16 len;
>> >> >> > -	__le32 data;
>> >> >> > +	int res;
>> >> >> > +	__le32 tmp;
>> >> >> > +
>> >> >> > +	if (WARN_ON(unlikely(!data)))
>> >> >> > +		return -EINVAL;
>> >> >> >
>> >> >>
>> >> >> Kill the NULL check - it is a silly coding error.
>> >> >> An OOPS is just as easy to debug.
>> >> >>
>> >> >
>> >> >
>> >> > I don't think that one single driver should kill the whole system. It's
>> >> > 100% an error, but kernel can recover from it (for example disconnect
>> >> > the driver, since it's broken).
>> >> >
>> >> >
>> >> > AFIAK, Greg and Linus do not like BUG_ONs in recoverable state...
>> >> > Correct me, if I am wrong
>> >> >
>> >> Oops, I thought about BUG_ON() instead of WARN_ON(), sorry for
>> >> confusion. My point is "we should not let the box boom".
>> >
>> >
>> > There is no point checking for NULL that just can't happen.
>> > In this case all the callers will pass the address of a local.
>> > There really is no point checking.
>> >
>> 
>> We not always read in local variable, there are few places, where we
>> read into passed buffer.
> 
> It is still a very local coding bug.
> 
> 	David
> 

Sure, but is defensive programming so bad?


Greg, what your opinion about this NULL check?




With regards,
Pavel Skripkin
