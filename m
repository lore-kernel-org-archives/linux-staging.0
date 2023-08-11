Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C4D219EF
	for <linux-staging@lists.linux.dev>; Fri, 11 Aug 2023 20:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE6BC433C8;
	Fri, 11 Aug 2023 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691786319;
	bh=uP0nmuup0yTgjoc5elBFMH9z+XNNpp39WJ5WJEU+rk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k479Dx7W5ntFL4dGcna0RDTfm+cAPcCysDWRRIvPJYilGm//vRwrxNR9ja0GQIElb
	 HcuebiPcSj0R5/jdbBv6adGHKj5CKDNvM1vTtnVhU4jFLG02UctxJOOoKreOVmifP2
	 suz3o+ycQ+tpPZtQywXIlIPxrjYmkg3TJ5NOX0sw=
Date: Fri, 11 Aug 2023 22:38:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH -next] staging: ks7010: remove unnecessary
 sdio_set_drvdata() function
Message-ID: <2023081141-customary-abstain-e0c4@gregkh>
References: <20230811091736.887120-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811091736.887120-1-yangyingliang@huawei.com>

On Fri, Aug 11, 2023 at 05:17:36PM +0800, Yang Yingliang wrote:
> The driver data will be cleared in device_unbind_cleanup() in driver
> core code. So the sdio_set_drvdata(..., NULL) called in remove and
> error path in probe can be removed.

Yes, but, many things happen after the remove function is called and the
driver core cleans up that field, so are you SURE that it is safe to
make these kinds of changes?

How have you tested all of these?

thanks,

greg k-h
