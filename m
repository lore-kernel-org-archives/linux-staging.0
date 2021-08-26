Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03FF72
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 18:18:27 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id b4so8666325lfo.13
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 11:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=B/VrRohepb3vSq/SMW4bQf319Jg1hMieHlLY4AnbjL4=;
        b=PGIJZKm4VGJBN96ENsNK6Re9qNwqZoK8YVUChnl68R6y1gQmn4Mr2RkL0jHH1ScmD7
         1/mmiyl91x0JkfLMyGwPuOKtkHSPhzbmltvfFlwKV1+o3xBXqg2Y3RBzu5zA7imrMHP9
         kn8x/VWpD5aJ93LmXGCNQfILRhk6z07ag+D363HnYyVksYJs5ySBctk6yFH3benAgJcj
         3oo9vliV3I4zuMCTuUxiPI2eVSmwv8gJI/gaH9RMRY3FA+B62iXCTjpmPmBkfgWjEt0r
         D6dwIygui/i2opSFgXx27EjkkEubW3ucRKTiWwmVYsQ+7fcSUu19bch8D/Ls+geDtWuq
         PuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B/VrRohepb3vSq/SMW4bQf319Jg1hMieHlLY4AnbjL4=;
        b=DstMcfmBBGGZLKgmGRXOg+rkvapKrBoB0sZprW0d6ZKNuqUrodUcY71+QbgzLJ2O6e
         HFBvNyxcsFKeuLVnKKTGHTpB+3utlpK8a7LzGkW3pUgRoKpTsVvuze1IrtRhsEa5e11a
         rI0g8EnMNjAADTydmuKpylUfmvcB/4GkJvBkduMgN5PTG7ZQ9+5UKAXMHFRlxytXkTxz
         wzJE6OnQ/ST5EClT2Sn/tpBeqxFB36R7KiMUlkL3m+Z4GsRVX6LC/gXgxRNuPiom1Bfm
         EkcXTlAoeE+dUV8jiYoD577786GW2nwPspnDrd9JpZqu7s4IXOiXjA0+lXpHHYNgq7pU
         fTew==
X-Gm-Message-State: AOAM532LS3IOA7kP4oTBpm3rEReQmeyjlZ0cTdmxgRg2byDlR9btEWrr
	xTJZ6DVk3LRFg8ppsGfgjT8=
X-Google-Smtp-Source: ABdhPJxLm8N1FZVZDucH+Y2mue4iEpLkmlI149tIEln0mRazK+1NxcHJ5IIW7n38uCRdmWNzjvbh7A==
X-Received: by 2002:a05:6512:b8e:: with SMTP id b14mr3977712lfv.449.1630001905743;
        Thu, 26 Aug 2021 11:18:25 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id x142sm378521lff.5.2021.08.26.11.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 11:18:25 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] staging: r8188eu: Use usb_control_msg_recv/send()
 in usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20210825035311.8910-1-fmdefrancesco@gmail.com>
 <20210825035311.8910-2-fmdefrancesco@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <f2360c8c-e001-70d6-daeb-03ca5b718d84@gmail.com>
Date: Thu, 26 Aug 2021 21:18:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210825035311.8910-2-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/21 6:53 AM, Fabio M. De Francesco wrote:
> Replace usb_control_msg() with the new usb_control_msg_recv() and
> usb_control_msg_send() API of USB Core in usbctrl_vendorreq().
> Remove no more needed variables. Move out of an if-else block
> some code that it is no more dependent on status < 0. Remove
> redundant code depending on status > 0 or status == len.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---

FYI, I've tested this patch with TP-Link TL-WN722N v3 + qemu :)


Tested-by: Pavel Skripkin <paskripkin@gmail.com>


NOTE: I am still not able to apply 2/2, so tested tag is only for 1/2


With regards,
Pavel Skripkin
