Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FB0332EA2
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410791; cv=none; b=eBLWCRUbI/zGW4Ljf9UicpUrY7BPPJUZSqiMkM3dy0xs08yNzq74CmzBJ4kFCoitIQDoNlwRl7myoWkPxLGvGcI41dbvFRZ9bpUC4ull2kWwP+UZDUU2neFNaTpwPcpdX1KtUJcjS4Q9s0Kx1x40HUSSZN8HJH/qoTWE5/156zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410791; c=relaxed/simple;
	bh=6z8KU3NCMbUT3OhZmEf1SYIWyHEsqj/J2MUIFTj1moU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oRjNYGOkndUv9mp2bCm6gL6gYk1dER/4GpWKarXTFe/i4YLZjtGLkMxbhE0XsdPrF8xdBcq+iPlItlyXeFBilwOUZpNL2wbECLkJzkibd89CmD1dsye+s0iwIP9hf1F05h5bZPwEzXOzvD9vNoqqOgYb6U1klMPA+GDkamgAN4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pfRkGkcc; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pfRkGkcc"
Date: Fri, 17 Apr 2026 09:26:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776410786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6z8KU3NCMbUT3OhZmEf1SYIWyHEsqj/J2MUIFTj1moU=;
	b=pfRkGkccTyn8UoXdC6PKPPlDBSbs6b6VvGT8U6Qg7X0ZT2eSAjTRdeI0z2DgOpiehT36sW
	GgJDGODwiTnLM1EbJ2MxYTktjGBFJ5G6G0eKanRUTRZyk1s0cV5aYsABIwNvxjwHrZw17K
	/neXIRr5TdE+u19m9NPvArgSQrIu3TY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Delene Tchio Romuald <delenetchior1@gmail.com>, gregkh@linuxfoundation.org
CC: error27@gmail.com, hansg@kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_0/5=5D_staging=3A_rtl8723bs=3A?=
 =?US-ASCII?Q?_fix_multiple_security_vulnerabilities?=
In-Reply-To: <20260417061048.62484-1-delenetchior1@gmail.com>
References: <20260417061048.62484-1-delenetchior1@gmail.com>
Message-ID: <71B54E47-F1DA-49A1-9742-3F70AA631607@linux.dev>
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

On April 17, 2026 8:10:43 AM GMT+02:00, Delene Tchio Romuald <delenetchior1=
@gmail=2Ecom> wrote:
>This series fixes five remotely-triggerable memory safety issues in
>the rtl8723bs driver=2E All of them are reachable from the air by an
>attacker within WiFi radio range, without authentication, via
>crafted management or data frames:
>

LGTM=2E
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
