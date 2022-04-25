Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290128.outbound.protection.outlook.com [40.107.129.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874BC7A
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 10:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joe3H+4nt3qjxG0vkSsWr27S1AHdTQgqXGdy8NBSq17oaWxxs2jRr2nD+Im5GtXneQWDXh5239CbSJ7djuXYunBhNHSk/N34LwwlkxH7h+9OUIKCMb8XsQBZ5KgH5trM4T2MN30CwdvY9TTg6I45LjA2mpDV50JDqXkqYpSL+zQgfLiACHWa4rZ3aNa+0yKvdAUeBc8x226EvUpEfI4olWpzQJYTgYwuFMXU8SZu7dkJgnVJHdwZQVCa8F18LS5gBv9rBrvpPuncMb4rXe6mcFeSwo8+2pKQ1hGwtYwjmaLbEH/OZ+NlZjxQnbvbemycrKJ2Izbultb/ULpiMaRJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQ9YQytMiLv1F8fL62ACblKB1RF1tIrhE7Dv+eLlhf4=;
 b=YHbZpjNo9bPWT/8ib2HRyFgBX12ZDeY7TbElePJQ+zAYm5e+VaDRhGaak0Y2dCKQgW30NSWGXHbPL2NMxsJo6AsaF+3OBJakLx2vViTcmk1FLTWnxupgh8oXD2ywZ6YS10Ty+mA3wYcyxBRM7fOsS1IKBkt/82wAsAKSfn8qCesi00OFAqji9XuF7Fp8UpPPl3rt8hJ6QZWGjbeDYdJc+8qPkZmXLkE8L9lNrpS6VjC9xE9s5VdXgcwYquoCQ6A7TtEIo0+S87CnSRlMS/4pGCxhmvAXrxtl0m45DmmGOBGlWXO9Y1sMrZRngLIdhy8Ei9oeCdvMnWghBK9A4y2cpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQ9YQytMiLv1F8fL62ACblKB1RF1tIrhE7Dv+eLlhf4=;
 b=ZhmOS11ssLAoS7pm3wVmyEcr1HN2thjRgmshsNZIp/ix7X+PZgufEOGIV0g3aZPxA7O574/7YIk/VqWP80vh+aG9lWa9DJD9ipy8eIg3tspUDfFP6VqZkaAcmTPhE2ADCS4MnXD7EaPI38r+aNUAkU4jDHBQOhIAnjuF9hCxZ2o=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PSXP216MB0120.KORP216.PROD.OUTLOOK.COM (2603:1096:300:9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 25 Apr 2022 10:16:06 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 10:16:06 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "open list:STAGING SUBSYSTEM"
	<linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "kernel@collabora.com"
	<kernel@collabora.com>, "dafna3@gmail.com" <dafna3@gmail.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"kiril.bicevski@collabora.com" <kiril.bicevski@collabora.com>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>, Scott
 Woo <scott.woo@chipsnmedia.com>, "olivier.crete@collabora.com"
	<olivier.crete@collabora.com>, "dan.carpenter@oracle.com"
	<dan.carpenter@oracle.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"daniel@0x0f.com" <daniel@0x0f.com>
Subject: [PATCH v7 5/6] dt-bindings: media: staging: wave5: add yaml
Thread-Topic: [PATCH v7 5/6] dt-bindings: media: staging: wave5: add yaml
Thread-Index: AdhYjF5tw0RFiZOISpKDnw1+D+xgnQ==
Date: Mon, 25 Apr 2022 10:16:06 +0000
Message-ID:
 <SL2P216MB124677DFCCE25C6D02D28151FBF89@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b8bd8a8-ffeb-42ef-fbfe-08da26a49c52
x-ms-traffictypediagnostic: PSXP216MB0120:EE_
x-microsoft-antispam-prvs:
 <PSXP216MB01204F096B10FC909ABAA3DBFBF89@PSXP216MB0120.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9TDGtraVJrJE3R4hRvc6A/RGEyi1yOgW8nsaKzUFCuUixwK28vNSFCg9ftxZDLLQr8XrxAAV8leaEG0/HvdvXSbBBlAC8o/4XD1Ocg+2O7vX7BxWuI54zUOmXKu2x8k3crrDkRu7vC0pFMcD5LE6dFezdIn0WN6XFjKuRZq+FOM22afg4rUjJNo6TlHcf44d51fj1H3xz6EWu2rpowxAGp+XNKSz4f0fWbQ/wDewzA0+b6+oF5NIy7oZeReYuhXIvjBhiKObCFGRsHORPWpcwU4wSvuzKHFiSKV2ZbtMOmvvgwQvfL3aIazsQZw+b4QPnk6wy+Ai46cxnh+pPwfeZ87CV+Z1ioJM7KcUfbGNSvJ9m3yKm7Yh/GG6Zui3fWQ++jiGQ33rMR0q4LFPKobOBrzzGnxUbErxUyYX+bB0Jz4iNssXuzGMl8BW5PdLaK/Usd+swAnv4XllUMzkoWaKLyphvXURcoaH3LLZoE/UBrxlVH8Y9ACcd/wO0PA3mByO5UZHYB8jROrAoh3tgf6bcRo76vTZV2reCgeWi/sYmMrAKYp/P9K6Rmqte7xGDjnz+yJWClPhRajsg3yA82bhp57QeeDxMsGwLW2o0+CvnrzSWB+hWl8gpzT9gM9MifDHH6/eNJD5BUxo50L8izl+sa3diQUZaRGyQp9xaIj/1Uu8iOlfy+4TLzQ8D4PDFFj841umm3f+QSdzoP4pKc3HzRBEEnBi7ervELjzgV0kJmi6JhJv5IdPJv/q3TkpC71cEDiaojTfDni9Z5e4Vv8/zi7V5RX/h1088rJiudWhQOA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(346002)(366004)(136003)(376002)(39850400004)(396003)(186003)(6916009)(54906003)(64756008)(8676002)(83380400001)(66476007)(33656002)(6506007)(9686003)(66556008)(66446008)(4326008)(76116006)(5660300002)(66946007)(316002)(26005)(7416002)(55016003)(8936002)(122000001)(508600001)(966005)(7696005)(71200400001)(86362001)(38070700005)(52536014)(38100700002)(2906002)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fnea7a0bVY3m3CHRT2NNiX4kkuR58Z5f/pjj4au3eJ21epXk7OmRPEmc3yl9?=
 =?us-ascii?Q?pWK0LFtJ3LyWCEa6d3UjcxzChfPeFT076aj6HzPkBb15+KYf6naOVO+kqcmL?=
 =?us-ascii?Q?AP960K8APPPzpRiftkwFMeJunnno1U/RgW+daUxeo0zOKDiI+Hqvr9eSmZD1?=
 =?us-ascii?Q?kTGIGRUBaAGvHK5O54ebQ534x0HHoMHOxqgJWg3gjFv1l4nztotBv5mBxow5?=
 =?us-ascii?Q?9O3BQMtvpzgngGMA4G8/0NGbjxC44vs64myD/49fEbUEwAHB63Xc6JEm6SRb?=
 =?us-ascii?Q?PFoSK3UYPb0KHaI+tS+PzoF7rGtod00dmSGa74nXqY8ZJul1K70BISnW1m9a?=
 =?us-ascii?Q?D/wtGiTnGSZc//vOqEgMSpdHNoRclcLBFuqqWOTgRx3t+T1OXQtirF9/zXfW?=
 =?us-ascii?Q?JAINMDtfCqGBLiKd/hni/KPuRKaDe9V8XXvLy1CtmV09vMyGmaCXc/5f2Srg?=
 =?us-ascii?Q?gJQqyZznCbXMkrXZzwqbpJNlts+dChxALJ0WUg/v4LliTGmJ4JtOUQNhk3W7?=
 =?us-ascii?Q?vl/FT0v8RWAksKvyPRAQ7Cs2oVZ+i7zvvXjxeY9yQ7AClU5Co8Sw5xKEQUgI?=
 =?us-ascii?Q?jx/LOP3A7djWebgTJyOObehyak7aZI2UTJUx9mGezZsb1hZeBf+stq0kUchS?=
 =?us-ascii?Q?hN2cSffKoit5PFNLf6PKzdlVQ8oojMVbg82buyd2gzB9EGfzJfE5vfyY4KsN?=
 =?us-ascii?Q?5/l4wHxkEVFEvlDWY7SLx+8u5KPI83K7Zc8x0ED2RGgBIiJyupjDatX5wWhv?=
 =?us-ascii?Q?4odcr3UFi/LB6HvDn8tMgzG5MnYpU5dcP6HkoHixCa3DN/bZLq4Y/Waa2x/W?=
 =?us-ascii?Q?dX2RCiL40y1Ykgme+vDasDjufh19kK5Wx3tYiJfjcq8OI+gx7zg00aqQc67n?=
 =?us-ascii?Q?iEYxflCgg9rodXRj00FDLSDD+0Omb4OEl3nyXY2Mk68XGVZjm9mZppHBWmrP?=
 =?us-ascii?Q?lxT6hA9Bt3e5Ryj0SED99ecFYj1LrO++tvXu6F/DiozHsxN26dp83avc2553?=
 =?us-ascii?Q?7xr1epV6rfrpMVTX/lC1JXGrIKSnQTosOK3ul+gD1lKtRb8vymJfAhdetea+?=
 =?us-ascii?Q?LFRZkSbfIh+Q2m8j6YvPoecUHyMbs5LYH6m7IUAEXrbEDpQOPT2dXoL0lByL?=
 =?us-ascii?Q?L1M+vrJXdWOFlhU3m5ZYJrPOGgF4Ia7Gpv6oYhoS8W0AoEHaeHVT10npyQ7q?=
 =?us-ascii?Q?WvT5vUH2PrQEea19/yPLB7KoUTV2YpYapGsRAXUgwXegZNZzWHSAUawyfKC6?=
 =?us-ascii?Q?ZVU/VxxDh0/PwyG4oqwI97g/hUl7OWV4nCKuki5Usj8FXY7HvVzKzUHm2SKQ?=
 =?us-ascii?Q?N0izk+vsqPl6320mx2ttCi74pXoZIge1QqoWzsUvM3AyElJb29MVMo+boMwK?=
 =?us-ascii?Q?+hR6VEPDc2vb25iLWl4DAfLWhW02g5WWrdNce/4Y2YU/OK9/n7PYYb+8Hefa?=
 =?us-ascii?Q?CdNTiCM1P0JQvDbQo8MsvK8iTFTGl1uvLowvjeCMFgSCZ5wymeP34rbQQAEO?=
 =?us-ascii?Q?k4EACCyykAd18gKjatwUxrm8I9zdEtwrK42fNouPYipHYUtbHWAUq9eWAteD?=
 =?us-ascii?Q?BVDW7COiwa09PJ42at21Fjni0WxtP8G+9yeMfTHd1StScq203s9DuqJdXY4G?=
 =?us-ascii?Q?sgCKiyUa7GE5heNjHNNf41uhX4E5fuSjGGPPOt+xwTfVkI2ys85J+CuSwJZK?=
 =?us-ascii?Q?1gai94DvCSXMCoTUYwyEyDWmkI50XpTOQVDTrW9WmgAavY4xIS2oWkv0f4Rv?=
 =?us-ascii?Q?fLRGhVJtkExhD00DWExHqA1oIt/reo4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8bd8a8-ffeb-42ef-fbfe-08da26a49c52
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 10:16:06.4897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vA7WzUogb1q79dKDwo9PGKdpwJq8djcGA3WaDGC4CrZ0MmstTrLTJ87zpMwJhped7l6/K1ny+LKpL3rWzmVp9wnzt1pSUc649DRpCRlcOtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0120

From: Robert Beckett <bob.beckett@collabora.com>

Add bindings for the wave5 chips&media codec driver

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../bindings/staging/media/cnm,wave.yaml      | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/media/cnm,wav=
e.yaml

diff --git a/Documentation/devicetree/bindings/staging/media/cnm,wave.yaml =
b/Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
new file mode 100644
index 000000000000..e18978cbba16
--- /dev/null
+++ b/Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/staging/media/cnm,wave.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Wave 5 Series multi-standard codec IP
+
+maintainers:
+  - Nas Chung <nas.chung@chipsnmedia.com>
+  - Robert Beckett <bob.beckett@collabora.com>
+  - Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
+
+description: |-
+  The Chips&Media WAVE codec IP is a multi format video encoder/decoder
+
+properties:
+  compatible:
+    anyOf:
+      - items:
+        - enum:
+            - cnm,cm511-vpu
+            - cnm,cm517-vpu
+            - cnm,cm521-vpu
+            - cnm,cm521c-vpu
+            - cnm,cm521c-dual-vpu
+            - cnm,cm521e1-vpu
+            - cnm,cm537-vpu
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle pointing to the SRAM device node
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    vpu: video-codec@12345678 {
+        compatible =3D "cnm,cm521-vpu";
+        reg =3D <0x12345678 0x1000>;
+        interrupts =3D <42>;
+        clocks =3D <&clks 42>;
+        clock-names =3D "vcodec";
+        sram =3D <&sram>;
+    };
+
--=20
2.30.2

