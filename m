Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE783CA77
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bAjMzBEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06001C433C7;
	Thu, 12 Oct 2023 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697092546;
	bh=WKqW/qfFXpEtKhsfFnturnGNaQf5Dhj6r+Pg8s1o4tU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bAjMzBEz0U6dTeu5nT/idd6XkTDbOUnJx0Ey+Z0TmygNTBmHHGRu+2sNLuSQ8t7mL
	 3KtHsHzUpqaJ++RF2b20taBM8sVNFUAh9lPJd4IB/4z5tBnhTDEhJ4YDbOj5cH6FP+
	 K1tYkBvfB5Qshg4Dh9MR6stsK/fJOEqpkrhb/3fM=
Date: Thu, 12 Oct 2023 08:35:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] staging: rtl8192u: Fix two crashing bugs
Message-ID: <2023101244-unaudited-sadly-d9d6@gregkh>
References: <cover.1697089416.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697089416.git.philipp.g.hortmann@gmail.com>

On Thu, Oct 12, 2023 at 08:02:58AM +0200, Philipp Hortmann wrote:
> Question: Fix or remove rtl8192u?

We should remove it if it's obviously broken and no one has reported it
in a very long time.

> I found a USB WLAN Stick with a rtl8192u. I got it last Saturday and 
> found out that the firmware is missing in my ubuntu 20.04. I found it on 
> the web and fixed it. When I started the driver my computer crashed. The 
> missing part was: priv->priv_wq = alloc_workqueue("priv_wq", 0, 0); 
> Fixing this the next error was a network = kzalloc(sizeof(*network), 
> GFP_KERNEL); in wrong context which leads to a crash of my computer. 
> Fixing this the next error is more depending on what I do with the stick.
> 
> When lucky the connection is build up and I can surf and download at maximum speed (12,5MB/s) several gigabytes.

Do you want to keep it here so that you can maintain it and keep it
working?

thanks,

greg k-h
