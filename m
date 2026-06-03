Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5982BE051
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493127; cv=fail; b=azvaQYttOkTdZDmwWa+NS7Vpa7J80YltCsY+65n7WPk0lESmpSpcn4Hy0z80RuMBl19vnyeOZvubEUhVxpizxjR5SMDLNFn8x6KZhaihYub7/ckAcbJT2TiCX3sGROUVjlkBW6LwSp6HBNjSUAIaFg7AB1/UT4d/1N4bsmpHrUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493127; c=relaxed/simple;
	bh=EWrOIt54baUN/di0ZdfGlbq+wgMzVupDOyz/X/1Pax4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rAmgBNOGGLqmR0ySuXnNGnTAU+5fNvaoMAZv8xzcZAnjT+Py+hxKokK+Q+Ru/RKaxHl+1T+dqdvDxfLHS0Xj47JcSxwsgZ6Zq/YlkikM0Fl1nXBUSTAnWAyu5mTspb8UNNEoLZFDvQ0z5d8leRbvvuUQqrtaCzhFSM1bK2JVCMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jwz3sk/i; arc=fail smtp.client-ip=40.93.195.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jwz3sk/i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhSyR4cyVt14axuniN5UFfdOHONhY9jKkGBwk3+PbjDFHx8WaX5ClBKLToDkiNWAGpNh1uZIhjdFso3Yt73CdqUIvvouRPs9e6eQs8psZOkAXUB+WnqRirOODJOCpTwNrLg5aXmIBfXZ8Gtk7FQ3OdYqUZpcf3JbWgpqJgcQKx2EyDJWQiAbuELJuMETEd0/62Udrd0BTqlcdUYIvVQdS8/tIiRBwe/lObaX7CfDoIqyuF1gVpsrDAtIPD9jl1hRSyUz0QtRFg4a3BO/uGXzoLLyDxCUIa0hWiCxdVB3e1SBVna5o3UwqXNUEtMrpuQiTr/HnYW5Q5sEm0TbFg4RYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5GruWhuzRxXXb6er62tX1j3yb0z4Q95IO4X7dOs0Pc=;
 b=LfpMkKBmAp1Z4We7X8qTvjJ6dzbtd6acqzZ6r1YpIxJHGwIIZq0BXNa7XwbhPhKmN3XB0bIpuuTiIxVawedwwfh381SmHfnan5PYMlX80nbpJXJBTfqaw/80drCbSFfGXlnZl1u7cbdS2m+qbZlziURmzWkjPAzfv66W90xPUFY9YjlN5j99i8BYQJ6GLt92M6fPS6rnEe+3oBQjslejDfEox5K0w2NzlafPJktN1FgJ7IL/CDboZ0BQngmA1iEdYiM5heVO0K60KqJrpwJ3XMoRrh8xz6GF2Mgjaxs4treZ2SL/hWYXmu7aYAQOShhCDO50XziXedyR7slsEP/2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5GruWhuzRxXXb6er62tX1j3yb0z4Q95IO4X7dOs0Pc=;
 b=Jwz3sk/iGah3oOcUF6BpVj5lk3lBEU7ZoqUWXhVcCWYtgcoUzpFWTtMp6srKkSRnovSMSfYWjFCCeM4XfSM09HeqmaiAewJI9BtJyhcrrmLeuVAZEZRRMurNUTgGV7sGB5as6eVymn7usKqhOLpGx2NXoy/QcTdjblXAzkhuzno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 13:25:23 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 13:25:23 +0000
Message-ID: <88df704d-438f-4298-850f-56c625f25624@amd.com>
Date: Wed, 3 Jun 2026 15:25:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: axis-fifo: remove driver
To: Grewstad <dogestad24@gmail.com>, Dan Carpenter <error27@gmail.com>,
 lucas.fariamo08@gmail.com
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
 Jacob Feder <jacobsfeder@gmail.com>
