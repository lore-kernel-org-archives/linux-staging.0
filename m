Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03B72
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 11:45:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id gn26so30433510ejc.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 04:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QQYCpHJmp8uC7aFvit0nfPjJGJp7mRZxxtVuqB2tCDY=;
        b=azqj+BfZoaRebYhVFIG0bWlGPdH/zX31M4uyrGiwqPqsqXbFlLfVu0hseU967UBS5I
         kHtVg2Aftmdh5iI2HUyVlETQdTbdzXbcb5wmlUbuG/TLeAnOXIxcp3tkdrNeaH/tqGz4
         Ushb+yW+VERF2Dw/FlNGleRyAayiw80zljifk11XGAaV9NPIrYeWDhQDa8BUutA6pr+R
         PzBUK1+YTnyM8pjUBx0Wp+GSIAQ2MjWDv/MAckgtK4ApkEsULWzINpdl4pPsGwTj7UYs
         oN0toPcq23FDjNHIGajBaQ2qUuAKk/SG9FA7lsJ0irOCOZ/6ahWGswEx3kdVlOL9evB7
         6/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QQYCpHJmp8uC7aFvit0nfPjJGJp7mRZxxtVuqB2tCDY=;
        b=JIhYrZoPXSGuzfsGECITRzVkjms+dVIQ+AjSjPHDq67Y2G1EsfMKtm8IKzGcYvJxtS
         zB1ylYn1ItvWEYB7mo/+alFSfWSJg81u6X7H+6QB4k04XQ+LpsLt+DNWiMkFheWV8Lxy
         FxQcxmISterab6aZkW4eqmnQn1Hr+MAapdGi9TFysvY09eTmFp3aUsDV1g4QhYfHsMCO
         cO5G894togLssvBHHhHxF+LouqHOV2eeglIk6AuEkquzSTkXhlq/I+j3yjb0qhyrjL3u
         MNn/WuiD8PfOb218EfjNjmTM4GtkVPBVmWLrNoEu/DywvI9nRQjtWzvBZykILGXZxVl9
         UfcQ==
X-Gm-Message-State: AOAM531oTdU3WMt4Yn3A6vLJdJJZvjUBI4MLSk1fR72AQrj/4KMkbO2B
	c7Y6bKT7JIZg1dwquAq2oO4=
X-Google-Smtp-Source: ABdhPJyNZB7XXcSbXyYBqLnZMUEY1Yqr4bx+VwLeu/9cH9+EIBji/FiOy++e9eSF1/j+lMqi73qz+g==
X-Received: by 2002:a17:906:3b87:: with SMTP id u7mr15219773ejf.66.1627904708359;
        Mon, 02 Aug 2021 04:45:08 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id q8sm5876246edv.95.2021.08.02.04.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 04:45:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Subject: Re: kernel BUG in new r8188eu
Date: Mon, 02 Aug 2021 13:45:06 +0200
Message-ID: <147993920.vpeT8VCmXh@localhost.localdomain>
In-Reply-To: <YQfKohnSRWHjlht6@kroah.com>
References: <80042e9f-6811-38f3-010b-1c0951ba88db@lwfinger.net> <cef19337-5ff3-c0cd-33ef-4f9990bcd4ec@lwfinger.net> <YQfKohnSRWHjlht6@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Greg,

On Monday, August 2, 2021 12:36:18 PM CEST Greg Kroah-Hartman wrote:
> On Sun, Aug 01, 2021 at 03:15:52PM -0500, Larry Finger wrote:
> > On 8/1/21 1:31 AM, Greg Kroah-Hartman wrote:
> > > I am worried that my "remove the wrapper" logic got something wrong
> > > here, so if you could test the revert of that, I would appreciate it.
> > > 
> > > I think I need to go buy one of these devices so I can test cleanups
> > > locally...
> > 
> > The bad commit was 9ff1cc4ef80e ("staging: r8188eu: remove rtw_buf_free()
> > function").
> > 
> > Looking at it, the only difference between the original wrapper and the 
new
> > code is that the wrapper zeros the len variable before the kfree() call, 
but
> > making that change did not help. Reverting that patch restores the old
> > behavior.
> 
> Ah, doh, that was my fault, sorry, that patch was incorrect (odd git id,
> don't know where that came from, it's a different id in my tree.)  Let
> me revert this commit and then will redo it correctly.

The commit to revert should be c7e88ecbe328.

> 
> thanks for finding this.
> 
> > There are lots of these on Ebay from $2.47 up with free shipping!
> 
> Any hints on the name for how to figure out which devices are supported
> by this driver?

The following link points to a device that seems to be supported by this 
driver. It is just $4.99, but I'm not sure whether or not they ship to Europe 
(I suppose you're here):

https://www.amazon.com/gp/product/B00L28AN88/ref=ox_sc_act_title_1
 
About this item: 
* Chipset:RTL8188EU 
* Standard: IEEE 802.11n,IEEE 802.11g, IEEE 802.11b 
* Supports 64/128 bit WEP, WPA encryption 

Otherwise, I think that the following uses the same chip as the above. 
However, it costs a little more and, above all else, I'm not really sure if it 
works with r8188eu, since they write that the chip is a Realtek RTL8188EUS 
(please note that final "EUS"):

https://www.amazon.it/Asus-USB-N10-NANO-N150-compatibile/dp/B081758CWC/
ref=sr_1_1

Thanks,

Fabio


> thanks,
> 
> greg k-h




