Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990502BF015
	for <linux-staging@lists.linux.dev>; Wed, 25 Jun 2025 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864994; cv=none; b=hw7zKfq373JvH+Dtx3sy1tvSDiPmUe1m2yTBvO4rEkzHFhmcOvQOfq4mUvpV/l/IRFB59enOuyZ7eH07wgLDhbUnxy8+bErmzPn2yLlOFPBw6LtoQnqqJLHpxzEazwUlV8uWKdxRWACOyIhuQx38Z0ErkWYos4AImD0A+j7FUHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864994; c=relaxed/simple;
	bh=5O2/4BpQHfklLSAAZ+OUfTKYve/rhKype+tQDUVh+no=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b56EO4PA2DJ+SRlYqZqME3/dTzBnKUF1e9MzrWAED6EtQvtEbIxfT0MPakdFOEOaTPlEkhSggU3FzbuFyDpsiyBn15+bWPbYCxTd4VTQBxVYx+7MMjB/KeO3IDC7ipOnn4SVf4/ATnME1S6rvOHJkgwu3vadr4VMR8k33EhqamY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VrzsYZlz; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VrzsYZlz"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-73a01a7bee7so580471a34.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Jun 2025 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864991; x=1751469791; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RscgyY7zr0J0heuodisQOvqSQWiux2P+I5t0Y0pHfw4=;
        b=VrzsYZlzf7I6FoH01UkVx7mCG4KO/VlaFrTpKS33ajnf14/luOK1VgYyOwiG9ANIr8
         lIGWIgnc9x4oTP2ngTZNWzVVJElLzQ7o730rfSfB+qcllBE7Bli9C9SP3Lsxc3IE3LUS
         x6KNNoDjJPhFF83ALD6Tyrf7djZV6EBSAWY27c3SPYhKvLceLtW4TP0uo3IzFvN+3t2x
         Um+VdtHlHxCFCLw80LGrJmO1ENHytUnGUks9iyv7q5PfGP3l+PO/u6Ec+VFA6dqvMgHZ
         f/VxFdNyv8+Hq+hp0/ggx+0apmJiEX0lMVFu8CMtVZfoFXIYLLxYgYznmS2LUUUv37zo
         mBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864991; x=1751469791;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RscgyY7zr0J0heuodisQOvqSQWiux2P+I5t0Y0pHfw4=;
        b=IvfC2zXUvoU4IzCN20EHPn34VvNS4girbXrDHRudHbXmlb7Vt/QZWRvJ/R37MG1CI1
         BHHj/EQEgZFPKu1Ebkoqhs14fy6jMucVmbjPxURJk5EuZtG8sFFj9za0YqBo2/J/k0s9
         bHCgB6odIHajPUm/GZis9CVMAhKMgosn/hhCEeFv0qDn3KpAC8xQ0VnzeTecXDqEq0/n
         C8LCycCDFQAfm3n9sO47Xaaol/Ze0TGJxywFJSfRkm9WDRzpnXlmZ/kFp/diyp/6BJd/
         ljH5kASH/SS5a2rp9tCTkQNVXSVmMwK++ke4DKLBU1Ys5f90qT4v/wpmnS1vj1Oi/wm9
         f8ag==
X-Forwarded-Encrypted: i=1; AJvYcCUJKUHEI9KSuW+t+QT994xoPLfQXi68+WXsTX4sejlMvcmOUhBKQRLkbD2hlYmUupd1Zg6wA2kmx3pdgilD@lists.linux.dev
X-Gm-Message-State: AOJu0YxsZbybIRCyqUI1BrFtKvLSsRiDb1bPYlx7C3XAleJUYEFcFpGv
	neSYK6yW++AEikqHFo5pUchyz2827nvzOovYdLBkSvKF4tEqZQ5EG0oAnVGFRY+GoXs=
X-Gm-Gg: ASbGncu6N+3Qu72tVSpRSoTOZec5sM9X8RHASnKxhNLpZ605pRhj4X1Sj7tvGrLrtdp
	N1DxbYt2dtp4QJCEZ0/QA8oy5lmBmeS+Qj13wI6mYTLc4y0xQ49lq+1zhL/Ge/vbUXvDri6XP6Y
	+ewpZiPLLRforgQclCFWU0ie9ues6AxP4QDVp0o7qL5fk/DfSIqbLYMQNEecHYpZAJydXisWE2A
	3dNtAEkgRXEK5qKwbFHcU0h3CnqtEH0L+/aMdX5VDulw5iab0wgaw/eqt2AV6q9qjZjoure3VyO
	f41Ac91R68mDo5QnsH5iqlXEn4ZG24qNqsLOx1fiYwavOM+sf0GWbxk+PpkR9qiOAkmFDg==
X-Google-Smtp-Source: AGHT+IFW4wlR0wlfzJlAh8x3qk2Cx37JojTQFFpNrPClMsltnG4YGIKmiULYONmufRuAqIk5456wBg==
X-Received: by 2002:a05:6830:2113:b0:731:cac7:364e with SMTP id 46e09a7af769-73adc811af9mr2506085a34.22.1750864991484;
        Wed, 25 Jun 2025 08:23:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90ca9c12sm2237043a34.50.2025.06.25.08.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:23:11 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:23:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()
Message-ID: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The iommu_paging_domain_alloc() function doesn't return NULL on error it
returns error pointers.  Update the check and then set ->empty_domain to
NULL because the rest of the driver assumes it can be NULL.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/rkvdec/rkvdec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d707088ec0dc..1b7f27e4d961 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -1162,8 +1162,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (iommu_get_domain_for_dev(&pdev->dev)) {
 		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
 
-		if (!rkvdec->empty_domain)
+		if (IS_ERR(rkvdec->empty_domain)) {
+			rkvdec->empty_domain = NULL;
 			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
+		}
 	}
 
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
-- 
2.47.2

