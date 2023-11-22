Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2063.outbound.protection.outlook.com [40.92.19.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C821C699
	for <linux-staging@lists.linux.dev>; Wed, 22 Nov 2023 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uAWTWyaH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2yv0uAxRUc6AE7u8+T+bZK1CTZExlSGReXY7lo/s+SLz28BQ2XWbT4u7srNcR8HWZuv5xiMkRtpXz+0+d7WaXWU8acCaMFd02S03mAA4H8QojbkyO5Zp4bdeXrPFqgg59NZp2pDZzm6WYUc2lGYc/r/TRHedLQREkqfrWyLLgmDVW13ng7GGOLFHigIhRVDxKBnExk4/sxu04IpITBDlnP0lExjJKbj96lDG3BDIVwHx80AHRV5ripkJ5HgR8zm+SGrwnl1sKDT15p5wlYdbUA6JZwvNNz4FjDeFWD2iSQCK6Yc+IRE9u4hbVs0GnvbkuqTJNPDuvav32JLys9qeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnFfUAQryLhIwcojAGEiuxP1tMLSxY49tcvw0lkQhko=;
 b=Xm+ppiLxFESqqTi/rs8DFbz9LiIN4HQSoKayylUlvncQGQ1mibB+VMd0Sbigs0R929jkVUtRZ7sDhF7sqEIBQcs+t/7yWCxyfkzVrH3IejT8ZA/pKx6di02+LhrL8cPvFMyuBc7CtdaO1CxgNIvd9AZ/B0+KsCXNUtSVvAO+ejgt0Bmia2JpTOdXg/6felEkPsPcL6+Mldz5sJRHE621cO1r0IRBhjZ3LcsbBpLem/uU4eAje/hAERjXIhu6BvLeYLDwn9WCtNndPnJqB+TFjo9QpdNudZncTdsZAcSWmrQws+TKImZYiOUobUGVTRKEQN+ZxTxcbsvLlNGNzdLeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnFfUAQryLhIwcojAGEiuxP1tMLSxY49tcvw0lkQhko=;
 b=uAWTWyaHQ9mPVc77e3gi5Sy4JP5smRqDshUrR4ncKK96XUFHTkqtaMHMNF43VS+xqBiapGelNDnIICr806G7gecPs6HTn1SWowIBcBSFYcq+97yDxuwWgpkAzVB3LKf/QBg3MmU0TCh4u4wMLO9CDTHeR3sduWsbLJzMQVGQ89oDJPl3QZMkGIzjroxc92Ilm1lcTJPoVj418qeA5n1iFSvf9JAO/VCYveLl25NOtjqX6eqxHqSOR2yF59XdTn8kGLGwdKh51lqE1CU6h/XbbfPhidsCIdSJ5LiCWjarggbGuszyqdU1Wisv9ZKp7uz4sc2tL+zGT8GPtvPMpJbERQ==
Received: from PH7P221MB1008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:1ab::11)
 by CO6P221MB0710.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:141::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 09:31:12 +0000
Received: from PH7P221MB1008.NAMP221.PROD.OUTLOOK.COM
 ([fe80::274d:c380:fca:c606]) by PH7P221MB1008.NAMP221.PROD.OUTLOOK.COM
 ([fe80::274d:c380:fca:c606%5]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 09:31:12 +0000
Content-Type: multipart/mixed; boundary="===============1192048764666995828=="
From: Heloisa Ramos<heloisaramos272490@outlook.com>
To: linux-staging@lists.linux.dev
Subject: nfe-84420780-35559061773.66905601115
Date: Wed, 22 Nov 2023 09:31:11 +0000
X-TMN: [qygPAmQgRvs5VQGIYOKjjHhlPQhQqkIo]
X-ClientProxiedBy: ROAP284CA0408.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:146::18) To PH7P221MB1008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:1ab::11)
Message-ID:
 <PH7P221MB1008BA54440136BEC5A29A75C1BAA@PH7P221MB1008.NAMP221.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7P221MB1008:EE_|CO6P221MB0710:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c46c173-964d-4f03-ce34-08dbeb3dc3fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZTbsFw7dm2Vz7wVRzPRg+dz457TptV/vtIJnqTMlr6vQ/GXGyoCyFdNHQ53s?=
 =?us-ascii?Q?FVkdAE3rup3VcBfNwB3RhvCIl3ju2l5ZH41tdsgMmFHHYgZpne9JZy6dp3XH?=
 =?us-ascii?Q?SLwJsVF3bTDpH6qBfYwSInC7Plbry1s2xFfnViTLgDLZG0bsS6pnQ7vKAyzr?=
 =?us-ascii?Q?iVyhVd4J42cJKJ/VDs0nZeWTNetFmxl3g63uqJjRXx/6vLyW/BMWEEDbGKEX?=
 =?us-ascii?Q?IBsW/spgV+zlr4r+U1UOgCADveVIviKQW6gu6uNmT8IN0DfMZiGpW2wd/65s?=
 =?us-ascii?Q?4Jx1jZy7xRZ2jLE7F49a55N1IVreK9pk6sgX4bmTE/zRqa0y8lHndFzO6+iN?=
 =?us-ascii?Q?P0RvyaScN8J16DLqrid73keLx7jWVqObfp+bL4FrvtTh6fLQVDTF/+yn0/dc?=
 =?us-ascii?Q?LoaRb2kQmYLsst0SvKHYV3rMOe0YPldyj1zZXzNAhvTU7JuJcQf9lJi/kQdh?=
 =?us-ascii?Q?bfp9GE6BDG8lskJuUFuAWwfGga3sOXc9m/AWGRzJIfHw8fsC0NxjL/+x6Wgq?=
 =?us-ascii?Q?A31niMLZRhIvohF6N1Eqi7Fy85QrLAWFtlFoEpNmuYCHf+Ajzx4tyWTvJvV8?=
 =?us-ascii?Q?QWH/WyH3wki9aEdZeotJ+NBy4K6try9LQZFADIFfanYmXA5aeRchLbzbEu+k?=
 =?us-ascii?Q?kNp/HshgIDHmhYhaCbFlguVp7itPtg4pwFojDOfdGTdhDBRygw0gvWzO6L4/?=
 =?us-ascii?Q?1J7DUDcfPXlTi4UrPuApluhnwNJCg5cyxtrjEwfH8z+adgADopT1AKOSKJCN?=
 =?us-ascii?Q?GYKSpAJH79Xibh0qgNl3v/b2zgsOOBobklOC85Kf4tWAyzxGMxlLJfQ0xIe6?=
 =?us-ascii?Q?zTZlcc6U9t7itNBIXObaBr6akh7YE3zF6MH+Y/jD9EsezV0COLxXnCJwstKY?=
 =?us-ascii?Q?PMVMBhUMgYRPLZ7kzsOzaUsgN2sbHwweX9a+iaqpfRjWvsIg5Jh/0p+bgy2h?=
 =?us-ascii?Q?TomfcDW83moq/p7U7tEjrytCeRktGhVNu/EgOBvURxhEcNMpxaQ+R81JuTit?=
 =?us-ascii?Q?feTPnuScOmDj3mcXwKEiHI4OUOtHkqsWSZyttzKFrVCU4PJS7dyRASCezuHd?=
 =?us-ascii?Q?VuxToqDE4G8e0uGwHUN0v6qDGv7eKfRaTRqqHD0TYyJbOJS6YISyKUbmRZWi?=
 =?us-ascii?Q?8228mrpEzQbWxLC9WRsPmk5kUwhee/tZjh9aEdhtM3w6TsyUCdjsdGVvZIqA?=
 =?us-ascii?Q?eDKRFmY7uWKfpR6eQcXivv1LKf3tAqwRpUMWFFMV6wfWtImxoQmg+YCO0jAu?=
 =?us-ascii?Q?dpvJfHHrito6MBdavNGdQ9o3YWSEhEbOUIinOtIpFhL09nW3R3PCrvhdNyxQ?=
 =?us-ascii?Q?KsdX+YWaBJQqXqwJuMv7xEppCQVGWco9/11CoVj6G/nmLeCmyEAkQKVnm8/a?=
 =?us-ascii?Q?Hwi0ov2BFW89ZTAKvp4xDqH1c9a6gHQr+fiqljHluo2sHOZvd0JlmJDhEmHB?=
 =?us-ascii?Q?c7pAIOs1WtNoW7bUxkgLZNG0Mo1M9xG+czZO4S5uTR3pIVcqbS1IpC2pyOqK?=
 =?us-ascii?Q?ljRdL1+wEcaIPnPTHatTu4mtskxQQwco0xor59tXaKF65CANB52F3RGsEO4/?=
 =?us-ascii?Q?m9KB3nl7jMt+jOI9aHg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2LlE+kJkue6InTmkYOlPkbN0MKzpcmfthpRwZzfi9aVld3ofDPTshwfJN0v?=
 =?us-ascii?Q?zrrhBTRBBjgXwkJTeQrnDOX+GU6dKKbS1QeMSAJxpTAnxg2fnTBexzkaXKSl?=
 =?us-ascii?Q?6Ilnej3uc+XsKjCKz9LHx4y0ZI9yTz6aDReeq4kpTj78dQnX6axy/Gl2vFjf?=
 =?us-ascii?Q?7Pq+opI4N2Whg4K2totoQKSqigmQSEkuBplqxvdiRISTlUiPWmuvpujjOXNz?=
 =?us-ascii?Q?7VB8JsZd+gfj6nRb5UbLan0t4xRHgDwGApwpPer1I/Rof1a3VfSxL7YwWMjr?=
 =?us-ascii?Q?wi5TA+CdvxyKFT2T+Ic4dIzR8+hCqg5Kp4DyPgWyASALEmtXNkTh+IQ3mOWV?=
 =?us-ascii?Q?4QwCjIzsTh88V8xpeX7VvU5NILK62gZrRyqCslKEAClAUtj/EC2K7yUZ0rAE?=
 =?us-ascii?Q?d9Co5nQ+Kwjjj24QRWDQs7nKmFZ7NArTQbA1ncy6ayUdZyd06n6g/Frow+WX?=
 =?us-ascii?Q?elLOYIOdodWanyk6t7scn65HUHbb6MTkNYxePglOlTck4Q1UooHhlem3tz3F?=
 =?us-ascii?Q?/yWcev2JfZhc4cSn41nxCQHuBOoqKC1ee4BR0ln47t9hgsjaJj8ZbFBKQApX?=
 =?us-ascii?Q?ge1RILE7M5eD/3uoIXtkXFNkIWtx9kAelPu0AmyAZb+DxQcTPBInr5s9gtHN?=
 =?us-ascii?Q?mZ362St7uCGCACT9drPNvu+k6opAQfHcW+l4xUkf1VD3Ow0UCOeyk7bi6RVy?=
 =?us-ascii?Q?kA6npUEJ4GRp7EmpqjTC6G9wmjRekhu55+kIkRZVsdmbC8d75KVTMD+0F1eF?=
 =?us-ascii?Q?oeS/7U0ynm37RjM1Qhf4/cTgPL6jqU1ast1d1wsMOMydV17JnoMlSQ0cNPXV?=
 =?us-ascii?Q?ftMHjZfkwQugcY1TxMaB1UEE/ZiQnKwhp8hzcajQMNvoTKUigO7ecurb6lrO?=
 =?us-ascii?Q?2H8/wJFlUR972+XXqUoyDLpwZyxfaHvhO7Hbv72Ya23er7mFgYWWpAcQLkvS?=
 =?us-ascii?Q?Brd3AVq361resdEeSlVSincNRmg5INgoXPlo4qb0u9L4Nz6gobkEYbTfb75M?=
 =?us-ascii?Q?JAbm1bjVf8tX8Ps68PNGZJjcv0zyTWDK03XiYcDps30Px3wuwYAmfkM4AGDj?=
 =?us-ascii?Q?AETJhv4qn9tvIt3OWmSN3x1D/ii0qh8dfh+6X93gociH+RLEzpUXOhQqCse9?=
 =?us-ascii?Q?jc6/TiDafL1eUpfkVBAjrP0vRjR2UsTcF9w6I58oGsvc2M1WZsSaYhWaOdny?=
 =?us-ascii?Q?vdJ32JhbSPRXQ04dF8LoasQi5hB1zfylx+EVb8JJDWpvN4Lkph15ythHWy5z?=
 =?us-ascii?Q?NMfDJ+r9e7Yg9zg+LWny?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c46c173-964d-4f03-ce34-08dbeb3dc3fa
