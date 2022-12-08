Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B6A21
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 11:37:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id ay8-20020a05600c1e0800b003d0808d2826so3944372wmb.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 03:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp8pwOm51jJbX2U8CysByv6l44up2gkmggH0zmR59uU=;
        b=hr9g9oA+X3Q3043FEle4T9g+0A9Xy44HTORfEb/s5xPM1dHsqTmiUzWPCvcRsRkKb3
         F2LL52mTvFPafXt7UzioOfPl8ePCQb6JJbkokegpperyXh5Omlhht2+ikyG7P14drP4m
         XC9E7hn88V7iM/tzIrEv392Hxe//oNSq3ZmicDIr4qrDO86eFN1NgRV11q4ZHVMX02EH
         0IREJzJCeW4nQCO7EZDPVZXenNE9RiW1y7/181+lWDA+OzFRkhd9mtzPVcVbOUh9BUR5
         uUTADI8/P/tfMkKS7Hjsa5PtBJsVJtf2+/6c8DR8EaStTNMLNzJBHm7wp/3GFxT+X8pS
         7NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp8pwOm51jJbX2U8CysByv6l44up2gkmggH0zmR59uU=;
        b=5dWTm4JodLVh6mcn1e+rb2eezA+gvpX385JIYvHH4RGldk53CopAe2xsGQDk5z8YSz
         gME/+YVqzPM5qtGdJRJMlcb8E6r/HanlKBLsn795sOcSs0CGhEOMxy/u4fE/dWO+hNHM
         yWB3FsaifPAoPAzJhaPyCsfzVzi686GaAInXBu/7duzCO6o+klFtkcqs9Gs1kCUxRK6w
         WPsSiU1AHzu0Xtfxt2CQYH+/2xGUzxUBdJLJ++qB8Hze6j/0HB3at1+lCWDD4wK0N/Yw
         dpiBF1Q9lEl2XUwKlToiQ/N7xkXzwj9imq05WgKfUgKyn3TKtQxajk+cRCVPziTOCcmv
         QhEg==
X-Gm-Message-State: ANoB5pm0oYRhOmYRuwfphmSCnu9QdnoQZSF/yC4mPhzT6sn853J2SgEx
	rZGDgY/z6r8oXCmXxkrtNaP8JJoyMYRqyjRf
X-Google-Smtp-Source: AA0mqf6PbtX+3B/j+FAZZNk65Q8S/kUPfPrdRl7H0QGckaFLO8gzU3pBjZnRq2LRDdZLbvVAlfklEQ==
X-Received: by 2002:a1c:790a:0:b0:3cf:e137:b31d with SMTP id l10-20020a1c790a000000b003cfe137b31dmr58493535wme.205.1670499458979;
        Thu, 08 Dec 2022 03:37:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m38-20020a05600c3b2600b003b4935f04a4sm6757693wms.5.2022.12.08.03.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:37:38 -0800 (PST)
Date: Thu, 8 Dec 2022 14:37:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 RESEND] Staging: greybus: camera: fixed brace
 coding-style and indentation issues
Message-ID: <Y5HMf2PsvHVKmJ0z@kadam>
References: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>

On Thu, Dec 08, 2022 at 04:59:46PM +0530, Abhirup Deb wrote:
> Fixes checkpatch.pl warnings for missing braces in &gcam. Fixes
> indentation issues for functions, following the Linux Coding Style.
> 
> Signed-off-by: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
> ---

I notice as well that this is a v2 patch.  You need to add an explanation
under the --- for why.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

