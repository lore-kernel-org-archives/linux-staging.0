Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606764;
	b=fTepxdmQkssCNkQZbP2tjVGIWEwabZkaOTGA25dJMaoRV9BbEk7RW/I8rZN3hFauNp/R
	 Pcm1FqoEZ7r6p2d7bSfMhyMI8LxSvQ5Z+M5T8oGGtRD5+xZV3HDEW7REza/Xv4FLrpHg8
	 gDtwztMBVbI2z5DaEFzXirYB3A4fZLKcLvS9G63F9R+Wgib7gVzXOKE6+Rqp1BRro1yq+
	 LVYi4o/e4c/woi6MVgCeX1XfvA7DrbtDoJwUVt/x2G5CQYLIxOeDMaZOdCSsOgURLvQhd
	 6sOeI8auo4kZk4qUhdbXpx0mK4rpobZAit7cjg+wyzGRMBbyeX79mowgls29whLkkWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606764;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=HdrnOwiWT60Q5tvd9IC7DNDznjzaCDtJtCQo1a1WQ7A=;
	b=M8uiWfiTMFdMWcXjFtShGA+5tvG/x7hN3HgjzTFzjTSMjfxrelJJyYixJNLonw2Rj5I0
	 9OPErHtqnWi7AQf0gF4b0YSFQOoutG2c2n4Qoi805Flrlh95C1VlJr5Vp/is7qJBq7U+6
	 ucBzJJa4Ng0nXUmJLU/PHa4TEGiZZ8y+Nw5y02OuyhLjh1zEtSXhrP/HHWdhVxgXQKQVv
	 62WQ0sijoHJvTGHhZ0q5Gvph5GMaxQIOCmC8PL+7kUr/BrL3L/O7Edu1TOVaHhM7rg0mg
	 8Xw5gmfk6ocBTuU75Z2tvPVHYn3V+0vhbnFIBcrGyzqdDmHPZWaG25zAjXBJrcCt5Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b="i2EiVo/q";
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAE360A2608;
	Mon,  2 Nov 2026 08:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DAE360A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=i2EiVo/q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HdrnOwiWT60Q5tvd9IC7DNDznjzaCDtJtCQo1a1WQ7A=;
  b=i2EiVo/qUstYAAT0GgH0IXBo0btmB69zStZ2DX02774VCng5Rs2rXKeP
   UnTMVgAzW5uqKNiyk1iXPKyITIX4rPhTJICnDuaUkySpLb9dSbdEhFc8R
   T5O/CagiaRfQu2hoI3ki7GBRfKlcxuH8qXgiaUVPT++y9GZStGwZjC5wP
   Q=;
X-CSE-ConnectionGUID: jhbsLQ8JQ+ObdIgkiMknug==
X-CSE-MsgGUID: bYq+ttHhTOmDcaHmen3KEw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,191,1787004000"; 
   d="scan'208";a="303274502"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 09:05:59 +0100
Date: Mon, 2 Nov 2026 09:05:59 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Maria Sheikh <mariasheikh812@gmail.com>
cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
    parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: fix non-kernel-doc comment in
 errors.h
In-Reply-To: <20261102022903.5312-1-mariasheikh812@gmail.com>
Message-ID: <5ff5dc97-5a27-c68c-a4b2-959081941084@inria.fr>
References: <20261102022903.5312-1-mariasheikh812@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 2 Nov 2026, Maria Sheikh wrote:

> The comment above enum dim_errors_t starts with "/**" but it is not in
> kernel-doc format, which scripts/kernel-doc -none reports as a warning.
> Use a regular comment instead.
>
> Found using scripts/kernel-doc -none
>
> Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
> ---
>  drivers/staging/most/dim2/errors.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/most/dim2/errors.h b/drivers/staging/most/dim2/errors.h
> index d707daaac3b6..af909560aa93 100644
> --- a/drivers/staging/most/dim2/errors.h
> +++ b/drivers/staging/most/dim2/errors.h
> @@ -9,7 +9,7 @@
>  #ifndef _MOST_DIM_ERRORS_H
>  #define _MOST_DIM_ERRORS_H
>
> -/**
> +/*
>   * MOST DIM errors.
>   */

If it's going to be a regular comment it doesn't need to be on three
lines.

Maybe it could be made into a kerneldoc comment?

julia

>  enum dim_errors_t {
> --
> 2.53.0
>
>
>
