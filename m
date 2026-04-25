Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3F7351C05
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777116836; cv=none; b=l3QhbOewNZqfl1fuK377Tz8zFAcL+fzoMLSTeODTEfTk2urK98RDPWu4ugv33fZXl5KPk7dcmVVWmEN0XdAZRIXqZtmjpCG6UwzrlKCgiSo812jaBkO1+lZwb2tHowH8lEeCjK+tXVtBPpKzTb+EK4qeeHXtGSDDuby8SSyiACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777116836; c=relaxed/simple;
	bh=JhUKbn1aGv/1mg9eVoyp44sLaobzCB6c6GxLNZBkyaU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=t5Gv/e0Jideo1E6uOZJN6HOr9XKAZcQApEbDNFeqaKCZe52o5KUKFKsd26z4hx0XNjZF0ZhMfmVIj6MjHI7eGZjkJ+1cbHKbbQknDk86Fmvy0ecMr3Jtb62ZVQqMqiBsI8qAOCJKoELSYIAGh/yI3VE0npHsoLwmBmv6N6Epr1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kmPJ4eQU; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kmPJ4eQU"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777116832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8xK5Y4wV6mhzFjEMVizjIYh44brdxl6EhAeLL0ODk8=;
	b=kmPJ4eQUQYTB6h/sIsJzGWRD4XhHBaroTly3L1VIrnchirFGgO8pAPUTHkHc7uD1ZNU19A
	/9gt9IN4vcdVM1kc2lJzorKbt1cxd6E8sxDNsEON6bgI+syeRnl9UJwrqd8UuqoB5aKFJi
	971xDnASYhz7Gnw/Foqz4h9rxCgKl/E=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Apr 2026 13:33:36 +0200
Message-Id: <DI27C2T36JNL.1NH9V9IF2G0X6@linux.dev>
To: "Mohammed Rizwan Kaniyate" <mrizwank004@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove multiple blank lines in
 core/
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
References: <20260425112327.215355-1-mrizwank004@gmail.com>
In-Reply-To: <20260425112327.215355-1-mrizwank004@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 25, 2026 at 1:23 PM CEST, Mohammed Rizwan Kaniyate wrote:
> Remove multiple consecutive blank lines.
> Issue reported by checkpatch.pl
>
> Signed-off-by: Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  1 -
>  drivers/staging/rtl8723bs/core/rtw_efuse.c    |  1 -
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  1 -
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 48 -------------------
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 25 ----------
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    |  1 -
>  6 files changed, 77 deletions(-)
>

...

LGTM,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
