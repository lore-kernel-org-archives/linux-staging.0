Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A45B53A0
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 11:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA63DC433EF;
	Thu, 20 Apr 2023 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681991680;
	bh=TVwOAXArVM41zt0la3jWQ3TCndHiXtlLav5yTK1LQuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jl5jfOiaNab8Z6bwSnJ51yf0bOwhPpMJv8dTl5PdsBMmW9w+Xt7r9yAE7RT8tPenX
	 tziSTthpGc52P1jiQCZ2vEkN50JsWhtwmH467ls7Cj8SrKlKIhvTMY8R4rnNxt3wmN
	 c/l+tVzyzwjp3eMiQK87lVOdJGkYXmX/+SPZKtiY=
Date: Thu, 20 Apr 2023 13:54:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: f44f44e4-25c0-4489-96e9-8ca63fa294d7@kili.mountain
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: wlan-ng: replace rate macros
Message-ID: <ZEEn_UfhXEtTGf-8@kroah.com>
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

That has to be "Signed-off-by:"

