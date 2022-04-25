Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290128.outbound.protection.outlook.com [40.107.129.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BCB7A
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 10:16:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/Nr/9Lb2L/XcsZ2KBUbcQhQ97MbbJSu7GWGOKbx7IAvrrkq9NtlQRU4cYzDM+a1yJYSl3A0wWgDTQFF5qEeOhoykALdmfaNg+WqFcz0R6iegHvYYIw+RjiAWqHRVQPcOFtPZxe4FpvWTui97sC330++Rkuya9zXIaOPTzL3n1clWwn/mYRG+t5vFVUMAqDmobecp/qBBbyxdvIUKTAqmULywzLyicx44noJcVgLFbm9Kxbt7iWFgfHwN5E71782peXUIdp/Ie7+XJ1KoJFuyR0b8+NVamc41om40r4ruPNrw2PdQGUnQ3GwgIviZSxRPzXnlFCH8VT6EMMMOtObdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3skplt4OXbGh+BDVKcpEbDTO6nWjkm3bv9h5adu6fPw=;
 b=FdyYx/OopLFMYVc3yxkAEK9rh7TiT3WBPtEPgTv90XyM0VFFetKDZ6xdgPMnBpNkSwf28dXp3FDg0j+waJegoyQplLsiE2CeGD1IclxWr3eiIq4TngRRFngtQ/IUWfU/vq+0EN6qRlPA4Ex5QuIiKhct+rNCV7glDVWyqBRfx3Aijwlr9w3688Rg31MQduoiBEsovwOFc1PXZe/QgT5SlGU5H22fqzmSdHFyj6havk/rJDLGkRkTeCDT0rtk2Ls6DkxfBlODZlTfBae0IrKdb6DkUqL6ZhDE8SBJO5xeN9OCHUb4mHs8ILaSjYfbASWT885OixadagvwbJyyS9q8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3skplt4OXbGh+BDVKcpEbDTO6nWjkm3bv9h5adu6fPw=;
 b=ieRUAdHOfzfLPl52PtZCpa35MoVCrCWGNpnOSOHNhoKd2cI8UB5SP9Q0mafcd2TM8rDpOdULLsaMKdKpHSA3jFKDe3gzKxPWB+8KvDhg/i0JiYWw69k4m/aTYW4wziXnMx2mhl7CN2HCMxSEpjfRH3wMtrscM2IDfjtBR5nV/jk=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PSXP216MB0120.KORP216.PROD.OUTLOOK.COM (2603:1096:300:9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 25 Apr 2022 10:16:07 +0000
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
Subject: [PATCH v7 6/6] media: wave5: Add wave5 driver to maintainers file
Thread-Topic: [PATCH v7 6/6] media: wave5: Add wave5 driver to maintainers
 file
Thread-Index: AdhYjHwJqTTCan+YTNCm54MWxT/BJQ==
Date: Mon, 25 Apr 2022 10:16:06 +0000
Message-ID:
 <SL2P216MB1246A56B38DD0A78D58062ECFBF89@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69e14c1f-8496-46e8-31bd-08da26a49c8c
x-ms-traffictypediagnostic: PSXP216MB0120:EE_
x-microsoft-antispam-prvs:
 <PSXP216MB01205A91052429383AEC218CFBF89@PSXP216MB0120.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ABRDNpUPIG57z9DlLYv05jvmVp+GCSALvD6QngFFomqupsp+dzUKu2eY04uG9vtgpF5S1R7rTM0DbGOMMoFkAGUcfdkUYkPkZCGe75yCmep7+g1bGRec+Gx8aaAfVroHZ/Fix+NaeaWZOmcfQX+4/q0pXZJ6ojvIjCQG8xGcoH9GC6PfW/bXXYLtKi0GAHsYluyL8VFBRuh2gYk4NNoPiAz68S5ZKh2bP5j1zQaBSwDdvi7OZJaUvzXKpmgGLr/fxV/1pt+NbRiIpfCJSEAzx3vKELII5pM4d8LnX6Q/+bZFrPHWZ2vk0lCT8gJ/39WjwMyUjWVSKUUZ8i1mgIUbRcDzdmyeyE8H48ba/GMV9Vlr/dObbatqOVAKxmDQxPJzjVYE9J6dahx7McGBKSF9AZGwI48wQ9fBXmtPmwE7B6/16N74Wrm6PvXQhkQI0U3l8uPAlRLy01Ogy+LCeySMUve/pYAezhkDb08khwtOdHp+5MzfDZSbbIFfSnDHrYYICvBWPmbRX2NA0dkgK+8EeYQFDoYGEvyMzpZYVNLX6f3YwklgN6jrX4QdJID8eG+DlL2qtoX41Btxjdxc0dQCaOF288d9ccFImwxLaSg2OcEKdGFdw0nfsDTEwfFBpZXTFip+HY4JKE5OqA3GMka8tAGg0X+zx19LilNuW6IPgek8fAduATXK4geRxyKDe+T08S1DwOlA/LtGSI+dI/b3AA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(346002)(366004)(136003)(376002)(39850400004)(396003)(186003)(6916009)(54906003)(64756008)(8676002)(66476007)(33656002)(6506007)(9686003)(66556008)(66446008)(4326008)(76116006)(5660300002)(66946007)(316002)(26005)(7416002)(55016003)(8936002)(122000001)(508600001)(7696005)(71200400001)(86362001)(38070700005)(4744005)(52536014)(38100700002)(2906002)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?62BsDFXh+zY9t50MZ95avhPT5vtLb0fJICkQjdy38GnOBo9957VVOeAQdL3e?=
 =?us-ascii?Q?yIGv8/JOw2gp0z1kEKwjl5LvorSZG4Cf0SL621x041SK9fDhgwzJ8abQic5S?=
 =?us-ascii?Q?co6M0zz/jUpkjlH+cgre1SHbrQuu0UwRXa6FqnDGYkduBb4dVcduT329KmM5?=
 =?us-ascii?Q?+nzMxor1WF61Aak2Gyp5923GXYfVLiLO86ccCHyfl3OT7bcRe+y4RAXYNpui?=
 =?us-ascii?Q?aqOCJQbp/arpB6iLRk6WhIH+/goZjR8YM3dt27niqvXsmZObhA+uigNI4cWI?=
 =?us-ascii?Q?vcwgstHWFeJb533hOgPuUwm85Y3cJZ5nt3ow3sWbIfvOew0N6NPywGfTfuKx?=
 =?us-ascii?Q?XgI2W8AV0D+A74m3YqiX66rfF1BaLVWAzPO/wTe+LYQlBJ995SVybWYXgW6g?=
 =?us-ascii?Q?z12UKUKRUsEus4zdAtPGs90zjMsTasp8J5YpiQrSlNEDU7+QThbVN9alcXQ5?=
 =?us-ascii?Q?mEXIfn3tkx8y3PEA3GeNzvLeJRr/nqGDqYFVwXIK+7+0FHipeIN6c7cZ9N5K?=
 =?us-ascii?Q?Rohfa1VRzStYqI0EeP1U4fFXCPP+abx+cgdL04bxwKig8qYkLyU0/+deyDXe?=
 =?us-ascii?Q?9YiUL0kOhqjPdYkL9bvFtViP2a0cgl0Zrh5O0pGt8fRLLg4r7lel9JApAiOy?=
 =?us-ascii?Q?trJlCohD2fTU598hB73H66zsKf+UrraJT70SXlCeyP7/RuYKpJCLWmag7fWB?=
 =?us-ascii?Q?6WkeiR064b/dcEydCTvRytTkYMBXRBYJMmbWfetRHuTMskwegtlaBByCf+2b?=
 =?us-ascii?Q?Az83lAg8ufeh7NfvCE3TAMwR7K/NYclwjHR7RsBfKgTruTN9W9lTmFWlHzRK?=
 =?us-ascii?Q?YfgPHfXHXljweboUuVhZHV0xLxDyPmlbNRIvO5WExCyg15NV+upSaWK4Bhgm?=
 =?us-ascii?Q?DMQNH6vOsTKg7deUY+hD1Zdojg7OhNMDbCROYoQmwfKKifI0cAMXoJYPf90E?=
 =?us-ascii?Q?w39ULUvfRknl3XOs1U+Xd7Hlynw2FH/15pSHMDxujTr57kf8B2uXZkxtYmTZ?=
 =?us-ascii?Q?Lgy3pggn4I2/7YiWuHqy/0n8Ev/fmNpTbvoVUO7JEChUPKoZYNGbdxjup4KO?=
 =?us-ascii?Q?9zLS1kHtFPNjc/pvtclabTZ61svdPxCcUQWkrX07RPtQE9613CF1xnCLMZa/?=
 =?us-ascii?Q?5J+e06XLXRZExdepPtC+7ZAg3GnDurnVjJAYZH55V+HPiJ0D9tF1eOFBTmo8?=
 =?us-ascii?Q?lc65JQffx4x3Ma0CZrHS6bmcUtjpgQQWJVQXEJ7+jkgRGgT3mhif+ybX3Fez?=
 =?us-ascii?Q?/IHFsDkL7b/CuFBRn0qIsQdWp5FHOspbpwQcLQslkqBpaHxtB3Dr8g72wSQD?=
 =?us-ascii?Q?NKEm/ggM8w3xCLDPGp9rbraQyWOO/ZwSpmoSTZKN8kDHHMXJdKL2o5CdEIIG?=
 =?us-ascii?Q?khToikwTqI+GtViySUuyKsfAKiYHq7dkZFujiYizGsToun1m8p5AXH4uBS5l?=
 =?us-ascii?Q?N13XRZpVc4hDh0kvDya+eAx9kV70q7U9Z+giFJ7n4Qb3cRumVeXVRPpm5ZdC?=
 =?us-ascii?Q?04KwzbibWZrtSSkhBhyC3QsUh9HlVK0ARb4rX6ka0dd//+GnW/nOU0lSyWLG?=
 =?us-ascii?Q?92uGAMjpKwtYmy5ITzQ18C/btMSXvzS0MVIgialMeC0BvCDKd8LbYpvx9TLa?=
 =?us-ascii?Q?LN7z5n6hqth+pPU3wcOeHC7PGu7f8Wgx8DfRWGz9I5bqF8iBOoMcTrMY2tNm?=
 =?us-ascii?Q?jTKZNx3Hs6920700M0uMoQkH4Xvha/OP98nYL3IBzQSxNc8HJ/GyCMMbJ/TT?=
 =?us-ascii?Q?zWrXnlJcpXgcynhK/hl0yhvLgZMECt4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e14c1f-8496-46e8-31bd-08da26a49c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 10:16:06.8647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKbKvij5nn7U4f9LysZNP6S4+OrgT/ZZTO86ww24ZlkbC4IW2jJLkRVEtjisFyJMmMvJI3pNvpTuz3Sr5u3RKinNXWkHsG1N2VesCTUBIYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0120

From: Robert Beckett <bob.beckett@collabora.com>

Add the Chips&Media wave5 encoder/decoder driver to the maintainers file

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e8c2f611766..129034ed7e7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21210,6 +21210,15 @@ F:	drivers/watchdog/
 F:	include/linux/watchdog.h
 F:	include/uapi/linux/watchdog.h
=20
+WAVE5 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Robert Beckett <bob.beckett@collabora.com>
+M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
+F:	drivers/staging/media/wave5/
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
--=20
2.30.2

