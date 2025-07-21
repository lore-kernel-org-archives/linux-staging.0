Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F42D3EEE
	for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753106903; cv=pass; b=KzoX09sSuhSN8701qz35TNTGanej6wI4OvHc3twMuuE273ruaUbXxf6AE+ll6jDz5sij3grGfe24+SaAAl07XszcTHjbbYPaPsV7V6S+68agsZ5P51HDfZ/AbrJgTp+Tf+g20g0lHjSjO05u0IZM2T8DPwXjmjtBLDbiFEQeNXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753106903; c=relaxed/simple;
	bh=aPE9OP5n/nxXpSPei6MkovrRMZGc+nmT492+wys9qe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjZ2GEKi9biChzg5DUBGe5PgaoZDFvzUKtdagO3RKLsi11aVIRX37l/2INp167j1BnA0SE8cppjKPqKvqtaDk7X7heR/IcFcfEZsiOXeuMZKIj3op8FpT4niiZt+5xwXxWUl9EMDRKnPVKfEaWie0NPG8PrU4+u8mnbpCG3YLuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=O1/OT2JS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="O1/OT2JS"
ARC-Seal: i=1; a=rsa-sha256; t=1753106889; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z59vGM/4C6HeCkGkpTGlXB/INooxTGTCbMXlVKrKnXCzYTgMLU1rufxW22HSGRc9v8c8iuDKMUfprp3da72GnPAku7gGTij3Bm5s6lPNLDmuwzw1DROb8sLE+WkP7v+awCypwBrSCPCNNxcqxm5tMK1eEYRxjI96zDnGf20o7is=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753106889; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iUwGYLVqI6Xet0Y6yYXId8OhAeexUPWui/BWydgtxjc=; 
	b=XFMi09ggTPwIeka28tO2P/9v65WtMvNUHgWd6CrO28mYZ10fSUVAoceyZKJzy0RZ05Hl5DcJuf2tgv/lnb52ozIejBKm/DS0Fy6VgFHJT1Q6oMy/1/CH9BuxqumRG42c2Y/IY9eXEBz36denos92wRamjZZ/RTZQwJ+CTJ1eXok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753106889;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=iUwGYLVqI6Xet0Y6yYXId8OhAeexUPWui/BWydgtxjc=;
	b=O1/OT2JS33uLJgy6z/cS/tvpgWhtZPC+kVwWlYfZ3Q2P/tDCOTkJrKTdjeFcwFJX
	Q0Az0saTpCz2ZbJ6YqiL4gfo42cNWX6fS6wE+FBuv58OqMpewlGvmPf3IGx95wZ3t4p
	iwpd8EUhPHMOeOO9ZOkSVNKHzLo8DhR4ufMeL1nc=
Received: by mx.zohomail.com with SMTPS id 1753106885694476.02518889834164;
	Mon, 21 Jul 2025 07:08:05 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()
Date: Mon, 21 Jul 2025 10:08:03 -0400
Message-ID: <6175873.lOV4Wx5bFT@trenzalore>
In-Reply-To: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
References: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Dan,

On Wednesday, 25 June 2025 11:23:10 EDT Dan Carpenter wrote:
> The iommu_paging_domain_alloc() function doesn't return NULL on error it
> returns error pointers.  Update the check and then set ->empty_domain to
> NULL because the rest of the driver assumes it can be NULL.
> 
> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c
> b/drivers/staging/media/rkvdec/rkvdec.c index d707088ec0dc..1b7f27e4d961
> 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -1162,8 +1162,10 @@ static int rkvdec_probe(struct platform_device *pdev)
> if (iommu_get_domain_for_dev(&pdev->dev)) {
>  		rkvdec->empty_domain = 
iommu_paging_domain_alloc(rkvdec->dev);
> 
> -		if (!rkvdec->empty_domain)
> +		if (IS_ERR(rkvdec->empty_domain)) {
> +			rkvdec->empty_domain = NULL;
>  			dev_warn(rkvdec->dev, "cannot alloc new 
empty domain\n");
> +		}
>  	}
> 
>  	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));

Thank you for finding this one. I tested it on rock 5b and all is good. 

Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

Regards,
Detlev.


