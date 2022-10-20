Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139363D60
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 15:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCCCC433D7;
	Thu, 20 Oct 2022 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666279971;
	bh=MIwXW+lRvthZkwxf5Rk6tHYJaZ3mnMTh3sSJ4bAV7t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0TCq97O92tT1p+gRJMlxmAMNOiJopBZSiazSkr4s39n4uwHs4Ry5+kPoMJhmWHzVL
	 eWTyaX/PK5lcSYVmfmBrMKYAoGFgKpdSeEZ4HcvN0d8PEIVbk4N0AJNYxgszzHYRgU
	 JEAwn3r3/ZJnkFKbfkHg8awaLUiL3DfUbzv9ezJc=
Date: Thu, 20 Oct 2022 17:32:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dragan Cvetic <dragan.m.cvetic@gmail.com>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8192e: Rename Enable, cck_Rx_path and
 disabledRF
Message-ID: <Y1FqIYgP4F6hhyAY@kroah.com>
References: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
 <20221010190457.13199-3-dragan.m.cvetic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010190457.13199-3-dragan.m.cvetic@gmail.com>

On Mon, Oct 10, 2022 at 08:04:56PM +0100, Dragan Cvetic wrote:
> Rename variable Enable to enable, cck_Rx_path to cck_rx_path and
> disabledRF to disabled_rf to avoid CamelCase which is not accepted
> by checkpatch.
> 
> Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 20 ++++++++++----------
>  drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  6 +++---
>  2 files changed, 13 insertions(+), 13 deletions(-)

This change did not apply to my tree.

Please rebase and resend.

thanks,

greg k-h
