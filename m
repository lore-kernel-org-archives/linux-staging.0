Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D813A1A681A;
	Tue, 24 Mar 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360883; cv=fail; b=cpNRcGmZkewFkl5gE5qmrWiFic+b8geiXKc9OkX2A+32yK8+P4BLRONcQ6LUeVHwOMU0Q1bq8c+ABvvW+lTMUXY8iTC2yOo2AT7XrBjI1hHJuMkq7smOwdrIzck+ukRBk6pCAYU29cBuRuQzSMkPGhWvXnZ7naoJLVTTf9uZ+nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360883; c=relaxed/simple;
	bh=/tsEU8zRPQynbAS0EXtxuLeeFhymAkArvt1b18/7Xgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UiljgCd5IVrMmkRJulx/89YY2TJZCaBphVuuOXYxv9/cgREH2BsD4fu/WZ5GDdQI+3ek3651QZ/48gfhwfFGFVupyYnOq86J5cO6epv3awfPHENwQi74UyDutjUZzIA1PQ7deMwrUlHRKkoE6FYWnHR5u4t0TGmP0GXCXWCjc2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=LNreqS7+; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=QzTGnNMw; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="LNreqS7+";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="QzTGnNMw"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7ZFwi1409221;
	Tue, 24 Mar 2026 09:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=9VXrwkjg4ESeJeZgBeHMgHXCVi01/vCsk4cQXJSCjkk=; b=LNreqS7+peg2
	pSlv6DgWOuVx6+x0Qy+i6S9ayDdymdr3T6/yagpAReFrYBmn9Wdn68ty73xbMV/p
	0f7Xv8mmcEzVwxv31nZ6qe6J5IuokVQvq33es2SyHWkHlypz5pyBEUpz73VNyENd
	T4BOBYK4m685GhlfxOHFJqBbkTiF5QJg2MbauJWgYNMTprmzMp2g0lmmdCfbRHeO
	ErxViF9gW+pec/wVo5ohNXs9oq8k9d5tynl0yvZjArPJPcc8VJ9jlrTknNSRM2uL
	QfLw9VhtBJ20W3+YujF/ucQlKjgu+/CF+tvXDKDSOoF5dH4MYDQkqZtl2TQ9ZGpg
	Ll6mnOzNLQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023105.outbound.protection.outlook.com [40.107.201.105])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4d1qn5dxka-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 09:00:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWUCy7CgJiy93n1oeAJn/WsWOxNc2Cv/UqHrQLxGO8ZBkk2i39TUDD/8zHsW+nYE7Pnb4lmSPyHF61mzhvRe65mSrYWdgau+2gAoi9P+4kKGExiSNYyQRM9H/zU4mJ2yCJLt0R6PKCadkx+ho0auOI+eljHhLI51BLZ6gR5oKrEWM+5mpJxJpYb7NZHBgPTTMbQ3wkMzdrpUHOFU0sFDwhdWwduwtzaxPGu80w9E66HkRR8guJOUieSHaScLF3mFlYLI7gwhHFrWTzKc4Y17esrbD9YenATaTuKWI6QdRUETM7shzmtEVj/56U9ouHTHaWMGzCgDzggdgxzROnrMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VXrwkjg4ESeJeZgBeHMgHXCVi01/vCsk4cQXJSCjkk=;
 b=kduZ1nv7xDLZ7Xy+We9CDrkc2hIHqJmOx4BG2XoDCausw7Eth1Le3mmA/Ydkaq/vhKgwUn2CHHgmLUNSvTc3Z0mDUgFFkkM5hGmx69MZGdEzudjcLZy+mCaqzRSuBVa6DpCJhtOxsXc1993i/ezRrgjupRPzPupDUwNHwHim1RwOL/psLZwEBcF3llfjkG0mkPMTku7VBfuSGUyj9vDZxwFYXX/gS2hci/tF9RBRkpo6IQO/Bh5LFKuqOdD0v026noFdY72HVEVw5UQnNrBgoE+a60/8I3k1+9KNFv62d4SF++454U1d6eKfEMzqJHuBwHyGjcygY4X5SJmFXtwThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VXrwkjg4ESeJeZgBeHMgHXCVi01/vCsk4cQXJSCjkk=;
 b=QzTGnNMwt51+2kWM/X7SEYea02y1iVpIsxVVjf7xvotVppMrZ5a1eRKVxXFFiPz1x98vSTRu8rvLcFqiK7wVplMHWNaSKQj+tKifreyiZyEr4IJtWC0vsFt7bp0hcPXsbeVQGvlr/YUYsPLDUhHHvJLgYbYnp5zrDoMzJTMyQg8=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:00:51 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 14:00:51 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [PATCH v4 2/2] greybus: raw: fix use-after-free if write is called after disconnect