X-MS-Exchange-CrossTenant-AuthSource: PH7P221MB1008.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:31:12.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6P221MB0710

--===============1192048764666995828==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Segue a nfe.84420780-35559061773.66905601115 gerada conforme combinado
Tenha um bom dia.



--===============1192048764666995828==
Content-Type: application/html
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=nota-gerada-84420780-35559061773.html

PGFydGljbGU+DQogIDxwIHN0eWxlPSJtYXgtd2lkdGg6NjEwcHg7Ij4NCiAgICA8c3BhbiBoaWRk
ZW49J2hpZGRlbicgc3R5bGU9ImJhY2tncm91bmQ6bW9jY2FzaW4iPjg0NDIwNzgwLTM1NTU5MDYx
NzczLjY2OTA1NjAxMTE1NTMxOTE1NTU4PC9zcGFuPg0KICA8L3A+DQo8L2FydGljbGU+DQo8dGQg
YWxpZ249ImxlZnQiIGNsYXNzPSJlc2QtYmxvY2stdGV4dCBoLWF1dG8iIGhlaWdodD0iMjk2Ij4N
CiAgICA8cCBzdHlsZT0iZm9udC1zaXplOiAxNHB4OyBsaW5lLWhlaWdodDogMTAwJTsiPjxicj48
L3A+DQogICAgPHAgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDsgZm9udC1mYW1pbHk6IHJvYm90bywg
J2hlbHZldGljYSBuZXVlJywgaGVsdmV0aWNhLCBhcmlhbCwgc2Fucy1zZXJpZjsgbGluZS1oZWln
aHQ6IDEwMCU7Ij5TZWd1ZSBhIDxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE0cHg7IGxpbmUtaGVp
Z2h0OiAxMDAlOyI+PHN0cm9uZz5uZmUtODQ0MjA3ODAtMzU1NTkwNjE3NzMuNjY5MDU2MDExMTU8
L3N0cm9uZz48L3NwYW4+IGVtaXRpZGEgZTwvcD4NCiAgICA8cCBzdHlsZT0iZm9udC1zaXplOiAx
NXB4OyBmb250LWZhbWlseTogcm9ib3RvLCAnaGVsdmV0aWNhIG5ldWUnLCBoZWx2ZXRpY2EsIGFy
aWFsLCBzYW5zLXNlcmlmOyBsaW5lLWhlaWdodDogMTAwJTsiPmVuY2FtaW5oYWRhIGF1dG9tYXRp
Y2FtZW50ZSBwb3IgZW1haWwuPC9wPg0KICAgIDxwIHN0eWxlPSJmb250LXNpemU6IDE1cHg7IGxp
bmUtaGVpZ2h0OiAxMDAlOyI+PGJyPjwvcD4NCiAgICA8cCBzdHlsZT0iZm9udC1zaXplOiAxNXB4
OyBsaW5lLWhlaWdodDogMTAwJTsiPjxicj48L3A+DQogICAgPHAgc3R5bGU9ImZvbnQtc2l6ZTog
MTVweDsgZm9udC1mYW1pbHk6IHJvYm90bywgJ2hlbHZldGljYSBuZXVlJywgaGVsdmV0aWNhLCBh
cmlhbCwgc2Fucy1zZXJpZjsgbGluZS1oZWlnaHQ6IDEwMCU7Ij5ORmUgOiA8YSB0YXJnZXQ9Il9i
bGFuayIgaHJlZj0iaHR0cHM6Ly9qdWNhdHlvNi5hdXRvZGVzazM2MC5jb20vc2hhcmVzL2Rvd25s
b2FkL2ZpbGUvU0hkMzhiZlFUMWZiNDczMzBjOTk2ZjZiNGM5NjdiZDQ1OGVjL2RYSnVPbUZrYzJz
dWQybHdjSEp2WkRwbWN5NW1hV3hsT25abUxtOXVUSGRKY21SbFVVbHhTVFJTUlRsTk0wUlBOa0Vf
ZG1WeWMybHZiajB4P2JlZDljZGVhMjZiYzQ3NjU5NGMxMTkwOGRkMmFhNDAiPm5mZS04NDQyMDc4
MC0zNTU1OTA2MTc3My42NjkwNTYwMTExNTAwMDwvYT4gKDIxOS41Jm5ic3A7Jm5ic3A7a2IpPC9w
Pg0KICAgIDxwIHN0eWxlPSJsaW5lLWhlaWdodDogMTAwJTsiPjxicj48L3A+DQogICAgPHAgc3R5
bGU9ImxpbmUtaGVpZ2h0OiAxMDAlOyI+PGJyPjwvcD4NCiAgICA8cCBzdHlsZT0ibGluZS1oZWln
aHQ6IDEwMCU7Ij48YnI+PC9wPg0KPC90ZD4=

--===============1192048764666995828==--
