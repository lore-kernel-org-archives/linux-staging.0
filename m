Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290100.outbound.protection.outlook.com [40.107.129.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937837F6
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 09:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrkXxtQtp0FJoGtyH0oseOwESPXMVLZ/6RgfN2zUJWGSS/WVy/x3WdhJADf/dal5ciH2jRCMd+QjVahCN7BWxmD2hFz8Kr3EiFNScrX8KZamRsifLQ0/cR6GJsxDHCvmsRPLfZ6GU5V05uNMdLMIgWCob0foohxZZxKKzjezqxRivMkmssiTtvcXTE9nWWVeIS2qIaC9kZN7G2qPY32t1c/NgcnUTBaDrFaJ9JLBSrCnzW7QsyDlCm6bf9W/GuEU1yP5tpUCX+vLl+aVE9+N7moshly23oeRENTiK/OzMoGcHFQ60PEyCls3ddjGSaEoPGuF+iojxD4+c8CuE9zk4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSE6b44LA/actIRZfLnmHupukRMj4ELL+OCHIIyM1Zo=;
 b=Tf19EUeOESSwTYyh8uvFgAwBdnAzMJT4BeDWA4jn6YOmWiJDoyu4uXRN1bORXS2L5L+PSi2uRpBc3iZOn7o/CjVkS/3Tkp4ryuICfIE1yleRyLJDw0bl4RjOcn43UMsTUlHKuMJttyGldM5a+16E9UP5avaSH56HcKfaCQmbnvM8m6493mWlxrCuNPO0ZE/X22Wv6zQkQ314Jrl7cFqXrZwY+B+GuF5nuF5S2HmaS8K/tIz1g/SL2NoF/9yMUZgw679iQ1hIAq96vd0aJl7PLstcCe9RoUTZxOwG9EXinUBO3b2osXeTGhKxZnCy1+pTQcdMByBYFdN7aVe3Sb1a9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSE6b44LA/actIRZfLnmHupukRMj4ELL+OCHIIyM1Zo=;
 b=XkCuq8hQgX38ZHWRHSk6iF5GjSS8+XR8zA3DEGvl7jHPpkSr11HBS+wsdgWdFDPl0NCSq72gfliHHfa386ZgYjRWTQy9dOydGVBkt92d2MBKplg33bXyvFxisUg1WK6naU8od1Kf0QEBMKehwEoZ1MZLOAMm+jSCQiceAKTWHRo=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB0897.KORP216.PROD.OUTLOOK.COM (2603:1096:300:20::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19; Thu, 31 Mar 2022 09:55:12 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3%7]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 09:55:12 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open
 list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list
	<linux-kernel@vger.kernel.org>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "kernel@collabora.com" <kernel@collabora.com>,
	"dafna3@gmail.com" <dafna3@gmail.com>, "bob.beckett@collabora.com"
	<bob.beckett@collabora.com>, "kiril.bicevski@collabora.com"
	<kiril.bicevski@collabora.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	lafley.kim <lafley.kim@chipsnmedia.com>, Scott Woo
	<scott.woo@chipsnmedia.com>, "olivier.crete@collabora.com"
	<olivier.crete@collabora.com>, "dan.carpenter@oracle.com"
	<dan.carpenter@oracle.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"daniel@0x0f.com" <daniel@0x0f.com>
Subject: [PATCH v6 5/6] dt-bindings: media: staging: wave5: add yaml
Thread-Topic: [PATCH v6 5/6] dt-bindings: media: staging: wave5: add yaml
Thread-Index: AdhE2q7tgZMfh0OUSvmg9kMT+Dv1cAACYYiA
Date: Thu, 31 Mar 2022 09:55:12 +0000
Message-ID:
 <SL2P216MB1246756A8C9CFA1FF9979BAAFBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References:
 <SL2P216MB124653FD0B4DDAC1504C15AFFBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SL2P216MB124653FD0B4DDAC1504C15AFFBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1656418e-272d-41e3-6277-08da12fc8c45
x-ms-traffictypediagnostic: PS2P216MB0897:EE_
x-microsoft-antispam-prvs:
 <PS2P216MB089796AE809A030642A0A4DFFBE19@PS2P216MB0897.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7UI2kOb9gwfwcdlNZzJNnIGtUZRCvfZSc6o6bPe7XoSESeA8mzvBHmL0cExZz9xaXg/aGk2myr38MTCAsq8JswaUykmWsVeU7GgaUpab6EG2JC/UQJ2v0rqGRf502m/f6g+gQlDtbd3UgV56a6bRctbg93umAFgDVNaUwk+zctLG3iVRmqis0MgPeJszqNlVzhpv3j2YWVNInZYx1bxUS7egO3HQ/m1hzjpgAmtw3z3KQM5+SCx1TUmOe9wEnIx/+s3NJawMhR/DpMer0itQMTbWP+3dIWjcV9XNxb/d2EomQ1ap/os9w/91OlwVKCmpYLqQd+W8sugcV7n9HN/UPbOS5HkakVPp3k60COH9f+NcGdxmKmfNFeDsHbwH2pNBwcIaeN2JdXkoyJaID/gAitC2WmHwQIud9kJSyDEoEgVADHhtxktuFPTLPnS8N0gCwTbsj/yUUwzCvBiPD6ZrmGalHxtWST2BA4QLipn9y9mylPUYg/qjIgDup/71NrUDXndPxgQ8O3NsQkWxbEvgr4h/eBucAIWj0s6TXipPTwPtM0XjxytRbvzP3vhtScOO6BoBeG+7420b/cJ/m1BEMrzZUCpue1p/ntaosYOHIiY11djGkFKfY3TKf46qmDb/cKwwW2Uo+78PxwawarWAP1y4bGarzlF/5VFFLIK5E0C66u2uLmBvifHj7RkEd4TfciZG8WVwZnzbZ5A2t6itQ3BoGcSu5YCfQ1c4rtsk7gDsyaowFq7JO2YWV77pZhFTFMbf5ImGX7x2EO2czvlzgzFhu+1ml+uf9aKGqR5qJ9A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(396003)(136003)(346002)(39840400004)(376002)(2906002)(508600001)(76116006)(966005)(86362001)(38100700002)(55016003)(71200400001)(33656002)(66476007)(7696005)(83380400001)(6506007)(5660300002)(316002)(8676002)(122000001)(66446008)(54906003)(66556008)(2940100002)(8936002)(64756008)(7416002)(38070700005)(186003)(66946007)(44832011)(52536014)(9686003)(6916009)(26005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?70ykRBhzc6StlCsUJmYrNQO7GQal1Heu0IZDEKSwOO8jkW2Xd3DWmPXB4AjC?=
 =?us-ascii?Q?JovJZxeMAHZ0zYGuiNLqtXDTk+FnaCsboMzWFqtvCF3XeztQ5wCC55ldV7u+?=
 =?us-ascii?Q?vqSIikO1WNcYE5M2kR6fzdMALCiM3vFPO/O+9uOI9q75F7wTEGBL/XYyML89?=
 =?us-ascii?Q?wANC8X/jMlHv2r4417FTKHrzkyvDfkmiXfIMVw6Cm0PQkqkhXg8jYgt7HhNa?=
 =?us-ascii?Q?dbHa0XuQqHaJHT+eA4eTymmAAHJC+FrKyDXJNDufh6hU9bRMf2+Qn7/g+nQ1?=
 =?us-ascii?Q?TQiReCP9slHE62J6CXWXPcyg/xapTqhfTvdsn45HWCRjyu7KhZG1VZosvE+x?=
 =?us-ascii?Q?7HG5//CsGuApxp7EtaffFDOT8cxIXWAerM6JVslWgj3dn4EYYjGaKjX0RZHv?=
 =?us-ascii?Q?eTy1sW6kYD7zBkGRwdIVYdvP2z26vlASEhk+4mW/3O6BlpaW/7FfPLdS/wwC?=
 =?us-ascii?Q?wrWjHHmBrqcmArRzVad8WSkavBum7sRmqaJdTq/wdQ8uwCilK8Kfh5bMJ3Ro?=
 =?us-ascii?Q?WprVWtDckQuGCxN31rElSikpXzJcqdMJalzlsyGuLQaaCMw6+P+3xKpZsSLX?=
 =?us-ascii?Q?DgXrBIh8Su/H5qT5XRrb/hpk4KwwOkosVr/kcjSFC1fez7I7dZVoXzgMBkEk?=
 =?us-ascii?Q?CNyIrThkqs4vRA//91WECfjYY7b98360xxFA48yvAqjFa1UNhGSFPcSMMrcL?=
 =?us-ascii?Q?MkBNokkSRPBuawax+qdlC+fRfmSt1Td3exhD1LITdvQ3IFIDQgKtqib55Cf3?=
 =?us-ascii?Q?eL8KIHbOmba4jpxQcCHWKaC5iE++TdCiulMAGl6ecfhkfIIvtFvupV4aVCJA?=
 =?us-ascii?Q?UiriPbJlIWhiSD3n8JbHnVzEWEwv23yp4gyyYONfQy0Txk7EJ/jxNyJmvL1z?=
 =?us-ascii?Q?HEgyjboKDFnapyc8njJIxZx274LPYBrbXRf3pUmEqmT49OoLeJ0DEW1Y3nLs?=
 =?us-ascii?Q?7lnRsvMwEA0wf2GkiKZY3gX+HK1kSWsquHVBPPp15SZWfEKnoiuxTWSbNoM9?=
 =?us-ascii?Q?vU/rH48igrRC9n/B1TYlQGEQawMobqukAx9X/lc1XsdjoMTNPdUHOoLjtP7n?=
 =?us-ascii?Q?/My6EjuozvWwxUXMIA9/hIXfkQWuUaZDrRNvycyjWa7bdjC+8KLt3C1+gbAB?=
 =?us-ascii?Q?h6Ni4wDvkC0PEIRfgPRHk3IHlESgzayfsmIpzd9qHxM8pnkPzOYfxtggQo3x?=
 =?us-ascii?Q?PFXDmIziRGgX9I6tuWcHQJOdNzGD0uAZFGHOsX6laQr8QFOB07PQZaL2jpmA?=
 =?us-ascii?Q?DE3drK2k9syC9+hslxQs4uUKBgH3aHkMgRjeWNMwcE1c1nuYZwiel1p2nt/Q?=
 =?us-ascii?Q?EqycvDf2sjX9azDszMN1AugAMkUfufnxfQzVc/E5EYqT6wckh93AHzK7t50v?=
 =?us-ascii?Q?YKmQop124WcoSOwaSSahn2ek9ur0YXp+286cNfjUBwhPUQLBCDUPFKlzB0a5?=
 =?us-ascii?Q?Et8kRWUUUYyKzzxY7wQk3RX/WWQGY7UEBIA0FBtvE9nBQtDKroZv7ExW0TEb?=
 =?us-ascii?Q?Yd+0XFuspwOX1qtBmWbdjQZ1AF0YYvKUFxJd8eYd+B0a6ltlM+X4Ic6xHT1T?=
 =?us-ascii?Q?CcKKI2KTxgfAVkcxZ/gDUN4OuraUb9LIlpJXYjx6CGQ3a5ZSbskSjESUmlaH?=
 =?us-ascii?Q?xEvh0WKT6MVOZxc4SomfuuSCdK4E4RfBuWfr2++B1En+l3c9wDIhZRzvF/46?=
 =?us-ascii?Q?7uxJnCcolQOjtz02Aoa21FkWnTVP4jj7LLe2FETlNpG4K6VQAJv50D6RLvPP?=
 =?us-ascii?Q?XHwekjCGw2V3vlcEHfvb2ErOa9agEQk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1656418e-272d-41e3-6277-08da12fc8c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 09:55:12.0450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m5R8/wzM8LwAzUO2HJeEeSS+gKpTMbKsKsH1wY9rsKamO/S9QnzlK8BWz2KarxEATIHSajJ8usU/qxIoHzpX4DoCfO+boM8eCA9ZcC6Rhv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0897

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
--
2.30.2

[C&M]
IMPORTANT NOTICE

The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or their agent, or if this message has been a=
ddressed to you in some unexpected situation, please immediately notify the=
 sender by replying email and then delete this message and any attachments.=
 If you are not the intended recipient, you are hereby notified that any us=
e, distribution, copying, or storage of this message or its attachments is =
strictly prohibited.