Date: Tue, 24 Mar 2026 10:00:39 -0400
Message-ID: <20260324140039.40001-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324140039.40001-1-damien.riegel@silabs.com>
References: <20260324140039.40001-1-damien.riegel@silabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::16) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec3e979-479c-4fce-3a19-08de89adc1a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	okMb8POdpJNluqujr05Nxonu65fryYktqnUjSH+ggL08QmJIBV+VEHd+nruzdFKBhzy4xekc3VFneG39Zc1X/xHTLA0m2tOc8Tpxao6BoE1tEiWExXq530hDy0q/LW4ddPO9qnhq/s6E66PrcaBgZJMMKstfvTFC1ZSmjZsbZYIXYJHHsHHHlO9JfNNOxy8lkuDrF7IO98JPbJmzWg8kwFQxZfDoa9/TTToedhBho+6+ZSzoyxEMWf5R8tRbpbr/f0olkaMySWjJT1iNIwgFUfceUDXIMqR8iXXrnJrmPBy2d4eP54I4aPBXKaECnuzIzTnThu5FYTKtxBOx3xNUMV2uVo8ZsyxOspouNSy4QmuAiJp3zrrcLCDbLfGvY5y7FPwZdPCz/04M9uJCE8W69tpj2NOAA9l5vSo2XxMSxWqZpNFjSz3bXkx2l4SJzgAxjrHTUtpZuwecDneHmJMoP1kres3Wr3vtPzxP4PP8zCJBSdJB5fc8t4a3a0UfJWtLgSlD+g3KSP1kT6e+jWksQ+7CtVglkGoaX8Kl3jn1JkG1MrhN/ytZrb5B8NfFmi1XNnHzuov11Rej8LEhmir5iajr0o1kM2yl4M8qMxpynedjLzwl83aytXz+vOdLzF+0415YGpwGrRbxCoAyvjUQ4o9qzgr+W/MHg8JReFfPfHvaonSiEUBKJB6xGRuVxj6QeZWtr6Tg572dR9byynOeW3+SP8hWgm4wTCxnGDlElhBJS4zBJ6TEV0LEBToHoe0optNFaleUKbb2kmrE0UINQo7RsAwf5fIUu8zgKhK76yI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHpjNThHOEd0c3V1bEcvWGh4NlNWeXdrYURwQnl0TmM3emVJaTRpNEh0bzlu?=
 =?utf-8?B?V0doMk9Kb0c5Q0hpNzVHcUIyUjdzWDdCaFNMU2J4LzNsdFN0aXJVTUdTbmZy?=
 =?utf-8?B?cnhOOGtyU2tkQnJZbHZXK1VmenFsbW56alV0djIwZHlsUEJOaEVZZHRrWFRO?=
 =?utf-8?B?UHQwQ0p0YnY4U3ZpOFFEQUlqYnd2M2M1THRmbjEyU0l1cVFCcytvL04xZHVK?=
 =?utf-8?B?Wlc3ZktiWXZ6ZGpuTVZDVU00cHBNMjdYQllVRVMzUGtVQXlUL0N1YlFLK1Bi?=
 =?utf-8?B?UCsrRUwzZ3UwVjZqMC9jQ0g2YVlSWkcySUZ2TmtyNzlBYThMeEtVb1lVRXVU?=
 =?utf-8?B?NWZ3dXRpdUxKQXRMUzAwdTVJa3dwQlUya3FkSFk0dnVweWtzOHFWa2pESlVx?=
 =?utf-8?B?OGRITGIxOUxoY2dwZFhRNHdxanlJK2RURzBqcEFrbkR6bGQ0bGxTdE1ocjly?=
 =?utf-8?B?eVVyOW5oTklIK0lua2Z2VGlTWmxEUFBzWlhyNDhyYnZNbitGYjFzUDRweG53?=
 =?utf-8?B?S3JPNXM0TVBoVDlqSXVQem03cmpqRkliNFpnUzZuc3RqL2VuTW1TSDZZaXdk?=
 =?utf-8?B?SG5QUkdyMkN5UVBTVlZWUTlGMGRSbGo3SUpkc0VlRk56VjJmTVZEelNzQUNw?=
 =?utf-8?B?MTlKM0ZuamVIQWQrMTJHSTlyaGZ5NmlYYjRXVldzS3N6YU1POXBFamFRV3NJ?=
 =?utf-8?B?aU9sTTNjQkQvUERZVHppN3pkY0paeFJJbkdHZHpJbS80NEYrR3MxNU9Yd1pW?=
 =?utf-8?B?V0gybmhMUVYyL25uUkNoQjFyTEJSQ01JbzkyaEkyZU9UNlMwcTI3TkZLbEt5?=
 =?utf-8?B?bFZGMVBQWkY2RzNwSmx6d1VPY0NReXlkU2k5V2xpWHJ6SytqamVjYmQ0akYw?=
 =?utf-8?B?eGNaTkQ3UzlSdFN6ek43MFI2VDFlRVNBbEVkVVN1L3VqU2ZYc3ZGTTEwUHlH?=
 =?utf-8?B?N2VwTnJCYmN4U3hHUlpnTjFaQkxpaWNYUFZDejRQMFNaUk04MnNvbXl0Ukly?=
 =?utf-8?B?VkVsUmk3bDlmK2RZZXNudExudDZMLzd4RUJ2czFhMDlEeldCMXVtOHNoK1h0?=
 =?utf-8?B?Z1BMK2U1OWlYQ0hXdEdvYnUvdTFvM0NCUmRTbXEzeDZTaHYwYVpObmtDNEhN?=
 =?utf-8?B?QUtWZFlsYnhBNEFMRUZ2QUZxV2hYUUtOaEFoSW95Q2hUVEVtU0haam5aUk9v?=
 =?utf-8?B?T0JkOXF4SW1xQWowQjFnemZGUTNveHI2Q2hxZndhLzBLVmlVbWZZODZPMGZI?=
 =?utf-8?B?R00ydTFkN2dqWHZhSUxTUlcwSytpclo2YVhYdlgzSk1oVzA1d29pSXAwNExq?=
 =?utf-8?B?UkxBRmlMNEdMUjlOeW5qRGUxWWdzNzNweDhCckI5eTcxa3VWVElDSEljMjNH?=
 =?utf-8?B?d3R6ejZLUmtjNFdQRTJGSXYwSGtEa0lVNzF3YnVRcVlISm1Nak1vY2xTbEsv?=
 =?utf-8?B?TStoNW9ZaUFVMktYVmQxY3NEelRQRHJza2JJY0ZueTZOV3VRM3Q3eXViMU9H?=
 =?utf-8?B?QlZvYVorQXlOcHNUK1ZxeEpRZUVMQnpyZEZ1THVLL1RtVEx1cFZUOHlIUjBn?=
 =?utf-8?B?MnNXanptdFEwREh4RzVxOWprakx4dG9NRWl0N2ZGcllpTUx3OGhHVHAyVG5k?=
 =?utf-8?B?WDd5VUZJWkdJOXcxQkhTdVhBdGNiZkwvVXlzcm02Q2hrT0pkNXNFcnhERU9H?=
 =?utf-8?B?UGlnTWRSQWNMUGJLSklBNmFvZ2Z3NVpJODl0OCtFeUJ0d0J2WGxmcEJNc3hZ?=
 =?utf-8?B?ZEJwMThIN2kycTMxYWdyVGRLTk96SW54RG5aMHNnbTB5bG91ZWlQc0hLbmtS?=
 =?utf-8?B?L0kvek5DbVdNblB4R3dMcVBhU3hJVXhIa2Z2Yjl5djdoeE1FL3U0SG5CYXh6?=
 =?utf-8?B?aktPQXc3bE5TQ0NOK0ZRcHVFcUxaQ2pMSjl3UE5qc2NMVmIxK1ZwcWEva2d2?=
 =?utf-8?B?Z2c3Yy9wMVJVSm5CMjNEbUZUbVZza3VMRjh1NGtja3dqdVJoc294Si9OMzhV?=
 =?utf-8?B?S2xKa3B4cTcyeGo1UnFXTGkyWFgvQ2prT1grUGJ6T2ZJbDZtZS9UUzBVbEJ4?=
 =?utf-8?B?NS85R1VjdU5qRE9TWWJNL2ZiaUx6a1ZyUndTcXRhMElVSFNLTEJwckhQM3d0?=
 =?utf-8?B?WG5zNVJUTysvZjRUOUhsVUozNlhTaTN3STQxWVRaMHV1ekVLVTdFOGVVVnNo?=
 =?utf-8?B?bVhUdVRteGlEZWtBYkpBVE1HclRTdmJ4WUY4V2tnbFlFYlhMU0I4ZURCQ0Nu?=
 =?utf-8?B?cWRHTGlyOWh1Z0VUMWRaaXI2Wk0zMU50d2w1WThLajJlTGsxUVBpcDZzdmNt?=
 =?utf-8?B?c09oTExIUzY2OUYwbXhhb05zV1ppcFRyTXJLMVp4MFFZTzI0MlhpZz09?=
