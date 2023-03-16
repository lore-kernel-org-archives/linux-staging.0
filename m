Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41720EE;
	Thu, 16 Mar 2023 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qEPB1OV4lhu+yEz1IMcjSvJh7ZC2UDdKQIeQ4FynUXY=;
  b=Oa9YuU+hDBLcgyp3jfCn56DLnykLgah/yuKYJ5VcuAYvE4hOygjZflQ3
   59L1SNT68G0kLg1etzmABb59BLtZHI+KYJguof+eTF3nfmkZ11kbH7Yoc
   9cobnvvakIlRCf8S5a5OB/5H5kEFwHlnBUmsB8hLTDJ154jfDzFGtumd7
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="97477327"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 08:40:29 +0100
Date: Thu, 16 Mar 2023 08:40:29 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Nathan Chancellor <nathan@kernel.org>
cc: Khadija Kamran <kamrankhadijadj@gmail.com>, 
    "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
    Alison Schofield <alison.schofield@intel.com>, outreachy@lists.linux.dev, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
In-Reply-To: <20230315150656.GA2938956@dev-arch.thelio-3990X>
Message-ID: <60638fd8-29a3-c89c-af56-a2b0732ae28@inria.fr>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine> <ZBEJ+8DbhADSBTLr@aschofie-mobl2> <ZBG699SriXWy1I2K@khadija-virtual-machine> <16148020.1MiD057Pog@suse> <ZBHUr7bANuhnOnIV@khadija-virtual-machine> <20230315150656.GA2938956@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

> Just repeat the last step as you investigate. If you have any further
> issues or questions, please let me know. For the record, I am not
> associated with Outreachy (I am one of the maintainers of clang/LLVM
> support in the kernel), so if I have messed something up or overstepped
> some boundary, I do apologize.

Definitely not.  Thanks for helping out!

julia
