Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A862346AD6;
	Wed, 11 Mar 2026 21:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773264482; cv=fail; b=AXjYutmq7Gkf4nUy0GGFZaC6CjKnJUu4q4MQV5HXNr8KDX2VQ3v+xB1w28hVJG0NPtbC4bwOtbapqdS9RCJMGd9K4793XaU9T4iBq4jHlFpm2zlUkNlCpqCfgs7CYql2+bx3qpsTG0A5g5SmDDsty1e7x4Ett1r+rkLNpZ5VtZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773264482; c=relaxed/simple;
	bh=utSYjaamOC2YDKtKM/z8kJHJk+ebbKvesAKqbZ7oJZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V5Th5heCLdH3M49xVj6vF/G9HvK1dPfNHK5/2x3ZShP4cK6ldK4ZP2QoecGlRGPO7mTl3yY0IUI9Fhze1vz9CH5cqPOBC29i0288uckThn0oQYbsnzy7HXEN/dIOfCHb1ufz54SRcp2nIoDICRtudrZIMgDqrJsvA9QMl88ae3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=kdklKW7g; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=K5vzNHuY; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="kdklKW7g";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="K5vzNHuY"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BJG3VW1211720;
	Wed, 11 Mar 2026 16:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=18HeeNSkWQjGINCba2bkXVN8snBEWNlV1NEtwxDRdBk=; b=kdklKW7gaBDa
	NWHgmHCmS+Z8i9v3eD8HuAOhE4/BRnmk9iURh9Nv5kuRa07Y02I0XvLlJT69DJ+y
	zWekmcgloH+Tg/Q7NpAsXZcUunTV/E3Ny0iGbjGsX8r1hZ/HRDFF6SmQZX8rLhJZ
	OTrBbuXPhw2vLOiwEA0XDR4lr4outjXlaHqczvNFQQTtijHp8TLrQJuWMNfcpA7/
	7a+rmS8FxwBckkyndDTO3bRegGId5FOf7L0RYzo6+KN+I6Ugy2LsQlXQCtEnqJJD
	bBgG+LKVZxDeJiLU2gTrbwZsimNqKSTsPvTbxaoPUj8xhXoyzvp0+FVmldm8EdTe
	6oO1NClnPg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023079.outbound.protection.outlook.com [40.107.201.79])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4crh7c2015-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 16:25:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MInACoE/3HqkW+Hqla4JqNcUYdp+a9YlZUEUKVndAOiJymwVCLTTG1dEtYzrxzJridOGnnkokQMpiESV23or+rnf7awqxQfbz/z2RdzOSp0SWGvX71X11AF41a+RQCdyPABEB0NK6iFPxwqUq7upxzdABclthvwNovVXu4BZ56J4U/38GsnzfAjsdfun6G5AHd1S+GhCpJ4Fe/0CO2AbGLnVBnxqMHljKMoN2mim7ehu2oqH4LNPFpAypDCR+bZHPdT5Ytp6Zkr5aSp8YS+osSt37y6j0rifU2WBg6jUuqdt1hKVKKMkPTT+YMFVefjTIferRBMQsPun+Gp1iu103Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18HeeNSkWQjGINCba2bkXVN8snBEWNlV1NEtwxDRdBk=;
 b=IQgmtHPzsWYukxxb3mm51AIgKktxvONJAvq9w0dheKbbP6goweQKfkfzJqfl1dGjgpbf3jpf7YvOJXlVy5/PEu6XIHZKc6lvNDyu9TuikDc8FX9Q8XVdQOFs260MUqBKCGY0kEvY+590yNXaj0T9YU+ipG98bDzsxyKu149dfWNHpfbNDWD3sI/z7aGTm7xBEV5bTZA1efHW30osXPu3wqwGuM11HFu/4/jaq7T0OxFmfokU9+hCeaHA+W/s15/GOpx8pQjDXPpY6cwGu6t4bmHk+/BmyPKrlo5nlDOK40EW6EB2UfazCmbgtn34kX97jTFACx3fqnZ7XYvn/lDrkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18HeeNSkWQjGINCba2bkXVN8snBEWNlV1NEtwxDRdBk=;
 b=K5vzNHuYkdjec9ML/5hrc8oR1XrIjNTAWwFFwkWQS0yALQPNLykK8Ant8b1WlcTMZDGz9iSs3XNHu4QapMaFR4lClwnk1R/uEwBtZVyvLa1ahIdWO4lmbR/AFDN0cBK82nXVaslXFTarQgByEwNIYCQ2MTQlyKhoUE4cv/fh7Ms=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 21:25:23 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 21:25:23 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        greybus-dev@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [PATCH 2/2 RESEND] greybus: raw: fix use-after-free if write is called after disconnect
