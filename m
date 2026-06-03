Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F412439D3D0
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474752; cv=fail; b=imUCTXxjLTgfZw5VnkxVU9tJpu39+Ov/msKMGSiBHYDGCZqaqLHEMjFDB+r8KEwvX1RmaniVgQQO46UQO7AFzjNl0diYFqqxKu9W1yNKOQQSdaA55MiFDr2Lzr1eb2bygSmBl5p8bIcBXzxiDPjl+39EGNfXxlrVLHUjkgeSiJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474752; c=relaxed/simple;
	bh=H9z287vkbiTuPk/C42cZXWpORuBh1pdVaIGCsJEeoKs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Dj/uYSdJCGrEH+kSWTJExRoRNrJf0eVM2hy6HGE/HLE1A2EEbf23yMN9+LWEBxTjA/YFy/fVj0ML28um48OhZglXn5UF8ANFAM0HhT49EodnDUOdTQtY8yEg/NfRKKfK6NvtDNFm+WKb812fXp5UUeNli4ZBMgsY8OdnR36p0iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V5lnnRYA; arc=fail smtp.client-ip=40.107.208.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V5lnnRYA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QD8J54MSO0UoaFtdJSZ5G3+jr874tdsW3Dm9PGmuABj82ytrcUe7F1MKp8HvNCCjNaQMvgSmZMu4zn7tUR0TnEUS5V2P3V8yBMtnTeEdoP+g//1LCUMj6VdBO63zddOSLaN75tQkiwSfFRxFjBIuXaP6RAQqj0/VSBULV7YHzd1FvHSpoVu2GHyWYGT0CCbLVw1Um14dFpevDGWCr1C6gKkhodlPCLPBIIeoJ6ZjCM297I/UXwbQ3Rbr6M7VJCuiNe2H1FeHQnUtQJwFxGdm6aFQWwWnB+hkubGywXVFK1VpulwhcHgVIXxQLPKkJpyAj3LKIG09vyGpuI+h/NrHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8k89cheg4axcSD7Ki5l/ZXa6UJ1jKBmtqyvQKormnU=;
 b=rjJFYTXmw+fj88CRhlCuakP5NHbzj3V1tqpo0gmRbRFEvpWchW7TF4fLPbZFz9HB/1AbN08YYR//nsJKdba6GGV4ynMvSYr8wCjke3n69QpD47hpKn+d4xTD1vc4h4JeQGHf5iaK6eAEsuc4ANBRVlI6/FOhSiakz/DVuVhcwzxWZnQe3N1Ohy1ghsnGvZddYs0HrrEcE4IF7JlqMC6ZKOkMa7pmeg5YNlN9t7LVQafSy6onaeb8fZWSPlNJiX8hXdyw/A9OFuki4vUGAe1vO8vsU+umOpp5NqxiHQ1yGOk8XSp1tmXnuut89HWs258J3F1k/42GIC/cij1tXYbAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8k89cheg4axcSD7Ki5l/ZXa6UJ1jKBmtqyvQKormnU=;
 b=V5lnnRYA0A3RXwfCPiKrzl2358csmOXLq6arbjDgVmyQFyhMOMwrRZjeLffADP5iPLhm7qAMp5pvU3+oL+lNkKKUyK31j89wpPqcvydYhLi5uRfIOslnos0r4GPIc4XGn9sVxRbj6WvE7qO6mWsz065in7n/s+LnQ59azxicDTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:19:08 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 08:19:08 +0000
Message-ID: <b05f069e-a1dd-43a5-b73d-d4c6bbb0807f@amd.com>
Date: Wed, 3 Jun 2026 10:18:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drivers/staging/axis-fifo: Looking for users
To: Grewstad <dogestad24@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: radhey.shyam.pandey@amd.com, Andrew Lunn <andrew@lunn.ch>,
 jic23@kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jacobsfeder@gmail.com, "Katakam, Harini" <harini.katakam@amd.com>
