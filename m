Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B092F80
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 06:41:19 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id y22-20020a17090a8b16b0290150ae1a6d2bso8590787pjn.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 23:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kImME5iIeF2ku552Ogx5gcM67tAerfzPBPxvLhd8mak=;
        b=CfMqLMcYNo44BeSwgqtGFzUdJePtmsZD1wL5ol348PnvSg5iCVb+PkkT0paOoZaJfB
         w8jPXJwXzG8+bXVHnjFKTZdFKe42K6ZAJ+98H7YrtgdmXFOl8kxixnkOxj7rs72LTfad
         RzWy3Ai2rrl9KOhmlg5hicwQsElwCtD13dbf+Zk7KFp4zxgmgYs0BAsB+RZ2mhX91Chp
         ERL0ahLx+XV9Yx9e+qQYXxtrblzhyxw1fzYoEREuMUcTV3S2ot/+5mlkGJXybFL3nSAM
         J18Opio0/gXJ9ykD/+Wvl7WUC3pqBdg7+zF+CgIXz8KjByZ0F4vZ/9LXOBoYZ4jinTMR
         smGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kImME5iIeF2ku552Ogx5gcM67tAerfzPBPxvLhd8mak=;
        b=nTQDXJTExG12wJZQvSXCg/s1EYUU3/A64zecmSA4Ztwq4W8tBl8Ns1b8Un5stv7WKV
         7m0YswMwlFofY5w60VzbwQnf379fwO2cCOZJV7DxwG0/aDbXuyxZT0Txc6YuVjTA0ZuN
         MVjndhZspt4LJv1X4LoHLiB0FVKEbwPwZKyxkxhdzUhnWFFQeEom6o/DeliKuj9WWx3G
         l9W6YQ0rbbLT7BsA0HHV3n6LwhPRtbdVTLG7tS9faiJo7ynQj7MnAO0k+OYFrub4ZpKG
         s7fLctxNd9KRDocghBFANIS1jXAKtiUvbVZE3ityij3ytNXfVT8pm7TIrEbLkwhY/wRS
         Z7HA==
X-Gm-Message-State: AOAM531bUR0J7YcPgbDV4lbz0ma3O4colKzB7T4REYuXVEWSCISEwNA2
	94Opmho5hAg1IPHek6CrljY=
X-Google-Smtp-Source: ABdhPJzX9qEoiBScoUVof9fcdElcKhFLLOEgwXKhJIZnzzTIqJW9f7rbN01QdC4waBt/TTjyQfLX+w==
X-Received: by 2002:a17:90a:aa11:: with SMTP id k17mr2317606pjq.211.1619592078631;
        Tue, 27 Apr 2021 23:41:18 -0700 (PDT)
Received: from ashish ([182.77.14.23])
        by smtp.gmail.com with ESMTPSA id m20sm3748357pjq.40.2021.04.27.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 23:41:18 -0700 (PDT)
From: ashish <eashishkalra@gmail.com>
X-Google-Original-From: ashish <ashish@ashish>
Date: Tue, 27 Apr 2021 18:04:36 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ashish Kalra <eashishkalra@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wlan-ng: silence incorrect type in argument
 1 (different address spaces)
Message-ID: <20210427180436.GA37280@ashish>
References: <20210427165844.GA35857@ashish>
 <YIj6dw5afJ1bBYWK@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIj6dw5afJ1bBYWK@kroah.com>

On Wed, Apr 28, 2021 at 08:02:31AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 27, 2021 at 04:58:44PM +0000, Ashish Kalra wrote:
> > Corrected data type for variable data adding __user to make it cleaner and silence the Sparse warning. This is version 2 of patch, version 1 can be found at https://lore.kernel.org/linux-staging/20210420090142.GA4086@ashish-NUC8i5BEH/
> > 
> > Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
> > ---
> > 
> > Changes from v1: removed type casting of (void __user *) for req->data and corrected type for data to include __user
> 
> Did you send this twice?
> 
> And please wrap your changelog text and put proper information in it,
> not references to previous patches.
> 
> thanks,
> 
> greg k-h
Thanks Greg
Sorry for sending twice due to some issue in To list
I have corrected and send again as per your inputs
hopefully it will be ok now
