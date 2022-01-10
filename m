Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35522CA2
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:54:25 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n6tFn-00022W-GG; Mon, 10 Jan 2022 12:54:23 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n6tFm-000CGx-Ur; Mon, 10 Jan 2022 12:54:22 +0100
Message-ID: <d62d838872d26201b04a1014a925738d29ff3e48.camel@pengutronix.de>
Subject: Re: [PATCH v8 4/4] staging: mt7621-dts: align resets with binding
 documentation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	linux-clk@vger.kernel.org
Cc: john@phrozen.org, linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org,  neil@brown.name, linux-kernel@vger.kernel.org,
 sboyd@kernel.org
Date: Mon, 10 Jan 2022 12:54:22 +0100
In-Reply-To: <20220110114930.1406665-5-sergio.paracuellos@gmail.com>
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
	 <20220110114930.1406665-5-sergio.paracuellos@gmail.com>
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
> Binding documentation for compatible 'mediatek,mt7621-sysc' has been upda=
ted
> to be used as a reset provider. Align reset related bits and system contr=
oller
> node with binding documentation along the dtsi file.
>=20
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
