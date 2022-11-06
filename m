Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFBF23A9
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 09:37:52 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id v17so13358148edc.8
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 01:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=io0/8bk23qfo5CTsPUcvXEb6MGcn33aYZt9gOjPuGXI=;
        b=Dj6BHM0FILQ+S8vjBLGgRJrvGiAGvjHQCCxlNtlYEMmA5waobtlnz0w5oFNqgJ1/as
         AO+XzcybTmbo9U8tXt5YzHupgd/XhhIbc0nI2sTc8ZdtLl8u1Z3FT+1RNcdUaAeaN8C+
         Zx4gjP+acw1eD/R4lUcUoI3ndpGxLgx68b6POiRY624+x4EAiUi/qB1bnyt82+LGi0Bi
         BNyMIRFTlF85VFiknNre4hRjnMBz63bajVoJIBnLjgOh02aEEQ9RiNFf2mVhwu/CTCyJ
         +35zTv+tEoa05MBiM15bqOCArw3R0xgIXJHT2NFuY28lW3NXJaIc4Kikmb4Nvy2H5Jt6
         8LCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=io0/8bk23qfo5CTsPUcvXEb6MGcn33aYZt9gOjPuGXI=;
        b=Lh9yogCV+qVtrLdvP6BB9Sa85/kA0atDvSazUGu97pf407h1Hxs+N9ORWUbLqZ+C5b
         qBtL7+MsWT/WXsW9XawqriQTGVMa+9sMhOZwSOWgneURFGgbWR7t2sC0Rrmc0/bQrS1X
         x/ACGGOyDnjKUaPdYUI3Y42Q424jrIHC4Mk9GiTpnCibQjL8u5ZQaJ21+e3b4QEZc6+T
         kjxV2HvLiW0mz1tqE9UfdC1NZ2TMHkt0EGZa9UjJKzbpcQOzo9knmtp8WCF6YE0zh5js
         lxbeErnOIjF8mUaJL0D27PzxutlfbB29SJeAmctZrqgaHtVOHyYPTvWinXXdD14Gvo4O
         QNfw==
X-Gm-Message-State: ACrzQf1uaZvHuVQaw4E8I7NScwaGZ9eT0foyruTKHT/3vVxYSbgbtxSr
	sn5EAVPxD+saLP7toTN0L6M=
X-Google-Smtp-Source: AMsMyM4XpkPstkk1eZEL2oVdpiHe0WCxgkqtOASRuqNIW07B0OkrJOVWofCYsTeWF6RvVwIMspg6yQ==
X-Received: by 2002:a05:6402:2073:b0:461:5462:9dc9 with SMTP id bd19-20020a056402207300b0046154629dc9mr45132451edb.52.1667727471043;
        Sun, 06 Nov 2022 01:37:51 -0800 (PST)
Received: from [192.168.0.101] (ip5f5abba7.dynamic.kabel-deutschland.de. [95.90.187.167])
        by smtp.gmail.com with ESMTPSA id n20-20020a05640204d400b004588ef795easm2402500edw.34.2022.11.06.01.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:37:50 -0800 (PST)
Message-ID: <c630dd74-83a2-5f98-bd8f-c1eab7df5f96@gmail.com>
Date: Sun, 6 Nov 2022 10:37:50 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] staging: r8188eu: convert three functions to bool
To: Greg KH <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221105093916.8255-1-straube.linux@gmail.com>
 <Y2ZD0B6bsDbdpa6A@equinox> <Y2ZIMCv7n8OgzqTG@kroah.com>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <Y2ZIMCv7n8OgzqTG@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/22 12:25, Greg KH wrote:
> However, these function names are horrible for being in the global
> namespace, but that's a totally different issue that can be fixed up in
> a later patch.
> 

I'll send a patch to address that after this patch is accepted.

Thanks,
Michael