X-Exchange-RoutingPolicyChecked:
	PRMawV7RplyfwciWc88RYTXsoYgVNLS6v9w6zWH3eJ6iq9F64HHNtD4JXzjJ7xDWvYLnPvnLtCtIVhPDlMvIHTotPOhXfU1sCOBL63MxJoyHoqRe6RyDOif/cLbc/b42YbvNRjJdWDRk/k0A7j/oxwb6pGQjU8oDe+uv4JiYPVRB+Mo9wRrm8lFl3x+ZwKPIOpfeUvq082hliquuOkw06bAbn4JqL5WG8Z/DmPX48y5yXscKK8HvCjDDMJZqzi95gRVKl//b74ikgvs230FqZAHRsR8HvbQEr7ENS44QQxZ5BC2G2cTHCVqiDHlDAboVmKwOg+X5v9BRlCcd4uLhgw==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec3e979-479c-4fce-3a19-08de89adc1a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:00:50.6817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrPV4DWuYltaFRlGB8DB8q5g7ovmyRyDK7bXX82p62uAkaz9ccaYlHyO12nFWHCNeHeMH9qs7c4c7p73U7jQXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-Authority-Analysis: v=2.4 cv=T5CBjvKQ c=1 sm=1 tr=0 ts=69c29916 cx=c_pps
 a=mXWPUgXNGD4LDRIkHGcDmw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=VwQbUJbxAAAA:8 a=2AEO0YjSAAAA:8
 a=g3cNx9zKZhjWjZNNIMcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: iTBY7Jd0-Lk5w7fWaSmTf11PiknxSoxp
