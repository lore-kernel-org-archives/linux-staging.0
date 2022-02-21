Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E733D8
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 19:07:41 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id d10so35615032eje.10
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 11:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RB+KnGP4vjA0xEYG3QLBV10Oe0XhSXLPzGOpTKcC0fY=;
        b=K4a5HCHQ7nMPlxRuuLiM+TEcOdIH2u4Ivlw02dABkJWLEtElRDBMXHD3RESCh/OdSt
         Bnoei2Jrw75XrR4m2W+CgqK6BV9c1M7NKPCk3cC+SU8KngQv+S39l8TPMUqldOaPA+o4
         a0QngcOYe4VzptVwY6+Tg5WqerVbT/J1+zbAjdKb6t9L9CDz7igCjUh63mByyT6GTtIu
         ghiOzW0aS/tegRFhNpYMDDVDsvm3f8Ne3lyWnyBHru+O3Bza+d9+UsMi2poWspKQ/0Ry
         kkAcIGeJAHOQLpj+xH0iKjdgjOy+sGjnXs/2WxbCpPCApGSNdS9xSgI3lKqpbEpPtumI
         FhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RB+KnGP4vjA0xEYG3QLBV10Oe0XhSXLPzGOpTKcC0fY=;
        b=iZvehpwoct3ic01z+zu4+3FMSXsz8G27rstGOgEO5MMa653k3Hiujxr4cGmpHu47+e
         4EgZ2Zc4c7QMTDMp4Ddu++XA4d6yUuMZQHBmW4tLRetFC5QloiDqGYd2Am+6vTKps0Tx
         BoGwm+/m1GHTxHrSyWWaipZEUBZkmqdgpg5kTMyAEUn0fVGROUbbVwq1euqOuFgRlu+O
         MV9RK45bOd2wkDyqiF4yNj0hQ5L7Phz7Zt5N79iCsOIdOGIPI2kJp4Mh7yNQG211ggtG
         VBTdjpnReigPUXugaJRBv6Yqx6wFkJHWK4P03Fxe4MRT95gqVB3ehwaIVrAbMc3hT8Um
         YgQA==
X-Gm-Message-State: AOAM533tF947A0TGC40LiRP5kvyVhEMbrNwSl35aFfsAcMIOAACzYv3l
	oZaNUiXcLHbvGC6zdxlW16s=
X-Google-Smtp-Source: ABdhPJzsNn3FN3IHD5Uiz1ak9lTE+NTulWsnCooaEKsILTt0Ty1qKTletT1JXuKhptwRDKjeaguxzw==
X-Received: by 2002:a17:906:a384:b0:6ce:c3f4:c59a with SMTP id k4-20020a170906a38400b006cec3f4c59amr16279290ejz.580.1645470460317;
        Mon, 21 Feb 2022 11:07:40 -0800 (PST)
Received: from [192.168.0.253] (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id q5sm5357733ejc.115.2022.02.21.11.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 11:07:39 -0800 (PST)
Message-ID: <28f888c4-e77e-3b2d-a65f-9596ff70c519@gmail.com>
Date: Mon, 21 Feb 2022 20:07:38 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] staging: r8188eu: remove 5 GHz channels from
 ch_freq_map
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220220154847.7521-1-straube.linux@gmail.com>
 <20220220154847.7521-2-straube.linux@gmail.com> <YhPIVFmStJOMI0QZ@kroah.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YhPIVFmStJOMI0QZ@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/22 18:13, Greg KH wrote:
> On Sun, Feb 20, 2022 at 04:48:45PM +0100, Michael Straube wrote:
>> This driver is for chips that operate only in the 2.4 GHz band.
> 
> How do we know that?
> 

The documentation that I've found for RTL8188EU and RTL8188ETV says
that both are 2.4 Ghz only chips.

Also the old rtl8188eu driver had a TODO item to remove code that is
only valid for 5 GHz.

So I thought this can be removed. Did I miss something?

regards,

Michael
