Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC723AD
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 09:14:30 +0000 (UTC)
Received: from booty (unknown [37.160.6.101])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 711B5C0003;
	Wed, 22 Mar 2023 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679476463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=deGf4hUAwHy3aFmh+GEX0MrCG/Z4A2oTIyUdBJkliMk=;
	b=FcUqVMG0jy2j8wsgIutB3P8OM24PcNQNWBz/Oz16g8RToD5DJEy5rdWd6kKMp2GZdUfq+h
	xUu+Wf9ibxwbvZaUvUSlT9NOQ1KANWdSurt9yPw+uB1IH2iQo/zvJr1Ko8BDW7Owe/vD3x
	Oei1F7LKlH6GrTB1h6GRyiNcllzYXPfjtaiYgEpL5i3Gmo9NbNNxY2uSdJ+DKNtK8BPsjq
	Y5T3ND3mtKcyIfygf8QnqSEU7Ngc+sGqOICeS5J+uSEJ6/6qrX8Dzn4tIXVWJ5MXIwg4BR
	Y3ZCQgLKRiSrn5CZ2oSjXWhVhlmG3RptxTrPyQ4BnSmZD14Y3s2C97Opga6VCA==
Date: Wed, 22 Mar 2023 10:14:17 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Richard Leitner
 <richard.leitner@skidata.com>
Subject: Re: [RESEND PATCH v4 00/21] Add Tegra20 parallel video input
 capture
Message-ID: <20230322101417.4561a7ae@booty>
In-Reply-To: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu,  9 Mar 2023 15:42:59 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> TL;DR: Resending this series with Rob's review tag added. Now all DT
> patches have at least a reviewed-by tag from Rob or Krzysztof, all the
> driver patches have one from Dmitry.

This is a gentle ping about this series. All patches have a
reviewed-by, there are no major changes since v2, and it's touching a
staging driver anyway.

I don't think there is more I can do at the moment besides pinging, but
should there be anything, I'd be glad to know! :-)

Best regards,
Luca
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
