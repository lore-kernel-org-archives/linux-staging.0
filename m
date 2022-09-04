Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2055.outbound.protection.outlook.com [40.107.104.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A472FAE
	for <linux-staging@lists.linux.dev>; Sun,  4 Sep 2022 14:37:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZS0NSlZfNCXSbjofpRU5BL2fXGXGfXy9WirwemqRdc7id/Pr99FgPis1TRr7Cp412rSssmxr9NPr4x7qirRvJw5dzdnjSyy9vlsMGwel/uMX1v3dSckGMMIQ9t1XEqvxAUIo9gt55QXRl+hYtcSlPFopdwj7aDUa4iRsHT5m+dki7A9E4KZH6sIFkK+CF3i3KCuLNvZFmrxq46rHaHDXX8exJyhVBpRQKEuTRGG+6VemADoznkJ9qu/i1vVgppS/f85iGn8Pl2s/JUsCiSubg3fTlw9h3hzkj9OWZr7aRIVhWgsccfi1kCDCIlfGi0DdyR/mTLfJ3nzPtlL41s2/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyVxMxF++/yZzRYOtWfN5tvV15Dgfj1UFI/IoPXRF3Q=;
 b=MwEOFhyeCdS5hEoGq/vQS7SyxaSiisPr0m/ExWEHBd4np3bvXlItWOB3cnVA38zcKp5H1LwePDA3/cNOoPs2d0oUEFu3JFWAoCbkB9z5doCsOpxunzmIN5b4Xhb1O/7PTZNXSLm5dPpDSNEV4tFykRr4OAy3bQq2lHK2gC2U7gHcTUKM5F00e9+xF5y0HqYNnLw5vLTUGB2W4ewEU1CSv6r/b+VRCUsQ2vYO769FNCt5TiJc4eYUNgrUCX+jHfPOCoPr5aYA+8OTrwHloNqDkOCFarsV2zWYYM4UXi7t/8ShF6/X2o6Zucz4sYdazQA0uT7xKdOLLdrtWikdlRzTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyVxMxF++/yZzRYOtWfN5tvV15Dgfj1UFI/IoPXRF3Q=;
 b=CZKVfmZqeZldyjRISFhFjFCy2nc8fcFPMeHACo5gNuUFntLWg8xWmfnEcqYi3FZ3znffVhU0upomdepJVIotwrISPYoUNcoxv4o24SenGKb0ui4QXWwMtS2UaGH5ijMoYhQ8s02gXBD7krEYxtrmiVaBsqRVmdEsR1bZMyCX3UwPvCLuEJfTemKrThYFHQmVnVneDlyBOSD3fF6obekAHsTrwfbX0uxXNyz+dwYHDtM3t+SG1dcaYg4C0C4Lqq+yq629PyNUgISyosu0fc3kLUIYaTswi7fc3d15+yaVsVizgOSliFuHbNN1XP1tNSUPVDNqaUyJzGmjPmSgeFlfiw==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DB8PR02MB5931.eurprd02.prod.outlook.com (2603:10a6:10:11b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Sun, 4 Sep
 2022 14:37:32 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46%9]) with mapi id 15.20.5588.018; Sun, 4 Sep 2022
 14:37:32 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
CC: "Hammer, Gal" <gal.hammer@sap.com>
Subject: invalid drv data in show attribute
Thread-Topic: invalid drv data in show attribute
Thread-Index: AQHYwGq9NvHSxWjabESaa5oh/fCdVw==
Date: Sun, 4 Sep 2022 14:37:32 +0000
Message-ID:
 <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 635bf2aa-bba6-4908-fd48-08da8e830084
