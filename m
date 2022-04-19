Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013F87A
	for <linux-staging@lists.linux.dev>; Tue, 19 Apr 2022 14:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41271C385A5;
	Tue, 19 Apr 2022 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650377998;
	bh=pFVocPAAyxNwE+EAgAOFl3aRkOLQgd7KM/MSQo7oSns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUC4esakcVmVf6Lifp1odfO1Kh5p1ZHfE8rXBAhkSrB3L7xkPaoqaXaxqSyb8e8/5
	 1g0JtHAE9hplmxTNMdJlBiqb+kHyuM/9wzvqlge6w5OgrDvLBZZ3CwMim1dd9SavEZ
	 4pM5mUs9If6XW2itCchuIQSZ92Zoi6Wl2pvIG4GI=
Date: Tue, 19 Apr 2022 16:19:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tom Rix <trix@redhat.com>
Cc: nsaenz@kernel.org, bcm-kernel-feedback-list@broadcom.com,
	stefan.wahren@i2se.com, gascoar@gmail.com, ojaswin98@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vchiq_arm: change vchiq_platform_init from
 global to static
Message-ID: <Yl7FC9M0hz7kQM4j@kroah.com>
References: <20220419133616.544255-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133616.544255-1-trix@redhat.com>

On Tue, Apr 19, 2022 at 09:36:16AM -0400, Tom Rix wrote:
> Smatch reports this issue
> vchiq_arm.c:466:5: warning: symbol 'vchiq_platform_init' was not declared. Should it be static?
> 
> vchiq_platform_init is only used in vchiq_arm.c.  Single file variables should
> not be global so change vchiq_platform_init's storage-class specifier to static.

You did not change a variable, you changed a function type.

> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> v2: refomat commit log

Why did you not fix the build breakage?

{sigh}

