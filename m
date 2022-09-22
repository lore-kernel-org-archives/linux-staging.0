Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF38423AD
	for <linux-staging@lists.linux.dev>; Thu, 22 Sep 2022 08:01:24 +0000 (UTC)
References: <20220916030655.11105-1-anjan@momi.ca>
 <28159639-c011-62a0-e8bd-07a79aadca91@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=momi.ca; s=key1;
	t=1663833683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0yNopc1Gi0yMjAQNP4Zf9e0rxlj1CWidMLuNaUxDY0=;
	b=n/MGXy+lmhuEqiGv5GNmJL1RYZ2xdAf74PP8XiD8QexpebBwedngI79Qk7DnpjPTUBzsxN
	gEx0mKiDqxaYrJZaWTjGIZO4faGiZrRks3hfjlVRV7P/Px8O9UzNAG+YNaS/ms4CaytNrH
	EJV6FLF4Tq0uH7ecCJF0h3pi4OetvtJwwsvYvyhJhjrfwv3fR/4yBasCWfZHpgFAsIhN/T
	NJekAUgAgN+zmsKyGUeTIQA3bSmsdzJieqyFBjw6Q9Q560hiOvB00GTDEA+iApOPblMQFl
	a9aaox7zzb5kos+R1PCkEhtpOTs7Ux8/4YIGVyhQb2w5QnegAk+GIwRcP+LW/Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Anjandev Momi <anjan@momi.ca>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8192e: fixed brace, space, and align coding
 style issues
Date: Thu, 22 Sep 2022 04:00:14 -0400
In-reply-to: <28159639-c011-62a0-e8bd-07a79aadca91@gmail.com>
Message-ID: <878rmbalda.fsf@momi.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: momi.ca

Hi,

Thanks for the review. I just sent v2 of this patch. Splitting this
patch up into multiple patches helped me make better commit messages.
Please bear with me as I try to learn how to contribute.

Best,
Anjandev
--
w:] www.momi.ca
pgp:] https://momi.ca/publickey.txt