References: <20260602103208.15799-1-dogestad24@gmail.com>
 <ah7AYukZ5uzW1NVU@stanley.mountain>
 <CAD03fjZQwgvDbBdh6A=1FeGVn4Na29ww2DzG3anuk2sOd0-4EA@mail.gmail.com>
 <ah7Wn3-meqmDLk_d@stanley.mountain>
 <CAD03fja+rghsG=nY7zEZCO1RuX+ZEst92_U28xLoLv8YQMjf+g@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CAD03fja+rghsG=nY7zEZCO1RuX+ZEst92_U28xLoLv8YQMjf+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SN7PR12MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: b803050b-6b33-442d-63a8-08dec17390da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	egjdfzmfilM54T1C8MultGM4l+db2ZUwPk4wVUfJ0sfYYZ7GJbTf1wPOQPAfgpEVT8vlWFOgQjfvp6Y5XBS5ZpIpf6E9ouF80oK+8AmOaOCMxm+WTLfht54ye6D5Pohk0cV1M5pikvWVxe57RWTrIjBj+ePD22MUerOkdaeV8f7aqHMOu7YasfopJNOfTht7h7H6HeuwH5bYyi9UmowMZVhdfEIr3zErmMWw9OXoc3Da3XHLt9TCM8nG1AN4I340vCVcD6ePWNBLjLhQbZMl+/9REuyCy13TzdNQ1/HnOZTAgh/yW26wN7CjWJwYKBQlyPYmkOxL4FlaJv+dmAaY9ImTqFod0nJ3VloSbPtRUilEDJ8g2yEHp2m33yxZMxK4Pyf9C1g3YiABs8b47VTtHGBONWXSe44f0vHpafaw8q4kqOrJyKNAqoyHTXN8bknjEwVCB5GW8ovmh/fr8Emyw0jWb0kIFYBEx1Mic1b3Lat51/S2+ia6EHWmWFQ8NOFtZIUXJVc/xj0IzZwY8HQZsLXy8NWHnWmWFze1N8l1toWwVRRP2qoTnsen5I/Z6irytK4XLXhQkEF8DwM1TjfR9U9+c+M0qxajxTS12XchgnlaizcCjizgcKgY0PladOLpNHcns8s8fc2Hp6Sy8QWaoecqDAOVMeMevtxuYFVFi8EJ353oSd63UH47yudkr+G+MNpztL1pobr/TgwEDhUuZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGhSVVpPYUppb2pweENJS0JpWDRMMXJZREo0M0VaR0U2N3ZiODRXelpqbDNN?=
 =?utf-8?B?M3c5VVJPcGVxSkwrUWRBenlVL2FLODJlVHZvcTZVQk5sTVdkTE1la0xWWVRF?=
 =?utf-8?B?czE4VW5DUkVBWWtPV0tPek1yMHFSd0k5azRQTll3QlA1ODEyVDdtTW5nN0xp?=
 =?utf-8?B?T0RpeEU0cERqQWdiTjVyVkVRRzl1ZXdhb3QvVEdBY1BseSs1Rys3YStOZ3Ns?=
 =?utf-8?B?cGFhVGk0VE45bnZGN2YxTVJ3SGZuMUtHWks0MVhRUDJacnhkcy85OGdKRWpp?=
 =?utf-8?B?VXpNcmYrZVFaaDljZUFqVk4yNjVVWHZyZ0lRMmhFaU4yM2JCVHdzNjlEMGo1?=
 =?utf-8?B?ZG5yNml6OXY3VXdGM0dwUFcrdzNnL1RLZ3lYemVKYWwyaWFNR0pwY3lmZTZO?=
 =?utf-8?B?NFE4ZndUblVxU29HeGx2WXR5eGdGY3U1UXIzeU1UVHZZbVRjZ0Nub0U3Rm1P?=
 =?utf-8?B?UnhpQUtyUUpzbSs5QmEvYVoyZHJ6Y1J6ZlkyMWJtZkRpMGJCZmpCMy9HYllJ?=
 =?utf-8?B?U25SZnZRMHRPejk5OGVTUHFZSVBVRHc3SzE4L0JGZm5CZDhtNkZ5TFFKVTlU?=
 =?utf-8?B?ZSt2bkYyZUFGMjNCWmRnNlRONkpaQWRLK1NNdlAyV0NYMVROdzJCKzVQdkI4?=
 =?utf-8?B?SFJNTTJvWXliVVNUN2JCV1BpUUFUZDM5VFJFZXFCNGVDR21xcXM1V3R6ZUlq?=
 =?utf-8?B?WkF5UFJGbjBWbGRZMHlzcEsvWFZ5MVZudXpEUHRWSEVyWHpIVGd6MDFicE9J?=
 =?utf-8?B?SFgxTWpRNHRacnd2ZkJ6Q29iWWVNV1hpdW53YVNqRTBvMmtMTjNocEZPbWhh?=
 =?utf-8?B?Z1c4V2k2ZTZJVzVlOFlOcURoamxjMDRvTW1DRm4vaDV6UUo3UStwTEpzcHF3?=
 =?utf-8?B?TFIvMDhMdVRPaWxpYmJ2UHJCV0ZuZzdlTUpET2o2R0d4MGV2c1UvSjNESjZX?=
 =?utf-8?B?SS83MExLMUdzTWNiZXJxYkNQTi9zcXl2OVY4WG16RU5sYTFHbkJKdGZ6K3lX?=
 =?utf-8?B?S2VXSmhaSjBtL09hSklGaUxSY3JxZUkzNzZmNzV3TWlERi93SVVIOWRheHhr?=
 =?utf-8?B?aTBURW9IR3NGQi9kbEtqZGhTK1pBTFhTbWR4a0xSZkVhbmNIeVhpQWRZUEtO?=
 =?utf-8?B?MXE3L0xwYWVmb0dsdjhQdnVUb3ZBbk1ELzZwQnF3N25ienRnWlM3UWdlM0tY?=
 =?utf-8?B?RzF4UWZFenhZZnRQbHNHWXZsSlVBRHRZSXdRdjJmQ2VDV0phM3d1bjFEMFM0?=
 =?utf-8?B?bDZQTTUySnprRHhlb3g3QVFORlVVYzNVQ29jczA0amNhMXlGUHdrMlRSSVZQ?=
 =?utf-8?B?YjgzVlV5ZmxlbURrcGJQb2U3VzAyTk5aZGpIMnJpT2d0QXFZV3dDOUFqVVZs?=
 =?utf-8?B?cHVneGplUXhjd012eDdqMUFBMVd3c1B5RjhtL3YyTHRuNzVkV1JjMkFxZ3ds?=
 =?utf-8?B?TTJWd1R4eVBDbTFwQmJXQnEycUY1VUxpNkRFcHgydkIzenZxNWorMzJOSElh?=
 =?utf-8?B?MWtUTHVHd1dJTXFVeDdxMmtERHU3TkpwczM4SW9SRHVidFNNckdZU0xlVkto?=
 =?utf-8?B?L2FnUTEzM2FLZmRXbDM3UzJCYVhoUE45aEFaUTBVUXpndFVad3F1VmVPYnJm?=
 =?utf-8?B?dk5xZFZnbXNSQU1VZk90QzBwbFNJUXdFMy8zQ1EzMmNnTjIvcXVHcVJEWTlv?=
 =?utf-8?B?SFp4eFZiSUl2ZG1TYUhUUFBwbzJvcnQyRExRdzNvTTd2VDVHZkx2SmxpUkNy?=
 =?utf-8?B?UmNGY1M4enNDNTlMNGY1UVdZRStNRGgwWTEzZzFuczNQNDNSYkpZenprRS9Q?=
 =?utf-8?B?MmRxUkl3UXZhK3FtbWZpZWZIYWU0SmMzdll1ZjFrU2xvUUtxNlJoenRIbi9y?=
 =?utf-8?B?bWlHSytjUWlLV3VSWHZWMi9WZzdWbG9TclZZbnloVXNhU21mNmRzZVFNajk3?=
 =?utf-8?B?N0RrYTFSSkZyY1ZEeGlIZDM4dmkvL3BPd3k1NEJrWjlmZWZqTjkrQjFBVU9H?=
 =?utf-8?B?RUxGdExFY0czWmF2QTlaWnlLTUsvQ0hZUFlTK0ZZcUlReThsblFTeGladEdJ?=
 =?utf-8?B?cXJsMHpwS0kyQyt1SFY0bGkvbVhVRk1oVXlmc2twWngxLzZ5OTB0M1prZG9R?=
 =?utf-8?B?WmlRN2QrVXVidTV3KzNRZW1MbVJDS1J5N3ZWVjU4K29HeEtLSWhjU0lmclZF?=
 =?utf-8?B?dG1EK2l2eEc4QkpwWjg3U2JYejRvT0ZwVzZrL3pUa0oyYWNTREZIZ3VBMGIx?=
 =?utf-8?B?MjllMlhZZXVDbWNHczFDRk5DdmVZcTdReHd6VjZQZDVKNkxrVnNkQmFZQjhU?=
 =?utf-8?B?K1cza0RKZWs5dUpFVEdkb2lmb2ZEYW44YWxxVmpwR2JsVERiSlZCQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b803050b-6b33-442d-63a8-08dec17390da
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:25:23.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SeRbt7VJL3O49mz9XAIQYGrDBPLzsWIIUF8r3y4kkb3DTHwnJjYFxECqZAPKl6y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060

