Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA172
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 09:29:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D84C661AA7;
	Mon, 15 Nov 2021 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636968551;
	bh=I6O2UV2fGViDnmQb3yT5G3yszWMS4rc3+0/gpS1qXvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtv0z9F+cg7m5iUigYzQSXdBmqjeNhYNc1I8EJFax1CT8PECJIzX3os6j/DxEhLkx
	 93M6KA+U+kN3zisIL2iFiZybt3QOI5g4ISKMbL5XeBSS0SgZSKSo6xro2OHg3eDBBX
	 qvbOul007NWliank+ghlFaz1YeU9MgaYAjP9xG1M=
Date: Mon, 15 Nov 2021 10:29:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: mt7621-dma: reindent to avoid '(' at the end
 of line
Message-ID: <YZIoZIuXKBh3mANt@kroah.com>
References: <20211113142455.370952-1-liujunqi@pku.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211113142455.370952-1-liujunqi@pku.edu.cn>

On Sat, Nov 13, 2021 at 10:24:56PM +0800, Liu Junqi wrote:
> A change to make the code more like typical coding style.
> 
> Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
> ---
> V3 -> V4: Rewrote the text below the --- line
> V2 -> V3: Added describing text below the --- line
> V1 -> V2: Reindented the code
> 
>  drivers/staging/mt7621-dma/hsdma-mt7621.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This file just got deleted:
	https://lore.kernel.org/r/20211113192045.32153-1-sergio.paracuellos@gmail.com

sorry.

greg k-h
