Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964D71
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 09:28:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9081F6144D;
	Fri, 23 Apr 2021 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619170094;
	bh=pPV7IeamXkc2iB/Kc4qm35zKemaP1YRXz0WQDwGoVFY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=F82HXPLrzX4soDdA1hZfusGCkTPOuTb/KkEVV/6beawUJiSoC/02nnmZLFdsnlKy/
	 f7QFR4ShtTLDbQJkZjhlhDrOUjuigMXNZxW8EJhvy/F1AoIz25ZFd7TEAHrt6PFJrR
	 oW+KA9h7KIlDHMmb8cTMhkv/OPLCQghOng3du37sov5lZfJ8X1GveY9nzujF1alEjO
	 uhpaeV5KBsdAKXGFhBC0/9HGmH0p0dNMYfqj9i1njZ3jpKG73eAXRLCYPxu+96Tf6v
	 O63SsMG08DvUOi8crZDerOow3h5Ie+dgu7tk4r1Z/ZSDoQsNSeUbhQJNJtRgqOcgj3
	 q0se/Wyc69alw==
Message-ID: <8513d464ba7bbdd154c28e92cd7d41ba2cce4c0a.camel@kernel.org>
Subject: Re: [PATCH 05/10] staging: vchiq_arm: drop return value of
 vchiq_arm_init_state
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 23 Apr 2021 11:28:11 +0200
In-Reply-To: <1619122076-31785-6-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-6-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> The function vchiq_arm_init_state() cannot fail. So drop the return
> value and the unnecessary code.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas

