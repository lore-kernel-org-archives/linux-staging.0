Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED51258E
	for <linux-staging@lists.linux.dev>; Sat, 12 Mar 2022 18:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIUEGiAIRlFKmFoflAUkW/nAaIdHMaIHRDFmkCzOvhN5S2Fi0nonbhekfIVBsCRXPertXYDlO8+Hhsp+hENb2rE79nAaZ4Tlq3bD+hhpa0AzBQb6sxRawHRk7FGB597VW5WBYLhOMNPVRaIiA6YYmGlQ2d8uwT6fNdwAWHTkyk1C9GnZmSzTkfm7A57NPdvay68wC1SONn3+oMsELi30GbFSLzulBT7azhv6gVNjvAbn5ipUQYlvLi5pnfI8jmsa29e/ATCrasJqXOUly7D6tROlH6EQmAbrYr6xJrT7svcCsBAWZjvHKLOZFKiKiGSg/OspO5xcPKy/hgtqCNd2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9Y1BHNJ1dbiIDDSNei6WoTgmNAESPaK+SeCCoGJTek=;
 b=FkIA5OBBaugxfpiM6fro1lgRkxaVC+aWxP889mweD8LmlRtrDnlbM1UAFLJY/Xgo4pxfSRSm4uFmxeE7XgdzIPxdiqSoZDsviLXpCgwcc3tu0WAad41vatZldQlL5yGarDrOWykmej/Vcv5NbOSrcl1ucZzYcU/WV9B2nriJ9LrHy5aJmcVT5Fi6DjZ8bLCYUW1AEEDelM1JIw5IE0AEbxXJJQbCsXrQgadKtiwiGg6YJ4aA/GK3IIlQqG1e+PYfYN5xaDyNpHkxgObt3c3d6H7QKWjZ/vjzX4sDA5jziZZdoIQEn+LtoMEsbVzC+5N6E6iUBCFFvKZtuOLfShA6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9Y1BHNJ1dbiIDDSNei6WoTgmNAESPaK+SeCCoGJTek=;
 b=Nbj98+t05EEiQGcP/plIssR9+YyQjRs8GnHUthWZI52krfJgzAvufXWf7VonmhPeH2TxyN7gk8Ri06Rvm0YOz4HnDKECvSsxjuM0a0m0zNv+7Ghd7YLWwg90f4S64rYOumpGa/00rzR1ByjuHf7v6Up1soWg96EUgA19tiLyvPgGhRc18yipWPsbVK47zSEyp3hC/yWnSs+xbRtLRS+Az07mllnaaYooEYEiZbDOyB88NNomysXw0kEux4pKSsf/EIavVGa6j8AVtBOzl6j8RAbTAXtXwnvkq17VJykveIJl76jxwkTlbW5UZ+ySP6JVxPvkoLO7lGJ1U9WvjhVulQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by AM5PR0202MB2532.eurprd02.prod.outlook.com (2603:10a6:203:6f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Sat, 12 Mar
 2022 18:39:48 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::6037:ae95:7dcb:e23a]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::6037:ae95:7dcb:e23a%2]) with mapi id 15.20.5061.025; Sat, 12 Mar 2022
 18:39:48 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: help in address issues with a new driver
Thread-Topic: help in address issues with a new driver
Thread-Index: AQHYNNHMA26xNAOrmUS+yj4QsxENP6y5OuCsgACD7YCAAlY+Ow==
Date: Sat, 12 Mar 2022 18:39:48 +0000
Message-ID:
 <PAXPR02MB731099745AE6E250C4BE4F6B810D9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73108745861C53FA175BA588810B9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <PAXPR02MB7310A014368829393A8D8692810B9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YirxFbTcmzF1uAoC@kroah.com>
In-Reply-To: <YirxFbTcmzF1uAoC@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 68229244-606d-0c41-2aa4-6cb84ed4de04
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b371fd4-ecbf-4ba0-a73c-08da0457afbb
x-ms-traffictypediagnostic: AM5PR0202MB2532:EE_
x-microsoft-antispam-prvs:
 <AM5PR0202MB2532830880DA051CCE2C8760810D9@AM5PR0202MB2532.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CxITqw77yvF6nSiXCNWcbSMefmw6e/y7RxWY49O4WDHHmwyRAfbpQiyTf2VTGn7wo1/Zh9OyUBiDeT3bMJ5QauwDVT7K08itE5WeUfA4YSV1YvKPX+8G1Qb/S5ZZRJdA5qj7g0tEQTuS3dgUTyBURD86ad9OJuOOu+D3DYPM2JyE6AL2tlKDVVtCUqzsHBNpSL5MUnPYkqDwjMzoS3oSr7kSz5ZKNPoDoHwNBmvU1iJbiyP4CAAxW+M96xSwIbizX0Z7bONptFwy1b63kGsm5IGLSA87zMPeQFCuD22qSlD8WaZDEYbSL1Fy3I+XYcGKfbdGyR6fl24+Qm54OkbLg/tI3uH6HqlYPUhPAWA4HF0W/dYgoIuxmhq42cClJXc4o8Nos3446LMtj8BO6cpwLbI/BzyN9MPG1SWRnEteXPoi0ZQ0069N1V5WwIobxokdhVjU5LaDVY2D+sXOZlf4Ii3wWnlucKlemPioQhTp+spvqCXgmZC5CC2ix4tdJY34iTd00Qb6L5GmpKy2GQr840AjQh1cnx9w6qzidemOjE90t6oxzM8cuuO032RFeDSbChUvnSYvpY55LqcLJ7CyuHmgTguCTxRby7RQS3KFfgLnYuuS4UCrMtIMDQ6itSMLRTGsCIdn1NgdN4E3v5B12qKT2CV/Zkfhgn/Z6s88GvXkzxe9uvO4OTWZmakKJonPnymlPgRtZJU3RGO5AIMFyg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(2906002)(186003)(26005)(4326008)(5660300002)(66946007)(66446008)(66556008)(8676002)(64756008)(66476007)(91956017)(76116006)(8936002)(52536014)(6506007)(83380400001)(9686003)(7696005)(82960400001)(33656002)(6916009)(55016003)(38070700005)(498600001)(54906003)(71200400001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XM7mdAQR3VutP7yZAGBJHZeItK+l2P4A1/QaicaxgOWLLS/lfJ2x7oeuzf?=
 =?iso-8859-1?Q?E0Pi3mEcLobCfJFcd8UkC/Lq1Ge9C7GPbP6IzuO9R0vg4TyUeS8iEMrPfZ?=
 =?iso-8859-1?Q?MiA1opcl+LsSZPEedxQc/3fdSl2eREVbfDbOR/UAlZamSQ3C7iZeAI4lfF?=
 =?iso-8859-1?Q?3E2VVDHENE0eepBONbDBqTo3zFyc1NEElo/ZHqN4XTliylk8BuOpGkyyVa?=
 =?iso-8859-1?Q?b2ZLBnrmbSOMf2ElfM1wlXKPNcLlfJcGWooeUVLV3sxW3tZcIMMEpjxD6w?=
 =?iso-8859-1?Q?W9YG8M4U3UAimeQZCWVPs4xGrjoyQCAZYtXWlomY2JjksZ/4hu/2LYY1cg?=
 =?iso-8859-1?Q?Ttve1aiGz7CYUFTgtRxHAVbMoCemaY0Zi4cme+/3ocs5ssTw2T88RecePX?=
 =?iso-8859-1?Q?2WeaftU48Q5tPV3+uh1reqfFM49gkICpjkx5lfpI4y6lsVui4WnJYVmV65?=
 =?iso-8859-1?Q?VEa1fAvswn4WrI3e+CGlC8e4J3I9wVBT8pSeMWJusYMUeP1D9tBQrs+AFx?=
 =?iso-8859-1?Q?1BzIHozBjY0mappTN061XIDo+GRXlsdbYaDwj6ps16AEkTR7kqvegmTyBq?=
 =?iso-8859-1?Q?5xMraaaqa3xL8b4pOG7JF2WfYdrmARoDbc3JJ8CsbJTa02N5uhsqTJGzeV?=
 =?iso-8859-1?Q?P0HB7qTCX0fgz4nvt6Tw465hLCqFY662TeEGBBPe5WwiPZzWRRmipKA2qY?=
 =?iso-8859-1?Q?navw9CHpw9tbDXuJJYMIyK4a2I/RGIrDTzWoB2+6VVNCM9TIZQ8NO4GaCG?=
 =?iso-8859-1?Q?wnaPcXXdLwvXsH3+ZNZOph2x0gFVx/PRSY9QBXakWWp/TYJ2Ywd5RctkCi?=
 =?iso-8859-1?Q?Ze8ceatfLFEKTJJDO2cZQKQJhSx4yWssOMq0oYsX0j67sc3iE/jNMPPIbI?=
 =?iso-8859-1?Q?ulbnh4fToXmx4v3It0UYU2YU3YbN03mgR0JY7MkV+Zqr8v22T8afIyLYcK?=
 =?iso-8859-1?Q?P8UuJZ56Q8fesVhZhaK2180mTfY4mvi5AasEVkfggnkMfqAAD7Nc3S1ktT?=
 =?iso-8859-1?Q?wiot8B0RTiqOyPKxuuTC3RxeW9vAnferHstbJB97h165oQP1VThM5F1iUY?=
 =?iso-8859-1?Q?LWREV9rCAFh9KRpyGFQ7oUSKcQ29CfRHfIPU1yQFzuj5mDbUagylrBMr+U?=
 =?iso-8859-1?Q?yS3NCQwhIgenAGNvxh/uKz+9LCLs+PotEkSTRSeTmEhUF1p8lHvv84VhJP?=
 =?iso-8859-1?Q?dHUeIR8VQ8pU6Qce3acOLPP+q3vOBL0cs3pKOksy8TCh66prDuFirx/unp?=
 =?iso-8859-1?Q?TR/ehQDzAMeBVlIOTVB9QUIBtpIopu/sHBowXGubetBdGb0GhHfCjoU9sH?=
 =?iso-8859-1?Q?ie4FxehLWZ7mzlVpiWWtbM0dEGUjBC6tEtS5TeZ/XvYlPRC0bAvx8qvdSF?=
 =?iso-8859-1?Q?sFZOH/+ayW9Dm6uwDc6FWgzT0Bvxgfn+7MRkDhnxXRMX6lxHjT1EosYiMA?=
 =?iso-8859-1?Q?0TsyOPEbf1xjOwHBVlAhmeCKtblGsaJCXsY1rerqapA1rUv1W/cGBKMoKg?=
 =?iso-8859-1?Q?mDxCnjQ5MkNVth/APb1qAj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b371fd4-ecbf-4ba0-a73c-08da0457afbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2022 18:39:48.2373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6g9w5Jj3HMyRlGMkQjOMXuHhUG5X7P/qGNQgpKfRgMxmJDgALaxYPPIu3ZQIyf+ZPGPWGZDQ+IynWaAMSZxFLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0202MB2532

Greetings Greg,=0A=
=0A=
> On Thu, Mar 10, 2022 at 10:58:25PM +0000, Czerwacki, Eial wrote:=0A=
> > Greetings, =0A=
> > =0A=
> > I'm working on a driver intended to be sent to staging soon and I've en=
countered two issue I'd like to get help with.=0A=
> > the driver's hierarchy is one module file shared by other two modules.=
=0A=
> =0A=
> So 1 .c file that needs to be built into 2 different .ko files?=0A=
> =0A=
> Don't do that, it's a mess and is not worth it.  Please restructure your=
=0A=
> code.=0A=
> =0A=
> =0A=
> > when I try to select both all three drivers as modules, I the following=
 these two errors:=0A=
> > ~/workspace/linux-staging.git$ make modules -j 9=0A=
> > scripts/kconfig/conf  --syncconfig Kconfig=0A=
> >   DESCEND  objtool=0A=
> >   CALL    scripts/atomic/check-atomics.sh=0A=
> >   CALL    scripts/checksyscalls.sh=0A=
> >   CHK     include/generated/compile.h=0A=
> >   CHK     kernel/kheaders_data.tar.xz=0A=
> >   GEN     kernel/kheaders_data.tar.xz=0A=
> >   CC [M]  kernel/kheaders.o=0A=
> >   MODPOST Module.symvers=0A=
> > WARNING: modpost: missing MODULE_LICENSE() in drivers/staging/vsmp-gues=
t-driver/common/vsmp_version.o=0A=
> > ERROR: modpost: "vsmp_release_op" [drivers/staging/vsmp-guest-driver/co=
mmon/vsmp_version.ko] undefined!=0A=
> > ERROR: modpost: "vsmp_deregister_sysfs_group" [drivers/staging/vsmp-gue=
st-driver/common/vsmp_version.ko] undefined!=0A=
> > ERROR: modpost: "vsmp_register_sysfs_group" [drivers/staging/vsmp-guest=
-driver/common/vsmp_version.ko] undefined!=0A=
> > ERROR: modpost: "vsmp_init_op" [drivers/staging/vsmp-guest-driver/commo=
n/vsmp_version.ko] undefined!=0A=
> > ERROR: modpost: "vsmp_read_buff_from_bar" [drivers/staging/vsmp-guest-d=
river/common/vsmp_version.ko] undefined!=0A=
> > ERROR: modpost: "vsmp_generic_buff_read" [drivers/staging/vsmp-guest-dr=
iver/common/vsmp_version.ko] undefined!=0A=
> > ERROR: modpost: "vsmp_read_reg_from_cfg" [drivers/staging/vsmp-guest-dr=
iver/common/vsmp_version.ko] undefined!=0A=
> > ERROR: modpost: "sysfs_deregister_version_cb" [drivers/staging/vsmp-gue=
st-driver/common/vsmp_common.ko] undefined!=0A=
> > ERROR: modpost: "sysfs_register_version_cb" [drivers/staging/vsmp-guest=
-driver/common/vsmp_common.ko] undefined!=0A=
> > make[1]: *** [scripts/Makefile.modpost:111: Module.symvers] Error 1=0A=
> > make[1]: *** Deleting file 'Module.symvers'=0A=
> > make: *** [Makefile:1370: modules] Error 2=0A=
> > =0A=
> > vsmp_version.o is one file out of two in one module named common, the o=
ther one is the main entry point for the module, is it logical I need to de=
fine MODULE_LICENSE in both files?=0A=
> =0A=
> MODULE_LICENSE has to end up once only in the resultant .ko file.  How=0A=
> you make that happen is up to you.=0A=
> =0A=
> > prior to the common module, the api module should be build but it isn't=
 for some reason, the makefile looks like this:=0A=
> > # SPDX-License-Identifier: GPL-2.0=0A=
> > =0A=
> > ccflags-y +=3D -I $(srctree)/drivers/staging/vsmp-guest-driver/include=
=0A=
> > =0A=
> > obj-$(CONFIG_VSMP_GUEST_DRIVER) :=3D api/vsmp_api.o=0A=
> > obj-$(CONFIG_VSMP_GUEST_DRIVER_COMMON) :=3D common/vsmp_common.o=0A=
> > obj-$(CONFIG_VSMP_GUEST_DRIVER_COMMON) +=3D common/vsmp_version.o=0A=
> > obj-$(CONFIG_VSMP_GUEST_DRIVER_LOG) :=3D vsmp_logs_handler.o=0A=
> > =0A=
> > any ideas what I did wrong with the configuration?=0A=
> =0A=
> Try not to use a subdir for files like this, it's not a good practice=0A=
> and can be difficult as well.=0A=
> =0A=
> Try to simplify all of this, it should not be complex.=0A=
> =0A=
> But of course, without actually seeing the code, it's hard to tell=0A=
> exactly what to do instead, sorry.=0A=
> =0A=
> thanks,=0A=
> =0A=
> greg k-h=0A=
=0A=
I think my current design is to complex as you suggest, I'll try to simplif=
y it in hope it will fix my issues and allow viable driver.=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
