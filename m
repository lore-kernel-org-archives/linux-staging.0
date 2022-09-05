Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140050.outbound.protection.outlook.com [40.107.14.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681844416
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 15:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfhA1ELuuRJCnhzFromB5HUmqDYaNDs/IUW9K01qkpn5WKr9XG5PUASnCG5LMzskDbAtLch+64pjvgkhIXo8StnT3axMnbcR2ss784RlzmRFc/xJevDGNcjAabywYbpQAUap2V5/xooYOLwjuLl/5NUJTi/HEJh+aVc6414QlMAn10leS+9fh0kJNwySMpIPZhXAHecp9KsgdUdcEy8sqU4zMupUKJDhWCW8pZX6YHa2DfqCdI/6yqsOtUgI6Umrk1kDJzYBfgPhS651MuBHyQ9n2WzOUVkryZaYxGo/tlHsKSnRLEodrU7VHXDgI+vE9EPzOVepQKN9jqyxQTfQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hXshkkFQKd2XriSEYDPlM/gIAyIGUIQo5LrJNn3wE8=;
 b=SIzAFx3Pjg9imD9rtFbudM0Brj8qgt+I4TYE3kof2mDYJSy1gDC+cNMZBF3Yl63JfNNKQwcWj6y+gzwFqBYeHKqCQlaxaUJ9c8V4m1+wE0/MBJYtEKGFrcVTzoUEJ9+0D4/YzG1JIH2BFrjxP8pj0ajKCh06enfGvoClQl9ptxJ3xQiIlU1QsoiR6l04XLfZ3g2y5LxTc1osEyVP2lG60y0DUjNVt44syEWQyNyjDDp/WOpZZfeM5H6kycBE5BUMCEqjbokNqDCkVrtKWlUq3sUjeU6AQ7dWURY16m0JDXxyubipphdM7Fp0LIZY3PwIj7oQ8wsi2f+pcaxpRmhoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hXshkkFQKd2XriSEYDPlM/gIAyIGUIQo5LrJNn3wE8=;
 b=C7TE+09SGKU3ZQ+D2vXzccjYQJN05YhqPs6ScTkM/12MebbWZbgy0aLf+K5kmiLdhjywNm0p90oGdt+weJQ5YY1SjMd8lrZ1TjgRoAy0V2HnSZqPxZ7bE5T3jV1N4s7HrKV8/OoMDE1xoKYnWBBAbz5e85qiqft64eVeNT75lJ55KmMXDux7VdmSCesQZdVLxembjnykNo8P6XbJze2AiipJeUV3E7Bh5pZtfbrG17OkrYBbLuudPaaB38nE5IX14I8IiDREsOfOtuQFcgp3R91NC0fal3iXukJSCzRl7/ZZSDqTeJN3NgDKELXVDXIJIoGGW9olY2aNQBK/aakzlg==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DB8PR02MB5804.eurprd02.prod.outlook.com (2603:10a6:10:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 15:52:02 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 15:52:01 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "Hammer,
 Gal" <gal.hammer@sap.com>, SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: invalid drv data in show attribute
Thread-Topic: invalid drv data in show attribute
Thread-Index:
 AQHYwGq9NvHSxWjabESaa5oh/fCdV63QVbUAgAABNZSAABLdAIAAAL6qgABNnYCAAAH0kYAABi2AgAAD6Y+AAC7bgIAACcP3
Date: Mon, 5 Sep 2022 15:52:01 +0000
Message-ID:
 <PAXPR02MB7310AAA80455E4B3A97C3A1F817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXgfRx/E26kl/N7@kroah.com>
 <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXnT42bNR0got/E@kroah.com>
 <PAXPR02MB7310E5970299650B7B81B399817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxYR5SyPB6G5vDXH@kroah.com>
In-Reply-To: <YxYR5SyPB6G5vDXH@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2066937-a168-40a4-d8cf-08da8f5692c0
x-ms-traffictypediagnostic: DB8PR02MB5804:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LAXtlVoKQCBF988J09KwMMGypm/swI6wv+Sm/lre9AYTcJDC4lFda33J4QUDJ+yf08eQ1nKnVBDEygAs6EomjaUkKH0uIAukycMlvPl8tIsI6d2hPp8PwSvLv3ct9mzSh0vBXhvvtdVGMEqbKamj7NNML33GLAQrQwVgnpUqJuyMF3JIiHzaD287Y+zs/9NzVcY99zVpb0slj12Ret03hptoyVLVspnAJZgErbUP3oGzyK4WVOU5ONojBPVYzwViQtBHLu1/28dnBvAJhJD0fijjam7DbXIFtGN0rWOQmu2qJAtLXuMcohXY2s39LiD6O9jP1DBD/JaijtLBrdYB7Pyg1rEFJQLguD01eUN15Sfs5MOFKIFLbI6L9MsQtLhJhaB4re/7xG+5Myk0tPtuEjCEH+GUo1NBDloWk0JGocHktxZSna11XUOUKUaZ7qN/SmCB8MMxMIjx9yQNUvClnCk5irzsaoI9ktYHKHo59ih7eBK4W9IeS1F83t5D8tp55avPy54xhZjR2aYMpuSkhJVlLt24XtOc/wrpwQJgVxa21CCB6xonrczbO9DjGyjM6qtDPY9X+rcVsOp+0CsFO7CJTu1Pe+Iqpf+3FSEdXy6UAM+dL6IViJuP322lGfeti2coc8on36pKG4gafQD8igkvdl+S2jtXmbgJppdDzUmDA993IH1hw7ZxolCsTndrcmdtPAFzgXCr9K0Ex6Wj+MVPWJBfc98PNFPej2WKVVJMHYrPQAlyeB8nm7GrkRkk+xxHMWtbqeTm/gH2OQS7LA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(66476007)(38070700005)(5660300002)(66556008)(52536014)(66446008)(8676002)(4326008)(64756008)(91956017)(478600001)(41300700001)(66946007)(76116006)(33656002)(82960400001)(26005)(9686003)(8936002)(54906003)(71200400001)(7696005)(186003)(122000001)(38100700002)(6506007)(6916009)(2906002)(316002)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YWKFkMaoqlbK14mPZ/4eYkFb0n3RBQDlHno+/iSQh4fLi3URaC82ZIJK0T?=
 =?iso-8859-1?Q?EsezqGnLSZ/zVo+MrOvN62j58EGbQeDf3DGDwyKNIOdl9UKp9qTJVT2NCI?=
 =?iso-8859-1?Q?9DjhCHzSzRnbJT5JFS41vWKLd2WaWpKwXqQ8Ctv42JDs3N6heM1fh8cdZt?=
 =?iso-8859-1?Q?wtbfW68J5m0X6fuHTX6G7bemuS15Ofvla3ABfN0xD4Y/YK8XfJI00CQFZ3?=
 =?iso-8859-1?Q?64AFhrx4dikkSjq9enMdG/xgQdLj4AGcUKloIQXSgSAsAXRgVGh7OMsl02?=
 =?iso-8859-1?Q?36BCNzqfsLJx2DBHSo8OsYsGoea4K3pvOvLP4toD6gZQS9XQlO2wx+KRfZ?=
 =?iso-8859-1?Q?QsFa1zm6kamx1UejglqKmZ5aRuJ4TwnyhhJWd5UFZLFJdqNkmZZaRs8I3L?=
 =?iso-8859-1?Q?xlCeCSt+InQvqTzoNRmsIdW8WG5wdnoRSwPE6NC7DNCPHbf+PPAIIA9ytZ?=
 =?iso-8859-1?Q?Q/AmUos78EJHijk19KgD7+UG9AMKGtNPv3hu6aMvO2hcesm4f4jPqF1kzn?=
 =?iso-8859-1?Q?PxHxd0wcF38y6GeGL60i9JWNPcK+4wXl/c/s6FFmVVOg7k8IJQOPIw1M+1?=
 =?iso-8859-1?Q?K3jPn8VzOOBcgtIY3WkxZ1p2XKVU/M8jW3XRXrFxKmgXk11wPzRNFppX9E?=
 =?iso-8859-1?Q?/CWLrpPkY5gLn9cZTit+nC3m+OPTnQah3btQsrTq6bYUy/c6ia4jcIGk5C?=
 =?iso-8859-1?Q?Cvwye8+jFsQxomjj4DEH10ZkjK0A7xHlxeOq1H30cXswDsXCftCxaDCz9W?=
 =?iso-8859-1?Q?jqPS23mx0QzVGtgOSX6XFMX/Hwg5XG/Hf3Ckhfi5Xi9y4vDbWuWzke8YWm?=
 =?iso-8859-1?Q?zxAJNlDOI4TWP1uzrXZLGiSYt8eLxnkyHRpyC+ddEgv2vgo4W501BZY9FJ?=
 =?iso-8859-1?Q?HwSoASzw/O5gABxOYubtBQhTtqd5bhyUxbqt0PQ9uJx3raCNkIiXF6L+nJ?=
 =?iso-8859-1?Q?2YGGsv9014BGrtqaQ9SWapMUsRAnqzIAdwD1RWXMseiKB/4WWfcQBhVq5s?=
 =?iso-8859-1?Q?CvPEpe/CG3t4831VIPEgIAXq2SnaUwA5W4OdM0+qinY3w31/3uz+Ne05Mn?=
 =?iso-8859-1?Q?q8gCIePIm7iapVvBaTnqopZlnqeVwvkmV/wjfFrqPWedHku6eC0Bem2lHB?=
 =?iso-8859-1?Q?vTWIgdsU5SWfwLGU1zOCRg1pdoGJlX/dA6jZfko+Pd9PPlqLp4+JSMSJMc?=
 =?iso-8859-1?Q?wzNG4h619dJnydCejVTXhxdGhIXT3O/lqMKcuQqxFW/C1a4ExPSEn3stmm?=
 =?iso-8859-1?Q?C9UxBz92QzfN5/EBuJhCcXlu5pDbbhHb0tbwnHl9WYqeJc2W8JzSEB1kmP?=
 =?iso-8859-1?Q?hSFTF0Ovi18M+5Cdy0y8IzNWJWjyiRjvqN8+3+evqAPg4qMOSeroNnzt5h?=
 =?iso-8859-1?Q?6UwEhtisxDtdY02uT+TESR4e3q7SziqJVECze5P7DvccQE+C+Tfj5m48LS?=
 =?iso-8859-1?Q?aubAUF1otJmW5eCvS3qx96rNpiq0cNIVJ8SJwo1QsZ7i6srq6xDPUryB+a?=
 =?iso-8859-1?Q?qqMq7V7ffNERz+61/h7cHQ2wfnrvKi3LhMkhelrWorOp+QC1mgfqEliUpy?=
 =?iso-8859-1?Q?0m3zPkcRZAVY745uCHnmVLC/NyoFOVU9eEI9LYVnZBP3wMaA9Vgb6BuzBy?=
 =?iso-8859-1?Q?wQpBalwvmDAgddoNq5tlTmPogUyRdolJic?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d2066937-a168-40a4-d8cf-08da8f5692c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 15:52:01.8105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1bCXmsVwFvfWmVLCC5z8h2mphKaLmSLv2X8p3Yezah6aFc8mng5K9wqSi5glhvHnDK9JO8TUNYv1Ola+LeFjZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5804

>On Mon, Sep 05, 2022 at 12:56:29PM +0000, Czerwacki, Eial wrote:=0A=
>> >And aren't there others at your company that can help you with this?=0A=
>> afaik, there is not expert on kernel in the company.=0A=
>> there are some workers that have experience in kernel development but th=
ey are from our team=0A=
>=0A=
>SAP is a big company, I think you should seek them out if you are=0A=
>wanting to add new subsystems to the kernel to get their help as doing=0A=
>this is not a trivial task.=0A=
I'll try to reach out however I'm not sure there is any.=0A=
=0A=
>=0A=
>> >> I'd prefer not adding complex code to the utils which need to travers=
e the sysfs tree to collect the right data=0A=
>> >=0A=
>> >for device in $(ls /sys/bus/vsmp/device/); do=0A=
>> now I understand!=0A=
>> that is what I was missing.=0A=
>> so inside /sys/bus/vsmp/device/ I can find the following tree?=0A=
>> 1=0A=
>> 2=0A=
>> 3=0A=
>> ...=0A=
>> n=0A=
>> ?=0A=
>=0A=
>Yes, or how ever you want to name these "boards".=0A=
/sys/bus/vsmp/boards/ or /sys/bus/vsmp/device/board#?=0A=
=0A=
>=0A=
>> so I can create entries in /sys/hypervisor/vsmp for the global info=0A=
>=0A=
>Yes.=0A=
>=0A=
>> and link /sys/bus/vsmp/device/ to /sys/hypervisor/vsmp/boards?=0A=
>=0A=
>No symlink needed at all, they are independent things, right?=A0 What=0A=
>would require such a symlink?=0A=
>=0A=
>thanks,=0A=
>=0A=
>greg k-h=0A=
I'd rather have all the info under one place than in multiple places if pos=
sible.=0A=
is seams more logical to me=0A=
=0A=
Eial=
