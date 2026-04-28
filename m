Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79CA44B67D
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 17:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777398165; cv=none; b=kKDizAZNxiWd0B++zLDmPYN2tG2Mm3cni4rVbGQqFWnGDUjpw7tz62l8yVEMDazLIZZT8HtMjxaTnC3iPaCdr3rK13TqhlTNMvh9wPyaf4BBRxsltjSWwKjdtRCvh61CtVQ0AkqAR+gVWoSoocbX5myEpHDPKLADLD27Qmtsv2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777398165; c=relaxed/simple;
	bh=h3sGh1XG/mLOaQPnl0c3he5nFmqiW0gZ83F4vTV1BK4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Flq+GAOgv8zY+3aXZnmaX4K46vCNqNPEwc9Kg5LYO/zf11oMq7WtyRv18USVwq+Pw+Lhjbmz/HYEkRTg9soNP4Adi8QysjuGCJ4jGUCNrt+7hq+goIgSuDwI1YY0XniBucdlCmjvGpful3xFOC5bVQSdF5cpIL12b9Cgid6QWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Bjx9E4Km; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Bjx9E4Km"
Date: Tue, 28 Apr 2026 19:42:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777398160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YdJQSJYDM/IbqzjPxAjtk8rzxHEHRk7kJMeWrCBeJVI=;
	b=Bjx9E4KmdPSp+lKU4RMF0MB0+FESzuD3jlohd+pq17iZfbgH6MZqt8Lxo4XeCNEiydkeqR
	06TL7DylEsBEysvLK3rWVsKnbRHFU4lq8Furs57Kd8s6odhcne/3zQ6akMZKy3H8eMJbrV
	cDuqUSdEqPwDNkviG6mbi5r9BgXU5WE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Salman Alghamdi <me@cipherat.com>, gregkh@linuxfoundation.org
CC: straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_0/8=5D_staging=3A_rtl8723bs=3A_rt?=
 =?US-ASCII?Q?w=5Fmlme=3A_fix_long_lines_and_related_issues?=
In-Reply-To: <20260428164513.763471-1-me@cipherat.com>
References: <20260428164513.763471-1-me@cipherat.com>
Message-ID: <9EC2EE03-DBFE-42D0-AC1E-520D73C83C5F@linux.dev>
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

On April 28, 2026 6:44:30 PM GMT+02:00, Salman Alghamdi <me@cipherat=2Ecom>=
 wrote:
>This series addresses review feedback on v5=2E Changes from v5:
>
>- Fix variable declaration ordering that broke compilation due to
>  dependency on uninitialized pointer (per Luka Gejak)
>
>Salman Alghamdi (8):
>  staging: rtl8723bs: fix buffer over-read in rtw_update_protection
>  staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length
>    subtraction
>  staging: rtl8723bs: rtw_mlme: wrap lines exceeding 100 columns
>  staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
>  staging: rtl8723bs: rtw_mlme: extract local variables for long
>    expressions
>  staging: rtl8723bs: rtw_mlme: remove dead commented-out code
>  staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
>  staging: rtl8723bs: rtw_mlme: add blank line for readability
>
> drivers/staging/rtl8723bs/core/rtw_mlme=2Ec | 276 ++++++++++++++--------
> 1 file changed, 183 insertions(+), 93 deletions(-)
>

LGTM, so unless Dan has something to add, for the patch series:

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak
