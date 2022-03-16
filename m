Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8043438C2
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 14:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F6EC340E9;
	Wed, 16 Mar 2022 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647439704;
	bh=bTEAVJzNEOhI/lKmrR9+/svr6T+tjoocmNyfraD9/PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1yWEwnlFH9tmeVTqd6TZBfZ1MWs508WLTvjXcidNx2MtgliNe3BaY+owDlxLfYke
	 nlw+vGKNgkCtwnxIYzZOm24cpf2hJNJCNGk1A7UNWGyzmiYZ+5kYmugCiBPAsquuf4
	 sdmKn4DdZCk3RROL2vmCS+fgwUV5HOOfWVddMKYA=
Date: Wed, 16 Mar 2022 15:08:20 +0100
From: gregkh <gregkh@linuxfoundation.org>
To: Xiaoke Wang <xkernel.wang@foxmail.com>
Cc: "dan.carpenter" <dan.carpenter@oracle.com>, nsaenz <nsaenz@kernel.org>,
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-staging <linux-staging@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: mmal-vchiq: add a check for the return of
 vmalloc()
Message-ID: <YjHvVM3kug3ritca@kroah.com>
References: <tencent_7F2A8AAFF05125C6FF159033E69B5C108E07@qq.com>
 <YjCwagaijyA2oO8r@kroah.com>
 <tencent_84264ACEFF062098CC35B9C01C7A1464E108@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_84264ACEFF062098CC35B9C01C7A1464E108@qq.com>

On Wed, Mar 16, 2022 at 12:23:05AM +0800, Xiaoke Wang wrote:
> On Tue, 15 Mar 2022 16:27:38 +0100, Greg KH wrote:
> &gt; Your change just crashed the kernel :(
> &gt;
> &gt; Please be more careful
> 
> I am sorry. I ever been told that vfree(NULL) or kfree(NULL) is safe,

Sorry, you are right, I was thinking that there would be an error value
there.  My mistake.

greg k-h
