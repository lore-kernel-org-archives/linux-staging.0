Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2066.outbound.protection.outlook.com [40.107.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473BA2C82
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 14:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaUSYhZxC6DgASqlUa9MJXi3yjTV4maymLs+ICuV47V5+dY9RNRhBqW1T7y6eFKK4KztAkMmyI8OpLfl/aRozZ6ffGb8mU/yNCCSnWWHS1PAbBqaLT3RzvagC9ixhat3njijrH2dSRDk35IQ1anY7bOdO2YNMriFwqtqeT9qtb0kbtExn9+LL4RM+IHQr5/lCfn5JzgCDIj0B7d+Nrkrf7i9PZCjwd+iApTW1wTjqa5gvmLcAbtG0Y9ZFwc23AF8Gmw1yL1pVJes2zBS8aAyVMiWLz9XN4UaXasvdR27ZUcKKP2RGS3QEg9r1HtXLJiinfT8Uqh+eiVfV1M+lgTI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RGUmp3x/olqmxtHO9vuW7ie3dX9WEse1ffa/e1zfGQ=;
 b=Lw+pbshyyUnHyESf2VqZ5286C+CqU9hIanAxJTT0aLU4GVeDX+W2JgGO8myMA92c38irlcxY/KcubdlYvOOaxqpPzTpOCHiP8f5I/zBUkLVfhYl40mV2dQi/dwYr9BRarIHo8pTMeZapuKE7roAPtFnyvcAQ4/n1RzJDHmQsPGJCDg7IAvOzZknO12/0ee2VjAfp3Q2jWkdt+qJKl5AKhggKMgkI8BZiPf5Tuh6Mg/9w+smCsAVZawGRQrXaCWdijacgxXDxZTGm9OzlFa3kC4pQXnxcShAowCEajjdfhsM3qFc/KmBXDI0GL9BwiKD9m/AggWFmjCtFKiqVomFNIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RGUmp3x/olqmxtHO9vuW7ie3dX9WEse1ffa/e1zfGQ=;
 b=Wb0zDN5sg3OYg/s+2B8LanVTf7URcRjV526/XiING05SnEBLjoV73PUmczygbhezzNiqNDS4oPSNJBs+EVQHznzPYrhM4SmEV8cP4UJnp7gQCVWNlhILGVGaawMnBOMzJiV6GwDV37DFKHM2Jpp1Ietm5GjZKHCln/tW+xX1FOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 by BYAPR11MB3253.namprd11.prod.outlook.com (2603:10b6:a03:77::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 14:17:08 +0000
Received: from PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::2025:8f0a:6ccc:2bfb]) by PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::2025:8f0a:6ccc:2bfb%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 14:17:08 +0000
From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
To: Mark Brown <broonie@kernel.org>, Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Marek =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Markuss Broks <markuss.broks@gmail.com>, Emma Anholt <emma@anholt.net>, David Lechner <david@lechnology.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Dan Robertson <dan@dlrobertson.com>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Marcus Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>, Rui Miguel 
 Silva <rmfrfs@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>, Antti Palosaari <crope@iki.fi>, Lee Jones <lee.jones@linaro.org>, Support Opensource <support.opensource@diasemi.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eric Piel <eric.piel@tremplin-utc.net>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 M
 anivannan Sadhasivam <mani@kernel.org>, Thomas Kopp <thomas.kopp@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, =?utf-8?B?xYF1a2Fzeg==?= Stelmach <l.stelmach@samsung.com>, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Harry Morris <h.morris@cascoda.com>, Varka Bhadram <varkabhadram@gmail.com>, Xue Liu <liuxuenetmail@gmail.com>, Alan Ott <alan@signal11.us>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Solomon Peachy <pizza@shaftnet.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Mark Greer <mgreer@animalcreek.com>, Benson Leung <bleung@chromium.org>,
 
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Lucas Tanure <tanureal@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Daniel Mack <daniel@zonque.org>, Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Stephan Gerhold <stephan@gerhold.net>, Alexandru Ardelean <ardeleanalex@gmail.com>, Mike Looijmans <mike.looijmans@topic.nl>, Gwendal Grignou <gwendal@chromium.org>, Cai Huoqing <caihuoqing@baidu.com>, Minghao
 
 Chi <chi.minghao@zte.com.cn>, Antoniu Miclaus <antoniu.miclaus@analog.com>, Julia Lawall <Julia.Lawall@inria.fr>, Ronald =?ISO-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>, Marco Felsch <m.felsch@pengutronix.de>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Jon Hunter <jonathanh@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Heiko Schocher <hs@denx.de>, Fabio Estevam <festevam@gmail.com>, Colin Ian King <colin.king@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Matt Kline <matt@bitbashing.io>, Torin Cooper-Bennun <torin@maxiluxsystems.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Stefan =?ISO-8859-1?Q?M=E4tje?= <stefan.maetje@esd.eu>, Frieder Schrempf <frieder.schrempf@kontron.de>, Wei Yongjun <weiyongjun1@huawei.com>, Randy Dunlap <rdunlap@infradead.org>, Nanyong Sun <sunnanyong@huawei.com>, Yang Shen <shenyang39@huawei.com>, dingsenjie <dingsenjie@yul
 o
 ng.com>, Aditya Srivastava <yashsri421@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, Peter Zijlstra <peterz@infradead.org>, Michael Walle <michael@walle.cc>, Yang Li <yang.lee@linux.alibaba.com>, Geert Uytterhoeven <geert+renesas@glider.be>, wengjianfeng <wengjianfeng@yulong.com>, Sidong Yang <realwakka@gmail.com>, Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>, Zhang Qilong <zhangqilong3@huawei.com>, Will Deacon <will@kernel.org>, Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>, Davidlohr Bueso <dbueso@suse.de>, Claudius Heine <ch@denx.de>, Jiri Prchal <jiri.prchal@aksignal.cz>, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, patches@opensource.cirrus.com, alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormr
 e
 ply.com, linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, linux-wireless@vger.kernel.org, libertas-dev@lists.infradead.org, platform-driver-x86@vger.kernel.org, linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 5/5] spi: make remove callback a void function
