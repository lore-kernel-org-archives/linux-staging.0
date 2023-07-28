Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969B423AE
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 05:25:02 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so18680395e9.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 22:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690521900; x=1691126700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QhXjvTT1z/0Yde7vmO70EoyF2uav/7UHdhOF67DdG14=;
        b=XOQgq3+ILcCCJmdqTQzoiRxVgQX65mXoXI4u+ymyDQGTa2JEOKd5rI4c2BUeZQ9ddp
         4hLFTUYPbQ3wth7dA32jY73j9JABR7M/hYXTlI0K3RikX0Af1pE+7s+kZjfm6ZGq5ZQB
         rfv5QeZhhiGHOXIxXNVuY6a+rf5eSp6FCag/+NvyyHzoN6ZH30DQP/b3Z+JX2A+R8Zat
         gfVZvxZH5i6G9yk0JPTiengAvXb5kyHEMtcuENqynXv2n0RziGFyGHJUFKPe499ydroU
         1N+iyM7RrslQnVYbudq8/b5oPXQrVw5Wq6FdotezmIpKZiIvC0eGS+mg2fLYMSlUwZEv
         LyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690521900; x=1691126700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhXjvTT1z/0Yde7vmO70EoyF2uav/7UHdhOF67DdG14=;
        b=OcZ+P4HtW9glgImwBDbidKOegM4UBpjOoW/rqaIF44Lk+DrvyZp/hYcgaWiCIj1j17
         aU06f3FkSTljBCMLa3YRmtirlOlOLTlaGx8/TxVPe/GU3w9b+XCsi3JAhh0SE8mfh2vv
         w7TYu+3i2FlsIxfm0XN2cxZwBTKExUgE6+X+ShBxpelemF/sPbwcf0Nf8X0/eyj5DZPU
         TvwK0kzLxq5sw/c75VkI2gU7v99D2PnUzOFIkcgsQ+Z8f7hi4YjDhtc47o5Erje1HINB
         TNGxE3UrJi/auin4g353/XmQwD+gPxvYKVaTS0PaWUHfx/Q9V8cb1rVaM13Bw6QEpph+
         IC6g==
X-Gm-Message-State: ABy/qLZW+SC3K5eHC+QHGJb2bKcHmtbgFAZCkqmURGX3tzbNO7s6rxav
	BFsCyAkDjEv8PvZyZKs4TlnZuA==
X-Google-Smtp-Source: APBJJlGHtNWsq2d6hGtGwwyGl9qqBOF+mkyNxUw1SO2HGPsAosfmm009SzN4C8A/L0G//Y5RnoXO5g==
X-Received: by 2002:a05:600c:2258:b0:3fe:10d8:e7fa with SMTP id a24-20020a05600c225800b003fe10d8e7famr25702wmm.41.1690521900478;
        Thu, 27 Jul 2023 22:25:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c248100b003fbd2a9e94asm3241617wms.31.2023.07.27.22.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 22:24:59 -0700 (PDT)
Date: Fri, 28 Jul 2023 08:24:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <2354895b-c127-40eb-8f16-b19e4750e1d0@kadam.mountain>
References: <ZKjeHx/zqrNIqaA6@alolivei-thinkpadt480s.gru.csb>
 <2023072729-sensitive-spyglass-ec96@gregkh>
 <ZMKDeyGaPQHm6/pr@alolivei-thinkpadt480s.gru.csb>
 <2023072741-mankind-ethics-b95b@gregkh>
 <ZMKkgItqf8r8BcRB@alolivei-thinkpadt480s.gru.csb>
 <2023072752-stem-pupil-76ab@gregkh>
 <ZMKrcvpu3b15Hdif@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMKrcvpu3b15Hdif@alolivei-thinkpadt480s.gru.csb>

On Thu, Jul 27, 2023 at 02:37:54PM -0300, Alexon Oliveira wrote:
> > 
> > I would have thought you would get a "line is too long" warning, that
> > didn't happen?
> $ pwd
> /home/alolivei/git/kernels/staging
> $ perl scripts/checkpatch.pl --strict -f drivers/staging/vme_user/vme_bridge.h | grep -i parenthesis
> $ 
> Nope. I didn't get any of that. Check it out:

Heh.  The warning is there but you used grep to remove it.

Speaking of long lines.  Could you fix your email client to line wrap at
75 characters.

regards,
dan carpenter

