Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4313C7B;
	Sat, 11 Mar 2023 12:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=32bL0mYWtM+3ID3jj1jtKti6IGliY5pwZ9oi3Yv3bSQ=;
  b=RACmxyM+m4LMNfuXauexo38mZw9CPTu2TuJ1RO7FaihRjR1x53sT5Lgy
   aX5YF7817W8EeYnuimglODVoziAYUnTWIaCRnrFztT4EQFSSa1mlvLstN
   Xmsi7I/PVDip/RasaQ4mQbN7j8bjstb/mTn97KmAHuEOd0586vLNQYhQx
   c=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000"; 
   d="scan'208";a="96640125"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 13:12:28 +0100
Date: Sat, 11 Mar 2023 13:12:28 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Sumitra Sharma <sumitraartsy@gmail.com>
cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
    gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: pi433: Change bit_rate type from u16 to u32
In-Reply-To: <20230311115904.GA21529@ubuntu>
Message-ID: <alpine.DEB.2.22.394.2303111312070.2802@hadrien>
References: <20230311115904.GA21529@ubuntu>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 11 Mar 2023, Sumitra Sharma wrote:

> Hi julia,
>
> I forgot to Cc the maintainers of the code of the above patch. I have Cc
> in this mail. Do let me know if there is a need of recreating the patch.

You need to send the patch to all of the relevant people/mailing lists.

julia
