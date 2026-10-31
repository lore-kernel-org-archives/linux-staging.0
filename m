Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453555;
	b=iI0mFU4ja18QwOM8tL/nzn0rlmDUgUX/N93MCIt4HCOAWFTfSo+0JkgCFE38biwscVME
	 1b+t2A7/QFofYooW/V9TLE4F7aUduLNbiyzC9kCI9SaBY3uwT7qQ4rCTPlzGCay7vT2WK
	 1zUNz2fVOh0bx36U8JaFkwIp/ygVCsDtSNXW2P05ctPnC9xSXNXZREEI7/CXcaAv6MEfg
	 DfBdclv9wmj3zr3rseArtEByTFj+jxP26PhCMvUljsRK184R2rM0pWw9EcWEmTDK5mhdT
	 IUD+YhF6J+/3sKHE+K+ISOQKm5vnJLff0WvPZaYbBSrWdx4ayXcpAHJ9rq6YBlKCrDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453555;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Content-Type:Content-Transfer-Encoding:From:
	 Mime-Version:Subject:Date:Message-Id:References:Cc:In-Reply-To:To:
	 X-Mailer;
	bh=D7LvaphkkZhIV8sWBjj5XfC38F7LHAzLjBycln5nMTQ=;
	b=bqnqVGcINL0zv9aWcg0KIrKvgwUM2b8SiMhZMQ7FGVY66dBj5St+vQq3al8iFknbASeu
	 VrZv9q619jcBrQq+NOc3M5kJzSLplmY3RlmJnL7NBfd0s2J9wgTuzisJGuWlYb0KC9Lc3
	 EIyfLksKCTUxsDk3lUAmXuK4Q4tKDfQbo/8N49/OJTfUSbKXHg3KxBr9rKHMQA6ZVqI1u
	 jycWIo7y4BlNK7YcB1A01EKvlVkZ/hu7kysN3PyU29xtq6W4o2na327Y1waagFoHnt+UZ
	 +feUNV+uVb+kdRAWlWs7UktlReAXFTSanejUG1Na/gQwxx2mjR5/GLG2a/HHkJuNpNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=p5HdaAwh;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB73D606A31E;
	Sat, 31 Oct 2026 13:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB73D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=p5HdaAwh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=content-transfer-encoding:from:mime-version:subject:date:
   message-id:references:cc:in-reply-to:to;
  bh=D7LvaphkkZhIV8sWBjj5XfC38F7LHAzLjBycln5nMTQ=;
  b=p5HdaAwhI5g3hTzWI43jKfRzRQZLNw+Bu1TShoYLkXBKR6ktAymmpBBx
   fVXldhYgKWBQT4XU0y9EvHEQxK8FnDwS5ujelMz1fpD+mBTdk+lwxj9QP
   sjVG660D6P6mrQqgu/7gm8js0Qm2DbM+nqhLd9j+2iMC+QeUbwM5sH/FH
   E=;
X-CSE-ConnectionGUID: 0JLDJ17zQY60Wwg+oM/8bQ==
X-CSE-MsgGUID: DKW+yWdNSEOI4tCpgy1QHQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,188,1787004000"; 
   d="scan'208";a="303148185"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO smtpclient.apple) ([76.123.3.53])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 14:32:29 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] staging: fbtft: fb_tinylcd: align argument with open parenthesis
Date: Sat, 31 Oct 2026 09:32:19 -0400
Message-Id: <9445966A-996E-4F2F-9E8F-E71E9C90A6C5@inria.fr>
References: <20261031064705.9513-1-mariasheikh812@gmail.com>
Cc: outreachy@lists.linux.dev, andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Maria Sheikh <mariasheikh812@gmail.com>
In-Reply-To: <20261031064705.9513-1-mariasheikh812@gmail.com>
To: Maria Sheikh <mariasheikh812@gmail.com>
X-Mailer: iPhone Mail (23E261)



> On 31 Oct 2026, at 02:47, Maria Sheikh <mariasheikh812@gmail.com> wrote:
>=20
> =EF=BB=BFAlign the continuation line of the write_reg() call with the open=

> parenthesis to fix the checkpatch.pl check "Alignment should match open
> parenthesis".

I believe that this patch had already been proposed by another applicant and=
 rejected. Please check the mailing list archives before sending a patch.

Julia

>=20
> Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
> ---
> drivers/staging/fbtft/fb_tinylcd.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb=
_tinylcd.c
> index afa8f1c740c5..d58b1247262b 100644
> --- a/drivers/staging/fbtft/fb_tinylcd.c
> +++ b/drivers/staging/fbtft/fb_tinylcd.c
> @@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
>    write_reg(par, 0xE5, 0x00);
>    write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
>    write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -               0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +          0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
>    write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
>    write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
>    fsleep(250);
> --
> 2.53.0
>=20
>=20

