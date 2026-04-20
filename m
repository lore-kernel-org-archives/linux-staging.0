Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C53845C9
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689599; cv=none; b=WKUFwoJaqBTWn3KQSwAzjbUMJD356ZQBOOUxtYMU/CRE9AVYTaImeAOARiQ+by1kOG3sbT3baBamnoNIk0IXFYiaF+/epdZCOSPRqDzLSHt7LDgS+tPH6hfh3TYqtUerCf1jV+MUk7Cxs8+2BG/oELVtIwadvE/GqI87eQCg/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689599; c=relaxed/simple;
	bh=3aIblukag/ZNLd2OaZ8WSCtw1NSjxSWvPCnZvAuBXfU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hNOt6s/VHItDBB7l56vzXh3hcH4rT//v4PxB9yCR3PnCQ5BjD9UMeiU+ItBdLVpo3dX3wXBoeOyIRcjpBfCd/x2RevAqNxkFBt1uHMlI52xjM88rrKUhABsjOV13Y/3965iXEXeeHluftyHn4l/ZgFWcIiT0TXwh7CDUnY4Kh/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K4Mlov9p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K4Mlov9p"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:51df:7e0d:3bc9:3b1b:3f69])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7019E45;
	Mon, 20 Apr 2026 14:51:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776689499;
	bh=3aIblukag/ZNLd2OaZ8WSCtw1NSjxSWvPCnZvAuBXfU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K4Mlov9ppUMNP8rZPLvF8+Lk8FYC7T67oddg8h381mNfchsny+Z+bmTKgUw9pppjo
	 J1oeold4xdOJrZA8nL4Qo+c//XgFFiXVDyRtE+fUXLWZpcxKVM/iF5OkWi4fOBYTWz
	 n51RR8LnrOw/r5AgAfQG/PskGTCzv9gCR8Aromw0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260420-very-cartel-645595ffd1c7@spud>
References: <20260303-drop-starfive-camss-v3-0-8f44c07fb137@ideasonboard.com> <20260303-drop-starfive-camss-v3-2-8f44c07fb137@ideasonboard.com> <20260420-very-cartel-645595ffd1c7@spud>
Subject: Re: [PATCH v3 2/2] media: dt-bindings: Drop starfive,jh7110-camss from staging
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, Changhuang Liang <changhuang.liang@starfivetech.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Date: Mon, 20 Apr 2026 18:23:11 +0530
Message-ID: <177668959135.489396.16825302864805843232@freya>
User-Agent: alot/0.13.dev20+g31692a239

Hi Conor,

Quoting Conor Dooley (2026-04-20 16:46:11)
> On Tue, Mar 03, 2026 at 02:54:07PM +0530, Jai Luthra wrote:
> > The starfive-camss driver is no longer being worked upon for destaging,
> > and will be dropped in a subsequent commit, so drop the DT bindings.
> >=20
> > Link: https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F=
2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
> > Acked-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> In removing the binding, you should have also sent patches for removing
> the users of this:
> arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: /soc/isp@=
19840000: failed to match any schema with compatible: ['starfive,jh7110-cam=
ss']
> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: /soc/isp@19840000:=
 failed to match any schema with compatible: ['starfive,jh7110-camss']
> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: /soc/isp@19840000: fa=
iled to match any schema with compatible: ['starfive,jh7110-camss']
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtb: /soc/=
isp@19840000: failed to match any schema with compatible: ['starfive,jh7110=
-camss']
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dtb: =
/soc/isp@19840000: failed to match any schema with compatible: ['starfive,j=
h7110-camss']
> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dtb: /soc/isp@19840=
000: failed to match any schema with compatible: ['starfive,jh7110-camss']
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: /soc=
/isp@19840000: failed to match any schema with compatible: ['starfive,jh711=
0-camss']
> arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dtb: /soc/isp@19840000: f=
ailed to match any schema with compatible: ['starfive,jh7110-camss']
> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: /soc=
/isp@19840000: failed to match any schema with compatible: ['starfive,jh711=
0-camss']
> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dtb: /soc/isp@19840=
000: failed to match any schema with compatible: ['starfive,jh7110-camss']

My bad, I'll post a patch.

Ideally the usage should have been removed in a separate patch before this
one that drops the bindings. But what would be best now? Have "Fixes: <this
commit>" in the patch dropping the uses, so it can be picked in rc2?

Thanks,
    Jai
