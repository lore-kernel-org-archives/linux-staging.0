Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEBD46A8
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 06:45:58 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id k23so35287007ejd.3
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 23:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JYLTflw7lfJdOYx0URIPHkyjZlSOngY1f4PANC1Ya4Q=;
        b=bfGqjachYVfU5dPcDQg5xv9rbpIvCedlwXnPSgn1JNYcXGDNhP9LHMKnTUwviTqDVz
         HlY2DpIzKBG9qnHFP1Wd5RF1IOBtplLTITXxocnnSjUMVA6L10hNHfY36jfiQI3IwjLM
         gzEIYmLESgC426ishFNHPpqlz5rXW3CA4UlH7wwGnRXLcoEPmOdBTmNjXRQOnDGtVDp7
         tsFtQILfU39vtpL87hJwcLga80ZelaEvtYbhFbA0VRp7VCoeCHu2+GmOJbOPiuKaMYG1
         Uhz5Zvfudmp3k43IcTvdvEBUnHdNsS3ZgpPBrtOtWsvrgtcBhKX2J59rukUOdtGI7gjN
         5riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JYLTflw7lfJdOYx0URIPHkyjZlSOngY1f4PANC1Ya4Q=;
        b=FfBn/1UkOgIoLvdoE+QXyRC3m9ylEcbwqq5wxdCjPkROpdAJW3Fvtm5EKWNIxTuN/7
         +4fGwkNC48FaTIjQr9QqkVOoOCrR3hm/wqEzZew1vjuVVTOLQCf0eK/8+gv/oQ7jKwhr
         MkG0VWqUn4adz6vHcYxHHAn1Iilh0JbhoCsBZmZ11y9cFl5XlBbf3w1bODSs3U4peeEL
         y4aE/KZbcQ7EkFcxOn2IdyCss5TExXRKpIancDjIweyG1aYN1Gawn25neeSza6yHJf6L
         er9/sa0E9h6KOmspSMDKEaXh4EYOpRXwrRFS2409nkruUiGrULP5zGXIFHY45BL2DyoY
         2LHw==
X-Gm-Message-State: AOAM532PUkBusyWJ8eWd75XuimVLLL3qiaH6Y+ynKNeX+gejn0EnblB7
	Q3c0+LNlyL8u1VWVRPs9ORw=
X-Google-Smtp-Source: ABdhPJw6lfK5d0W8P9JWT5moNgL+/hy+tNZlsnRZrxsACK0MlAXTebV5yp1YPCq7QatkW/q2oN9Ntw==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id fj2-20020a1709069c8200b006e12c941616mr33061090ejc.64.1649745957361;
        Mon, 11 Apr 2022 23:45:57 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f1b:f064:b948:7f3d:8352:96be? (p200300c78f1bf064b9487f3d835296be.dip0.t-ipconnect.de. [2003:c7:8f1b:f064:b948:7f3d:8352:96be])
        by smtp.gmail.com with ESMTPSA id fx3-20020a170906b74300b006daecedee44sm12758207ejb.220.2022.04.11.23.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 23:45:55 -0700 (PDT)
Message-ID: <25a1bac5-7758-9602-7c9f-9d8b02d845e4@gmail.com>
Date: Tue, 12 Apr 2022 08:45:53 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/7] staging: vt6655: Replace VNSvOutPortB with
 iowrite8
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1649706687.git.philipp.g.hortmann@gmail.com>
 <3cac1ca7000a56e82b390ea0ddbab5aa549ee7ec.1649706687.git.philipp.g.hortmann@gmail.com>
 <20220412063731.GA3293@kadam>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220412063731.GA3293@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/22 08:37, Dan Carpenter wrote:
> On Mon, Apr 11, 2022 at 10:49:39PM +0200, Philipp Hortmann wrote:
>> Replace macro VNSvOutPortB with iowrite8.
>> The name of macro and the arguments use CamelCase which
>> is not accepted by checkpatch.pl
>>
>> For constants from 0 to below 0x80 the u8 cast was omitted.
>> For variables which are defined as unsigned char the u8 is omitted.
> I hate that GCC prints warnings for this.  Useless.  Horrible.  But I
> understand that GCC does and we haven't figured out how to disable it
> or who needs to approve that.
> 
> But even then I still don't understand the casting in this patch.
> 
> Shouldn't the rule be to do the minimum work arounds to silence GCC?
> My understand is that the the casting is only needed when you're dealing
> with a bitwise negated constant.  These are macros so the parameters
> might be constant so basically any bitwise negate gets a cast.
> 

Please send me the compiler flags you are using.
I was using:
make "KCFLAGS=-pipe -Wall" -C . M=drivers/staging/vt6655/
But of course more flags are set.
I did not see any compiler warnings.

Thanks

Regards,
Philipp Hortmann
