Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0A2F25;
	Thu, 16 Mar 2023 12:03:56 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id w9so6683640edc.3;
        Thu, 16 Mar 2023 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678968235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wlpeM5UguksmXESG0oRb11EaXAJOpN9tS9q1lJArhJQ=;
        b=JDPEEgm2VfHy9iCZT4/fnPcLSzoP4unFp6RLVhbnGDcIt56+r0ofQizctvGDPHnC4h
         Isfq2bmUDep1orRzSWR2pcjFH3TNyMdSI2rFkuEB7ycxKtBLE1/J/NAXYkYj6NwNU07T
         7RMv6EHiv1nf9/XuQgDGmKHktvnTqpkyuOrX/KEY3yn5MrHOUCewNvlzC/oF6PhuWYus
         evCd/OigZNfCS3/WygWJTCxRs6YwVCc1E6GyGn7fB+GZH/CxNBlBdDv7tR4DSPxgI5aL
         MSk29fEfAzJ/TxQyiavCfEukRsadc3QpGpuaeFKb/lqCFoMsuoRKG5gqY+jqvppg2LRa
         LpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678968235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlpeM5UguksmXESG0oRb11EaXAJOpN9tS9q1lJArhJQ=;
        b=0DyJb/CPIr4NRH2SU9MeWu99SNc0iOe3tECB9mdvgbaB7mrFNuv5vuEYZPDNi7ieVB
         X1wpH38AgFBajfttj5P6d+m2OmN+4eRHC0uIq+G3X6crFAsg5VrowQCNMlwNseipP3cP
         m7Xo+dVDEO04CUAK0rzYOq2GZ/JzSCaUvq8KbZVhhzTquvXyz24Hmzq9Gw6E4d9Q4o+t
         GMHj2WbnNcVRYJL4PLxlIguKxlYCj4hN2dynRPKxkf4lUr13FtM4GIHub9o5xjGnZmiB
         A/ZCzrgxHludAk287JBZd+FzLdlRUwz4zYzBiSQ/pZHmTVQP6b5CxHd7C5WHWEM7OqFY
         Cp+g==
X-Gm-Message-State: AO0yUKVVd82jGfDsTYJ7fJJMzpkcffu/FRKZ5W2ClGBjmBjHMWpfsgJy
	nxtHyZ7NPddPwa956vnHGtTH+oW19C0p9PfP
X-Google-Smtp-Source: AK7set8S05CDQKjQ5gYxFTUel7gKHxL7+STiiRFF0iHPqzYWoEH3WZUr/hulMkZpdlRqMW6u/v9UQQ==
X-Received: by 2002:a17:906:a215:b0:889:b38b:4bb2 with SMTP id r21-20020a170906a21500b00889b38b4bb2mr9623247ejy.49.1678968234967;
        Thu, 16 Mar 2023 05:03:54 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id tk13-20020a170907c28d00b0090e0a4e1bacsm3740039ejc.159.2023.03.16.05.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:03:54 -0700 (PDT)
Date: Thu, 16 Mar 2023 17:03:52 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBMFqDWuZQdg3YP3@khadija-virtual-machine>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
 <3096768.uvML7RA1vL@suse>
 <ZBLmev7BaIhYQXIz@khadija-virtual-machine>
 <1797409.3VsfAaAtOV@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1797409.3VsfAaAtOV@suse>

On Thu, Mar 16, 2023 at 12:13:23PM +0100, Fabio M. De Francesco wrote:
> Khadija,
> 
> I'm not yet sure whether or not you are doing well with reserving 13GB to a 
> VM. First of all you should better use multiples of 2GB. Furthermore it looks 
> too much memory unless you have a total "real" RAM in your host exceeding 
> 18GB. You must be sure you are leaving enough room for the Windows host to run 
> smoothly and avoid too much swapping to/from disk.
>

Hey Fabio,

I have 16GB RAM. I just chose the highest option that VMware
recommended. My Windows is running smoothly. 

> At the same time I doubt that you can reserve 8 logical cores (2x4) for 
> running the VM on VMWare.
> 
> However, we have time to investigate and adjust your configuration (if it 
> really needs to be fine tuned). I'll try to reach you on IRC, open a private 
> window, and assist with this task ASAP.
> 
> At the moment I'd prefer to see you focusing on getting your first patch 
> accepted by Greg.
>

I am working on the new [PATCH v5] as I was able to remove the warnings.
However, If you still think that we should work on the configurations
then we can start working on it. :)

Thank you for all the help.

Regards,
Khadija



> Thanks,
> 
> Fabio 
>  
> 
> 