References: <CAD03fjb=_kW9=q9YV4qnQ5GD=HMB5Bx7pf3+AFcgDR2gVc1V6Q@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CAD03fjb=_kW9=q9YV4qnQ5GD=HMB5Bx7pf3+AFcgDR2gVc1V6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI6PEPF00000229.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8f3) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9373e70b-2d74-44fb-12c2-08dec148c897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	0xin8uLv3xUe7WTkk6iu6WiB+6g5bX7+lzbjno96GDL1+NhkjLM2CQiL65k/Mw6g6oVYRqHHB2+Y9pMKcXlwI4v7aIhb9nHu9DT58bZsUABpYivoXOPvvXsOudjet+91Dq7MIxMBed7mYucBHCoieMtH8j3eLfs/+MCA2mww1l0HdIK3NKxa0DHK1nE+cVgCi7vZP+ykonlHcr7Klgi9iIZ3TuBBhki6nxQ/FmHe9HO5TsyX9pIk2IDzct7NsvUg6SJcCAwn3DomwbhGNHmNo0rKXDfridbvadd8eHtMpjmkXhFVoXhXREWbQTMxr1j++wW0wvQ1Tlrsodn/TsM+n7lWt9mccRJT41gtgFtpCaJzDhOJYiG4ULjOAXw+hCxDuZ4qiwynRfTLkmXy0gZwzr+gklap9c0zcMHClvT9ezQpVjD8Ae75CtSh003x1CsrLrSZlSl6wd8U4QkP/6mWDdkDopl254DpGURxrz5Zj8N3zbBaKNgR2TNA/9jcMV/tyMVhWILXV9310Ioda7W5nksTZ4ltG72joLYiXzHyc0Sq2XQZHOnTU9hNh9FKdCL6NVpA84f+oRUC99Jgm1vURZ9eDbsWbn0fjGUSJqua0Tyb+1H3c9zW0kPkdBFLxuZDVis+bgFvrD4LjQMt/NAnPMLTdSlhNxBa7NI65LUpzRtz4dKjaZBUm0qUBtFE1I7a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGdXbGhQUldDWG43b1doNDJmaUVoU0JSS2IvZzVzMytTc25VU3BYMm1FQWQv?=
 =?utf-8?B?d2NoMWdTckNkSlZocWYrSk9vWWdNRWZBSUJJWEdGUUpJUEpoVTZzcTZDQytn?=
 =?utf-8?B?cVZRd1FpNjJacGNlNGhxTGdGTkRzMzQwT3B2a0Q3RlN6RzhaWUtFaDl3SWtF?=
 =?utf-8?B?aU5BamJTYlRZVkQ3WTRzV0Q4SnBQS0NKNDJNMUNMcFN2ZjlBcG1vTHdWYnpx?=
 =?utf-8?B?NTRhMWZkRi9SdmdWU05pd0pncW1MYXB3Q1VxcGdWUE43bWErVTczWHFTZzB3?=
 =?utf-8?B?WVp5TXhWbHZYZ1FDZ2tRMHhGdmYzRUZzNkNEbnR1b1BJYVF5VVcvS3h6N2I2?=
 =?utf-8?B?dE02OWcwSUdIWXZTZWRRVWhSbHdxSXh5L3VmOENITjkvWUhuVHpZSU9qYm5O?=
 =?utf-8?B?U0N6T3lzOGlvdy9iYzBIVTU0VHZhL3hHcko2Mm13Uk85Z3UyaDdlV1pHQnFl?=
 =?utf-8?B?NTBZUGF6Rk1kYjZBRS9FT3g2SEpJQ1k5S0t3TGxqSU5CL1VxcGdtQzUvR1RU?=
 =?utf-8?B?YVBNYTIwcU81a2JzNHRrZDloc3BObmttMCtJU2EwTTJJZmsrSmt2ODFGcitG?=
 =?utf-8?B?VFM1UU03dzVraDc0ZUQyaWVkMXBvcGcvbFJVeHVMUXlsU05kOTBCNy9hV0xx?=
 =?utf-8?B?K3RhZ25pMjVwQ2E2TUFkL2lncXlRTlpJbms5UGlYMXg0VW5sbjUwNEZSRlFy?=
 =?utf-8?B?L2hhWmVGVEhXZC9LUW5sa09Bc1BLcEl0cUlCSXdJdlFWK0xkRWEvd294U0Zn?=
 =?utf-8?B?UnFXTlo2ajl3YlY0dGxjckJGWUpOZ1VXVVhYS0Y5VlE2dE9FQmNaUTdlbGR2?=
 =?utf-8?B?TVlYSEdDa0I4VUZpbUZrVllhQUVxemcySjB5cG9uZmFwTXlCbUJNMDllKzdF?=
 =?utf-8?B?Y002RGlyQTlCNXRTWHd4SnAwcWVxeSsyRHlCSk41U1dIQWFFNHdnakJyQ29x?=
 =?utf-8?B?YThERGMyRUovRkJGRWkrVUpnS3lZQ2FoVU5OWEgwanBWT3ljOHk4M2VPRWNq?=
 =?utf-8?B?eGNMa3JlMTc3b05GZXpWOFBiY0crY2ZzbE1PeGsvUkZha2FHbGVjTWFaT3kw?=
 =?utf-8?B?cmhrbnpJOWFPWlcrSkxyb0tZK0dyekRndUJtSTl4SEgrcDZWTE82VWw4QXl6?=
 =?utf-8?B?K2l6b01BKzQ0NzBUSWh6elFzMnB1d0J1NHJoRG5qQjUrRE5icmdmNmgrclBU?=
 =?utf-8?B?MC80TmRZVzVycm0rNWFmTHFFcjd1UkNtb2Z1M0FINXZEVm5md3NuQjFOeExq?=
 =?utf-8?B?c2c5N1NmazhOaWgxQ1RqZVlyanp3dkEwcEhSWCsyenNEU2h1dHdUYmdHRUQx?=
 =?utf-8?B?QmNEODdUV2pibytqenZ5SVVTZnZLMDBDdmcvVXd6ZFcrWkNPR0Zuc3FDWkt0?=
 =?utf-8?B?aDNNVUtJV2pqU0tLcXZYck9UdVk2TjZmNmx3bDFGdTJ2WlNRZDhhSFdnbEIx?=
 =?utf-8?B?YklzYWhOUzVSYmE0dUFUbTJzSFM5c2ZDUUpwTDZta2hlZjVHcDEvL3AxS0tl?=
 =?utf-8?B?THAwRHI1MUplOThiOTRjcXhrUFEyc2RONUl4bDdFcnB6QWhvTXVpQm5WelZE?=
 =?utf-8?B?RE5LVTFhTnM5NjF0ODZEYmFVOG44SXlGUzVmTUg1bzFwZmxTZk5XZHRYTnhO?=
 =?utf-8?B?R01Gdk9TU3B3Yk1aQXhXL2xocFVoZEtVOWxJVDl0MzBneElQR2VVK3NhVW5i?=
 =?utf-8?B?Yjg2enQ3L0tlU0ZDQzQ2aU1qQjFTRVF5ZlMxd2FPc2ZJRkI2ZmdlY3hHU29s?=
 =?utf-8?B?U1BKOVVMNEdSUTRHZG9aNEIwOVFpNGhlL2dNTjc1bGlzdldEdnFOazlJemV0?=
 =?utf-8?B?cmdENVpyR3N2S3kwbk95T1hCazQvUkJuOEFTbHc4Qlc1dmZ0c0FYb2NaYnc1?=
 =?utf-8?B?UXVOUFRiaUFScGcwWFltSWZBOVJWRlJGNVhuUWQ5WStHaWh3ckRrTWtHQSsz?=
 =?utf-8?B?Smx5cW1NVXVCMjB2VzN3clFkNkJEMUFIVjRPcHhVaUJhMlYwbzBCSHhWNHVT?=
 =?utf-8?B?c3ZEQUE1bFJNcENYdGtMV1FON3pzWVBUdGQ1dFFoN2xmb3VDSVlmUnN1WFYr?=
 =?utf-8?B?YnV5cEQxMStPZW1IQUJneGhhZXFteFMveStGU1phMWIwVWRSQVhYL2hWbW5C?=
 =?utf-8?B?VzliN3hSMDdZdWVPaHp2RTRtTCtSR2xWWWtZTVowdmdVdGZwMG5aMlRCV0FC?=
 =?utf-8?B?THErcjRqVWhWS0oyOU4zNm5JUDhtcUNSenhOU1l6RnZWRkhZSEhBbFdmdkdh?=
 =?utf-8?B?YlJSMVRLNkNTZ3pPMTFyenpEcXBmMS9ZbERyY1Fmd0MyVUpzbGVQSVFRQUlt?=
 =?utf-8?B?TlBZK0Z2dE9ZVDFEelNIaDJiOFQ0M0lVTkZXYmZxUzFFRUV3c3dUQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9373e70b-2d74-44fb-12c2-08dec148c897
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 08:19:08.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/kjFEwn26QGVUogkDZXJHoDFZNphjhSdkQIJvZwhetAdmQdSPMUhztKu52i/ALZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562

