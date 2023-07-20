Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6551BE63
	for <linux-staging@lists.linux.dev>; Thu, 20 Jul 2023 19:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD2CC433C8;
	Thu, 20 Jul 2023 19:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689881705;
	bh=dV9aGsXWCvr0Ac1gshnAaVzWiwaXSmq1UCHY/ZsafDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMdPxkt2qkTUISJFM+X00lqNiMotzP0z1OGsqUCxL7vCq3rpoCcgLzJfjoLlNkwN3
	 uFyeORVJl40oGECGsUzESdBl50OlX54zHuAP0Ewc1R517WDA5cIKBahBcjjjqd2HZ6
	 cfefFydlg7dQ/kKCqQ70qVG1yG04EQZx123ksWmg=
Date: Thu, 20 Jul 2023 21:34:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, anjan@momi.ca, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] Staging: rtl8192e: Rename function ActivateBAEntry
Message-ID: <2023072027-goliath-roaming-b06a@gregkh>
References: <ZK82TTDh4mthB/Hx@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZK82TTDh4mthB/Hx@basil>

On Wed, Jul 12, 2023 at 04:25:01PM -0700, Tree Davies wrote:
> Rename function ActivateBAEntry to activate_ba_entry
> in order to Fix checkpatch warning: Avoid CamelCase
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>  drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Odd, this series is not correctly linked together (see lore.kernel.org
for the results), and it's not listed as a v2?

Please fix this up and resend the whole series properly.

thanks,

greg k-h
