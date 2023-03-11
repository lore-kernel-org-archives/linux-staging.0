Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A57B;
	Sat, 11 Mar 2023 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mnBoXWCWc8GTA6EussKi3kzGkFsly/2hTA8VBPAoaQo=;
  b=jodawiDvrX0oP7vrwzWvZWWHyISWGU7N221Bf9fAM+a5K2zt8hATeL8m
   Der+1hrP4LfSfoMp+gKNeBpyzDCOovSIOEzhTcZihqQeqfa6yc7deY66f
   ZJYniCDvlqlaWdQvZ+C76N0G9LR/3edqBmXULOTSX3KW3i8WevMt7pODE
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000"; 
   d="scan'208";a="96649826"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 15:49:03 +0100
Date: Sat, 11 Mar 2023 15:49:03 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Sumitra Sharma <sumitraartsy@gmail.com>
cc: error27@gmail.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com, 
    gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
    linux-staging@lists.linux.dev, manishc@marvell.com, netdev@vger.kernel.org, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: qlge: Remove parenthesis around single
 condition
In-Reply-To: <20230311144318.GC14247@ubuntu>
Message-ID: <alpine.DEB.2.22.394.2303111547520.2802@hadrien>
References: <20230311144318.GC14247@ubuntu>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 11 Mar 2023, Sumitra Sharma wrote:

> Hi Dan,
>
> Your suggestion for correcting the indentation to
> "[tab][tab][space][space][space][space](i ==." conflicts with the
> statement "Outside of comments, documentation and except in Kconfig,
> spaces are never used for indentation" written in
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/coding-style.rst

You can use spaces at the end of an indentation if it allows lining up
things with a similar purpose.

Look around at other examples of kernel code, outside of staging, to see
what others have done.

julia
