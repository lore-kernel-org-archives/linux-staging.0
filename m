Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E75E8BFF;
	Thu, 17 Nov 2022 18:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42ABC433D6;
	Thu, 17 Nov 2022 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668710798;
	bh=k0dh0rEQyTPqwNESfa+6rnl8z5JIFBLAvXgrbLyBuyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xfs60hKgUoTWQqe/klrNMFAYPqGnFIGwOtF4LTOy/zXFt+mTEHyrkLH/E0UpvxOdT
	 P5uqiNVoRCSmRUzxVLwli1m0+MNroUFhDOPIUa3cRj7do+JyWDsAUA6L7dPmyfHeYb
	 boxOzNTm+01q3zds5h3xYDPAiPSCrxb0TtIqBJsM=
Date: Thu, 17 Nov 2022 19:46:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: vt6655: change the function name
 s_vGenerateTxParameter
Message-ID: <Y3aBhDiCOoF+70xC@kroah.com>
References: <Y3KN+kVLZ8gRzccm@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3KN+kVLZ8gRzccm@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Mon, Nov 14, 2022 at 06:50:34PM +0000, Tanjuate Brunostar wrote:
> Remove the use of Hungarian notation, which is not used in the Linux
> kernel. Reported by checkpatch
> Add indentation to the affected function to follow the Linux kernel
> coding style. This improves code visibility
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
> 
> v2: removed unnecessary function prototype
> 

Does not apply to my tree:

checking file drivers/staging/vt6655/rxtx.c
Hunk #2 FAILED at 85.
Hunk #3 succeeded at 880 (offset 26 lines).
Hunk #4 succeeded at 1119 (offset 26 lines).
1 out of 4 hunks FAILED
