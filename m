Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40061.outbound.protection.outlook.com [40.107.4.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD3A3B29
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 07:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUUNrEWg+TKkt/+gwVtBcbByre3YtY5m+zYV7JSsEk688NSiCCIw7Ia1lzFNlibpRm0Q0/Xq1VJsMcZ2WV1x9GuFoqNAEqKUN5rOLhBjMXXClkobqLT7gYhLLKq9Kxjgb5Rn5MokW7kxeTEGP91ZrJc11gHTzXv5QfQaJSF2tWDuAD4az87OQ1HMFSs8YXV4ZYs1WQe+20ggbsMdqgrQbxIh3EIoI3ChjAx9vRKTye02KTWpv5ehxJeqDSCLrlHmEZpEuupd+HB2wsB4VcW8tko1gU+Wzaoyocn6wvpO8iN5wlql0XVYUPDBr308/ls9uzBO5wTPLvh3s6QmafeXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O94Rf9gZrXc93ACYH2aoy9D+GgGlV29ypY5q81WJpJ0=;
 b=KWbRRS87Dm6O6n+z2Ta9NgatAdLo0cDk7hmcfuAc12mtQWo40SLsmYmjZzRoTQZQpAaYdwplSFEfjEGwJ0u256Y0KgoScCyRNyuK9v31hsoFFS0KTKhAx8WDdfHHOE5vczPcarMiCBtrOYO0M4tEu8Ks13LDdgGRvbkl/lFyJB4b5ne5CLlJvP1aB8XLduNyagACoa2rueoDSJtgYTM1+Pf1F332EfGlSpw7cD53cZUaAH3Ihn/jBwaYEr+eI5czKwrEdfNtS+LaS1gacnjaUFqSypk8sc2ys4PEAfU1WhFrNmH7TAE59qhq0dlIi6i4N6j4wbiofylaNCqj9A9QcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O94Rf9gZrXc93ACYH2aoy9D+GgGlV29ypY5q81WJpJ0=;
 b=TaeI3DvXKzom3NTIvWSB+QBCvb6Iem0fSv4/ZrbnDr8Ca7/CtLlqrz1lMFkIiHEhpFXQNxvxHHBN68iGkPPhEiJbfTueu1OYaWGDNAxVepSU1Jv11NXVetKvA0w19c+Q3QsJf4g5KfY3KrUzzpy7OwXvG77uPU1ArYZtGEjP70UQAKnFDUIz04wbSvRkkiPyzjAKu1m54K9YMZ8iTykNx5DScybDhnpNVpKxaTRRpyUsy8kBdEpNb3IZ8TPxkn8tpjChFhMhAkWh0JV0xvl9IRBrBZ41Ev2CKAiCNnkK0BJt7dWIPppkMO5/hUW+en5dALobvOl5g1qPB2ej1f8RiQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by HE1PR0201MB2300.eurprd02.prod.outlook.com (2603:10a6:3:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 07:38:28 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 07:38:28 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index: AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDLViAgAACzMk=
Date: Thu, 17 Mar 2022 07:38:28 +0000
Message-ID:
 <PAXPR02MB7310426E4B8329062656D8A681129@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiMzVvbLgrePlq@kroah.com>
In-Reply-To: <YjLiMzVvbLgrePlq@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 14852591-043b-9dc8-3641-fa261b236c4d
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e9d4b37-ce70-41c9-0252-08da07e920f9
x-ms-traffictypediagnostic: HE1PR0201MB2300:EE_
x-microsoft-antispam-prvs:
 <HE1PR0201MB23009737F0B3168EA143D20A81129@HE1PR0201MB2300.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1nWQYU7jqvT7WZw3Yoq2BF5DzIS9OaqF1B3NxM1U2IFl+Dv60QUskz+4GK8etB8MadcrNM9/9whbNGaoF2emhf/7FbREAkRSvF8XbuGxeRuHELyzAlEwsXuaOlECXRcQ/akX04/LCzaW6NP31/l4w3JAkL4a+T94so7nVfU/u/qi7ljSAJF1TD1Fta497yV5KLM9wAwE+JVX2QmOPhefBNHEOETwJa3vwDjLTUGZrh/ECEpuowwlTLD5aYtosyM8aA6WJK7CG31FlVm0r/fxZSjE6lxznpC/ncIu79RJLrRFAUOQTnXsvgFfZC2Qx0I8qicbyZYIu5Rat4dBQ+/Jgn3EsE+DFJ6X/bzqy8dNShIeujt6m1AIARvW8h0Fum5pCsEQ0BW2Kb2wxzXKEj1C3gjqOCJEc6mv++EqGDXNATCov6jGwfxC+vkEO42V3tuoeJt18uYHpyb20ENyikV1gh/nWtHlJiCkHDmE+rw0YmBW4UtCK+mOn92e6+PfNQ+j1MC2cSM5wjJZ48kLHE+ixm41IsA1asPKMJX1oG/smnLHyixqXmFfA6PWrEXkm3JhEAezzUf9ZBk4HLRHaLZtrPSTj1VRhwImQpG77hlEMw1aVXy1z2XucsxcXGzcH+CNZLkVHvfSRYuc+GqgtQS2wZGnabAfsrOioi6O+Cm9m4ahPDK4PZtJT8haSyQlEg3ivGsheq5j/VSA6YYVhr/CQQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(8936002)(86362001)(2906002)(316002)(122000001)(6916009)(54906003)(82960400001)(52536014)(76116006)(91956017)(38100700002)(66946007)(38070700005)(8676002)(5660300002)(4326008)(66556008)(66476007)(64756008)(66446008)(7696005)(9686003)(6506007)(186003)(508600001)(71200400001)(26005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4kg1SfEdZsV9eP5dqw7+MPZbytKJsbIshkQhNCNR5G8MBBaO5eL+E//ZpJ?=
 =?iso-8859-1?Q?Bm3HdmEDW7Iu5AjzJFLBQ65+ztix96D3QwjvF4fCtjU7J+6eRbi1GaPC9R?=
 =?iso-8859-1?Q?EAhYLq4AOEoIzEMkg7IIsJqz5CSPspzRBo/kOW9/SM+/nOLtIkuetOpZ80?=
 =?iso-8859-1?Q?YiAPTizNhnpceNzCxfibLYm6kP+WBLGZkPBgO4hjFDu70fIm42FZ0bjtkq?=
 =?iso-8859-1?Q?GiKw6KAUR+IFNuXjtLFaKg85BEe4ygRR8b0WPTkgaNize/Lsg9WzPaf/Yr?=
 =?iso-8859-1?Q?rWXDG3YBouzSCLkQCLCBoUoPPeZeO29kxQODupcg4cUyABfN6v0cP45XqI?=
 =?iso-8859-1?Q?ztHiXIVpwd516ecWpHVJpHy81do5xbUsKOWOgpK5ZVr3KD4h69TkHXNPc4?=
 =?iso-8859-1?Q?tO5wguAlvI8VIaq4I+V6b8ZRu0gaVjR8hvRlYyWig9CgZi9aWInASLCSuP?=
 =?iso-8859-1?Q?88AuM+AT7r5y24pEDO0BFVIB/mwKXdxGPlczp707fVteqHDXScoI8klu14?=
 =?iso-8859-1?Q?CSeBqa/MfowjnRvhqGXV8vyeuP3FkP1sMhAl7DuCr0jSlmw3Y1aOxtkYG0?=
 =?iso-8859-1?Q?iaeERmD2mOfYyR/LSBk8SVFdicZtJvo849I3GOvef371GzHVnjEISrLVu6?=
 =?iso-8859-1?Q?XYc1I8ei0UaN0br+igHH5bGCWejt1FSsLFFhG4ux97xe5IvQeaske5WLRl?=
 =?iso-8859-1?Q?YkmkjAc2aUoEXOsTFMT34nymkRBLchohA+Q2uHNXdXpPIBLS0FhPQ7CT/6?=
 =?iso-8859-1?Q?eIJ6CHpaxy4vQNUg9ptu5bWlmDXOA7zSg3jY+zNXRoEkNiAJioMV8LcqaK?=
 =?iso-8859-1?Q?PrcW7FoGgox2dzOkF8skifYTHVOT+0y0x2QBrGwsifkvkfx3O/NzAEDYT7?=
 =?iso-8859-1?Q?u/FO4rwP8OSjoXkB84LLjmnRzXZgb3SvEfUL6ICWJTvZKjsY+sGFHZBzvz?=
 =?iso-8859-1?Q?8Ysotie0MoPAHjOogp6W9vMFVaE/igHKFgiVsraPG6W5WEHEIbNzH+pUUx?=
 =?iso-8859-1?Q?/nNEo5uV6yuRyoPeIlSgXJnUkqvlBEbSBAk/4pp6vHKkQc24E5z1L5DfaS?=
 =?iso-8859-1?Q?1AwWy6t3FehPLcgpVDI+kr/op9KJKNxxaxc9OGMwlOUz2xc8r20q3/Ww/n?=
 =?iso-8859-1?Q?0eBd8+f2c0Ii5ypICEVbFfpCSkQnfFY+rDLN1HxM1EmqGTkh5FumT5IouU?=
 =?iso-8859-1?Q?AtKf2Z0SMYVqEzgmEzxfV4z39dWGXD6Dp6LSCxQbmO+RQ8A92axsUYBL6c?=
 =?iso-8859-1?Q?msTKv3OCT+VFkeK7GeT/Zj7BHjGCtC1PH73IuES+SjQm4363tzGzufx9ED?=
 =?iso-8859-1?Q?y09HFDdNlfT7DlPopGxBh/JDyUCitBLNIPdR64hAWecdMzqJCLpgVFwXzk?=
 =?iso-8859-1?Q?+c4AOh6QAkNhMhyiPeg4mSxzsB4mGP4Tu1pDEUKF5vxdpI7YGRwjCrfDdW?=
 =?iso-8859-1?Q?J/QqsV9S28pg6jFC6mSR9ucEj0QNwAj8GLh1D97LyUHtplhmJR4VxwsR9e?=
 =?iso-8859-1?Q?jZAYesjBQ34epr4NoMO8XS?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7310.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9d4b37-ce70-41c9-0252-08da07e920f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 07:38:28.7998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGt9eCUMl5JG9L5Ao/qy1i1TU/2C7nckRTc/Hvr1Z5L8y9qwtafUd19Lc8ybA0xFzs5tQBtFYU7wRkmkdyr/TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2300

Greetings Greg,=0A=
=0A=
>On Wed, Mar 16, 2022 at 06:13:04PM +0000, Czerwacki, Eial wrote:=0A=
>> Introducing the vSMP guest driver which allows interaction with the vSMP=
 control device when=0A=
>> running a Linux OS atop of the vSMP hypervisor.=0A=
>> vSMP is a resource aggregation hypervisor from SAP.=0A=
>> =0A=
>> the driver comprises of 3 modules, vsmp which includes all the api neede=
d to interact with the=0A=
>> control driver, vsmp_logs which allows reading logs from the hypervisor =
and vsmp_common_info which=0A=
>> allows reading generic information the hypervisor exposes, currently onl=
y the version is exposed.=0A=
>> =0A=
>> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>=0A=
>> ---=0A=
>>  MAINTAINERS                             |   6 +=0A=
>>  drivers/staging/Kconfig                 |   2 +=0A=
>>  drivers/staging/Makefile                |   1 +=0A=
>>  drivers/staging/vsmp/Kconfig            |  14 +=0A=
>>  drivers/staging/vsmp/Makefile           |   7 +=0A=
>>  drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++++=
=0A=
>>  drivers/staging/vsmp/api.h              |  61 ++++=0A=
>>  drivers/staging/vsmp/common/Kconfig     |  11 +=0A=
>>  drivers/staging/vsmp/common/Makefile    |   7 +=0A=
>>  drivers/staging/vsmp/common/common.c    |  64 ++++=0A=
>>  drivers/staging/vsmp/common/common.h    |  27 ++=0A=
>>  drivers/staging/vsmp/common/version.c   |  85 +++++=0A=
>>  drivers/staging/vsmp/logs/Kconfig       |  10 +=0A=
>>  drivers/staging/vsmp/logs/Makefile      |   7 +=0A=
>>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++=0A=
>>  drivers/staging/vsmp/registers.h        |  16 +=0A=
>>  16 files changed, 832 insertions(+)=0A=
>=0A=
>800 lines of code turn into 3 modules?  Why isn't this just one module?=0A=
>Why split them at all?=0A=
>=0A=
=0A=
imho it is more flexible, if a developer needs only the api part but wants =
the ability to read only the logs, he can do so without the need to have th=
e module up=0A=
if you think that merging it to one will increase the changes the driver wi=
ll be merged to head soon, I'll merge them to one module=0A=
=0A=
Thanks,=0A=
=0A=
Eial=0A=
