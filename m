Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA838F5
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 18:57:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anR4IZeh0ehjrb3axRcIjaFcOB/qIjkO57lZ332kZMK27Qw6rSk+668Pv9UDvWlzPf73RMQ6ch9/98ELthT9lpk25dVhY4wNLLdYV0ruN0k0CymUhSU0FuB5Ck0bM/ZcoTqwVU1JzuFnHlwxsd7QjezUzbNPE6JyMNWf1NdC23mphcaK8w2LqzROqQ/pc4LJS85cj/iGohnL+C2NaJ9yfKV/EO9KW2N5i0s4BT194B5TIV04r9yXSTNf46uHLTW9/IhcF7scH1PIa/OMJ2OsQ13vIRQFXOkaWUEHr6lpIfFbnnUNvCSWYFoAOuezAdXezWv1VG8M5ijwJy6hgbHTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+BX7tHjmGXxyQUO0VqHGnr77+8euYcx+OtKfnvAkms=;
 b=kPJk2n3bln+0hWA98BEpoc5k1rohcGiKTrUrIkiptgwlMwBjhF0ISA/EqumawS+NLwyXr4E8vTn+N7OCkjxAhJrbfhl8AekPx6xurw/XrHeke5PCGngH5H+t+oIFa2eUQplq5pvCtZ3IHzkTGKa3+867G0aIxlrDSUmyQrb+WH/I3HcgxSd4RxX25K34oChl5Wrs6FGPIyLn+/s/RQ4eJoinnWS+yoqkZ6iF9wYQNlYlzXyVC0dq4IuD8WcQfHtHgcbGuW44xamOWY/tm7p3GMuF2/bMqtRtu0dO2m6d5HHNZymjfJco8DCDUBml7WLdLuGAJQ93n4cafJaGcjWlyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+BX7tHjmGXxyQUO0VqHGnr77+8euYcx+OtKfnvAkms=;
 b=S4vw+GxCDVwmOF8zmYtKaFdHAi1hr4CARgWkGXYVSmCo1dO23YjllN/Pft8lapnNwcEJC7XXpFXZ8n9G8G4x8Mik5hJdfBtsCmQ6KvX5g/38y6kII4ax3X4S25UD2rjNCco5BmZdFPmmnP3Emi/B/OM/NxXskQerlNJp28pGhusckzmrLc8ZGuIEXwlfIJ+mpM0VS4jwCI1fdtp2HiIQP8yE4XnlZRKzzr5CrfETRDoxK4uv/3RmXHHpmoNkfBnl240p12pzsAv2Vr5uZ5IxySPkrv4Wy46Nn9HN4Vkqjr1dz3RHkqO+5woSXV5koIEq+7Y+UfeSzMLpLIY+6lyPGw==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by PA4PR02MB6702.eurprd02.prod.outlook.com (2603:10a6:102:fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Wed, 16 Mar
 2022 18:57:39 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71%7]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 18:57:38 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: SAP vSMP Linux Maintainer <linux.vsmp@sap.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index: AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzCVXUAgAAGCRY=
Date: Wed, 16 Mar 2022 18:57:38 +0000
Message-ID:
 <PAXPR02MB73106E577096DBD6A982D96681119@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <55c3002a-7eee-9877-24a4-41f11ef4d1b8@infradead.org>
