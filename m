Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2048.outbound.protection.outlook.com [40.107.104.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686B3201
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 14:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA8XyCMf1sM2NN8ZUlc/BRZLqmNIPbfTQLiqvBGQ2TKLUWxXYFXjhbUAdlXeYNuu4Sf3EbwKfZLnxaryA8qIPZdQ3YG8KxoCSomz7ANMC4QyIUWqoyfpk2G0WodOKgouwNwT7pbS45IG/+PiPF8muM4K1L0Iq8j5vDSuY4Vby5Rd3L6GXkJk/IfQNRfYIovvHF5lTyvSp7okQTy5cW6N2Ps0Cw8/bBuni1SwtycvOqoWkDFQUOCXy7a3texincfAonkmC344unYuSjLZWmzlkxIHEJHOLfjTVKYIBR0gyWaaaSJsGYFusI0M8xMX4jQOFZ012sR5THEly8QSO7dzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXMu2wnAjzIAz+1OQe/g2joL+x4HWu9ujXa+12dI7mQ=;
 b=jgrizgHj/ESufwi+59ZJx6BK2OrkcO7l3DP3YnQj9a4Tn23hN8AzvI886LIprbYpRN3wSZOhx33Z6ShRuxPD2DJbn8x2o//xKikBS1RLD4/G38+d3omTRiN2osRSwULYLGfi4SJTBddGvWjhdcmQluseadFbSft8GzG0pPnR2fZVypzm9blC3Q4Uv/09DyeX1eM2vcUiPiKbz3rcC/K2UKnpFcvxlpJ0zIhXnO5iZP9rsXDgdNQIOWh+B83qyasU18LPvFKogqLoB/XmeP3sMFAUqMAcVR8rWUt3gnG6JH+d+XKFMCPeM+8mQkijEC4iHy3hEM7r/ME3PYDojTwAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXMu2wnAjzIAz+1OQe/g2joL+x4HWu9ujXa+12dI7mQ=;
 b=Lvx9QSjMdEBUBXlrskrSq3R4VfVzcGAjU+5DhIBl8Eq2uxx/lLf+6nJlWuMpUq7HjNU/vpVLYIo5fV2l2RZKZVmroyT9zGU4QifliU7EjbPEJfOuBHFi0Sm/6e/tuecSbATI9Ae7s1IdSqKb4CyDRk8R5jrFstRdY+UXJkH2lYhUGrDtcAfu3H1UWDLsfn3qh5H3sNdu6b89LbBxv+c9WvxUlM7LHJZQr7nsKellNKxPKdHXom6MxftKvbleqLy8akoduj/f+UD5cUSQ8V0t9J72ZQhi+doFo+JmL/9f/141lmjUubvlSg5GZPAc13sCfHSnNR2x2fz7wnMaJVGK3Q==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by VI1PR02MB5808.eurprd02.prod.outlook.com (2603:10a6:803:132::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Sun, 24 Apr
 2022 14:16:49 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6%3]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 14:16:49 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC V2] drivers/virt/vSMP: new driver
Thread-Topic: [RFC V2] drivers/virt/vSMP: new driver
Thread-Index: AQHYV8TvbsysO1IV902JKnQurGWPjKz/EjAAgAAJmOg=
Date: Sun, 24 Apr 2022 14:16:49 +0000
Message-ID:
 <PAXPR02MB7310591DFEF6E1417E535D3181F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YmVTTvQBSd5nzN3k@kroah.com>
