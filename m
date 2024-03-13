Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE7F14A8C;
	Wed, 13 Mar 2024 06:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710312214; cv=none; b=tLbqWiKndFFiHEfQXzXpC6eDKWcc7O3QWKMeNd5PRODzQPYR3M9fi8AW6xbpsKQ2q0+Ij+Y9piYKUh2KTH2SN8wy191zpop32MvS66DTQdOS3Y7yuaiUs8EatNOHnjtF541jpE6GSHFHKE7jGn1ungFmdm6rWWloOPs7JZfhW1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710312214; c=relaxed/simple;
	bh=G9fU0sfQ+BUgFXDIEZhacWzKK0pVZkFYf2cAEq0MyZ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Md7BZQMkFvwqHgZhTer4i+9M8rJ7LJ8kapST63+zGZg8EqoVHgg62yESjxhP6YCFldG1dHNU4QaC0AEJfhQtDyXPytOP5c3hnZFhDPp1XK9ibhq5cf9FXzBnpVm/TEFUtT5rxwMCq88av2o4Ytmget/6hZvNIbJExijjhBdb4vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=oJ/5/+3A; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="oJ/5/+3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=o1iHmk4rKSpVyuwNMvqDmU6e1lRNlltfHxYanYPd4Ys=;
  b=oJ/5/+3ALIuWVRISi4JRRPv+86kP96Qv8NJgCTa1Yo0sVTDlbZdManZT
   ePruJKh4oYF2m2nm19it88PjbHlXfuEcqJm4HLle8QbB5HIPTaisypxO/
   Vff71UXW8zkS48luCXc4eNlaQQHT6Pg/RdOr7WPBnfdFLvruX0Lnz0loG
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,119,1708383600"; 
   d="scan'208";a="82007463"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 07:43:22 +0100
Date: Wed, 13 Mar 2024 07:43:22 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Ayush Tiwari <ayushtiw0110@gmail.com>
cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
    gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8712: rename tempVal to temp_val
In-Reply-To: <ZfFJoZWURDM+Uin4@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Message-ID: <alpine.DEB.2.22.394.2403130740450.3473@hadrien>
References: <ZfFJoZWURDM+Uin4@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 13 Mar 2024, Ayush Tiwari wrote:

> Rename variable tempVal to temp_val
> to address checkpatch warning 'Avoid
> Camelcase' and to ensure adherence
> to coding style guidelines.

The log message can be around 70 characters per line.  The above is a bit
too short.

Your subject line says temp_val, but the code says tmp_val.

Maybe a more meaningful name could be chosen?  From the calculation, it
looks like it represents an average?

julia

>
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
>
> Changes in v2: added a period
> ---
>  drivers/staging/rtl8712/rtl8712_recv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8712/rtl8712_recv.c
> index a3c4713c59b3..7fb9dfaa7448 100644
> --- a/drivers/staging/rtl8712/rtl8712_recv.c
> +++ b/drivers/staging/rtl8712/rtl8712_recv.c
> @@ -861,7 +861,7 @@ static void query_rx_phy_status(struct _adapter *padapter,
>  static void process_link_qual(struct _adapter *padapter,
>  			      union recv_frame *prframe)
>  {
> -	u32	last_evm = 0, tmpVal;
> +	u32	last_evm = 0, tmp_val;
>  	struct rx_pkt_attrib *pattrib;
>  	struct smooth_rssi_data *sqd = &padapter->recvpriv.signal_qual_data;
>
> --
> 2.40.1
>
>
>
