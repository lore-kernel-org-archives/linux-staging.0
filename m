Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78CE256A
	for <linux-staging@lists.linux.dev>; Fri, 30 Sep 2022 12:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF1FC433D6;
	Fri, 30 Sep 2022 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664539466;
	bh=U7CrY5N3SSGHOpsBnYGJip0ROeZK/n1WSl2bwv7ZBrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7BNizyvoepDy11fPRA/stw4hoTGP+1rRfqn+APwaeUidCRExavNgwWRjatvjuGsy
	 2b8tzCUoiI+CiU8nDrS/rPukp1kAyrtHiujlRbGo+HoRmKn2zcMiv0DAOtU/UYYTFd
	 ikioKIXyfaMsMSZwhWCpLmBgILMq4vzAV3si1r1Q=
Date: Fri, 30 Sep 2022 14:04:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deming Wang <wangdeming@inspur.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] vme: fix the typo
Message-ID: <YzbbSDohVcPgJ9DA@kroah.com>
References: <20220927192102.8623-1-wangdeming@inspur.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927192102.8623-1-wangdeming@inspur.com>

On Tue, Sep 27, 2022 at 03:21:02PM -0400, Deming Wang wrote:
> fix the typo of the enty.

I am sorry, but I do not understand this changelog text at all.  Please
reword it to be more descriptive as to what is wrong and what is being
changed.

thanks,

greg k-h