Hi,

On 6/1/26 09:15, Grewstad wrote:
> Hi,
> The AXI Stream FIFO driver has been in staging since 2018. I was trying to
> understand whether there are real in-tree users of this hardware today, and
> what the expected direction for graduating the driver out of staging might be.
> 
> The only in tree reference to this driver that i found is
> drivers/ethernet/xilinx/xilinx_axienet_main.c, which states:
> 
>   * TODO:
>   *  - Add Axi Fifo support.
> 
>  From this, it appears AXI Stream FIFO support may be used for some AXI
> Ethernet hardware configurations. However, I’m not sure whether there are
> any other in-tree users of the AXI Stream FIFO IP besides Ethernet, or
> whether Ethernet is the primary intended consumer.

It is clear that driver in current state can't be used with axi ethernet out of 
box because pretty much it is just about user interface for fifo via char device 
fops. But we are talking about the same IP used in specific scenario and this 
driver doesn't implement integration which can be used in ethernet driver.

> 
> If there are no other in-tree users, it’s unclear whether this driver should
> remain a standalone staging driver or be integrated into a specific subsystem
> like networking.

I don't think you will find out any in-tree user because driver purpose is 
different. It is about providing a user way via char device to push data to axi 
streaming interface which can be consumed by user logic. It is generic way how 
to push data there without writing specialized kernel driver for custom HW.


> Can you let me know if there are any known in-tree users for this driver,
> whether it has a large enough user base to justify its existence in
> the kernel tree,
> and what the hardware's real use cases are?

I think this is leaf driver which provide a way to axi fifo streaming interface 
where stream is connected to custom HW which consumes it. I can understand that 
this can be very useful for a lot of people who wants to process data from user 
space via custom logic with using streaming interface.

And I don't have any issue to agree to move the driver out of staging to common 
location.

Thanks,
Michal
