Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992068F6D;
	Thu, 23 Mar 2023 13:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=asBlhq5zp6DekDtJ5FFTj70qbdpKfhFcBMWsoiFAi2c=;
  b=IdcJK1YPBpsVbqlvvTt65Dq+cTU+GQPCFYPyHWuv4jVHL8COehNwe3su
   VEqs5aM3huiK2kyVvsLFB1wdxlcyZSyxCnAPaW19HD9ARKyusSZS3c0fi
   9FLWrTz+U8bGh7YlTLxJQYEAW0Asps+NXFGA87CeufywS1ktR40jPR9b1
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,283,1673910000"; 
   d="scan'208";a="51038134"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 14:08:15 +0100
Date: Thu, 23 Mar 2023 14:08:14 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Khadija Kamran <kamrankhadijadj@gmail.com>
cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 0/4] staging: rtl8192e: code cleanup patches
In-Reply-To: <cover.1679573474.git.kamrankhadijadj@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303231408000.2866@hadrien>
References: <cover.1679573474.git.kamrankhadijadj@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 23 Mar 2023, Khadija Kamran wrote:

> Fix several cleanup issues reported by checkpatch.pl in module
> staging/rtl8192e in file rtllib_rx.c

Why is it resent?

julia

>
> Khadija Kamran (4):
>   staging: rtl8192e: remove extra blank lines
>   staging: rtl8192e: add blank lines after declarations
>   staging: rtl8192e: add spaces around binary operators
>   staging: rtl8192e: remove blank lines after '{'
>
>  drivers/staging/rtl8192e/rtllib_rx.c | 73 +++++++++++-----------------
>  1 file changed, 29 insertions(+), 44 deletions(-)
>
> --
> 2.34.1
>
>
>
