Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313D435E529
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421245; cv=none; b=Y3Nyor1wjAo+Ihs3VaJyG/nJrvZa+fAUYxZPwmlRuEdaetVcWUGbU+IAM5E/+uu3H24PgMlnhvek8TvuUxRyNs2C/dVbMF2RnGufHUgfIHWOlgZJVd0JH0DKzVhlAnef6BvwSc8bG16SrBoxiqim947XMyHXmHfX4OIS9xwWMUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421245; c=relaxed/simple;
	bh=3Foy6EDS7dsBzVwkJ7Bk1Sbfuzgex9lTrhqeRse/u5g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ggCc0U+Lmz77Vo9xhFvfBmKek1rJVXNnor5irmNz1CE9dDklg1fEX4z4Pm0akh3vop5ED7LuV2kQdzg/wpbmsEQde3Sstg9iDNad8HbHPZVH2g6Nf3GJcJDb1FTpGL6tXSKozZPJHqb8axKjXRn3y5fNFNkKmI3M2VsYBhPD+R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cgoEFdaA; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cgoEFdaA"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776421241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2p0Kv4uC7B5tHNP98AdBf9LKu4H+fOGnCOTWap/YKCU=;
	b=cgoEFdaAyKHMo41fyE8ZNb8wS4HonVL1TI2KgNSkJQ0tVcksjJP0q9UT7CvGehPhR70ZYi
	UhvlNGzBVMYKEkuTjwkkb7ZeAVZ6+SddrADE4v0WOKKKOGqyRDg7Lb664FIG/BDyZdTzKB
	ooYv1GygF55lLhF9bah4ygZmTNrDF4w=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 12:20:37 +0200
Message-Id: <DHVCRUGQKWML.3PO6W7SN7QPRQ@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] staging: rtl8723bs: fix stainfo check in
 rtw_aes_decrypt
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Maksym Pikhotskyi" <mpikhotskyi@gmail.com>,
 <gregkh@linuxfoundation.org>, <error27@gmail.com>,
 <ethantidmore06@gmail.com>, <starpt.official@gmail.com>,
 <straube.linux@gmail.com>, <sameekshasankpal@gmail.com>,
 <arthur.stupa@gmail.com>, <luka.gejak@linux.dev>
References: <20260417095452.23440-1-mpikhotskyi@gmail.com>
In-Reply-To: <20260417095452.23440-1-mpikhotskyi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri Apr 17, 2026 at 11:54 AM CEST, Maksym Pikhotskyi wrote:
> The null-pointer-guard was incorrect, returning _FAIL on valid pointer.
> Invert the guard, so it returns _FAIL on invalid pointer.
>
> Fixes: e23ad1570028 ("staging: rtl8723bs: use guard clause for stainfo ch=
eck")
> Reported-by: Luka Gejak <luka.gejak@linux.dev>
> Closes: https://lore.kernel.org/linux-staging/E4BF62EF-C6F6-431F-8EDC-77C=
1E613E66B@linux.dev/
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
> ---
> v2: rebase on staging-next. Split into a series of patches.
> v3: add Reported-by, Closes and Reviewed-by tags.
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/stag=
ing/rtl8723bs/core/rtw_security.c
> index a00504ff2910..f467cb5b1dca 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -1212,7 +1212,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *p=
recvframe)
>  	if (prxattrib->encrypt !=3D _AES_)
>  		return _SUCCESS;
>  	stainfo =3D rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
> -	if (stainfo)
> +	if (!stainfo)
>  		return _FAIL;
>  	if (is_multicast_ether_addr(prxattrib->ra)) {
>  		static unsigned long start;

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