In-Reply-To: <55c3002a-7eee-9877-24a4-41f11ef4d1b8@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 32870f2b-9cb0-0523-cc82-dc5906503df4
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6161c7c-41fd-4403-e36e-08da077ed78c
x-ms-traffictypediagnostic: PA4PR02MB6702:EE_
x-microsoft-antispam-prvs:
 <PA4PR02MB6702DC591024BE402EA8729181119@PA4PR02MB6702.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Tv1knwhBFPr3Z9NJ4Ngd+AnEV7zI0YcbeNPd6zHm2pK2LOOSRCa0qfV7olDtd8pXpSg0aqWXYr96LIBdHfa3y6mtb8x6XHl7SNkVSmWsRzCLB2w1zyWauWt4cua44p9jbiMLjSuP65QzESJbKdX9P3Za1tPq8FINUnucnzgL+OmrYobzwOeFEfEas8/LWkQraulroRuf/IZrIo6EKQbcVtW6zl4BXrQAvU04anja7GX7HmP7/Si7J2tF0tZca6WI2Tmlp3RbDQAOBoIyMLcHQ1f2RadYhofKBDu0Yue87+WitFbkAj8KCAtA95V4cAIcl5z1hLN62VqWL0ar8pkACHxAQg5gGgE+ESUGsqbNSasLu7rLCX9wIJxn6EhSjZmWOhWLj7UaAVnlNmEV3Caz5i9ElCgCQXUn7QlaNxluEbTYho77ir1bBWE8PyhxoDtRKSORhikyaPNXXK3fN6/jGFx+6ksr3b5K8gb0r5HGebQM8KE5QIujgLNV0P+HfwYOpIdrvIzvG+UCcDLFeO96UUOsq4zqJEbgFbkgkMry4YdcYepkhcmjC8qO89709ILDJVeiiLQVKU2x3iqEmefOhNUoLO2ARU2JWFM/DPxgMx9BUq/cmmKdB4gp3lgdzd63qty6qiBHFss0LptnsrLrgsfHhwf9tSoXCnKQkFSuW7EiLD9Q4LrrQalwjCU6mhmnXIOZ3I+aZGfW551rt62PEdAuXFojgrN6AGF+BO3cbo9dw9ndoIwJ8WtqkBErmxHJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(38070700005)(2906002)(8676002)(6506007)(7696005)(316002)(6916009)(55016003)(71200400001)(9686003)(82960400001)(66946007)(38100700002)(76116006)(122000001)(8936002)(91956017)(33656002)(64756008)(66446008)(66476007)(186003)(26005)(4326008)(5660300002)(52536014)(508600001)(66556008)(966005)(86362001)(10090945011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xORZuTeWIa71tdXxNquS1R+6RglQNsQf0FSS6oqXajOZlwEMhqCC2fLchj?=
 =?iso-8859-1?Q?UHc25jbyZP9h5KEZukdiNZhsxgTdlOEOmNJ5oRGTmh3bK3NlrjDueJcgk1?=
 =?iso-8859-1?Q?fp7X4t3Nb9EHyQfkaTpGIl5KMSO8cqWgUjL/MHETVADP/76zmdGzo/YCiS?=
 =?iso-8859-1?Q?UT1Ary96k5uUErtN7JA6Hhi+C6mIwcFBFB+Jj0S7Hz1oarCDZyOc0BvZ8h?=
 =?iso-8859-1?Q?qCFuTiZ78O8xnfA7gG7bxI4CKJMLOsnI6Iv1qgHNSpt1SoRWp/JOfvK449?=
 =?iso-8859-1?Q?qQaIqvHYktGYaN4gkRRJdUPr0nI7q6DwPGTIoPbWA/3jqaxY2wW+o/amgP?=
 =?iso-8859-1?Q?/y8EVOxs6ojvGWXMoi+wKQWSGhMCALZtFoYYKNdbgXluSVCD1Qy+iO7YZx?=
 =?iso-8859-1?Q?Q2b9LDAt7INyJT47lDzgLfCQLkQs6rJKvShJ05oGFp/mJX3XDUDnMc332U?=
 =?iso-8859-1?Q?7+igMTgx1A0Mdpdqxbld3EwjlWoyaOIyg71VzO5QlwQ9sKj5FR52jodg9j?=
 =?iso-8859-1?Q?f2L8U14w3QlYimKSi+2iZ2kIAjqE2FrgcSAy03MtKCAFnl/Quh2syAET6C?=
 =?iso-8859-1?Q?L7aqRE2fZq4y8vqnFFpnHq/1ak70CRGWxJOoQmFAkyvUaJo8fBx7SMev6Y?=
 =?iso-8859-1?Q?wQ6Ue/7E1r4xInxKu2iHsqh4r+LmJh47d85oveiy6A5XpGXFSwGZOkjpKp?=
 =?iso-8859-1?Q?L16N+CcD6TqpopALkuwLd8hVUlp7FD8TkwPPkztdk2O66+YBRNK9a22mQl?=
 =?iso-8859-1?Q?UJji/PSkZvQSJBNMNpgXbhJJcAOh+m6o6HZwO6VewocdXit6AAOBcw0mbe?=
 =?iso-8859-1?Q?GFUWSIzgVSB5Sh3jA7Pdd4K8Q65lxtbYfHLSBFAViuCdyFwqtJC1eEPu/t?=
 =?iso-8859-1?Q?G74EPhRBntbWyQvRW56ecOkIi7d5UA52NoTiWXgopEImDfwRge0VlhzlUA?=
 =?iso-8859-1?Q?/OpuvDG3pxGsh7z/hDu+ZYSEXGkIBs9WtnUSyKDuKSEJ4XS6XWxcElSTE/?=
 =?iso-8859-1?Q?Py9ktrth+1xl7ZyaFz8HQcmzlHmaCbeuuDLPi5XA0jDScX9Nuzn7KYklXo?=
 =?iso-8859-1?Q?F9sTkIBka3SeBbMj+v7wZq2ELrnzHS0FHe4IJv9psxnxNAaEETAYeV7lbQ?=
 =?iso-8859-1?Q?u02SNy1VmyOVOTCPuVRNwF1d7bWxuOE3GMvJAhqIpw3OA4dgN0XiyltHbf?=
 =?iso-8859-1?Q?lSoCrnKNOWhmeAai8GrOpsTGPU/YneVJ106DbMaRL+dp7G5PYhK5AgoJPS?=
 =?iso-8859-1?Q?3xaffP7deBdNpVCtBHOURdjReBWE84nCauoPuxcjxcJnsGi9He/be9ElMt?=
 =?iso-8859-1?Q?qEZG38qo1j4czqLe9+8mu8QirMU0jPmI62lpTzA/bMnI0080uMVqwC/z/Q?=
 =?iso-8859-1?Q?2YRMaDC0jRxOyx6JY0c2NQG7FeIYSE9bf2Febr+i9hGpN3f/1TdQoMpo0/?=
 =?iso-8859-1?Q?2xJwG7XotTNXRa6Mtahm2HvIqS5SexFiWmd1RoFvCewQ9ATmfUTo1TUSvb?=
 =?iso-8859-1?Q?nGyU8eBM7nd0kStkJw9uWo?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6161c7c-41fd-4403-e36e-08da077ed78c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 18:57:38.9330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffqSdXojpq7H0483eG3wtBthP7bpz/V2xfAurFqTixPGfI1dVkDKda/HVaTHl6UInwdeXtmh+C9hSJGc3YkEKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6702

Greetings Randy,=0A=
=0A=
>From: Randy Dunlap <rdunlap@infradead.org>Sent: Wednesday, March 16, 2022 =
20:31To: Czerwacki, Eial <eial.czerwacki@sap.com>; linux-staging@lists.linu=
x.dev <linux-staging@lists.linux.dev>Cc: SAP vSMP Linux Maintainer <linux.v=
smp@sap.com>Subject: Re: [RFC] staging/vSMP: new driver=0A=
> =0A=
>[You don't often get email from rdunlap@infradead.org. Learn why this is i=
mportant at http://aka.ms/LearnAboutSenderIdentification.]=0A=
>=0A=
>Hi--=0A=
>=0A=
>On 3/16/22 11:13, Czerwacki, Eial wrote:=0A=
>> Introducing the vSMP guest driver which allows interaction with the vSMP=
 control device when=0A=
>> running a Linux OS atop of the vSMP hypervisor.=0A=
>> vSMP is a resource aggregation hypervisor from SAP.=0A=
>=0A=
>=0A=
Done, thanks for the comments.=0A=
=0A=
>> diff --git a/drivers/staging/vsmp/common/version.c b/drivers/staging/vsm=
p/common/version.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..35b5a7785e9a=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/common/version.c=0A=
>> @@ -0,0 +1,85 @@=0A=
>> +/* SPDX-License-Identifier: GPL-2.0 */=0A=
>> +/*=0A=
>> + * vSMP version=0A=
>> + * Copyright (C) 2022 SAP.=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/slab.h>=0A=
>> +#include <linux/kobject.h>=0A=
>> +=0A=
>> +#include "../api.h"=0A=
>> +#include "../registers.h"=0A=
>> +=0A=
>> +#define VERSION_MAX_LEN (1 << 19)=0A=
>=0A=
>Wow, that's a lot of version info.  What is in it?=0A=
>=0A=
>--=0A=
>~Randy=0A=
=0A=
the version comes in a text mode that displays the entire system configurat=
ion under vSMP.=0A=
the current max possible len of this str is 512 MB, usually, the used lengt=
h is way lower=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
