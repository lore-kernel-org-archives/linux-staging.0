Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3141387367
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775803065; cv=none; b=Ubd+WHYULsiFTkL6S0ODZRe1uuBegcrkrmJbz+eD+A7Q33o7lPv9swGSvMYDIxjQ6RVnA8N/ND/vC8955KuxxGoBHDLigZXtRQUWKF0hMaXOv6fXaM0IQaa1aojrUBo1peZ4EgW+Vegsoq3nlTvM3w0Q04G7Kj9WbTGOmWcM4zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775803065; c=relaxed/simple;
	bh=+5IzJVW4LpJ4gArplckiIoqeBmsPztvJDTSiyHkciUY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JAfiAB1ugAAFrB7yEVeUmrQ6NcmxCBnSR+8DNbz2sp2zf1/hporA3OvUi55+N4j6XBTFAGJ1zhY/zzSvT2DkxFu5g30au5Dz/xdS1dk0nICMagGFH0njKIUTwVOyYoluxYcN9snTYzzzEe8mO366breyz9dPaT22fPTJt/tjeU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e9Y6yUzI; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e9Y6yUzI"
Date: Fri, 10 Apr 2026 08:37:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775803061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5IzJVW4LpJ4gArplckiIoqeBmsPztvJDTSiyHkciUY=;
	b=e9Y6yUzIYxKHgRGmsDVw4dD9ma3wnQtvz0u2mcQey3Dtj7xMRxlMB7aEmzFNof8V22TGEk
	OpB61+GzRJn7hMDeiW2m98MwHfp4M1ARYUoJCM5+IavNXt/MZD398sUyQXlKOlDeEeAucL
	ecOX9Hv44rWxIaeBzTvnwaO2pC8rk6k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: osjin83@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/4=5D_staging=3A_rtl8723bs=3A_co?=
 =?US-ASCII?Q?ding_style_cleanups_for_rtl8723b=5Fphycfg=2Ec?=
In-Reply-To: <1C849327-B96A-4980-997A-6362B77B0FD5@linux.dev>
References: <1C849327-B96A-4980-997A-6362B77B0FD5@linux.dev>
Message-ID: <937159C8-3250-4693-B890-77DFF35C9CF5@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 10, 2026 8:24:56 AM GMT+02:00, Luka Gejak <luka=2Egejak@linux=2Ede=
v> wrote:
>Hi Jinemod,
>v3 seems perfect on my end, and it applies cleanly to staging-next=2E
>So for the patch series:
>Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Edit: Hi Jinemon*