Date: Wed, 11 Mar 2026 17:25:11 -0400
Message-ID: <20260311212511.82563-2-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260311212511.82563-1-damien.riegel@silabs.com>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0261.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::28) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d922fd-cddf-4ae4-452b-08de7fb4b490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	G/JLtGb5kOOgymWJrQQQKDL2EvP3M95a2zz4f5mAYcjBeiJ3g7On6pui9B/V9gcp9d7YMJtnhLb5WNbD1po/6PxG9vZnL5EMPHbCpei3T2lMOd9fL4jiAsah2DqoyWkFTR/LuUoAQwCgE5S36tMUorQ5pGyFaH97coe5UTiin9oej/tD9OJbf8abJMiEFQ2MvEkWxgEmiBasPHVkDiyIudx8IWRGqR9rOFJ5Jy6l5SZ3dD6g3QBQLr65pcE305Um303WajxCJnbqhoRrrHvU+PhcjnxcVCGbcADJgx4w7XOS64IcRAerjzTh47Cnc8fb78vN++ZZFF8ss6PPdSpMILVe/mQiobZf7s6cpjS16vWizovHQCFg4u9+FfKWYwcWvCpD4cGkjwAcyF3KQSz8C09nUtzV4M0GUiTSdzGDdxvGV1QkCVT/PK8Y8//55+ePWtsELD4rDX6sdaZQamgdFYr1RoQUPjHsHWFH3XedBl4KC8/dUdMp3eJ3PbQ0zmJKKlWNPvbpQSrdAMOokzTdEz0EMg+ZIz1LMeBUBsNVuDCOYyD7vs0TOAldU4KatbvIDPC7RZT23gDW2oirOceAjFk4IiM4ezlibaf69vX1mD3jYrGEqm/+9HciYLsvuRixVbwFMEPo6DAPMfDpWMpxNslgXd+pwiT5vfHBcA8316ikhPAc/DVYSBGmDwh5ZfyaxndpjFogNJ4F4wPzZ5QQLFcmWcVBgsEZQ5OICLRooQyyF6Xeco3jgTuHe8LlxazFTVL7uD31T4zSXp78eFC5CP8FuylPhsQI1mXNWwU6GUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEpjeFVaNlBSNmhNT3RIRXdSNGd6VEFhREg1c01xczlucTFSbmtaUW5YTWJI?=
 =?utf-8?B?LzMySUtueVV5eUs4YzM2ZHc2ZXUyVFZqaERhMk9vZzM5SHVUY3NyNDdXTFdw?=
 =?utf-8?B?WXNIU01qek9MZmlXdEFNZVdmVVZLRXNmQmRWWjduMzBOVzhWL280SHZtY29G?=
 =?utf-8?B?N0pjVjhzbFpQMThDaUN2ZFVDYVRJdzczUjdvR3dXK1BSUWJGa0p2bWREU05a?=
 =?utf-8?B?djZKWUVlZk12ZlJvWVczMHp2bU9nK25uaFAzajJ2QUF2MCtRWE5qd3RkOWJm?=
 =?utf-8?B?bThhTEN2bHJ2ZXByTXRUVklUSEZMWWhHZGNaMjhNSkIzcHF6K2wwTncwQUhQ?=
 =?utf-8?B?dDhFVnBEbXhNKzdvTGtDUDZFS05tSmhPYU1RTlYwOUZ5eExjTi92aWdaZlBU?=
 =?utf-8?B?NkdCVEJUNXFnTUp3UjRPUXRNTjdqLzNFL2RzekpzcVlDMXFNanJhWU5FZXJ2?=
 =?utf-8?B?dksrTTdwOU5INWl4aENoUHZlbGNBcGErYXVHNGp4Y0JuVmd3S0FIVjBodmxE?=
 =?utf-8?B?ZGU0VlF5eEtYUzkzNjBxUC9FMzhDakQ5TDQ5d2VWY3FYNkpZSXd6NElKUGFS?=
 =?utf-8?B?Rlo0Y1VzaG1KTWdBdGdaNHh4YzBwM1FmKzhmek91T3UxN3N5SlJ4ZlpDek9s?=
 =?utf-8?B?UFNGRDBsczZQcnhZZ05QWU1MQkZ5bGJOUHVTTjlBbkZFeUROQi85SGt1MjFB?=
 =?utf-8?B?R1paN0Fxb1I0a2lxSDZFMTZick9yQzRieVV1Q0FvRTgwRXRSVkZZTDU2enl6?=
 =?utf-8?B?QWV4a0FTSHBrckV1MnBxZlJXSGJIcmoydnQwYUhucm1CWFdPVGNFLzcxZG5J?=
 =?utf-8?B?Qk9qUlNSNGM1UTlHTFpYZVh0WEJkY0d6TFZqNTBqT0FxeDlSTE1EYnJPd3Er?=
 =?utf-8?B?ZkxYWmN3TklmamhMREJtT3pmTGNGSkVLcGJkYWczbEk1eHJ0QW0vdDl3cm9B?=
 =?utf-8?B?blh5Vjdlbms2cWtrdTN0NlIwaGN3QS91cmpZSFBISTZkUE5CazFJNGFBVzNM?=
 =?utf-8?B?SzZpK1VyWW4vTjh1R2cyV2xPNUN1eHFkRXZwY3g1OW5UVGNWbkFKUmtWNkgz?=
 =?utf-8?B?UlRQMmxNZHZydTFMYkhvZnMyQjU2Zy9UQUIyQk5xNnJubTNNOXk4WHN2L25Q?=
 =?utf-8?B?TGFuLzJNc1ZZWTNmMytUOXBJdHF0NUNkalROQzdUUHl6d25xMHBhRit2WW13?=
 =?utf-8?B?Q1YwVVZwT3pBZzU5eTdsaVNTdGo3WDFXSXVLNVpxNzNRd0Q5a3FFWnZFUDcw?=
 =?utf-8?B?RkxmaHNGczY4d2VRNFd6T09yTTlRaTMvMktrVlQ3V25NK29kMHFCZUpGaVZq?=
 =?utf-8?B?a3FrTkRUVTVBV2JpcysvWDlRVEpGUGZSNUd2S29VUlpyd0V6YWMxZEI5dnpo?=
 =?utf-8?B?U1JnTWV1ZjEwZ3Zvd0ZQa1RYTWR0WUErcnhQY1F6dXJYQXJwL0xGSDVLdFlV?=
 =?utf-8?B?K3lXa09PckxpSkczWUhyOHcwemxGMDNSQmV3MDlFTjZhaDFreE5rRlVYd2o0?=
 =?utf-8?B?N1VCbmVudzh1b1FEZnZybTRERmJySlRyWEk4MkJlQVN0OHNPTkRVQ09GbjVH?=
 =?utf-8?B?QjlKYU43UVhRb3BmNDNwa1lHOWx6TnNOQVNOM2lBYWg5d1FvTE13b0UyS3Y4?=
 =?utf-8?B?TDhxQjdjTXlUeUZJVjhYQ3AwT1o3d0ZuVk5ldG5wYm1FVTdzOWR1bFdHZFpn?=
 =?utf-8?B?bWpPSmQzbERYZWhhRDB6N244VnJ4UGgwUU9jcDQ0bHF2eTdNZHJFWXBjUVRT?=
 =?utf-8?B?RVNrL0c0NzQxaWVyY3R3MjViSVVSaitsRnVLNlRjQU5ycUNqYWpVRU1ESGtu?=
 =?utf-8?B?UldncHhsZ3B0T2J0NFJJKzZ6ck9la1ZSTWwxNllhM2ZzV2ZqLzVrZ3djRDZj?=
 =?utf-8?B?dWJGK1EwbzI2N2R4bjRnbkdhZHQrc1EwazJtZ3JhL2ZiZjBEWGV6a0l2LzFX?=
 =?utf-8?B?U0F6d2Q2YzkvWkNseVk5TS8yelBWVG9KaEl2d2lsZmlhV1B3ZnZkcVljV0Fh?=
 =?utf-8?B?RENYOFBrZWE3Q3ZtWXRFSHFrQUFBc00zSUpOdjFSM3ppRnUrSUhtUDVtRHFR?=
 =?utf-8?B?S1B5ekowbWFRbGVBNEVENHJtbDVpNER6akQyVVF6WnA4RDhyZmNERHdubkJl?=
 =?utf-8?B?YTc1TW5SMzlXc3ZQMFN3ZnQzTUh1cnQ5RnhRL2UrWVVydkZoOVQ4Mm9RM3cy?=
 =?utf-8?B?dS9VT0dKblhOZU1JYVFURUJOOUQ3SWw1UG5CZUdKbUtOMjFweE0rdyswZGZO?=
 =?utf-8?B?dHA0M1FsbzhoL25MTEhPWnhzNHRWZ1VGVG42SmpQMG85eHdubmRlWWk2TWZy?=
 =?utf-8?B?MVB2SkFMNE1PRVZhNUVlNnMxdms4c2tlNUlTWGdFK3V6QkFub0hlUT09?=
