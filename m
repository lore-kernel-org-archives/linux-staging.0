Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B592173
	for <linux-staging@lists.linux.dev>; Thu, 17 Jun 2021 08:30:11 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
	id 1ltmxT-0003hK-78; Thu, 17 Jun 2021 16:01:03 +0800
Received: from herbert by gondobar with local (Exim 4.92)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1ltmx9-0002mO-VK; Thu, 17 Jun 2021 16:00:43 +0800
Date: Thu, 17 Jun 2021 16:00:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: trix@redhat.com
Cc: mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com, corbet@lwn.net,
	fbarrat@linux.ibm.com, ajd@linux.ibm.com, bbrezillon@kernel.org,
	arno@natisbad.org, schalla@marvell.com, davem@davemloft.net,
	gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
	grandmaster@al2klimov.de, linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-crypto@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 04/11] crypto: marvell: cesa: change FPGA indirect
 article to an
Message-ID: <20210617080043.GA10662@gondor.apana.org.au>
References: <20210608212350.3029742-1-trix@redhat.com>
 <20210608212350.3029742-6-trix@redhat.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608212350.3029742-6-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jun 08, 2021 at 02:23:43PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Change use of 'a fpga' to 'an fpga'
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/crypto/marvell/cesa/cesa.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
