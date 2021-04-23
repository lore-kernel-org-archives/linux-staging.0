Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D9671
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 09:30:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B750261350;
	Fri, 23 Apr 2021 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619170241;
	bh=Fup06Co7po1Ve5Y/PsYB9k6zCrc4bfwsBl6xnG6jvdg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EaDaJWO2rxY+HF+4ndGCAr90LGUla1vK/1eWttBkU+fIUDQUhnrcg8T9LDEUBwAk4
	 9RAQnSzL0kEex036HON3rWqmKgvodjCgNmk2WqcAudKR7BbZU+FjRbLe2i+tHsrPrP
	 mcIlFdSQ6jEjUlHpRy2p4dizajOEcNdpK9bijV8CZrpc+Nvl6e9+fOyJE5mirBZU6B
	 PiAoGMpFh7XGnrtUPxGV6pK2AMH3A6ZxPLGejzkeu3SOcd6u/SDTZIXcanIgUDagt2
	 SIxa2Lbt/dqmSX85gaGorV01fngh5/gfCkufm3BzgyOMPK3AUDQhKzuiY0DEQWw5co
	 PLzwhxSs43CRw==
Message-ID: <79fbc49731e9602a7b3a211ba7ba60fb1a5df330.camel@kernel.org>
Subject: Re: [PATCH 06/10] staging: vchiq_2835_arm: drop enum vchiq_status
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 23 Apr 2021 11:30:38 +0200
In-Reply-To: <1619122076-31785-7-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-7-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> Replace the custom set of return values with proper Linux error codes.
> As a result we need to initialize vchiq_status in vchiq_init_state.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas

