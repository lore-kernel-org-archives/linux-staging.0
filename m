Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0317D23C4E9
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536859; cv=none; b=oTz+YEBwNkmps+9z3cgD927N4Wg2vKNI+auP3WqN8cIl7r+rgMUNcDgckInBYEhC6oYB3wT/2fGd9xmXjCBo6eXdsnSxj4uMowLbqwnEZ7x1wOCimdbjYuuyqJkFNoKfLVZTIv2GAxrXptForhbX5M1qEqsgmN6p80Gf56uit18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536859; c=relaxed/simple;
	bh=mMjcPctx96k8AW3mtoeXy2eGmTvYgaPV5jPnJwJmQE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IV6xKlNzz62gVIttzkT1W2gUsCnAwFZyH3e7DNgIaEmZmRbvQUbyTQziUlv1gSipV8vj4giujpLC5/34qjjOb4NTDIpbuFn+NrN8jpd6PRA4/XLm/yxqSWzW4kcILBsoIzIB0jkrTREVyPHUiV6b0zUXYUAkOkIb1h1jiUpLlhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=KoF24CFG; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="KoF24CFG"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4273845e6;
	Mon, 15 Jun 2026 23:15:44 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andriy.shevchenko@intel.com
Cc: abdelrahmanfekry375@gmail.com,
	andy@kernel.org,
	corbet@lwn.net,
	dawei.feng@seu.edu.cn,
	error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	jianhao.xu@seu.edu.cn,
	keescook@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in atomisp_pci_probe()
Date: Mon, 15 Jun 2026 23:15:43 +0800
Message-Id: <20260615151543.3385190-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ajADZZqqsFcgAPhy@ashevche-desk.local>
References: <ajADZZqqsFcgAPhy@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ecbda559003a2kunm52e56f2c6ec6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0lIVk1IGBhKT0MfHR1CTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KoF24CFGA/rqsCVcIhExTK+Qn0Rn9q4fVqSa2LEVHAzCFQhwzlWqJqbh49TSlj2EkqaLazd0rQL2Qdai4b2lktH/5vblwb/JwXjv2D3gGcUogdKnp1r4Psp1qhWnzQ6CgDgOpGrQkzlLGfxyMi+O8bEnfDqHnruT8qtt+yXxqKI=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=mMjcPctx96k8AW3mtoeXy2eGmTvYgaPV5jPnJwJmQE8=;
	h=date:mime-version:subject:message-id:from;

Hi Andy,

Thanks for the review.

On Mon, 15 Jun 2026 16:51:33 +0300, Andy Shevchenko wrote:
>But did he _develop_ any parts of this patch? Otherwise Reported-by is more
>suitable.

I agree. I will set Zilin as Reported-by in the v3 patch.

>Yes, and I still insist to move them to the cover letter. In any case those are
>not present in the second patch anyway, moving that to cover letter covers the
>entire series (and I believe you tested the entire series, didn't you?).

Yes, I compile-tested the series. I'll move those paragraphs to the v3
cover letter.

Best regards,
Dawei Feng
