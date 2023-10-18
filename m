Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BD28F41;
	Wed, 18 Oct 2023 05:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="ZU7HGQjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6UsnL94RoCPgeTX9ccivn8yeLwPhEKD4FoOoPKRV430=;
  b=ZU7HGQjbE8tnfSJZSD2Jp1UwDXjoEi8OiEjyY1hZihrJ6bz4RgD7QSk3
   GTFUT1O4HHTuCKKtkWO7KDnWIhBwBFDfUC5cEKCqdiJWu5VuHC5vzVZpO
   HVrJlKGX6u62byQfMcQaL1spy0x5tkSip0IchcY/c5KLk+coPaT4gDTYY
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,234,1694728800"; 
   d="scan'208";a="69015402"
Received: from unknown (HELO hadrien) ([87.129.180.234])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 07:49:23 +0200
Date: Wed, 18 Oct 2023 07:49:22 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Soumya Negi <soumya.negi97@gmail.com>
cc: Martyn Welch <martyn@welchs.me.uk>, 
    Manohar Vanga <manohar.vanga@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/2] staging: vme_user: Replace printk's & cleanup log
 messages
In-Reply-To: <cover.1697601942.git.soumya.negi97@gmail.com>
Message-ID: <85af8b2d-6246-46c5-c6dc-582807010fa@inria.fr>
References: <cover.1697601942.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 17 Oct 2023, Soumya Negi wrote:

> Staging driver vme_user has a bunch of printk() calls in vme.c which
> triggers checkpatch warnings. Remove all printk's and change them to
> the appropriate logging mechanism i.e pr_err()/pr_warn(), or
> dev_err()/dev_warn().
>
> Also, cleanup the messages further by using __func__ in the string
> instead of function names.

"cleanup" is not actually a verb.  It's a noun.  The verb would be clean
up.

julia

>
> This patchset fixes all checkpatch warnings like:
>
>     WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
>              dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> &
>     WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
>              this function's name, in a string
>
> Patches must be applied in order.
>
> Soumya Negi (2):
>   staging: vme_user: Replace printk() with pr_*(),dev_*()
>   staging: vme_user: Use __func__ instead of function name
>
>  drivers/staging/vme_user/vme.c | 175 ++++++++++++++++++---------------
>  1 file changed, 94 insertions(+), 81 deletions(-)
>
> --
> 2.42.0
>
>
>