x-ms-traffictypediagnostic: DB8PR02MB5931:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FvLwQBojtD6lY7qYVQTRztnMIq0pAkqVgGmRMS+KhtomHn7MienWsQigrOx0Fh9XyL1mcFCgvPV/aMvBP80fXxurv8nkAx8yL+OChI4+xnB+9A3pSJEtOlm7zzAHh2PJ5DgeppFzILbedi16aAxYPejWHQs/2wt/57JTCq3E40zUvQ+FBvdQr9kWoLh+IVf9pHQE+vt6+xuYj09VNsRFXaJOj+GJ+kT1Rxk34g/aaEvIF2pM9oDKY1UdFMQUtzJhlRSGRk7MhRWf3Bb4vszABFMSOfk2cKwbGUbvPwoeZCK/We7KyGbT9NXXbHlCTjALn+W2g4WOF/cu/For8qtyWM+ksFUNmOo23TS54ZpF+83TdeObVH1bIs2EnlnqxB+d4iNSmemL/4noloF7YnI/7AIevCGBmr0XgcrS6YFrLCAIxvPhbzLy1+UUN1tJbACmTQefT+UVByzD7v3CATDB3EMDQ/5CQhzUdj+xHBpETeZ8cAKtfEhboulLVfeMzrKWVCCBuWUEiUkc6SvrJymmLLCZm3e9wn33VRMPG7BGHGTIHbZIY7odBkw7my4o25xQOTQj92XWRqre/HIkROgI6kht/XeXZwr2bKJTmZ11A+/Y69pD3Vl1s6UWQYMk0pU69emn6HHoNOvhnLziKmzPgkqzu3rG2yKZYYUr7FfEpgbmUSZbvS2f4S5zgt6VM+EbH7hw/e4O8qFw3r6pCMuHGtPdxD6/L9mtGk4IR+LGBpNoPINKHi2LSuPd1WJgdYc4/UcmEhnYgBdd90Qj8XNDVQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(5660300002)(82960400001)(8936002)(38070700005)(4326008)(8676002)(38100700002)(91956017)(7696005)(6506007)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(122000001)(316002)(26005)(6916009)(55016003)(33656002)(186003)(52536014)(2906002)(478600001)(86362001)(41300700001)(9686003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cGqPgXUd/MGS6v6I0VQM6ZX3S91UxEeb+wDNQPTq+Gzb/DXAEzhYP22J7I?=
 =?iso-8859-1?Q?hWsP6k/smkPIGYF5z4AaFI0LO2a7RaI03urk6hXHwSPv+DENXE2T/55jBw?=
 =?iso-8859-1?Q?tF8/Opv81/DjowQXMEakce2NYI1mg9aN6YbZmvpJeVsZjAECaf+67GDZLm?=
 =?iso-8859-1?Q?NjqRJ+KOtG1zUSxP8fkz/dZWndz7QqIg6K7TIpSExsiCHAXIO9xB/h5yRI?=
 =?iso-8859-1?Q?ZLN6VTlS4GBTYJ5Im0IjNt7qh4lxw6XEjwRDFUoq4T5Oyax/rrfNWVnvow?=
 =?iso-8859-1?Q?zInuvAfmiibIzNTKjXv/aFtjDkN8T52IGADiTaCMK2m3bzZ2bNspjeuNcw?=
 =?iso-8859-1?Q?YMCuP7oQYQeqHc4WLMrxE+OOOPwMWJPRHgOvb12SegQUvmsVJO672LES9i?=
 =?iso-8859-1?Q?fZHOg1rTnyQwdJ1Tggcqx5Kg4g9yEffnoXhOfeTVM8HvGdJFSZbD9XLBA3?=
 =?iso-8859-1?Q?X3ZhR5FNGUI3ZlJQ27NbkPRcZee+A7Q1ev/1WKFRmgptdy27xlGKv0HSv8?=
 =?iso-8859-1?Q?h8nLMYU82NIpp5ormNGkzjI4Sd5EdMmOxu6yF7cayXo2uzuSA06mHVlqdE?=
 =?iso-8859-1?Q?Lf63/0hA82GXhVzGbcFvVkSyzKipK+vKWO09LrG5HgDYjS/eW5OgfOh2aE?=
 =?iso-8859-1?Q?nptr6qruTnHJCtMs9BXiQcUFNUUFueqLeitGRefmSSxQjc70CxPAaBwKV6?=
 =?iso-8859-1?Q?ayeixJbaH2pEcv+feAhgNvgkIe9UbY4fv6wv//z4OKgeMgG1RJdDKKYaRc?=
 =?iso-8859-1?Q?fkZlHUZlaBpLiruzj14wuiCHAIwXnRDfFUuKLF+2TE9ua3xSHfgghC/x5Z?=
 =?iso-8859-1?Q?hyL/GqCtylveITUjSsqniIvhfyD/xBjCchkD5+yl8aDmgVi42cmZ73UffZ?=
 =?iso-8859-1?Q?7OltXyNUtVFySg8MxspCcbGFgTJQSg6hqSjFivxwNVVvDPXnDqlAk5Y1Fb?=
 =?iso-8859-1?Q?TcZGbhxP94n+vWtaUdoJjHeVxd8oVQ1BBTia5neqgnySQOwz2yCnWM7+Sh?=
 =?iso-8859-1?Q?cg21Eywb0R5QjC88CGqwtRAbFfQ/ink9o6D/kqayfABHR9fCChm3q8bRPM?=
 =?iso-8859-1?Q?kyEcn7ZgfDfa5gx4xR676R/MUFItoPNZMgRiww17+Pk+9/DnVyNrpnyof8?=
 =?iso-8859-1?Q?Tn/vILCiJGf+n48ldkwiNlviMSdyAcf7fudPAFAzRpmZ/LNpjGRQA19g57?=
 =?iso-8859-1?Q?a7UOQD0+1qkmhlDlylXlS7omD5S+3pHYwFhIqavLV+/kUz8lLC4JnNI9jf?=
 =?iso-8859-1?Q?/vb4SKQLys1M095sz2BYEA0Jo7RbWDudXPArTbbea7tGmkFoIQOGLEhqKF?=
 =?iso-8859-1?Q?MAro2whakPD6Min2qPDk6IToWI66RWJl7WgqRk6AQQL4e5LMvaJ74AuEu2?=
 =?iso-8859-1?Q?fNxWBKBZ6M8/QwTCQxNxT4qfHfKAUxP5k4PuKD1nlFDiuTm5rltcPvQzH+?=
 =?iso-8859-1?Q?z71fQQfpB3GCKbdBhp2zYAOtDsUmUhd/3NTe6/A6bBJPihXj3m++SLixNF?=
 =?iso-8859-1?Q?mgISRechYwRObDPEFqw3BkdkfLWfHaA5/GFDNh6eIpjn+EtRKqSxWcf/XE?=
 =?iso-8859-1?Q?7xfb7WMusvkth61IFpGpxe2USfNGKg3HR1T6/rfuM0rSOi08tCc05H9Gjy?=
 =?iso-8859-1?Q?TKxUfjWikzjqzyBL5d49GdHPe2ug9b768F?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 635bf2aa-bba6-4908-fd48-08da8e830084
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2022 14:37:32.6609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnBt1pROXytbRIVW796jnGyYxOyWwbba4oC3uMn5QvGhbvktXpDSh6MMM90GWCAkbRUZNKKkIA1lKAbqvouXjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5931

Greetings,=0A=
=0A=
while working on a driver, I've found a bug that I'm unable to understand.=
=0A=
I assume that I'm doing something wrong. here is my reduced c file:=0A=
#include <linux/string.h>=0A=
#include <linux/module.h>=0A=
#include <linux/pci.h>=0A=
=0A=
/* modules info */=0A=
#define DEVICE_NAME "vSMP"=0A=
#define DRIVER_LICENSE "GPL v2"=0A=
#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"=0A=
#define DRIVER_DESC "vSMP hypervisor driver"=0A=
#define DRIVER_VERSION "0.1"=0A=
=0A=
#define PCI_DEVICE_ID_SAP_FLX_VSMP_CTL 0x1011=0A=
=0A=
#define ROOT_SYFS_FOLDER "vsmp"=0A=
#define DEVICE_ATTR_NAME(_name_) &dev_attr_##_name_ .attr=0A=
=0A=
#ifndef sysfs_emit=0A=
#define sysfs_emit sprintf=0A=
#endif // sysfs_emit=0A=
=0A=
MODULE_LICENSE(DRIVER_LICENSE);=0A=
MODULE_AUTHOR(DRIVER_AUTHOR);=0A=
MODULE_DESCRIPTION(DRIVER_DESC);=0A=
MODULE_VERSION(DRIVER_VERSION);=0A=
=0A=
#define MAX_LABEL_LEN 81=0A=
=0A=
struct data {=0A=
	char version[MAX_LABEL_LEN];=0A=
	struct pci_dev *pdev;=0A=
	struct kobject *kobj;=0A=
};=0A=
=0A=
static ssize_t version_show(struct device *dev, struct device_attribute *at=
tr,=0A=
			    char *buf)=0A=
{=0A=
	struct data *d =3D dev_get_drvdata(dev);=0A=
=0A=
 	return sysfs_emit(buf, "%s\n", d->version);=0A=
}=0A=
=0A=
DEVICE_ATTR_RO(version);=0A=
=0A=
static int populate_version(struct data *d)=0A=
{=0A=
	int ret_val;=0A=
=0A=
	snprintf(d->version, sizeof(d->version) - 1,=0A=
		 "%u.%u.%u.%u", 1,2,3,4);=0A=
=0A=
	ret_val =3D sysfs_add_file_to_group(d->kobj, DEVICE_ATTR_NAME(version), NU=
LL);=0A=
	if (ret_val) {=0A=
		dev_err(&d->pdev->dev, "Failed to create version entry, error (%d)\n",=0A=
			ret_val);=0A=
		return -EINVAL;=0A=
	}=0A=
	dev_info(&d->pdev->dev, "version is %s\n", d->version);=0A=
=0A=
	return ret_val;=0A=
}=0A=
=0A=
static const struct pci_device_id vsmp_pci_table[] =3D {=0A=
	{ PCI_VDEVICE(SCALEMP, PCI_DEVICE_ID_SAP_FLX_VSMP_CTL), 0, },=0A=
	{ 0, }, /* terminate list */=0A=
};=0A=
=0A=
static int vsmp_pci_probe(struct pci_dev *pci, const struct pci_device_id *=
id)=0A=
{=0A=
	struct data *d;=0A=
	int ret_val =3D 0;=0A=
=0A=
	d =3D devm_kzalloc(&pci->dev, sizeof(*d), GFP_KERNEL);=0A=
	if (IS_ERR(d))=0A=
		return PTR_ERR(d);=0A=
=0A=
	d->pdev =3D pci;=0A=
	pci_set_drvdata(pci, d);=0A=
	d->kobj =3D kobject_create_and_add(ROOT_SYFS_FOLDER, &d->pdev->dev.kobj);=
=0A=
	if (!d->kobj) {=0A=
		kfree(d);=0A=
		dev_err(&d->pdev->dev, "Failed to create vSMP sysfs entry.\n");=0A=
=0A=
		return -EINVAL;=0A=
	}=0A=
=0A=
	ret_val =3D sysfs_create_link(hypervisor_kobj, d->kobj, ROOT_SYFS_FOLDER);=
=0A=
	if (ret_val) {=0A=
		kobject_del(d->kobj);=0A=
		kfree(d);=0A=
		dev_err(&d->pdev->dev, "Failed to link obj to hypervisor, error (%d)\n", =
ret_val);=0A=
=0A=
		return ret_val;=0A=
	}=0A=
=0A=
	populate_version(d);=0A=
=0A=
	dev_info(&d->pdev->dev, "Driver up and running\n");=0A=
	return ret_val;=0A=
}=0A=
=0A=
static void vsmp_pci_remove(struct pci_dev *pci)=0A=
{=0A=
	struct data *d =3D pci_get_drvdata(pci);=0A=
=0A=
	kobject_del(d->kobj);=0A=
	sysfs_remove_link(hypervisor_kobj, ROOT_SYFS_FOLDER);=0A=
	kfree(d);=0A=
}=0A=
=0A=
static struct pci_driver vsmp_pci_driver =3D {=0A=
	.name		=3D DEVICE_NAME,=0A=
	.id_table	=3D vsmp_pci_table,=0A=
	.probe		=3D vsmp_pci_probe,=0A=
	.remove		=3D vsmp_pci_remove,=0A=
};=0A=
=0A=
module_pci_driver(vsmp_pci_driver);=0A=
=0A=
it compiles well (the kernel I use doesn't have sysfs_emit so I had to impr=
ovise) and loads well but when I cat the version file, I don't get valid da=
ta. even with printks.=0A=
printing the addresses of d from the init and the d inside the show attr fu=
nc returns different addresses.=0A=
can anyone help me understand what I'm doing wrong?=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
