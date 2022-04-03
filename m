Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD72D7C;
	Sun,  3 Apr 2022 11:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551BDC340F0;
	Sun,  3 Apr 2022 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648983815;
	bh=K5XSAOxhz8Ysr0NyMrapOBeVb7CDEO/6/xyLqOA8GRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcTzXqfZXUkrXz2z9oAtjHuKKmLBeyvjbTxVKCTpN0gRJet1DuQOvS2R34C4dUZvK
	 Jlw1Ep5LejLneBJI/TpUUhmU5S8fenKf2upUWuOQSdAlow2ZoEPLzHsLBOGUhW6+LI
	 IT25bHkMS1DUfZfz3gs+up9k5aX2cftf6AoDpw8M=
Date: Sun, 3 Apr 2022 13:03:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH 1/3] staging: rtl8723bs: remove redundant braces in if
 statements
Message-ID: <Ykl/BCgJx1V7OHSI@kroah.com>
References: <cover.1648817213.git.sevinj.aghayeva@gmail.com>
 <d157392b32cbc02455f8c1813a09c5cc8f11fcf7.1648817213.git.sevinj.aghayeva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d157392b32cbc02455f8c1813a09c5cc8f11fcf7.1648817213.git.sevinj.aghayeva@gmail.com>

On Fri, Apr 01, 2022 at 09:02:45AM -0400, Sevinj Aghayeva wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 76 +++++++------------
>  1 file changed, 26 insertions(+), 50 deletions(-)

Does not apply to my tree :(
