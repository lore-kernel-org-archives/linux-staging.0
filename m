Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70872226D02
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 06:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802343; cv=none; b=rZt4jB2ox1u0W6kYcjZuumMSZv+XO+0RErZL+OFgFxMlYvtEQ4PLfI69eByiG0FAYvKp2aU8gUPttn9+nZC1FCTe3mHpVBkqWvvLUDo2W5Z9wD9UyNjp+xuF/v0ZIQb2e0gwQDijkqaSTj2WZ8VUqtV2liQ/mF6ox+OmW6Tpf0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802343; c=relaxed/simple;
	bh=d/lMiVvCAlxac6LtNQv9U261dkliG676mvYoa9xn9h4=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=ARf3+AxMiTj678bFeLwx7vwZW5xTfDVswXNPYW2sBhl7S7AoOYa7GxSYtYgpF5SHMmoXwFKIrlPQp7BC8bGWnj6WifwgzjdznaOQO4ljzFiKtHA2kqgT8APF/lclwCFII73PAsSUFAQghVT5Ouq+gQ5jzZUYPS7QO+Uu5aSx2zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JO9kMiI8; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JO9kMiI8"
Date: Fri, 10 Apr 2026 08:24:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775802340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=d/lMiVvCAlxac6LtNQv9U261dkliG676mvYoa9xn9h4=;
	b=JO9kMiI8Z++RJvUmziPNO98P3vDAP7S/LFIS3xM7AH4LmEP1MN0iYbmUmercsm75MoAycv
	Ewjg4U95tG2belUs9cxNfZITgl05w1cLlxCGrULYvWkjtMBppw8YTA2phdZk5LhAxJ7M6S
	uN3jdbaGtzHkHkY019qGzWW/59aVzgA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: osjin83@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/4=5D_staging=3A_rtl8723bs=3A_co?=
 =?US-ASCII?Q?ding_style_cleanups_for_rtl8723b=5Fphycfg=2Ec?=
In-Reply-To: <20260410014214.10684-1-osjin83@gmail.com>
Message-ID: <1C849327-B96A-4980-997A-6362B77B0FD5@linux.dev>
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

Hi Jinemod,
v3 seems perfect on my end, and it applies cleanly to staging-next=2E
So for the patch series:
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
