Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6E7E6
	for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 08:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AE7C3411B;
	Mon, 20 Jun 2022 08:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655712251;
	bh=ngCOGSBoTpAJNhtEXwd9BxoP+DCWFvIilL8U9jLFbEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sy1gIRm2AlQ+DtESZk/fjBxXhoa4rdZ+J8lKd3nHVRtwamQDKDSGsHQj5btGXX/82
	 0uyq2UblpMvM4XWmYNEipu9i6Hp8QcOxaiwuaRj4d+/A3hZTJXttIbuY7yY8Cob+aP
	 XYQwN5PqokdieB13/NWW6IcW3bcHwCFpFuyaZJec=
Date: Mon, 20 Jun 2022 10:04:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: daniel watson <ozzloy@challenge-bot.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove trailing whitespace
Message-ID: <YrAp+KlogDNwjGVa@kroah.com>
References: <20220620054529.4019-1-ozzloy@challenge-bot.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220620054529.4019-1-ozzloy@challenge-bot.com>

On Sun, Jun 19, 2022 at 10:45:29PM -0700, daniel watson wrote:
> From: Daniel Watson <ozzloy@challenge-bot.com>
> 
> remove trailing whitespace found by checkpatch
> 
> Signed-off-by: Daniel Watson <ozzloy@challenge-bot.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've taken this, but you should fix your email server DKIM settings as
it is not correct:

Grabbing thread from lore.kernel.org/all/20220620054529.4019-1-ozzloy%40challenge-bot.com/t.mbox.gz
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
  ✗ [PATCH] staging: rtl8723bs: remove trailing whitespace
  ---
  ✗ BADSIG: DKIM/challenge-bot.com
---
Total patches: 1


