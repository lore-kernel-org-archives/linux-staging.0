Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FAB173
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 01:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52731C340E4;
	Tue, 25 Jan 2022 01:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643073048;
	bh=j6vKeVPrGr4EHT+l7nDwi2eyKxloly+NhKfQplr/WJQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sYnNzPvzuTG0/3WNgUND47z71/X0Zkb1IqtxjDYy2EVrq4icqKhFtwh/QnmQCbqGs
	 GGf+0TsspHJTkT4U30dpO2GEKsVgfqLTu6AcoN2m9xUMnZb0iGMd80wQRaDIc6xeWq
	 MVY/NPwEm8qTenehTm4pvjG0d/DgM43dNJAJ1oB+hfsatfZg9T2UT8PMlKbt+XICBY
	 D5hkX6WlVkMjV9kN+WhOalZquoX9IZrgMYjz2y3ooTUoewwIXvcfcBdgwUmeYqT4/W
	 DQaRXIBv3DnlVy0K9200j/z06+jR0nzA440jg1Mm5CIb2+rdREJ1+AQSQkxdlSdWBV
	 N/rX82i3eIEEQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220110114930.1406665-3-sergio.paracuellos@gmail.com>
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com> <20220110114930.1406665-3-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v8 2/4] dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
From: Stephen Boyd <sboyd@kernel.org>
Cc: john@phrozen.org, linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, neil@brown.name, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-clk@vger.kernel.org
Date: Mon, 24 Jan 2022 17:10:46 -0800
User-Agent: alot/0.10
Message-Id: <20220125011048.52731C340E4@smtp.kernel.org>

Quoting Sergio Paracuellos (2022-01-10 03:49:28)
> Make system controller a reset provider for all the peripherals in the
> MT7621 SoC adding '#reset-cells' property.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied to clk-next
