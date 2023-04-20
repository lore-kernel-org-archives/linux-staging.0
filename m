Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA3253A0
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 11:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94E1C433EF;
	Thu, 20 Apr 2023 11:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681991706;
	bh=43j8qb1ztwNnMs51aRYQjPVBIAJAJiKtU4LCBkzhueM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlG6v86o+r5l9DVeWkbmZ5aByPVNz2ysZ6LPONbCqvsrQcaOj+i1Tza+FhpShbYcc
	 b94R6WQfYU4cQ7+wVp9gNO3ybBsndvVwjh64MUkExN6GfclEStK8hSpti+cXamVDdn
	 eB/LMU1Jb7f4xneHRjdOCSCXtEiuw1ZvRI708Jww=
Date: Thu, 20 Apr 2023 13:55:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luke Koch <lu.ale.koch@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: wlan-ng: replace rate macros
Message-ID: <ZEEoFxsTuAxAS7Ep@kroah.com>
References: <ZD6OqBOp1ezQDgMu@kernelhacking.kernelhacking.example.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZD6OqBOp1ezQDgMu@kernelhacking.kernelhacking.example.com>

On Tue, Apr 18, 2023 at 02:35:52PM +0200, Luke Koch wrote:
> Change p80211msg_dot11req_scan_results rate members to struct arrays
> instead of individually numbered member structs.
> Replace macros to set rates with loops to avoid checkpatch warning
> and adhere to linux coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Macro argument reuse 'N' - possible side-effects?
> 
> Signed off by: Luke Koch <lu.ale.koch@gmail.com>

Resend without the odd reply-to...

This has to be "Signed-off-by:"