X-Proofpoint-GUID: iTBY7Jd0-Lk5w7fWaSmTf11PiknxSoxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExMCBTYWx0ZWRfXzMgQAeiY3t6W
 gZbQWuNNKAkQN9xk/h1UXwo5YU7Wfx6+6mIqDFAtE0x6hxLCjYGvyOgqN0rAm0ibuw+MrAU6soM
 S1/R3OTTbldQ4uZ6qrV+lOc5pwFZbboDlbv7Aiyreixbpkv+nTRDVqRjofZF+13aihQy5i7aRh/
 H8CUSxQ/+7eA8AxuXynpiexVxYz8LKK+e489hMvVqgLdptJuh/ov+8PaU3F0ec6PL+FNcqJnWe4
 fus2l/+G0bIgbWIDco11cjttCAbwZUO1YBiqcpnq5QpKQUuEf6yPLDYEOEgqVXL7jyJGAJhES5n
 +0DJNYuSTJ6/Eul5byh3bacdOTfZG07vUKcJ8BMRM0kroUrUyqsJjEJ310HkK5OoxYqc6UScTvN
 brHq/oP0V9E5QGLb7nmNtc3dsaPbHKm1kKXCANTsfoMNIM+9tEqEMwgCUybEXI2sTVkZt4coKvg
 WVZwZXlcySRlYvkWP/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240110

