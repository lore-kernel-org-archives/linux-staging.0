Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB62FB0
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 18:30:13 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 9CB7C1C0B76; Sun, 16 May 2021 20:21:55 +0200 (CEST)
Date: Sun, 16 May 2021 20:21:50 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: gregkh@linuxfoundation.org, linuxarm@huawei.com,
	mauro.chehab@huawei.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
	devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/17] staging: nuc-led: update the TODOs
Message-ID: <20210516182149.GA3666@localhost>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
 <f23fed6a89f66564f5af52f241016a4b9823ce04.1621161037.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f23fed6a89f66564f5af52f241016a4b9823ce04.1621161037.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi!

> -  Need to validate the uAPI and document it before moving
>    this driver out of staging.

>  - Stabilize and document its sysfs interface.
  =20
Would you mind starting with this one? We should have existing APIs
for most of functionality described...

We really don't want to merge code with bad API, not even to staging.


Best regards,
							Pavel