+Lucas

On 6/3/26 14:25, Grewstad wrote:
> Adding Michal Simek, as he posted some relevant points in another thread.
> 
> On Wed, Jun 3, 2026 at 1:49 PM Michal Simek <michal.simek@amd.com> wrote:
>>
>> Hi,
>>
>> On 6/1/26 09:15, Grewstad wrote:
> 
>>
>> It is clear that driver in current state can't be used with axi ethernet out of
>> box because pretty much it is just about user interface for fifo via char device
>> fops. But we are talking about the same IP used in specific scenario and this
>> driver doesn't implement integration which can be used in ethernet driver.
> 
>> I don't think you will find out any in-tree user because driver purpose is
>> different. It is about providing a user way via char device to push data to axi
>> streaming interface which can be consumed by user logic. It is generic way how
>> to push data there without writing specialized kernel driver for custom HW.
>> I think this is leaf driver which provide a way to axi fifo streaming interface
> 
>> where stream is connected to custom HW which consumes it. I can understand that
>> this can be very useful for a lot of people who wants to process data from user
>> space via custom logic with using streaming interface.
> 
>> And I don't have any issue to agree to move the driver out of staging to common
>> location.
> 
> Thanks for letting me know. When you say common location, can you give your
> opinion on where it can be moved? We cannot find any user-space applications
> that use this driver, as you said it is a 'leaf driver'. Because of
> this, we do not know
> how it is used, who the end users are and hence we dont know where it
> can be moved.

We have drivers/misc/ for this purpose right?

There is attempt to move dt binding to yaml too but I can't see Lucas in this 
thread.
https://lore.kernel.org/all/20260227181051.36207-1-lucas.fariamo08@gmail.com/

I was talking to our networking team and they have FIFO support on their plan 
with axi ethernet.

Just a summary I am not convinced that this driver is in a state to be removed.

Thanks,
Michal
