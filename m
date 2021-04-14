Received: from smtp76.ord1c.emailsrvr.com (smtp76.ord1c.emailsrvr.com [108.166.43.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39AA71
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 10:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1618396821;
	bh=MQU6zXTnVwC2EPvBCKMA0CNrDk1Hk62GskHjEQLN++U=;
	h=Subject:To:From:Date:From;
	b=VxbK51V12I1+YhED/ZiC1XXgppBjUCKLhEqsnjPlhBFjwOR3ZG20W5P+CoSJbgJ0i
	 XlTSAMi2ZdxVY1CbYruiBViizNCc85iVVn3IFraJRRaLv3Eoe6ve713u3yLfEjxy+Q
	 XiSS6QUamxCOMf2aJCOTB3p+V7i62zsP4YVYV+iQ=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp18.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id C0AB4E0101;
	Wed, 14 Apr 2021 06:40:20 -0400 (EDT)
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "Spencer E . Olson" <olsonse@umich.edu>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com> <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com> <20210414100905.GD6048@kadam>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <1220f6b3-69b0-fac4-5dcf-d06ea517ea0f@mev.co.uk>
Date: Wed, 14 Apr 2021 11:40:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210414100905.GD6048@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: 9aab8e67-545c-4e58-afcd-0a6abe5e9573-1-1

On 14/04/2021 11:09, Dan Carpenter wrote:
> Small resource leaks:
> drivers/staging/comedi/drivers/ii_pci20kc.c:503 ii20k_attach() warn: 'dev->mmio' not released on lines: 452,457,465,474,483.
> drivers/staging/comedi/drivers/ii_pci20kc.c:503 ii20k_attach() warn: 'membase' not released on lines: 441,452,457,465,474,483.

The comedi core calls the driver's "detach" handler if the "attach" or 
"auto_attach" handler returns an error, so those resources will be freed 
in ii20k_detach().

> drivers/staging/comedi/drivers/gsc_hpdi.c:672 gsc_hpdi_auto_attach() warn: 'pcidev->irq' not released on lines: 629,641,646,651,655.

Similarly, gsc_hpdi_detach() will clean up when gsc_hpdi_auto_attach() 
returns an error.

> drivers/staging/comedi/drivers/addi_apci_2032.c:289 apci2032_auto_attach() warn: 'pcidev->irq' not released on lines: 279.

apci2032_detach() is called to clean up when apci2032_auto_attach() 
returns an error.  The IRQ is released by the call to comedi_pci_detach().

> drivers/staging/comedi/drivers/cb_pcidas.c:1446 cb_pcidas_auto_attach() warn: 'pcidev->irq' not released on lines: 1295,1301,1305,1340,1358,1378,1409,1427.

cb_pcidas_detach() is called to clean up when cb_pcidas_auto_attach() 
returns an error.  Some of the clean-up occurs in the call to 
comedi_pci_detach().

> drivers/staging/comedi/drivers/cb_pcidas64.c:4046 auto_attach() warn: 'pcidev->irq' not released on lines: 4044.

detach() is called to clean up when auto_attach() returns an error.

> regards,
> dan carpenter

Thanks.  I'll take a look at the other stuff you mentioned.

Regards,
Ian Abbott

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
