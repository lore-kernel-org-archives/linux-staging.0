Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C7972
	for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 05:02:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3765060F21;
	Wed, 27 Oct 2021 05:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635310922;
	bh=wg2RNG7Fk6M43nRwVMIjou4UKMRQPMXmVEw6LZZ3p44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOCwXYtLidTIun78mfD71bjvQM+xj6hxNp529AHSZKIqjF31Z/F64L8YPsbLtwk27
	 1RK8grKv8pB3+zX/MK0jUeUBzf6lhiOMWk1UBBKNwu9/oQ5pPRmgq7ByWn81Qd455y
	 EP2qtjzVPJByc/msCAuIPSWKL554WuDaO0MUyZV0=
Date: Wed, 27 Oct 2021 07:01:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: linux-staging@lists.linux.dev, nsaenz@kernel.org,
	stefan.wahren@i2se.com, arnd@arndb.de, dan.carpenter@oracle.com,
	ojaswin98@gmail.com, amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_core: get rid of typedef
Message-ID: <YXjdRYCoqlx26MZq@kroah.com>
References: <20211026212756.25557-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026212756.25557-1-gascoar@gmail.com>

On Tue, Oct 26, 2021 at 06:27:56PM -0300, Gaston Gonzalez wrote:
> Get rid of typedef and use proper kernel type instead.

which typedef?  Please be specific.

thanks,

greg k-h
