Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA02D2CA3
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 01:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62708C340E4;
	Tue, 25 Jan 2022 01:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643073094;
	bh=SZQl2OYvF7dYq5ExNDfTCvJM3j5G6REAjF7S3w9vODQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CqvEZBYClop7DzOWBD4V5JRZls6qR9LNmJlm58IX+9Dt5ISzZO52HnK0IdRz38SCp
	 svowT/so8LHfOFgNqefwLNVxzCNTC9Rwa5NZ/NDFGemiHZ34I0QwzPkUmbfiFzqOM8
	 N+CSG7P6woDwroM1BYLsdl+LqQ2kLHoV3rVTc7rUvI0xBV3W86ZaI/TSLU+QLkpq4v
	 DLJCN0PqC7j5NO7ZCU8dF/j4ZQn9LiZG4PzEDB+yG/0yd1kqQ9oea8z26HHJuL/ux3
	 nv9u82LurQ3f8LHY/sCfo92qbea1UScdYHgYRr1yDPJxYnnCzxVJALpNW/kPBUNzLo
	 +prsIKHrgpdyQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220110114930.1406665-4-sergio.paracuellos@gmail.com>
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com> <20220110114930.1406665-4-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v8 3/4] clk: ralink: make system controller node a reset provider
From: Stephen Boyd <sboyd@kernel.org>
Cc: john@phrozen.org, linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, neil@brown.name, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-clk@vger.kernel.org
Date: Mon, 24 Jan 2022 17:11:32 -0800
User-Agent: alot/0.10
Message-Id: <20220125011134.62708C340E4@smtp.kernel.org>

Quoting Sergio Paracuellos (2022-01-10 03:49:29)
> MT7621 system controller node is already providing the clocks for the who=
le
> system but must also serve as a reset provider. Hence, add reset controll=
er
> related code to the clock driver itself. To get resets properly ready for
> the rest of the world we need to move platform driver initialization proc=
ess
> to 'arch_initcall'.
>=20
> CC: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied to clk-next