Date: Tue, 25 Jan 2022 15:16:33 +0100
Message-ID: <6493233.N8xH3GE6Eg@pc-42>
Organization: Silicon Labs
In-Reply-To: <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de> <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-ClientProxiedBy: PR0P264CA0242.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::14)
 To PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 045d4f05-1ac2-4123-fdc9-08d9e00d5e83
X-MS-TrafficTypeDiagnostic: BYAPR11MB3253:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR11MB3253C40B00CAA8BAB73A325B935F9@BYAPR11MB3253.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iK5JbPS6dvmOX1hodRx/9BLgimvGOE75BQLIs3BxDQ5viuovDiYHjumFWIxvj24EqLFLf+q/ksCDxGcaPIOVoqgychXQ+SjT+B5v1sxUquOGhNG0toHdcHKzqLiGlUbvWD6UQ2Co1v9aXdDvDxjRa5igUKUIX6mCDkYkUGB3FCV3Ubt07GM3agZaGvJkpos5lEb7aEV/eHE/tnWpUaJe/wIK3WeRhyuaEGHx7DF4Abf5Vpj8aJQcoG7QgbmnMgP79GrIruKQsFE4NCuvZi6zhUWOd4zDIkWhSuhMtBB8pA3r+iIUnKM6NHN75X025Ap7qZizpSueRnXtaroB6e4EhwH+ODfpT/C09r+NgBgQz9B02r1TXbetSx7+GNka6qxKU1xuFudVEkkczXJKq5RGJfMYK2oVrmzU2eT29Ihu4tl+Nd66L6HVLxXNAgt2qRfx2AAnbSQhazOY/KkzO5+MjQYYBT/3yRRajsEuFxsoPOTlDE3CTw3lyC/nKiwWvZ8/54RqjkRGzimNYzhCWDgnbsbZfYXTFRFo7KMoeDhnRF2tJv8CzWQrdmAtwkuVioN3Mv8LfXwLIVL+0onS2gUEg1DXqwRwbRMcbJOt4wokhVLSDVGYpiZ9x6+VPgpr5I5EkHlsvomGMZSPie7b513f5isSbqW30bhdDUIQqIkf4MT4e0E8ceNUHx3FzUv+hstgTMdm6MmjgknKAbixT8aR3pNnDEnIfrwu6R6BqzZjoL8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(6666004)(26005)(508600001)(9686003)(6512007)(8676002)(2906002)(186003)(8936002)(6486002)(4326008)(6506007)(38350700002)(66556008)(83380400001)(110136005)(54906003)(33716001)(7276002)(7336002)(7366002)(7416002)(86362001)(316002)(66476007)(7406005)(36916002)(66946007)(52116002)(38100700002)(5660300002)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?e50s0VndkRuVVavxDV7CAMEPRo+VNSLjUuKH7V0aSv6pAfM81RUrpIRJSx?=
 =?iso-8859-1?Q?6HpaUD2GJT3KVOtb6xvsUR0P+SH60FpttTXWFk3ff8P7DoakOAedmHQaXb?=
 =?iso-8859-1?Q?1l/bgzKkQlom9TJvK4tIPyncJPqL48hrUaM2uSJQgdz0PlD2fJm9OAhx4U?=
 =?iso-8859-1?Q?oA3SD7BstATXpKUnQzvqGeMpwBvHnXoIYyC/RqWYWHk5bICjcGwWFyqmwf?=
 =?iso-8859-1?Q?/snZsInUmicKZweiYTlg8Q5Xx/7KOkMrG0kpOeyT0pro7wvu3Vnu80vijU?=
 =?iso-8859-1?Q?B6u+7UUNZkyoXJcC1o39T1Gq5J152OScsCHrzIAPl9/LyRZqAbiJjEi9Vh?=
 =?iso-8859-1?Q?agaua9aaYmZymk/posg/WsLxaWvtlb8Bcmq68IdX8WC1EyESmBCxRC2iFU?=
 =?iso-8859-1?Q?9akols8qT82pYoAOwDuUWL9VLzPnuUe7UDmVwjqOSET8iNNzjbx8H1/Lau?=
 =?iso-8859-1?Q?isv/O08z6Fljmb8L8SnwNicM/UDCueoICnnu1K+uG5Zl239Xtoyg0+JPpL?=
 =?iso-8859-1?Q?jTmgUh4UK15kahChQF8kqDeugR8Uo16ypn5j/Y9Izz0TJHfedNCewAYGvg?=
 =?iso-8859-1?Q?8s/gBm5Hr2cskTHGsIc0YyoaY4HdgDMQA33v4TBKJE+BcdWbObgkr4DwP+?=
 =?iso-8859-1?Q?l0Sq2awV4ptUAs5Lciy0lBZUyHxZtl8hSB95/gxs3kfzoV9VNrb+abkg2h?=
 =?iso-8859-1?Q?pPorLknuUutJVO1H0nK8GlhS6KcW45IqMzs75z+/sJWhfp2yCi4rqlD4NK?=
 =?iso-8859-1?Q?dbuZpk6L+g34UbuT8+LU/e7pmk4gZucIpO6fnYIgZe/nmFHkkyq2qw1Ey2?=
 =?iso-8859-1?Q?EYjMUmakbjXkDtTqiws2NBaEkMTlpkUej9Mp2+NFp19L+QYpxWS70bAfAD?=
 =?iso-8859-1?Q?+CHPV9drbX6EiBFMuuUnDjPrakdOQxz5MgfadPkFCRmc6srPycx8UfFQYU?=
 =?iso-8859-1?Q?weZFhFfyrUdMkvT9VDGRUX3zXS3UwJuWlf8GIvvEm1lwg2x2NBCI7/AdtA?=
 =?iso-8859-1?Q?vE8L8xTlMubqhOaGOetHpdofYugOO1ySCI9C27qrTLEza96ZcEPUmzVbeP?=
 =?iso-8859-1?Q?qWOV0iCAXnEa5qh2Nf1Kv1OnvZEE9ZR1I+neyHZtqVozfUIo+D03Xo+Vqm?=
 =?iso-8859-1?Q?KPlc4D2MvbLF15EWtOXRPYUYwkT5+2TaVMkyGPZV3nnILvAQrxcM/FyJg6?=
 =?iso-8859-1?Q?v6CoVwE7sI9nyE9Mdo8Zphfi8LO1OfFK1QkZ54vhTnSgGT1t7b+WPynqBg?=
 =?iso-8859-1?Q?1+H+HMVbGHTW819dbfCrAeRxzq/77weA5iQtPUioViwMCn/MyzD5SYKL6m?=
 =?iso-8859-1?Q?QczNNV6fmWUpALs42XvT1AXq9ocfFcmzAz226BMnHT4UqjQLZeAxLB8Lo5?=
 =?iso-8859-1?Q?YY4AvAhVdkxpFU7ernfBS/+U07ptZliPNrY954cM+DfDJywPBOq5U15bpK?=
 =?iso-8859-1?Q?sL+sJVboKoRWtDWt1lAAPjIezipbhxhlpnCR451iByG6FsFAVVGwZ7Y5+c?=
 =?iso-8859-1?Q?y2PEiMcG+AQcqEj+7hyJKluZUzrpU4prRhxNH6tK3JTs4VxaJF9lVvm7xO?=
 =?iso-8859-1?Q?9jGGGPuvZv1mu4ukEKHwhdsKBuxb/OJ2bmB5Qef/8jK/v4f3vblAYth5Tt?=
 =?iso-8859-1?Q?69TtMIrb+biUA05Fg7kd8kC/lcbqWTMI21JpAq/r7DStyWIcsdY9LQwDwF?=
 =?iso-8859-1?Q?wZZUQnT1AkJ4n6XzvMU=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 045d4f05-1ac2-4123-fdc9-08d9e00d5e83
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:17:08.2195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZT/kz1H4hpN3JsqN7eJit8+mBc62ILlir+LA4/crqTu9+uHP0uQjByjobRy8Z0MVuIgXEmYHqlimDYTzrEhubw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3253

On Sunday 23 January 2022 18:52:01 CET Uwe Kleine-K=F6nig wrote:
>=20
> The value returned by an spi driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
>=20
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

[...]
> diff --git a/drivers/staging/wfx/bus_spi.c b/drivers/staging/wfx/bus_spi.=
c
> index 55ffcd7c42e2..fa0ff66a457d 100644
> --- a/drivers/staging/wfx/bus_spi.c
> +++ b/drivers/staging/wfx/bus_spi.c
> @@ -232,12 +232,11 @@ static int wfx_spi_probe(struct spi_device *func)
>         return wfx_probe(bus->core);
>  }
>=20
> -static int wfx_spi_remove(struct spi_device *func)
> +static void wfx_spi_remove(struct spi_device *func)
>  {
>         struct wfx_spi_priv *bus =3D spi_get_drvdata(func);
>=20
>         wfx_release(bus->core);
> -       return 0;
>  }
>=20
>  /* For dynamic driver binding, kernel does not use OF to match driver. I=
t only

For the wfx driver:=20

Acked-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller


