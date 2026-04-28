Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AA0328B75
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 19:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405937; cv=none; b=DlrKhQ7nOfNMdJrsoP95Vots4ms9SJ2Zog+JAwKEg6BpKcO1rs6wxuMY7MIknVU1wSFb2WJJFwZmQUD+KmerRNl1mRmBuUJ49Aaa06rXnzGWJ7QnNYnDnSG3mlvpXj76PXplfw37rssP7sn7Wqam5GBC1bcY8EqYhbjOGFbCSAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405937; c=relaxed/simple;
	bh=nwobxcnUP8fT/YjKT2j5rd7iB8DkE+wNbXazSu/6yC4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TsA2tQaa6/jIb6ZQzbPTIHR1LDlZ7oYnAaAOa/QY2shhV3NWXiKai1iuaOddWlnXraJMv4y5q5/DvbWVkkFRxMkFD9BGhydgHmp0SOSz+so0hdhqiS7zdnPx5h3nrnr4l5EyiV+Hq419MjociBNoBBQFgPvvnw4UcaaJLesqeFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k6qJ39KT; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k6qJ39KT"
Date: Tue, 28 Apr 2026 21:52:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777405933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwobxcnUP8fT/YjKT2j5rd7iB8DkE+wNbXazSu/6yC4=;
	b=k6qJ39KTbFZjlocKZlI+0rId/LRrEwvwqk2QtVVoBvboru9OFArKhsj75WyiZu549tPnTF
	27q18TUarqGM3qcgeg395u4ukfh0AJ0NlNdOwV8Zzz1OLRdNMMWsZeegHatO7AX062MKjW
	8fUR6Uj0zU9bGv+9w9OHkfEMO5mUVKI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Salman Alghamdi <me@cipherat.com>
CC: gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_0/8=5D_staging=3A_rtl8723bs=3A_rt?=
 =?US-ASCII?Q?w=5Fmlme=3A_fix_long_lines_and__related_issues?=
In-Reply-To: <c681a3f1-fc6b-2f0f-6b17-d3fc29ec5fba@cipherat.com>
References: <20260428164513.763471-1-me@cipherat.com> <9EC2EE03-DBFE-42D0-AC1E-520D73C83C5F@linux.dev> <c681a3f1-fc6b-2f0f-6b17-d3fc29ec5fba@cipherat.com>
Message-ID: <07342DFC-EFBB-4E48-8032-B4925771B871@linux.dev>
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

On April 28, 2026 8:43:31 PM GMT+02:00, Salman Alghamdi <me@cipherat=2Ecom>=
 wrote:
>> LGTM, so unless Dan has something to add, for the patch series:
>>=20
>> Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>
>Thank you for your patience and detailed reviews throughout this process=
=2E
>This is my first kernel contribution and your guidance has been invaluabl=
e=2E
>Looking forward to contributing more! -hopefully fewer silly mistakes :P
>
>Kindest regards,
>Salman Alghamdi
>

No problem, I'm here if you need any help in the future and feel free=20
to cc me in any future patches=2E One more thing, silly mistakes are=20
part of the process and you will do them less as time goes by=2E Hope to
see more patches in the future :)
Best regards,
Luka Gejak
