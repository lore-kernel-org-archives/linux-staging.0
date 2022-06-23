Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DFD43F4
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 09:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A417C341C6;
	Thu, 23 Jun 2022 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655977604;
	bh=YWP8xQl28FqLrVoNh1JnPPBf3z5SkmXcUdzYiHP2f7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gjtv+PjCDpxCyJtM19H3WCoRUbPRJ6X3nmxXRGq7LpG/Ias3TIY3bQk6vsTF0lPWy
	 Ac9WflSk2BxdX2HLvW3izOiHYz/v8axaZDYgPmopeiN0BfnajkbAf0/46n1SHjVNUC
	 5QItwP4uR9P1wkhPKXp2WqZ684TF3ihhl4Fa2phI=
Date: Thu, 23 Jun 2022 11:46:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-staging@lists.linux.dev, davem@davemloft.net,
	alexander.deucher@amd.com, kuba@kernel.org, broonie@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192u: Fix sleep in atomic context bug in
 dm_fsync_timer_callback
Message-ID: <YrQ2gXtX2FOkyNgu@kroah.com>
References: <20220623055912.84138-1-duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623055912.84138-1-duoming@zju.edu.cn>

On Thu, Jun 23, 2022 at 01:59:12PM +0800, Duoming Zhou wrote:
> There are sleep in atomic context bugs when dm_fsync_timer_callback is
> executing. The root cause is that the memory allocation functions with
> GFP_KERNEL or GFP_NOIO parameters are called in dm_fsync_timer_callback
> which is a timer handler. The call paths that could trigger bugs are
> shown below:
> 
>     (interrupt context)
> dm_fsync_timer_callback
>   write_nic_byte
>     kzalloc(sizeof(data), GFP_KERNEL); //may sleep
>     usb_control_msg
>       kmalloc(.., GFP_NOIO); //may sleep
>   write_nic_dword
>     kzalloc(sizeof(data), GFP_KERNEL); //may sleep
>     usb_control_msg
>       kmalloc(.., GFP_NOIO); //may sleep
> 
> This patch uses delayed work to replace timer and moves the operations
> that may sleep into the delayed work in order to mitigate bugs.
> 
> Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
> Changes in v2:
>   - Use delayed work to replace timer.

Did you test this with real hardware to verify it still works?

thanks,

greg k-h
