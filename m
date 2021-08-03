Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A360070
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 08:15:59 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id gn26so35139050ejc.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LKpGLThUAKZDHBxGPyyiTIsZv8h3dQEtwjqNS0LfTfY=;
        b=Jykv0bXk9ykz+FwAMHQ94SbW1/Boq78aX+mtIOgYAUjHD3kwsEPGCbCtrmjzvmQiwg
         ntPoCunb06r859nLxzeRzsaeiQqFuF6+7YXVL9wfFARtVmyvXAHmIs+IbJPBUegWnTtG
         YkBYJJ1VgOnMb3McBASPEsO+OhO7gDxoo8IAq1MrKVJoXWCj1ZOGNqigR+6BoapTScoN
         IeSE9aKXX8vMr5dmUWIlOclDgI9vuVYUUfwkTMA3F578j3G27aWSVa/39NoRaIHlo8VR
         x2FbWinzknLPhccnr9zUuY4F3aY2qhT14+oM2JchuSfAtsHDUnd3fh60jsFyV6/lF9Wl
         6q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LKpGLThUAKZDHBxGPyyiTIsZv8h3dQEtwjqNS0LfTfY=;
        b=ADixts91GYB5rd47flJhnIZkdiOefJ1WGx0b68oHgVcLeRpeFYWtxenTtm5kuMgLmU
         qTVFCVDl8YJR+yvLkQNsi7TQEIlxudf80un+imFbHndidP++ZIPjpo1nm+s9YJwDYKId
         g8M4JQGBslzkCUwKyQi85XWyaEa0s7kGJykPsYY+pz2+Jg/vysl6E31fXaIZrH5bYsu2
         3PPyeFlEZegvBfCNPmptOWBkEHw7iAjL3iNoU+YZlOwjsDGswkcjloFHDcUbq8LWSn6e
         ZDUdDmQy5OPLDnVe28P6wuRGNlF/0Lpj4L/4AoaHruSSyQsPqlBSMt51MjFR8hzCCqmD
         8mxw==
X-Gm-Message-State: AOAM532wKb7VikY/cL21Pr6AD1eIA/IsCZrBDFQm3s+co+QNCj1c/67A
	MzkP/Yd/WHA4URX7CW7d9nA=
X-Google-Smtp-Source: ABdhPJy0DAU6dtMQD9LujJfzucK0gBpu1BRKcDooUtCQkwtILARc3qp9pIHE6/3Qx+r3cy7x3mqIyQ==
X-Received: by 2002:a17:906:5ac5:: with SMTP id x5mr16771566ejs.271.1627978557934;
        Tue, 03 Aug 2021 01:15:57 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id n16sm7677590edt.31.2021.08.03.01.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 01:15:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Fix different base types in assignments and parameters
Date: Tue, 03 Aug 2021 10:15:56 +0200
Message-ID: <2671423.i2fK0j4CO3@localhost.localdomain>
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
Dear Greg, Dan,

I just read another message where Greg K-H decided to revert this patch, 
probably also according to the review by Dan C..

In doing so, the sparse warnings of different base types in assignments and 
some endian bugs will appear anew and I think that these problem should be 
addressed in some other way.

I'll try to find some other solutions that result to be more correct and in 
line with Linux conventions. But, before doing the work I need to better 
understand what went wrong the first time. So, please, devote some time to 
respond to my questions...

> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/staging/r8188eu/core/rtw_br_ext.c | 46 ++++++++++++++++++-----
> >  1 file changed, 36 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > b/drivers/staging/r8188eu/core/rtw_br_ext.c index 
e00302137a60..31ca2e548555 100644
> > --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > @@ -71,7 +71,7 @@ static inline int __nat25_add_pppoe_tag(struct sk_buff 
*skb, struct
> > pppoe_tag *t> 
> >  	struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
> >  	int data_len;
> > 
> > -	data_len = tag->tag_len + TAG_HDR_LEN;
> > +	data_len = be16_to_cpu(tag->tag_len) + TAG_HDR_LEN;
> > 
> >  	if (skb_tailroom(skb) < data_len) {
> >  	
> >  		_DEBUG_ERR("skb_tailroom() failed in add SID tag!\n");
> >  		return -1;
> > 
> > @@ -134,42 +134,68 @@ static inline void 
__nat25_generate_ipv4_network_addr(unsigned
> > char *networkAddr> 
> >  }
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

Here I've been misled by something else. I agree that f1 should be four bytes.
 
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

I'm not sure to understand. Please, elaborate a bit. Do you mean that there's 
no need to use be32_to_cpu(*ipxNetAddr) and that we can use ipxNetAddr as-is 
(it is a __be32) as the second parameter of memcpy(), even though the 
networkAddr+1 is the address of an array of unsigned char? Is this that you 
tried to explain to me?

However, there's a huge error in passing the second parameter to memcpy(): it 
should be &addr.f1. Or better, let's make addr to be __be32 and then pass 
&addr (so there's no more need of that union). Do you agree?

> >  	memcpy(networkAddr+5, ipxNodeAddr, 6);
> >  
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

According to my understanding I need to wipe all the bits of addr.f0 before 
reusing it in the next assignment. Don't I have to?

If we agree on this, I'd like to explain why I use the xor of itself... I know 
that `addr.f0 = 0;` is more easily readable. But I've always thought that a 
direct assignment of a specific value (0, in this case) should indicate that 
one wants to use that 0 for something that needs that specific number.

For example, in `for(i = 0; i < len; i++)` to indicate that we want to loop 
starting from 0; or in `res = some_func(); if( !res ) return _FAIL;`, and so 
on. In this cases I want to make it clear that 0 has a precise and special 
meaning.

Differently, when one simply wants a variable wiped out of any content, just 
before re-using it for a subsequent "real" assignment, I prefer to xor(ing) 
that variable with itself.

Does it make sense to you?

> > +	addr.f0 = be16_to_cpu(*ipxSocketAddr);
> 
> I'm so puzzled.
>

Again like the assignment above, *ipxSocketAddr is of type __be16 and the 
destination of memcpy() is an array of unsigned char(s). I think I could just 
have a __be16 variable and pass the address of it to memcpy.

Do you agree with the solution above? (Probably I was so distracted that I 
didn't see I should have passed a pointer as the second parameter of 
memcpy()).
 
> > +	memcpy(networkAddr+5, addr.f1, 2);
> 
> This patch is really weird so I'm done reviewing it.
> 
> regards,
> dan carpenter

I'm going to wait a bit for your reply to this message. If I don't receive any 
response I'll wait for the revert and make a new patch and see what happens.
Or, I could fix the patch, if Greg does not revert 56febcc2595e.

Patiently waiting... :-)

Thanks,

Fabio



