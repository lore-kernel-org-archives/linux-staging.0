Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E028F3;
	Sat, 22 Oct 2022 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AW9YOnXXwqRJMmUiyr1Fh6rDHqdahVqrAovQWDd7HJM=;
  b=Ua6f+53Q/9yGkPyRnTZME4Lg4qEqjuSPcKfrbcn+/vROPJOgncJxxlJ2
   Ch5fKsqOqBvPL/Sma1v9U7sx4oTAdaHWTWiVSBWkyj5rJECR4ngDpWPXu
   MlaENRB3CuxCZvdHODW97CDsg0ioQZ1A12s2RnY5/5l++M1raAUeTi21e
   Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,204,1661810400"; 
   d="scan'208";a="67853078"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2022 10:13:42 +0200
Date: Sat, 22 Oct 2022 10:13:41 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Tanju Brunostar <tanjubrunostar0@gmail.com>
cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    outreachy@lists.linux.dev
Subject: Re: request for assistance
In-Reply-To: <CAHJEyKVi=Bw1=-cH8dbJratKw3Lk3ubh_9bcBB=iKPm5H7P1Yw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210221013071.2700@hadrien>
References: <CAHJEyKVi=Bw1=-cH8dbJratKw3Lk3ubh_9bcBB=iKPm5H7P1Yw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 22 Oct 2022, Tanju Brunostar wrote:

> There is a portion of the Outreachy first patch wiki I would like to
> edit. How do I go about doing this?
> - Should I just go on and edit it? or
> - Do I have to make a proposition addressed to someone or somewhere,
> stating what it is I want to change and why?
> I would appreciate your help.

It would be good to post your proposed changes to the mailing list, if it
is something more substantial than fixing a spelling mistake.

julia
