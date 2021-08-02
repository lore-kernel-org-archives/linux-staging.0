Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85753168
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 14:26:36 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id cf5so13199351edb.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HXkv8U6JEJ9uH4cM8zikMXs3OixCFv3bMO79Qh9hRvk=;
        b=KZ+utS5C56NNXbltvwIEGLsCy0bGdgb3Ze6cNxcMKLIFalGqlOxdbk7q8BKU1tgysO
         2Hk/NPPCVzGHmUgOud1TiKHpvmH6oOVVCgNGq9+R5H/IEC6jSXxlz0Mqwhwye/T0guOD
         YwUBVmOQwZNx3YaGLWC7QZSth8BEUT6Q7vSKaoJkeGsWxsDH5bB9HTvZpPpijrurPnuH
         2zoLr+Lp+w1aKByskUV7ttaPx3qN3bhns6fT1McK15/zlhtfUCc1c8bSKQQhL4hKFfJv
         Ef8A/UtqRSznVez7EVYoVzSsP5Ls9VNdEj0EzMWYL6xrY+gdLqY+PKO2l0i+5ZztOxJi
         kdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HXkv8U6JEJ9uH4cM8zikMXs3OixCFv3bMO79Qh9hRvk=;
        b=TDkFB+NhNBc4U8e3/d/LWvmTQU6D29l2VIj4d8ZINzr88DUwCwNIxHuGg+YADxXU24
         MhH4wVdrKgGdPM83TPP54ybH0T3g/uGx+1/Rsy7K5SahqfygTwd4SKmQxuqsbnERVvgW
         x/63zOnu/nEIEGjJ3/CS94+jNfU4iMWjDUt0mDFwQqcKsvf3D5nZZ9PV3fcH8+G3RIfz
         SL6hzGrsgtfPnCMoz7G2XUyOUiQNnQfDvJSjw1UD1V82tQJY3wTt2e2CtxyxGA/8dJEz
         +Syzw3m/AvtX7ApZ6kD9M+7soljQCUZwN0XZZd8OfUFU/RgCxbO7QsFvOCFT8VT22u2/
         gapg==
X-Gm-Message-State: AOAM5310EnlWNbBAYLP2ejSZ2ZqxIooBiWYwhTDiVz35bErzFxcCPj90
	/1zShES/0l+lHLbdlXMstXM=
X-Google-Smtp-Source: ABdhPJzmbuhQhMHrqCMoAEhIfIYYvo4WYLMCu+/FTRVKU/TnGd+skwQn76xwKPZQdOp7z+rGc0rSoA==
X-Received: by 2002:a05:6402:30a2:: with SMTP id df2mr19858730edb.363.1627914394853;
        Mon, 02 Aug 2021 07:26:34 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id de19sm6252267edb.6.2021.08.02.07.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 07:26:34 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Fix different base types in assignments and parameters
Date: Mon, 02 Aug 2021 16:26:33 +0200
Message-ID: <2081658.ULrIQvW0dQ@localhost.localdomain>
In-Reply-To: <20210802140505.GZ1931@kadam>
References: <20210730181452.23062-1-fmdefrancesco@gmail.com> <20210802140505.GZ1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 2, 2021 4:05:05 PM CEST Dan Carpenter wrote:
> On Fri, Jul 30, 2021 at 08:14:52PM +0200, Fabio M. De Francesco wrote:
> > Fix sparse warnings of different base types in assignments
> > and in passing function parameters.
> 
> This patch fixes some endian bugs but it's not mentioned at all in the
> commit message.  Did you send to the correct patch?
> 

Too late to change the commit message: Greg K-H has already taken this patch 
as-is (please see commit  56febcc2595e).

> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/staging/r8188eu/core/rtw_br_ext.c | 46 ++++++++++++++++++-----
> >  1 file changed, 36 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > b/drivers/staging/r8188eu/core/rtw_br_ext.c index 
e00302137a60..31ca2e548555 100644
> >
> > [...]
> >
> >  static inline void __nat25_generate_ipx_network_addr_with_node(unsigned 
char
> >  *networkAddr,> 
> > -				unsigned int *ipxNetAddr, 
unsigned char *ipxNodeAddr)
> > +				__be32 *ipxNetAddr, unsigned char 
*ipxNodeAddr)
> > 
> >  {
> > 
> > +	union {
> > +                unsigned int f0;
> > +                unsigned char f1[IPX_NODE_LEN];
> 
> What is going on here??  Why is f1 six bytes?
> 

Please look at the third parameter of the latest memcpy() in this function.

> > +        } addr;
> > +
> > 
> >  	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> >  	
> >  	networkAddr[0] = NAT25_IPX;
> > 
> > -	memcpy(networkAddr+1, (unsigned char *)ipxNetAddr, 4);
> > +	addr.f0 = be32_to_cpu(*ipxNetAddr);
> > +	memcpy(networkAddr+1, addr.f1, 4);
> 
> What's the point of a union?  memcpy() doesn't care about endian
> anotations.
> 
> >  	memcpy(networkAddr+5, ipxNodeAddr, 6);
			                     ^^^^^

I'm talking about this memcpy().

> >  }
> >  
> >  static inline void __nat25_generate_ipx_network_addr_with_socket(unsigned 
char
> >  *networkAddr,> 
> > -				unsigned int *ipxNetAddr, 
unsigned short *ipxSocketAddr)
> > +				__be32 *ipxNetAddr, __be16 
*ipxSocketAddr)
> > 
> >  {
> > 
> > +	union {
> > +		unsigned int f0;
> > +		unsigned char f1[4];
> > +	} addr;
> > +
> > 
> >  	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> >  	
> >  	networkAddr[0] = NAT25_IPX;
> > 
> > -	memcpy(networkAddr+1, (unsigned char *)ipxNetAddr, 4);
> > -	memcpy(networkAddr+5, (unsigned char *)ipxSocketAddr, 2);
> > +	addr.f0 = be32_to_cpu(*ipxNetAddr);
> > +	memcpy(networkAddr+1, addr.f1, 4);
> > +	addr.f0 ^= addr.f0;
> 
> What on earth????

I can't see any problem in xor(ing) a field with itself. Perhaps I read too 
much Assembly code :-) . However, am I missing something? 

> > +	addr.f0 = be16_to_cpu(*ipxSocketAddr);
> 
> I'm so puzzled.
> 
> > +	memcpy(networkAddr+5, addr.f1, 2);
> 
> This patch is really weird so I'm done reviewing it.

I'm sorry that you don't like this patch, but Greg already had the last word 
on it.

> regards,
> dan carpenter

Regards,

Fabio



