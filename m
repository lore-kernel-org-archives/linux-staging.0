Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C301672
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 09:01:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9730960F44;
	Fri, 27 Aug 2021 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630054890;
	bh=oxC5ZTxehBWxGJ2olzRAgN2U6HU2A/PiUiC002GY2vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvPXKdHXYk23rkgh3y7jtOEzQYhOQl1oTICyYRYZVE4otQRTIi+sK+itKY3Iv6PtT
	 yt/5O7eluxwiRmKqqU5MCNn9NAczhIjVogRd3B16wQ5l3Fq8iJZsTvnOOxg1FzejVT
	 WZ4PQgUZX8G7vKLhWNpIOdQ0El1JUbFVHT6pXEbw=
Date: Fri, 27 Aug 2021 11:01:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: tsbogend@alpha.franken.de, bhelgaas@google.com, matthias.bgg@gmail.com,
	linux-mips@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev, neil@brown.name,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] staging: mt7621-pci: set end limit for
 'ioport_resource'
Message-ID: <YSip4/kMNOG4uYC3@kroah.com>
References: <20210822161005.22467-1-sergio.paracuellos@gmail.com>
 <20210822161005.22467-4-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210822161005.22467-4-sergio.paracuellos@gmail.com>

On Sun, Aug 22, 2021 at 06:10:05PM +0200, Sergio Paracuellos wrote:
> We have increase IO_SPACE_LIMIT for ralink platform to get PCI IO resources
> properly handled using PCI core APIs. To align those changes with driver
> code we have to set 'ioport_resource' end limit to IO_SPACE_LIMIT to avoid
> errors.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
