Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD9D231832
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754051672; cv=none; b=VE79kgmhawhjSfeZE+a9xWy248G2bTiB3j32HPYbBLkaoM/Wr92SXp3B1TE2cnqWRHaKD32le/rkhN9bpWHaHN4GVFj/WsHBnXdR/6u5oH+Qo82oxfi2n9IggitsAwDtBKPi49H5y9QU+r+6Oj5Y6Mx4nf7utwp9ms+2sglcCaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754051672; c=relaxed/simple;
	bh=gFI2pTssP7nGhWUGJLnw+yPgpk5f3RrGH63eLLAPMrQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kstJPnFVlKcWLWz8hpqRVBL96cS869sNBqqLu3Kdw+sjdV3DpV3uIFEYYHIiU3rN+CCKBDc5PwCiaAmlDM+RNNkTT3HIG5oUxevNdZHy6bt25rUN0rzaAB3+gSN+6r4VjeO1duYWXmkm6MdniWcY9WCZhmtebsEA3XyzpDE/wUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ntAzYNM/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ntAzYNM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754051668;
	bh=gFI2pTssP7nGhWUGJLnw+yPgpk5f3RrGH63eLLAPMrQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ntAzYNM/xoPxg7tl/ecqiifizscOEUvCqWHrGHx2xpq39nBPiyDD6fPoZXq7PEjtx
	 1rDJE08GD7psMW9/F45FXfSVl3/IaL9r/WD48Hhbx82eWT0xUrLXQJjoNZJTnldaym
	 PFV8i6rPg2GuC6AMkqFlnOjKyyJfrlBwcYK/4CtXOWFyRPLk9MpLc14DwU0SUc8+r2
	 Gy/xjTX8sdd8Cfb8orMGmSyVm5EHQ240PCCZqV8H/lRmvT49XDj2AKFBCvN4LKAXrr
	 IhB9rcrOJFXEbBt5pyjBLuWxdjHQz3Yjs8wI3sz6Sg1eA0UAUczuF0jEt3rBBp/CLi
	 qHRNxYJVfat+g==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8F85cF092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5D0217E0202;
	Fri,  1 Aug 2025 14:34:27 +0200 (CEST)
Message-ID: <ab6fdc6a603bb1d09c4c28b73ac91e67f27bb833.camel@collabora.com>
Subject: Re: [PATCH v6 05/24] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Fri, 01 Aug 2025 14:34:26 +0200
In-Reply-To: <20250716193111.942217-6-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-6-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-07-16 at 22:30 +0300, Cosmin Tanislav wrote:
> MAX9295A is an older variant of the MAX96717 which does not support
> tunnel mode.
>=20
> Document the compatibility.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0.../devicetree/bindings/media/i2c/maxim,max96717.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml
> b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 9afaa8a7a3f52..78ecbab8205a5 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -25,12 +25,17 @@ description:
> =C2=A0
> =C2=A0=C2=A0 The GMSL2 serial link operates at a fixed rate of 3Gbps or 6=
Gbps in the
> =C2=A0=C2=A0 forward direction and 187.5Mbps in the reverse direction.
> +
> =C2=A0=C2=A0 MAX96717F only supports a fixed rate of 3Gbps in the forward=
 direction.
> =C2=A0
> +=C2=A0 MAX9295A only supports pixel mode.
> +
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: maxim,max96717f
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - maxim,max9295a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - maxim,max96717f
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - maxim,max96717

Reviewed-by: Julien Massot <julien.massot@collabora.com>