X-Exchange-RoutingPolicyChecked:
	tnaj/0Jw5DOrv9kLIKxhz5nd4JTc2m2kYZgRWFmDY7ZW2QCAlP8KJEDCBptH8q/YQJNwbMb63ETqcjxAuNWLllIoHs0GBbt8XUjUSH3HksCf90F8USjNDmumpoYKE/7YiXN/tFCZgTLh/IYOMNyOLD/c3toqHPIZapOnYQjw+mtG9CqO8CP4iGmN1mV8sNW1/eO/xCZRyldjfX4d/CIw1MBxc9n8YewmDq1BTwHZX20jEa9BlWCngnpXaihSvNS8Xv+GfyyyLukEh0L1qc89TbfaIyqtwVRg2Cj12Uh/vnB6urbWkVG4NecLTjRPRRdyqGRI4tc+XKUubGycGvaEVw==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d922fd-cddf-4ae4-452b-08de7fb4b490
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 21:25:23.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFWDbuxkpGeUj1y0bl7+TLvBvtWYkr9nef5ayty1vbZfxXey+LDkdhudGDpE1bYL/B9bl+AT5JgixRkMK930NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-Proofpoint-GUID: lK5MOT04zxOI44g_pEkNkkc4IrMB_K1K
X-Proofpoint-ORIG-GUID: lK5MOT04zxOI44g_pEkNkkc4IrMB_K1K
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69b1ddc5 cx=c_pps
 a=QpQIPgq430LJFJp+cclIig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=ID6ng7r3AAAA:8 a=2AEO0YjSAAAA:8
 a=cuv1uKRaxINStOyNfHoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE4MiBTYWx0ZWRfX9DZ3uu5VaEmg
 /ZPqI7NPRu0HHILQViCsl1KbQJkUsjWPRIzIhTMK/7raAO+s20g9o1Oulyta+bf3u30Lw6S3BCW
 jEcsOtar34ShCueBSWYbtzJEVfHMfATAu6a8bQXyii8hrFRXHEqVC2j/OYuNrZsIlBzUxQKrRRQ
 nV0mCVchn5RwY/Q6dZkjCN1oFjFIOIkkzPN/HgMchTJwxigtzLD6kTHCWcOfX1pY+ZGDl2W9k6Y
 H8v7+96rOqZ9nQdBkjeW6d7jV1CWyqqsyci8D6rs1+rghAjkkJsvB8rNAcC1wT8MbFbCRNJNHgB
 bFWe0qyl2UVURhF4AlAuVv1ZqotHaLeDMNUGq0Fsq1ighB6TIbA0WO799jg6jGwGIMlyPo5FCIK
 EZQyEJzCwcm3jyuNLS6SlQ5NWo3FcyDEPXMgZ4oMh6YEeNC1iuKacIcPhqKHZ3078RH4vI25BJx
 EdrKAnSVQDKETx71h3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110182

