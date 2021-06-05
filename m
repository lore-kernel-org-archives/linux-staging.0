Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A8870
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 00:54:25 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id g17so8377064qtk.9
        for <linux-staging@lists.linux.dev>; Fri, 04 Jun 2021 17:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NXAAlR719ENS+6C5c36KajeUdOG3OvOItiqbEK2oPLg=;
        b=fbuVu0lM6+/bd926/ICmPduXJesNzGTKTe750vre3Aj5tcfED1brCvXrJ7ilyOCBz5
         NTSyuzTWSH98JTZ6Jmjt46+SergozH/63ihz5vvdyZ2C67yZVW4g6MQXzXJwxobVcclL
         9FpYOlOSO787HRrEzijqzcgoWfPzqt03L8VAiGTYWKTbshFW39WZqZ00XiesaXTxglh2
         Nm8bFopSnqAfyoVli2rS3sGqYVNyzjueOxi7dno82MV/yo5qOsD5DB1JUey1QbEO+/O+
         +HI0X2Av+h5dP7G/XI2FRiI6dW/2uUTE/rfyQZlj7EtGmck54kwrc/R8/r96716B0eKj
         fqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=NXAAlR719ENS+6C5c36KajeUdOG3OvOItiqbEK2oPLg=;
        b=ZW1yYvkerXrQdaWkDi3s9JnKOtzFZg5c0gfb6RVfWI2UIScD38yzS3y1N9uW7/xi9s
         Rhpcgeyv732mc99D2ztrhD7vnp2llPkerWWxDR97RsgP4kwDHiWS69BvIwvQDjr/KACF
         IfCKj+QvJLChqENV7rDkOD8+9tob6IlPWaXsTJ0ucURG4v0u9SQPQaf8hD2f0dsRNGWl
         c5nOddVukYg5UPJFc9394nBgL1k9qkACT8x+sZy64pf0FiFszup/SwY4YJuESv6NSzu6
         0NbfBwIM46+B2P4cXL+q7/mVLfUdRMyy6LTNxE02rASdpLM2wXJuH2vjiO/jej6nmoWB
         /svg==
X-Gm-Message-State: AOAM530qdtNS3/Bc7MbjjodPWM6mQ+LPiAZESAvYQBbfR/Nd5ZlalCFi
	zYiJmpKRp1jBKjFBGfZAQDU=
X-Google-Smtp-Source: ABdhPJyWUZMhqNlBfL//DMx4Q+YFN4wCxyUo84Qkhc4nARkGLqt22N9NvEaP4oQF+CJpR4QfVoOeVw==
X-Received: by 2002:ac8:5a86:: with SMTP id c6mr3924413qtc.242.1622854464485;
        Fri, 04 Jun 2021 17:54:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d12sm5060851qkn.126.2021.06.04.17.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 17:54:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Jun 2021 17:54:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use list iterators and helpers
Message-ID: <20210605005422.GB255680@roeck-us.net>
References: <20210428173301.149619-1-linux@roeck-us.net>
 <20210604172632.GA1526@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604172632.GA1526@agape.jhs>

On Fri, Jun 04, 2021 at 07:26:33PM +0200, Fabio Aiuto wrote:
> Hello Guenter,
> 
> On Wed, Apr 28, 2021 at 10:33:01AM -0700, Guenter Roeck wrote:
> > The rtl8723bs driver manually re-implements list helper functions
> > and macros in various ways. Replace with existing list helpers.
> 
> I'm testing rtl8723bs on a baytrail tablet (Lenovo Ideapad MIIX 300-10IBY)
> and applying the tag staging-5.13-rc4, loading r8723bs makes the whole
> system freezing while trying to connect to local AP.
> 
> Only a power off is allowed.
> 
> I found that commit b3cd518c5abd42fbc747ef55a5fdc40bf7bf01c0
> (staging: rtl8723bs: Use list iterators and helpers)
> introduced the bug.
> 
> I'm trying to find out what's wrong with this patch, have you any suggestions?

Some of the iterators needed the _safe variant which I didn't take into account.
I thought that was fixed, but maybe some locations were missed.

Guenter
