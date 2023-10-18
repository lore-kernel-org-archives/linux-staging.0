Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB8414A8E;
	Wed, 18 Oct 2023 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="ocVAA5tU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GpetY+lN0kNSU4kScIjhhgCa5RGP7XMD9CtalAfPG4Q=;
  b=ocVAA5tUSH9a/yZ5RdQNI6jlCZofdNcSgxu2dgyGH6cWFWdfNoM24QdC
   o8p2RnuOK3AJRzsqhh9Efd5ehBMqHulh/z/OXt3I8qcNG3gR/5cg4MCSU
   K8h2C2pBFa5C8l+jsqFym/Sj+XuBSV3AX3XPbs/mbkQXJlXgowLSIN45o
   4=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,234,1694728800"; 
   d="scan'208";a="131832249"
Received: from dhcp-138-246-3-50.dynamic.eduroam.mwn.de (HELO hadrien) ([138.246.3.50])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 10:13:28 +0200
Date: Wed, 18 Oct 2023 10:13:28 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Calvince Otieno <calvncce@gmail.com>
cc: gustavo@embeddedor.com, outreachy@lists.linux.dev, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Martyn Welch <martyn@welchs.me.uk>, 
    Manohar Vanga <manohar.vanga@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix coding style - remove
 CamelCasing
In-Reply-To: <CADFX3OQbXXaa1z+4-tOhidb2w_XH9sYB0x1_yLZ69yDy_1Nwpw@mail.gmail.com>
Message-ID: <baa4e15-6c4c-a2ae-259a-f6cae6de837f@inria.fr>
References: <ZS+HyqwvyVyfzGXs@lab-ubuntu> <cb55a015-4c2b-b72-dcd-af7f8c7380@inria.fr> <CADFX3OQbXXaa1z+4-tOhidb2w_XH9sYB0x1_yLZ69yDy_1Nwpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

> As description states, checkpatch recommendation

This comment should be just under my text, that you are responding to, not
at the end of the patch.

CamelCase is not just the mixture of uppercase and lowercase letters.  It
means that the things with upper and lowercase letters are real words,
LikeThis.  In the case of this driver, the lowercase letter was not part
of an English word, so one can be suspicious that it has some other
meaning.  Checkpatch doesn't know what are real English words, so it makes
the suggestions whenever there is a mixture of uppercase and lowercase
letters.

julia