If a user writes to the chardev after disconnect has been called, the
kernel panics with the following trace (with
CONFIG_INIT_ON_FREE_DEFAULT_ON=y):

    [   83.828726] BUG: kernel NULL pointer dereference, address: 0000000000000218
    [   83.829288] #PF: supervisor read access in kernel mode
    [   83.829528] #PF: error_code(0x0000) - not-present page
    [   83.829828] PGD 0 P4D 0
    [   83.830126] Oops: Oops: 0000 [#1] SMP NOPTI
    [   83.830753] CPU: 0 UID: 0 PID: 140 Comm: raw_chardev_tes Tainted: G         C          6.18.0-rc4 #212 PREEMPT(voluntary)
    [   83.831260] Tainted: [C]=CRAP
    [   83.831426] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
    [   83.831912] RIP: 0010:gb_operation_message_alloc+0x14/0xc0
    [   83.832366] Code: 00 00 00 00 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 56 4c 8d 72 08 41 55 41 89 cd1
    [   83.832979] RSP: 0018:ffffb73f0027bd58 EFLAGS: 00010286
    [   83.833247] RAX: ffffa44741f72300 RBX: ffffa44741f72300 RCX: 0000000000000cc0
    [   83.833513] RDX: 000000000000000a RSI: 0000000000000002 RDI: 0000000000000000
    [   83.833732] RBP: 0000000000000cc0 R08: 0000000000000000 R09: 0000000000000000
    [   83.834044] R10: ffffa44741f72300 R11: 0000000000000000 R12: 0000000000000002
    [   83.834267] R13: 0000000000000cc0 R14: 0000000000000012 R15: 0000000000000000
    [   83.834533] FS:  00007fead7859740(0000) GS:ffffa447a31bc000(0000) knlGS:0000000000000000
    [   83.834776] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [   83.834974] CR2: 0000000000000218 CR3: 000000000216b000 CR4: 00000000000006f0
    [   83.835259] Call Trace:
    [   83.835983]  <TASK>
    [   83.836362]  gb_operation_create_common+0x61/0x180
    [   83.836653]  gb_operation_create_flags+0x28/0xa0
    [   83.836912]  gb_operation_sync_timeout+0x6f/0x100
    [   83.837162]  raw_write+0x7b/0xc7 [gb_raw]
    [   83.837460]  vfs_write+0xcf/0x420
    [   83.837615]  ? task_mm_cid_work+0x136/0x220
    [   83.837784]  ksys_write+0x63/0xe0
    [   83.837946]  do_syscall_64+0xa4/0x290
    [   83.838097]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
    [   83.838359] RIP: 0033:0x7fead78e9cc7
    [   83.838712] Code: 48 89 fa 4c 89 df e8 08 ae 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44f
    [   83.839190] RSP: 002b:00007ffece5c3de0 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
    [   83.839489] RAX: ffffffffffffffda RBX: 00007fead7859740 RCX: 00007fead78e9cc7
    [   83.839675] RDX: 0000000000000006 RSI: 0000563d13f96326 RDI: 0000000000000003
    [   83.839892] RBP: 00007ffece5c3e38 R08: 0000000000000000 R09: 0000000000000000
    [   83.840112] R10: 0000000000000000 R11: 0000000000000202 R12: 0000563cf8925128
    [   83.840350] R13: 00007fead78596d0 R14: 0000563d13f96320 R15: 0000563d13f96326
    [   83.840635]  </TASK>
    [   83.840824] Modules linked in: gb_raw(C)
    [   83.841311] CR2: 0000000000000218
    [   83.842009] ---[ end trace 0000000000000000 ]---

Disconnect calls gb_connection_destroy, which ends up freeing the
connection object. When gb_operation_sync is called in the write file
operations, its gets a freed connection as parameter and the kernel
panics.

The gb_connection_destroy cannot be moved out of the disconnect
function, as the Greybus subsystem expect all connections belonging to a
bundle to be destroyed when disconnect returns.

To prevent this bug, use a lock to synchronize access between write and
disconnect. This guarantees that in the write function raw->connection
is either a valid object or a NULL pointer.

Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
resend: added linux-staging as Cc, this list was not part of the first
submission.

 drivers/staging/greybus/raw.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index b92214f97e3..aa4086ff397 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -21,6 +21,7 @@ struct gb_raw {
 	struct list_head list;
 	int list_data;
 	struct mutex list_lock;
+	struct mutex write_lock;	/* Synchronize access to connection */
 	struct cdev cdev;
 	struct device dev;
 };
@@ -124,8 +125,8 @@ static int gb_raw_request_handler(struct gb_operation *op)
 
 static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 {
-	struct gb_connection *connection = raw->connection;
 	struct gb_raw_send_request *request;
+	struct gb_connection *connection;
 	int retval;
 
 	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
@@ -139,9 +140,15 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 
 	request->len = cpu_to_le32(len);
 
-	retval = gb_operation_sync(connection, GB_RAW_TYPE_SEND,
-				   request, len + sizeof(*request),
-				   NULL, 0);
+	mutex_lock(&raw->write_lock);
+	retval = -ENODEV;
+
+	connection = raw->connection;
+	if (connection)
+		retval = gb_operation_sync(connection, GB_RAW_TYPE_SEND,
+					   request, len + sizeof(*request),
+					   NULL, 0);
+	mutex_unlock(&raw->write_lock);
 
 	kfree(request);
 	return retval;
@@ -186,6 +193,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 
 	INIT_LIST_HEAD(&raw->list);
 	mutex_init(&raw->list_lock);
+	mutex_init(&raw->write_lock);
 
 	raw->connection = connection;
 	greybus_set_drvdata(bundle, raw);
@@ -238,9 +246,9 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *temp;
 
 	cdev_device_del(&raw->cdev, &raw->dev);
-	gb_connection_disable(connection);
 	ida_free(&minors, MINOR(raw->dev.devt));
-	gb_connection_destroy(connection);
+
+	gb_connection_disable(connection);
 
 	mutex_lock(&raw->list_lock);
 	list_for_each_entry_safe(raw_data, temp, &raw->list, entry) {
@@ -248,6 +256,12 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 		kfree(raw_data);
 	}
 	mutex_unlock(&raw->list_lock);
+
+	mutex_lock(&raw->write_lock);
+	raw->connection = NULL;
+	gb_connection_destroy(connection);
+	mutex_unlock(&raw->write_lock);
+
 	put_device(&raw->dev);
 }
 
-- 
2.52.0

