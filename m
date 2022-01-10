Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F272CA2
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:37:27 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n6szN-0007la-8z; Mon, 10 Jan 2022 12:37:25 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n6szM-000B2v-AF; Mon, 10 Jan 2022 12:37:24 +0100
Message-ID: <c88e81067826f04e2301b52eddb84ec84bbd1c9d.camel@pengutronix.de>
Subject: Re: [PATCH v7 3/4] clk: ralink: make system controller node a reset
 provider
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	linux-clk@vger.kernel.org
Cc: john@phrozen.org, linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org,  neil@brown.name, linux-kernel@vger.kernel.org,
 sboyd@kernel.org
Date: Mon, 10 Jan 2022 12:37:24 +0100
In-Reply-To: <20220110111036.1380288-4-sergio.paracuellos@gmail.com>
References: <20220110111036.1380288-1-sergio.paracuellos@gmail.com>
	 <20220110111036.1380288-4-sergio.paracuellos@gmail.com>
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

On Mon, 2022-01-10 at 12:10 +0100, Sergio Paracuellos wrote:
[...]
> +static int mt7621_rst_xlate(struct reset_controller_dev *rcdev,
> +			    const struct of_phandle_args *reset_spec)
> +{
> +	unsigned long id =3D reset_spec->args[0];
> +
> +	if (id =3D=3D MT7621_RST_SYS)

	if (id =3D=3D MT7621_RST_SYS || id >=3D rcdev->nr_resets)

I forgot to mention that with .of_xlate set, the driver needs to check
whether id < nr_resets on its own.

regards
Philipp
