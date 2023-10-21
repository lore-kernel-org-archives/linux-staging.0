Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D58469F;
	Sat, 21 Oct 2023 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h8ILdv1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2094C433C8;
	Sat, 21 Oct 2023 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697882492;
	bh=3zCgKmJdi98hP9QQIfd4H55ELJbSnTf8HD6FTfiv8Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h8ILdv1xC+/c1UTQ76hervPgmqNVMKWX4Y1SckCY0sU+yPerY622eXEh5sr/07KxP
	 7KTjkMSqtlB3+cs0GxDuUvRGi2frDN7BX0cwCHzIRPuLcpd5dGv+Pd7ydJvPDhLVBP
	 xBF2rFo/2wXRDSmEp+/vLY0Kp5D0YzDzcmfQk+Jo=
Date: Sat, 21 Oct 2023 12:01:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dorcas AnonoLitunya <anonolitunya@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: sm750fb: Remove unused return value in
 display_control_adjust_sm750le()
Message-ID: <2023102113-barbell-amazingly-cef6@gregkh>
References: <20231019101348.22076-1-anonolitunya@gmail.com>
 <20231019101348.22076-2-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019101348.22076-2-anonolitunya@gmail.com>

On Thu, Oct 19, 2023 at 01:13:36PM +0300, Dorcas AnonoLitunya wrote:
> Modifies the return type of display_control_adjust_sm750le()
> to void from unsigned long as the return value is being ignored in
> all subsequent function calls.
> 
> This improves code readability and maintainability.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_mode.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

This patch doesn't apply against my latest branch.  Please rebase it and
resend.

thanks,

greg k-h
