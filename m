Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBAC3033F7
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 01:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461404; cv=none; b=jPl/rdFLqgZ5uaefU19CAP6v2a3EbCn8+/ov5decve5efXnEqGqSKPoq/BNMPekPORh9Oa9M0/8o9c5a/1Zg5B+pqXYikpiB/qycAQOrBbyQaw9FO1GZ0CCy1K/zDyJZ47+vfcszt0vUQyRAh1yz6Z7oJa5u7mbmiTi65SGMKG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461404; c=relaxed/simple;
	bh=meIxO2ScVjG2JFqHtezdQVNCyP0Z7xy7iLhrk1Sdf1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F+xnMnYT9pyAIYAFn+bt9tBynL4pnX1jYKlXE88hDZ1VfAeufEyw8Bv3XgfhI10CbT2CQw9AiDtNb+15sWhuvZZMDDynHUh6pIjH9DpwMHov9AkXs/vQX8nUz1GHWBRHLK4NilvIB/CfKMUra6Kqd2D3s3q9mVlJN4BpCqv1YWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b5Tl+P7f; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b5Tl+P7f"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785461399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I1Ft64q2OG/JA8I/Y+rwcNLJ7Y00OH7sn0pE+OCGhQE=;
	b=b5Tl+P7fXlck9uDNPBaZFzskYWC6la/SaWB22m67PZgHnYbT8ZDEZoeY1rO+IuYA6dhHm2
	t2cP2tjKyrrCTuImC3HQaGCg7xDJbXTaH/RF7Cn+k3GqmdNS5j3G8DPpSX0RUGCqZr6mlc
	MollTXV/uxe122ORs3hutaFCABpjXkI=
From: Yi Cong <cong.yi@linux.dev>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	yicong@kylinos.cn
Subject: Re: [PATCH v2 2/4] staging: rtl8723bs: fix double free when register_netdev() fails
Date: Fri, 31 Jul 2026 09:29:04 +0800
Message-Id: <20260731012904.2423763-1-cong.yi@linux.dev>
In-Reply-To: <2026073007-handoff-pajamas-63a3@gregkh>
References: <2026073007-handoff-pajamas-63a3@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Thu, 30 Jul 2026 09:38:25 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 30, 2026 at 01:59:58PM +0800, Yi Cong wrote:
> > From: Yi Cong <yicong@kylinos.cn>
> > 
> > When register_netdev() fails, the error_register_netdev label in
> > _rtw_drv_register_netdev() frees the adapter and netdev via
> > rtw_free_drv_sw()/rtw_free_netdev() and then returns _FAIL.
> > 
> > The caller rtw_drv_init(), however, still holds a non-NULL if1 on this
> > failure path and jumps to free_if1, where rtw_sdio_if1_deinit() invokes
> > rtw_free_drv_sw() and rtw_free_netdev() again on the same already-freed
> > objects, resulting in a double free / use-after-free.
> > 
> > Drop the freeing from error_register_netdev and let rtw_sdio_if1_deinit()
> > perform the tear-down, which is the single owner for this path.
> > 
> > Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> > Signed-off-by: Yi Cong <yicong@kylinos.cn>
>
> You forgot to use the proper "Assisted-by:" tags for this series, right?
>

Thank you for the reminder.
I have added the "Assisted-by:" tag in Patch v3.

Regards,
    Yi Cong
