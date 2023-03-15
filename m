Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E8D53AB;
	Wed, 15 Mar 2023 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RamjROs+sUVfYNzroeeQOrxygIhaTlWlwCCu0K2PnS8=;
  b=FKf5jfSzgO53FtuCQCUjdqjGwF/spoq9QegdaugJkHQUj9tgOluk7xpQ
   130YtQW/2plkrhIR+BvxZG0e+PuAnE/475Ev10b0JAXzQGWH46nTn3ZV+
   qB9AxzSn9nQQ5S2vGU/7ecATxhvnIOzWnTkHL+BCv0D3kbjoC+afVD823
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,262,1673910000"; 
   d="scan'208";a="50285566"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:43:21 +0100
Date: Wed, 15 Mar 2023 16:43:20 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Kloudifold <cloudifold.3125@gmail.com>
cc: Alison Schofield <alison.schofield@intel.com>, 
    teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com, 
    gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
In-Reply-To: <ZBHlycBoZ0JRwHZm@CloudiRingWorld>
Message-ID: <d231df94-c8db-aa3e-98c9-3d56f758675b@inria.fr>
References: <ZBHlycBoZ0JRwHZm@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 15 Mar 2023, Kloudifold wrote:

> Hi Alison,
>
> Thanks a lot for your help, so if I send my v3 patch, should it be like
> below? (Philipp said "please make the Subject more unique", but the
> Subject could be only a few permutations of very few words, I can't see
> how it could be any more unique.)
>
> Subject: [PATCH v2] staging: sm750: Rename functions from CamelCase to snake case
>
> sm750 driver has sm750_hw_cursor_* functions, which are named in
> camelcase. Rename them to snake case to follow the function naming
> convention.
>
> Changes in v3:
> - Add this changelog (Philipp)
> - Move lkp tags and link to the correct location in commit log (Alison)
> - Update the commit msg (Philip)
> - Update the commit log (Bagas, Julia)
>
> Changes in v2:
> - Use new function names in call sites (LKP)

All these changes should go below the --- line, not above it like this.
The history of changes is for people who are following along in the email
discussion.  Once the patch is accepted, they won't be meaningful.  So
they should be the in the part that disappears, which is the part below
the ---.

julia

>
> Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> ---
> git diff message
> ---
>
>
