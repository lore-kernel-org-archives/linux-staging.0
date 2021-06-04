Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5DB70
	for <linux-staging@lists.linux.dev>; Fri,  4 Jun 2021 13:08:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89B3561242;
	Fri,  4 Jun 2021 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1622812092;
	bh=oNNimxSgqlPEsNTwy/gzZkPhSLP95wk4lixKNq/Qjaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G12tOVDootUwZVZFjnqhCOUWLqf4YS124OrMyAiDDiwJ4FWfPerx7Iv4gbSGpfiAa
	 Xh/ewmBMzd8xKMkM32D6SrAw7Od8DGZv+XI0oUZ90YZSM1muRNwaKevJBqWugD30cj
	 2ZSLL/yrKyVyJlgp68sUVJVmt2i3l7ydd8b3RMTk=
Date: Fri, 4 Jun 2021 15:08:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, matthias.bgg@gmail.com,
	john@phrozen.org, bhelgaas@google.com, robh+dt@kernel.org,
	linux-staging@lists.linux.dev, neil@brown.name,
	ilya.lipnitskiy@gmail.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 3/4] staging: mt7621-pci: remove driver from staging
Message-ID: <YLoltDsU8ZbD2bQ6@kroah.com>
References: <20210515124055.22225-1-sergio.paracuellos@gmail.com>
 <20210515124055.22225-4-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515124055.22225-4-sergio.paracuellos@gmail.com>

On Sat, May 15, 2021 at 02:40:54PM +0200, Sergio Paracuellos wrote:
> Driver has been moved into its proper place in the
> kernel 'arch/mips/pci'. Hence, remove it from staging.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