If a user writes to the chardev after disconnect has been called, the
kernel panics with the following trace (with
CONFIG_INIT_ON_FREE_DEFAULT_ON=y):

        BUG: kernel NULL pointer dereference, address: 0000000000000218
         ...
        Call Trace:
         <TASK>
         gb_operation_create_common+0x61/0x180
         gb_operation_create_flags+0x28/0xa0
         gb_operation_sync_timeout+0x6f/0x100
         raw_write+0x7b/0xc7 [gb_raw]
         vfs_write+0xcf/0x420
         ? task_mm_cid_work+0x136/0x220
         ksys_write+0x63/0xe0
         do_syscall_64+0xa4/0x290
         entry_SYSCALL_64_after_hwframe+0x77/0x7f

Disconnect calls gb_connection_destroy, which ends up freeing the
connection object. When gb_operation_sync is called in the write file
operations, its gets a freed connection as parameter and the kernel
panics.

The gb_connection_destroy cannot be moved out of the disconnect
function, as the Greybus subsystem expect all connections belonging to a
bundle to be destroyed when disconnect returns.

To prevent this bug, use a rw lock to synchronize access between write
and disconnect. This guarantees that the write function doesn't try
to use a disconnected connection.

Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
Changes in v4:
  - rebase on v7.0-rc4 (no changes)
  - the return value of gb_raw_send now goes to "exit" label in case of
    error
  - add Reviewed-By: Johan Hovold

Changes in v3:
  - rename "connected" flag to "disconnected"
  - acquire/release of write semaphore acquire/release were in
    gb_raw_send, move them to the caller instead (raw_write)

Changes in v2:
  - trim down trace in commit message to keep only the essential part
  - convert the mutex that protected the connection to a rw_semaphore
  - use a "connected" flag instead of relying on the connection pointer
    being NULL or not

 drivers/staging/greybus/raw.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 47a984554681..459aed0f1240 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -21,6 +21,8 @@ struct gb_raw {
 	struct list_head list;
 	int list_data;
 	struct mutex list_lock;
+	struct rw_semaphore disconnect_lock;
+	bool disconnected;
 	struct cdev cdev;
 	struct device dev;
 };
@@ -200,6 +202,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 
 	INIT_LIST_HEAD(&raw->list);
 	mutex_init(&raw->list_lock);
+	init_rwsem(&raw->disconnect_lock);
 
 	raw->connection = connection;
 	greybus_set_drvdata(bundle, raw);
@@ -235,6 +238,11 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *temp;
 
 	cdev_device_del(&raw->cdev, &raw->dev);
+
+	down_write(&raw->disconnect_lock);
+	raw->disconnected = true;
+	up_write(&raw->disconnect_lock);
+
 	gb_connection_disable(connection);
 	gb_connection_destroy(connection);
 
@@ -277,11 +285,22 @@ static ssize_t raw_write(struct file *file, const char __user *buf,
 	if (count > MAX_PACKET_SIZE)
 		return -E2BIG;
 
+	down_read(&raw->disconnect_lock);
+
+	if (raw->disconnected) {
+		retval = -ENODEV;
+		goto exit;
+	}
+
 	retval = gb_raw_send(raw, count, buf);
 	if (retval)
-		return retval;
+		goto exit;
 
-	return count;
+	retval = count;
+exit:
+	up_read(&raw->disconnect_lock);
+
+	return retval;
 }
 
 static ssize_t raw_read(struct file *file, char __user *buf, size_t count,
-- 
2.52.0

