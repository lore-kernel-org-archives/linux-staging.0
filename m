Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938573;
	b=CwaFSBYnBhLr7BwCq19wJaZfgkIbTUn7GgwkmSXM7KR7N/5ZRay7NQD/DEnLKuQTLPmL
	 L0ul5LTsGICrzEiWbcDIFKzYovKHG0WolxyakTZKkKUFr5a0FhCfqMCNGID81EzPTvA9S
	 aCHV6LuCnunUhAWVYtHyNmDE7fCIpdpSwPNOWlKo1BJd9/4K0m/q++CVhNK1tD+gUP3HB
	 cSAOpZlt6rNDNZnFVS0rTllmcPI88krI2GTIGkJFdEUMrHmWe/JsGKIgtoTH9i+b8HpVz
	 fuLsD9OJZCfNgxUT7s623YHgE0B5u4B0/vrVc+xp2TWFvy7z6kd0buwNkoRp9+DY6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938573;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=2BKKIgxIPoZr8J/FUp/cedQWkiYMf1a2nkly3MRtnMw=;
	b=uCZaVrkhKv9dhFO8dT6YR4kkpCUO+dMqHKazsX6l6IWPJ2Li3c34+WhCXfkC48r9vDHo
	 Rqzdg47vn/UG/PE1yqVIv0VqAJOCY+nkmjnFBkCL4D7zG8+INinEzNFM165YJEua2lLTj
	 Awmt52cjb6s6kBN3Oum5xyX3OEYPjR37FLVrjyKhyad93vEsrUWNkPuTtaDpAgVkUg9vr
	 eYmVna44ttmqM0XZsG5AdbUjEWXDBm3sKeChfjRZuzRKmmNS3dGiZoCqMdkiP80iL6i1x
	 YyVgDguw5ZpCrEEf9paRKBaZXkZjgUYCxMLOBk0gluyX7uVFKchYgGL9TmJcyUPPagg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=uNujRV+9;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88850606A31B;
	Sun, 25 Oct 2026 14:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88850606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=uNujRV+9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2BKKIgxIPoZr8J/FUp/cedQWkiYMf1a2nkly3MRtnMw=;
  b=uNujRV+9XwZ9okqEusv9WApetp+/Zl4stto1YJXWr19c3csujUuE72s0
   5N3FroebNwBgxJbjRDpjEZqCwPR8/tCYfB8mX6yMIHdaWUQNedWal/1R6
   rd/YZ0lNMoqT3+fHeBzgAhNiRZhXoRpmZ4IB5htoQB99OT7fe9ZALHoui
   U=;
X-CSE-ConnectionGUID: NtLnQcYzRAyYS63qRgeptA==
X-CSE-MsgGUID: 2Mafx0XZQR2gnyYycgdMSA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,178,1787004000"; 
   d="scan'208";a="160810323"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 15:29:26 +0100
Date: Sun, 25 Oct 2026 10:29:20 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
cc: gregkh@linuxfoundation.org, andy@kernel.org, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fbtft: fb_upd161704: Replace udelay() with
 usleep_range()
In-Reply-To: <CAHxSwT_bdBdiwwXpGpr9+rGizZU3p+RsB18hPH5TxqMuMZOsQw@mail.gmail.com>
Message-ID: <7f65e825-b6eb-e7b-6bfc-a7549140c49c@inria.fr>
References: <CAHxSwT_bdBdiwwXpGpr9+rGizZU3p+RsB18hPH5TxqMuMZOsQw@mail.gmail.com>
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



On Sun, 25 Oct 2026, Abubakar Musa Samaila wrote:

> Replace udelay() calls inside the init_display() initialization
> sequence with usleep_range() to avoid CPU busy-waiting. Since
> init_display() runs in a non-atomic context, sleeping allows the CPU
> to yield, improving power efficiency and system responsiveness.


The patch fails when I try to apply it to the staging-next tree.

julia

>
> Signed-off-by: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
> ---
> v3:
> - Remove raw git headers from the email body per maintainer feedback.
> - Add a descriptive commit message body explaining the rationale for
> usleep_range().
>
> v2:
> - Send patch inline in the email body rather than as an attachment.
> - No functional changes to the code diff itself.
>
> v1:
>  drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/staging/fbtft/fb_upd161704.c
> b/drivers/staging/fbtft/fb_upd161704.c
> index 7288140e7..94ae5bbf0 100644
> --- a/drivers/staging/fbtft/fb_upd161704.c
> +++ b/drivers/staging/fbtft/fb_upd161704.c
> @@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)
>
>         /* oscillator start */
>         write_reg(par, 0x003A, 0x0001); /*Oscillator 0: stop, 1: operation */
> -       udelay(100);
> +       usleep_range(100, 150);
>
>         /* y-setting */
>         write_reg(par, 0x0024, 0x007B); /* amplitude setting */
> -       udelay(10);
> +       usleep_range(10, 20);
>         write_reg(par, 0x0025, 0x003B); /* amplitude setting */
>         write_reg(par, 0x0026, 0x0034); /* amplitude setting */
> -       udelay(10);
> +       usleep_range(10, 20);
>         write_reg(par, 0x0027, 0x0004); /* amplitude setting */
>         write_reg(par, 0x0052, 0x0025); /* circuit setting 1 */
> -       udelay(10);
> +       usleep_range(10, 20);
>         write_reg(par, 0x0053, 0x0033); /* circuit setting 2 */
>         write_reg(par, 0x0061, 0x001C); /* adjustment V10 positive polarity */
> -       udelay(10);
> +       usleep_range(10, 20);
>         write_reg(par, 0x0062, 0x002C); /* adjustment V9 negative polarity */
>         write_reg(par, 0x0063, 0x0022); /* adjustment V34 positive polarity */
> -       udelay(10);
> +       usleep_range(10, 20);
>         write_reg(par, 0x0064, 0x0027); /* adjustment V31 negative polarity */
> -       udelay(10);
> +       usleep_range(10, 20);
>         write_reg(par, 0x0065, 0x0014); /* adjustment V61 negative polarity */
> -       udelay(10);
> +       usleep_range(10, 20);
>         write_reg(par, 0x0066, 0x0010); /* adjustment V61 negative polarity */
>
>         /* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
> @@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
>
>         /* Power supply setting */
>         write_reg(par, 0x0019, 0x0000); /* DC/DC output setting */
> -       udelay(200);
> +       usleep_range(200, 250);
>         write_reg(par, 0x001A, 0x1000); /* DC/DC frequency setting */
>         write_reg(par, 0x001B, 0x0023); /* DC/DC rising setting */
>         write_reg(par, 0x001C, 0x0C01); /* Regulator voltage setting */
> --
> 2.34.1
>
