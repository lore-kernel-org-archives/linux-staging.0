Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF76C2EB
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 10:44:56 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 649C724E236;
	Fri, 25 Aug 2023 18:44:54 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Aug
 2023 18:44:54 +0800
Received: from [192.168.1.218] (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Aug
 2023 18:44:53 +0800
Message-ID: <a0c023e0-e145-f6f7-3a84-ac6045a6c495@starfivetech.com>
Date: Fri, 25 Aug 2023 18:44:53 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v8 3/8] media: staging: media: starfive: camss: Add core
 driver
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, Todor Tomov
	<todor.too@gmail.com>, <bryan.odonoghue@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<changhuang.liang@starfivetech.com>
References: <20230824080109.89613-1-jack.zhu@starfivetech.com>
 <20230824080109.89613-4-jack.zhu@starfivetech.com>
 <74183f7b-6e53-ba3d-2160-1e526d61073b@wanadoo.fr>
From: Jack Zhu <jack.zhu@starfivetech.com>
In-Reply-To: <74183f7b-6e53-ba3d-2160-1e526d61073b@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

Thank you for your comment!

On 2023/8/25 2:31, Christophe JAILLET wrote:
> Le 24/08/2023 =C3=A0 10:01, Jack Zhu a =C3=A9crit=C2=A0:
>> Add core driver for StarFive Camera Subsystem. The code parses
>> the device platform resources and registers related devices.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
>> ---
>=20
> ...
>=20
>> diff --git a/drivers/staging/media/starfive/camss/Kconfig b/drivers/st=
aging/media/starfive/camss/Kconfig
>> new file mode 100644
>> index 000000000000..8d20e2bd2559
>> --- /dev/null
>> +++ b/drivers/staging/media/starfive/camss/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config VIDEO_STARFIVE_CAMSS
>> +=C2=A0=C2=A0=C2=A0 tristate "Starfive Camera Subsystem driver"
>> +=C2=A0=C2=A0=C2=A0 depends on V4L_PLATFORM_DRIVERS
>> +=C2=A0=C2=A0=C2=A0 depends on VIDEO_DEV && OF
>> +=C2=A0=C2=A0=C2=A0 depends on HAS_DMA
>> +=C2=A0=C2=A0=C2=A0 depends on PM
>> +=C2=A0=C2=A0=C2=A0 select MEDIA_CONTROLLER
>> +=C2=A0=C2=A0=C2=A0 select VIDEO_V4L2_SUBDEV_API
>> +=C2=A0=C2=A0=C2=A0 select VIDEOBUF2_DMA_CONTIG
>> +=C2=A0=C2=A0=C2=A0 select V4L2_FWNODE
>> +=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enable this to support for the S=
tarfive Camera subsystem
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found on Starfive JH7110 SoC.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a modu=
le, choose M here: the
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module will be called stf-camss.
>=20
> stf_camss? (s/-/_)
>=20

Refer to the writing method of other media drivers, most of them use hyph=
en. It
may be better to use =E2=80=98starfive-camss'=EF=BC=9F

>> diff --git a/drivers/staging/media/starfive/camss/Makefile b/drivers/s=
taging/media/starfive/camss/Makefile
>> new file mode 100644
>> index 000000000000..f53c5cbe958f
>> --- /dev/null
>> +++ b/drivers/staging/media/starfive/camss/Makefile
>> @@ -0,0 +1,9 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Makefile for StarFive Camera Subsystem driver
>> +#
>> +
>> +starfive-camss-objs +=3D \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stf_camss.o
>> +
>> +obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) +=3D starfive-camss.o
>=20
> I'm not an expert in Makefile files, but this stf_camss.o and starfive-=
camss.o look strange to me.
>=20

Is it better to replace 'stf_camss.o' with 'stf-camss.o', which is consis=
tent
with the driving style of other media drivers?

>> diff --git a/drivers/staging/media/starfive/camss/stf_camss.c b/driver=
s/staging/media/starfive/camss/stf_camss.c
>> new file mode 100644
>> index 000000000000..75ebc3a35218
>> --- /dev/null
>> +++ b/drivers/staging/media/starfive/camss/stf_camss.c
>=20
> ...
>=20
>> +static int stfcamss_of_parse_ports(struct stfcamss *stfcamss)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct device_node *node =3D NULL;
>> +=C2=A0=C2=A0=C2=A0 int ret, num_subdevs =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 for_each_endpoint_of_node(stfcamss->dev->of_node, =
node) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct stfcamss_async_subd=
ev *csd;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!of_device_is_availabl=
e(node))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csd =3D v4l2_async_nf_add_=
fwnode_remote(&stfcamss->notifier,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_fwnode_handle(node),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct stfcamss_async_subdev);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(csd)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D PTR_ERR(csd);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_err(stfcamss->dev, "failed to add async notifier\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4=
l2_async_nf_cleanup(&stfcamss->notifier);
>=20
> having it here, looks strange to me.
> It is already called in the error handling path of the probe.
>=20
> Should there be a "of_node_put(node);" if we return here?
>=20

We do not call a 'get' interface, is it necessary to use the 'put' interf=
ace?

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn ret;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D stfcamss_of_parse_=
endpoint_node(stfcamss, node, csd);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_subdevs++;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return num_subdevs;
>> +}
>=20
> ...
>=20
>> +static int stfcamss_remove(struct platform_device *pdev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct stfcamss *stfcamss =3D platform_get_drvdata=
(pdev);
>> +
>> +=C2=A0=C2=A0=C2=A0 v4l2_device_unregister(&stfcamss->v4l2_dev);
>> +=C2=A0=C2=A0=C2=A0 media_device_cleanup(&stfcamss->media_dev);
>=20
> Is a "v4l2_async_nf_cleanup(&stfcamss->notifier);" missing to match the=
 error handling path of the probe?
>=20
>> +=C2=A0=C2=A0=C2=A0 pm_runtime_disable(&pdev->dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>=20
> ...
