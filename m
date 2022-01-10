Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A382A168
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:54:11 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n6tFZ-00021o-3Y; Mon, 10 Jan 2022 12:54:09 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n6tFY-000CFu-Aw; Mon, 10 Jan 2022 12:54:08 +0100
Message-ID: <6802d5586402452f7333cd7d14e3fa97ec177a0b.camel@pengutronix.de>
Subject: Re: [PATCH v8 3/4] clk: ralink: make system controller node a reset
 provider
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	linux-clk@vger.kernel.org
Cc: john@phrozen.org, linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org,  neil@brown.name, linux-kernel@vger.kernel.org,
 sboyd@kernel.org
Date: Mon, 10 Jan 2022 12:54:08 +0100
In-Reply-To: <20220110114930.1406665-4-sergio.paracuellos@gmail.com>
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
	 <20220110114930.1406665-4-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

On Mon, 2022-01-10 at 12:49 +0100, Sergio Paracuellos wrote:
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

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