In-Reply-To: <YmVTTvQBSd5nzN3k@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 3de6e1aa-c103-da05-45ae-8ca6f7ad227a
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d05655b-4316-4104-ae0e-08da25fd129d
x-ms-traffictypediagnostic: VI1PR02MB5808:EE_
x-microsoft-antispam-prvs:
 <VI1PR02MB580836FA3730FA364874BB2F81F99@VI1PR02MB5808.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XNetFMOR/5x/IsoEvJe3DPO6YSDwMBsVdJAwCzs9cAeHJDcI6fOUd8BcUCZQFrx9kmKwMZv9SNYbDVDw4zmgT5YHGe9OwSZDVwiyG9gFQDqcqzVwJeqLCk47ktL0uIRlLV6QaLtZw8ES0NzwrJ8X+7R/aCak0qr/aXsnJI7Ve4uUCv0Y9O8zKE+Mrg/ixZ7Z6rEX/GFA9llHnnOR1g1aPbU270S6O4CcMKZoH6tZMXjlh2RMwwGQAgAWjLTJEmWnU6Y3eonD4Q5P+TD00mXmg8XWrsmCunbaYfNfCoBtA/HnEoqBkWefvScdtKfir5XtADKlopXVy1oApZrQBHt30aDlL7sbaUPK3x5frLzU6mHcG4kFvZ9nN7oIw9dlVpKxERxqaMDjPgZatf8JDETkqk1v753O7b53/Xg62s8GE9QNC2wirI8wAka8x6VX83+8KHMNeD3eDpwyvpXidNuKkBqXWimHVUfQMUbwoLrv2bVAk3shkzmh/b1zSPGJVE6ukneaYEK/xYtsyaUazfEvrX/r17ZhP9V3EezVxqydAYiT88bREwrOiLgRVny/+y/4F+uMuXVoS9lfmgE+hVfOmRtDTwixDvrdOdUaolFynYme86S295EbHkbH99xayz29lT+Cvib7erQsYLjyMs7b1G5n3RqHgvmHyoL55BYWOLkUOdxskBrfzYuxK+unfCYDBqrpp1c1sSmppPVS6BYMjg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(26005)(122000001)(186003)(4744005)(66476007)(54906003)(38100700002)(66946007)(5660300002)(76116006)(38070700005)(9686003)(7696005)(82960400001)(316002)(6506007)(91956017)(6916009)(2906002)(33656002)(86362001)(55016003)(4326008)(508600001)(66446008)(64756008)(8676002)(66556008)(71200400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bmmYNe9Kky/mDhD2e1IyBLhyoj1OJ/F7CZY7BniuaOvJ12d1/sphT6SOh3?=
 =?iso-8859-1?Q?Lrj+MxrqMo2RdgxZXahsa5snuork/gH6YegvVhCKUFuPCRDRIwyIWXgjB9?=
 =?iso-8859-1?Q?EUR/zKvpj5+g/bj/TKq5FFqGFYLapSzt7IQaxcMmYzyhXBdjMAO6L1y/yL?=
 =?iso-8859-1?Q?V1fYwdpni8pvbKoRUe5Onk/DIO1i7+3YkmtOxhUMZTb3f9yWyGsgt3UHhW?=
 =?iso-8859-1?Q?TkR2HjSBsSWJZZHd1rMKZgX5dC/hURKSzVVBNpwS/zzuZP5IQJMHYPsD9b?=
 =?iso-8859-1?Q?h4l4DeR06P88Hnq52XaPjUD1+HDCBcg5ZsHEvYuIT4NIdt+TikjcPWH3s2?=
 =?iso-8859-1?Q?suV+ozJF4AvXyrjgsDT2pELy5cKEFfgyZgadrKACSJdT23qX1wVLKR2q4j?=
 =?iso-8859-1?Q?PLN/EBXxWTXBLTyq6oNN2wRORRR4612UnViK1AVJpSwtaSYrt+oMZm/Nrh?=
 =?iso-8859-1?Q?BupMf6a7V2sgxXyqJ0xXtbhEpExGWlUv+rpVe7jklfb27Bj7tjbDjIFVlN?=
 =?iso-8859-1?Q?7BXkSchsBJoFYlhiTTaDTqtDj3AjFzIsMMnViz0MnfEz3kYCaT9ZsJtGCI?=
 =?iso-8859-1?Q?D7k9eS51bcMBDfPUlL7WF3KFDkIIdMgwoSsPTrSlu6vTp/EmZKuHfwdkSi?=
 =?iso-8859-1?Q?bd7x2bBNsfMvcVS5EIcD6/b6LHRkALWt5iMjE79RNR4X0bGUv8oeQTDgIe?=
 =?iso-8859-1?Q?Bwh4HvIvJX4HcM7HZ8c6lcWGxhKO8AhAeZl0YylbFR1INWiuNhceP0guXQ?=
 =?iso-8859-1?Q?Zyy17GPhniqoYgfQ/MhFxutmvwx2A5T3+NYOL/Whd9eZgylbcNWKyZXTaa?=
 =?iso-8859-1?Q?606QKpUMA54Uh6Pw6/kGD0qV+YcZFTZVaj5Z2945m3APuX1QoXdHZfTtUu?=
 =?iso-8859-1?Q?lDaCqh6Ch+BrISXkof1bjXndXVkyMRhxhqHsh0/qRfthPy+uI7KaesYznf?=
 =?iso-8859-1?Q?c9IRL9kjxjMSK/IbzFlIcnXA85im2va5iMsA3IobgGzpAAga0BuZ7ptwKG?=
 =?iso-8859-1?Q?0gMtoBKeGsKxSUz10AuXrxGZdgtXlb4wTNZu3Yn1GJ3bDikA6csiDvNYH/?=
 =?iso-8859-1?Q?l17nQ10S7DDYf719ffd1kzYOuCFmV75iTpu8MtBdIKQsAkZ2yeg8xloCsJ?=
 =?iso-8859-1?Q?32ugL+DHvJ1voLOLBMYQr6gwY/fn8LsX/w8A0VzImXV2eb1AkNCeDuRdya?=
 =?iso-8859-1?Q?aLPazFstW1yXqW1lYaBYgYJskkV0hnQk6k7hVGubPtOiT7C8dJkyREh7QX?=
 =?iso-8859-1?Q?Aaa5DgYXKJvE9ZsQzLXurIKOe6pOAzv9em5qrvCwim5AE8BRHvNX1yXOUz?=
 =?iso-8859-1?Q?fUM9iNkqOHKwPIfFHWhUS08HvHn9XH2Gs+d9gmk0VS69c1xp39AJlZ2WTE?=
 =?iso-8859-1?Q?7TiddD0TnY8ksYTRYgowp4G6pB/cboogjUh8ZpsNR6bLx0ZeXpg/W/sRV5?=
 =?iso-8859-1?Q?i5NfABQsJJFF/tS2LVi/j1iGpMWnq6JcNjK8wsuOCqN77NW9LpiZkbatvq?=
 =?iso-8859-1?Q?5vS5BfXcFOUgsAHu/HatpVIiclEErsA6sSA5ab0lGua5SxBYjPpNBth18s?=
 =?iso-8859-1?Q?vPD25dhIhcZ7Aq7OjnSnl/FET6ALg3gk646kQi45LE0b8zYSZqDokoocs2?=
 =?iso-8859-1?Q?J65O7QOolKbsYsFFEENpt99SDisV/PShevBeZQQXNG1cbNRnFEJ+HbRWH6?=
 =?iso-8859-1?Q?W1s0H54+ranEBlqBddIxU+VZhKWi3DnrxB+VCSpOgzqCTL7D+azEwKyT7L?=
 =?iso-8859-1?Q?Inm4FdeaB9M6hVP13x5V/pC7p42MhzsELhdu4zoG98iLsDdJxEtA58VBy6?=
 =?iso-8859-1?Q?EV/SkpPcCA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d05655b-4316-4104-ae0e-08da25fd129d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 14:16:49.5311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tD0h0DrnWHZDFZYbS4mzVpHUIE8KoDxbEbdBJ2Vp+NjpLggiMxvq55cY6s7DF0larLgBWZoVQOsT5/JUHjtAiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5808

On Sun, Apr 24, 2022 at 11:44:33AM +0000, Czerwacki, Eial wrote:=0A=
> Introducing the vSMP guest driver which allows interaction with the vSMP =
control device when=0A=
> running a Linux OS atop of the vSMP hypervisor.=0A=
> vSMP is a resource aggregation hypervisor from SAP.=0A=
> [snip]=0A=
>=0A=
>Again, please move this code to be a proper pci driver and all will be=0A=
>good and much much simpler.=0A=
>=0A=
>greg k-h=0A=
=0A=
will fix and send again.=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
