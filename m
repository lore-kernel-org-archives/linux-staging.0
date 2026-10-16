Received: from mta1.migadu.com (out-190.mta1.migadu.com [95.215.58.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015093C9EE6
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138910; cv=none; b=M12FFSkvR7zUagb18tD5WIC5yQGbrOklZwztift28eru2UfV53dLqbQ22FQeX7miMW6p3q4kmHAR8Y/h+V1eqNsaTI/OggdmdhGGh8BQH41M3Qe5sDF/VdG9EHWss8Qt6yIZLd4ecOAW498B2as0cjePC0IgtqY5GRFgeARXByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138910; c=relaxed/simple;
	bh=TwbhKfu3u91eAwNGkrsleoxl/G512cdBFDvkqCM3U8w=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=fiYZAw7jdapPnAD14wLJ3J/+4v25v/SIP3G90gI+WMo8X07fHpvL9WIpBHdhYKYBHT2F3Qq+OW/MGZQauEHT6Klf0VAMVlFAbVqCXYTLg/7ALYvGIuHhTsAYW0d5ZbC5H4eYO+YSXXie8qYnR9O9yK6U+0fUeW5e7yzM1oGQL/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uboPEu+C; arc=none smtp.client-ip=95.215.58.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uboPEu+C"
X-Envelope-To: linux-staging@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=TwbhKfu3u91eAwNGkrsleoxl/G512cdBFDvkqCM3U8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792138906; v=1; x=1792743706;
 b=uboPEu+CmpcslK1VgyGnZ45Ngn85n+hM5lTya4ALJyHgusUMU0vneBYbdNLdQEBnVvpcNUd1
 jblNN0ZQ9VNw36DGdPDQCwJC59+efZxFjMm8hNC0rGisLa4wh4mAbL3Jac/xXcQHnx9pVDhSAK4
 XU4v377PePSVUj/HBocaNcB0=
X-Envelope-To: linux-staging@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d44a6c50874890b6;
	Fri, 16 Oct 2026 08:21:46 +0000
X-Mizu-Trace-ID: d44a6c50874890b6
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 16 Oct 2026 08:21:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <59536437a71f69bc688f96b94269b9e53216642d@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
To: "Dan Carpenter" <error27@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, pavankumaryalagada@gmail.com,
 gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
 dennylin0707@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <atHcT5GG8zzoH7kk@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
 <atEtUV5q9MHRSTJb@stanley.mountain>
 <672f78b36290a4021d3f94d9ec401d23420febbc@linux.dev>
 <dec2320eb01dc6499948a936c94512ddfd47e2a4@linux.dev>
 <atHcT5GG8zzoH7kk@stanley.mountain>

October 16, 2026 at 10:11 AM, "Dan Carpenter" <error27@gmail.com> wrote:


>=20
>=20Ah... I didn't realize this patch was applied to a different tree.
> #Unexpected.
>=20
>=20https://lore.kernel.org/all/7e53bd59b7b146caabebeca4347674c7@realtek.=
com/
>=20
>=20That's a mistake. Staging patches should go through the staging tree
> or atleast they should be Acked by the staging maintainer.
>=20
>=20So, yes, that's always going to lead to merge issues. Not a super big
> deal because the conflicts are simple to resolve.
>=20
>=20regards,
> dan carpenter
>

Greg did agree, see [1]. Also it got merged to net-next today.

Best regards,
Luka Gejak

[1] https://lore.kernel.org/all/2026100746-delicate-carless-a04c@gregkh/
