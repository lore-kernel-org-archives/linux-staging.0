Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5427BA23;
	Wed, 18 Oct 2023 08:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nusavwgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697616246; x=1729152246;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9Lh4+P8aXBNsuI2VcVr55m/obmW6lr6Ck8rdzu9ijac=;
  b=nusavwgRr5ijWvwlyvVFoeDTiAj5T8n/XIiYp9aKsLuLMeIAMepoLclG
   MSP0jGAMmXUucPkrp1cQvfpi0cZkMhXdCLl/YuWByDrmnWikytEbTMicI
   LY/JuJEhkfdJSd8sb+JKO1VPsuv7eBWcP91fwd4XKUhJrM0SBpD6dibHS
   +svZj1YOoo6WoLbmSEGUz2/Lf9giUDNuMvcOdijL8vpnp1ZVyxzTwVDYx
   7AEzhyMdHnhVPwMAMVeBu01hSHzBCC68/btAM1D2H2YLTkk6oXJntHX9+
   bIcdRtD6Zuf1wB/YRnpXG3ivYT/YCm6YjKuwb4g0Km+z13wi6XNIHnUab
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="472186117"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="472186117"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 01:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="880133675"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="880133675"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Oct 2023 01:04:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 01:04:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 01:04:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 01:04:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 01:04:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDuhFw2NKV3vVmDAA/1VQHrIZhWXcvyD1kfQxRdZxBh0OaFhhTBeFNR7p63Nwwa3edYmxdP5cJ9OqlUp/m37Kz1W50U1VHCdWgH/+WiEKV3YG5y5nXv16jDrHaG7ovV4G1ddB5z9kbIO+m07a3mA4LNI20ZqVEMxBiZIouAWDzrYbpuoVoFFpISTUhGW/ZN2OY9WRWbIsa7N7brSittKKtiyciv51lezftW7ROd2p2reBI759UWBrl6ennLxc1sQFHkNnqxNJW0GuA1/dkAoiVu96mpVqjjJzQz6ScHpC1W0fL1smAgKWgjJuU6Wg+BchGEhtd8azXtw4pfWkvNn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkF0yPwyOQSkGuQDjHBO3779/eKWAuwljlEu6yndxqo=;
 b=DUGNUWYXEHxBhmRoIROucpHUwD8UkENakUNhMUmZ1k9Tt4dlkp40zgu3H7sy/RSvkON/8crhZj6/mXDPe1Wq/XAguQv9slW9L1I+d9btbWOYk4gF/zJ5w/6sCt38RZoF8NH8Xgpj3404nLMAXjMe5hENCA1/DwUcvuw+rvqPdKwqtUh+R768bhEgU8ZdhK7UqRNDfLDsAh88DIHkw0vQeEnCvB8NGt9cGw1LkYFwlrwSRHhi5wLqkxJPgR4NcVJJ4LGt9Ir8ZtNWPlX/r9FPE1x/5RyQcVpS7fGKWZQWDADYS+lwbgMMmFbS6PHLCQ85f8E9uHjTvzBkj5FxR0a+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 08:03:56 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 08:03:56 +0000
Message-ID: <c82a0b17-d6fe-39bf-27b3-e0658994a834@intel.com>
Date: Wed, 18 Oct 2023 10:04:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] staging: rts5208: Replace delay function.
Content-Language: en-US
To: kenechukwu maduechesi <maduechesik@gmail.com>
CC: <outreachy@lists.linux.dev>, <shreeya.patel23498@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20231018004300.GA3189@ubuntu>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231018004300.GA3189@ubuntu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|SA0PR11MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ab8646-f4e7-4e20-e7e0-08dbcfb0c66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q589x6p+W6okBe0P9FaSn12U9v4SSmxrKIUFH86JITZ9ctkgVBMWVJEYkBkH8OvYBQJcCNUt3ti+dR4eUfkQeGg4VMSQfyQ+BA2S79f3pzwW6iwc7im8piC2rtnKPXtWrgkBVxIeDy5uO+q/JpiWAVTg62y0L/bmdHD2voky+tD/HM/j/7JWqe/717kcjCaXn8ZqAMyKeLeojRZ2sEq1gScvA9eqqgDtGz4RoW8VP2XXDfTBEYnmh+5XDJR9PrgPwABmfP4O94EUBtkxhQJEdlM6PEA4VHTcmRCQZjLd5a+3Kc5rTWXIj7oJtI1hjJwECr6dKN0PVc/UYvPTXWflZeGaM6EtM0cqBLCNxM3Z7LUHIOweSbjwLy3oQz9ItYoOWDEMv70K+30sE/R2L+7hELM/Az6spy7rqIETGRXgHweiHSZeiVZXjceDqNyq9kS6Q2o7RM4NDAjTRMv9/hzmWkLBU8/d215UJEMilgxKqHaRAizlLmODBvrOmqofXlyeSnPhbCokwwtEW3fwJwjVQdZp6s/d5HdbXWrOX253Q5w+2YlOGki53pTHiHY2Cr8xdpKpSNgMxAKpaej+ZXNlNng/sTlKLA/1nx1X4GoR07kOGU3fDflLlQei3Yh3kbx2Tnbv3lIuXoJbjzCM2Ca2QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6916009)(66476007)(478600001)(66556008)(316002)(66946007)(6486002)(6506007)(36916002)(2616005)(53546011)(26005)(44832011)(4326008)(8676002)(2906002)(36756003)(8936002)(41300700001)(5660300002)(86362001)(31696002)(82960400001)(38100700002)(83380400001)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekhjeEE1dWNSYkEzWGcvaWkrM1ZYaWRQZDFKTVA4dkluaGZ4R3RiM2xHOFR3?=
 =?utf-8?B?L203aVYyS2FDQnNlZisrRHBLZGxsb2ErUDNNNFRtUVd5TU96bFBGZFV4Wita?=
 =?utf-8?B?K1RHb2U0WjdsMHVsWnNVSHp4clJmemJUTk55c2pXdTZDeHlkUjFOQWZFTlJ2?=
 =?utf-8?B?Wk5Lcnl5a2dLaFNNV0ViRFYxL0cwTXhWcHdpL20rYVdlQVFFbDBzbllBLzUw?=
 =?utf-8?B?bERZSEswT1RmaER1THVrM0NEdEhtckxuUmw2Sjhzdm5jRWxYd0NqWmx0aU1D?=
 =?utf-8?B?amdzekZNY0pUYlJZN21lTlFEdlMvYVNraXd4RzMway9ScXRyWUhGRU81MS9l?=
 =?utf-8?B?YmxZRDErbWNoeDVEZXNxOW55Qit2Nkp2dGRYbDhtZWdaNG4zQlIrWTg4T01F?=
 =?utf-8?B?UXFQckh3TTVQSlRkUTBHMFZ1SlZUK2NrSUNWV3V2TEdPYTU4eHVsOXBaRDVt?=
 =?utf-8?B?cmVvZDEzdkRnTEJ1Mk1udWxiMWM2azRLMEFFdHpmeWtIVTJzdFBwU2dGbXM0?=
 =?utf-8?B?SVh2UkxlWXZwWWd2SDFnbnc3Z3R4MFRMRlNPaTNhRTZyTXF6anduZ2U2S1Ev?=
 =?utf-8?B?VEdNUUpIaCtKUk5HemtUVFk0MjlqT2Z6RHFINXphNFN5V3VNNmNJaUVOMWdm?=
 =?utf-8?B?d3V1b2xvYjU2MzVFRkxCWUVBMFIvTjdpcENxL0JlWk9saE9qeURUZEVkRjlF?=
 =?utf-8?B?ejRVT2dSZUM3dmtFLzk1S0lHNzVlZzQvbUs3L3EvckErYnlyODk2ZHpHbFlD?=
 =?utf-8?B?TmdRWDhNY2hlM3Y1ZmUwRU51RzUzVEJzdHNKOEUrenMrVFQ3azJwdzRDY2xM?=
 =?utf-8?B?QnRhS0p3MmlQV2FXd01GQ1hzQzhlWHl4NWx0akdDTDlKK3l2Y3ErWUxnYjhE?=
 =?utf-8?B?YXBOdHNwWUlHekVxa2dQK3dlTHVJazdtNEk2Zyt0M3hrT2Zmak9rdU50dlpJ?=
 =?utf-8?B?SmJ1aHduWjhlTnU1cnNYeWN6MjV6KzUrd1UxdjdweUpCWmhZSmF2SWZlcGJx?=
 =?utf-8?B?RjBnQ3RYVXo5eG40aVMzR0JWY1lkSTlKbmFxbDJZWWlIVHpxeVBldmd2MjlH?=
 =?utf-8?B?Q244cGxNcjNLSTlrQ2JFWkFtM092cU04Rkp0b1o3cTlEaUNCSWZ1ajJjb3U2?=
 =?utf-8?B?N3VDVXpldVRabUJIZTNwZG41eWVGOE8ydXhkVDFKTy9mMmVjcHZOcVZPaWh1?=
 =?utf-8?B?RVdpaXhWbmZEWGNsanpPNk5uVGRuVFFJeVVrY1VzbEFRSUFoWGZXdDNDTmV6?=
 =?utf-8?B?ajZ0RStFV0hZL3NRNlRZRExoQ2IyRS9PT092TENNWHMzbTFQVUtTdHYvYUMr?=
 =?utf-8?B?ZDFQZi9KK1FERWdEYjJtZjI5RkVCM29pcU9sVEZpTUQ1Y01tSDRUVTFqYS83?=
 =?utf-8?B?ZHNEZ1RzZVh3VGJyWVNlTWgrOUhxT2JwaS9UcnY1djg3WUFCVVN1OVVQYTBt?=
 =?utf-8?B?elpydk1OdXorcG5xR1JuRmtDYnpvUEhEd1Fwb1Z4V0lzeklibjFLck9ucUVD?=
 =?utf-8?B?Vm4xMXZQU3NZV3c5enpjQmc3NFYyM0gxaEl1Ukc4SXQ2SDFYTzM5emM1OXVO?=
 =?utf-8?B?blgwdnNyeHNIRUpOZDQyK0d4a1JEUlNiWlp6MExnaVpnQTJ3aWpYczU2NnlK?=
 =?utf-8?B?SGJianZGdWdOLzRYN1plMHVJQzVIMFdnVnRwYStXcU1BM0hCb2NuUUV3Wit3?=
 =?utf-8?B?WHhXY2J3RHFtRGZTNWJSbXpJNTJtOVowcEQrRmtjUzR6VzNtSG52Wm1RYUtC?=
 =?utf-8?B?dENGck9lNHYzVi80WFcyanNKNVdPS1FsUkFKdVQ3UWFmZGFRTk80elZsbU9I?=
 =?utf-8?B?WVJieVRwaFBwNEdZQmR0cmVVc1RWRFZKbTZha2lwZUJOREFOZ1FFSGxMZDZq?=
 =?utf-8?B?RXJaK0JCdXpxdlJWNUppbmZrVVVxNlhPNmdRU2REQkw2TzZRdUpSVW1pVlZK?=
 =?utf-8?B?NUVqQU52b2RxMGdLdDJuVkJValF3ZTZMaE1ZTTl0U0tLNU1YMWN6TkZWOGNF?=
 =?utf-8?B?R2MzMnN1eHdTMzl0V3YwV25uMWZKZjlIc3I5L0RlSURTbUJUSU9KTTY0eFEw?=
 =?utf-8?B?azlUQkdEdXZOakU0eGFCZjdFWGJPT1Y5bFZ5SXpXdkJWT3B5dU5RYVk1dXlB?=
 =?utf-8?B?T01uRUdac1dXRkcxT3kzZm90c1JwTERhQWs1cWtReXNlcjF0MHBiM1hmaTlD?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ab8646-f4e7-4e20-e7e0-08dbcfb0c66d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 08:03:55.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqmES165PuV5thg4+xmbTy3tfiUDuiqFsikWCZideHHFAwymhsNXLJux1Fzj0UHGn5JhbVxaKiZX49xSywFS49DmhSTB6at/j30y0/Tfsls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
X-OriginatorOrg: intel.com

On 18.10.2023 03:03, kenechukwu maduechesi wrote:
> Replace udelay() with usleep_range() for more precise delay handling.
> 
> Reported by checkpatch:
> 
> CHECK: usleep_range is preferred over udelay

Have you tried to compile your patch? This is something you should do 
before sending it to the mailing list.

All the best,
Karolina

> 
> Signed-off-by: kenechukwu maduechesi <maduechesik@gmail.com>
> ---
>   drivers/staging/rts5208/sd.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
> index 74c4f476b3a4..059f99b0a727 100644
> --- a/drivers/staging/rts5208/sd.c
> +++ b/drivers/staging/rts5208/sd.c
> @@ -865,7 +865,7 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
>   						     PHASE_CHANGE);
>   			if (retval)
>   				return retval;
> -			udelay(50);
> +			usleep_range(50);
>   			retval = rtsx_write_register(chip, SD_VP_CTL, 0xFF,
>   						     PHASE_CHANGE |
>   						     PHASE_NOT_RESET |
> @@ -877,14 +877,14 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
>   						     CHANGE_CLK, CHANGE_CLK);
>   			if (retval)
>   				return retval;
> -			udelay(50);
> +			usleep_range(50);
>   			retval = rtsx_write_register(chip, SD_VP_CTL, 0xFF,
>   						     PHASE_NOT_RESET |
>   						     sample_point);
>   			if (retval)
>   				return retval;
>   		}
> -		udelay(100);
> +		usleep_range(100);
>   
>   		rtsx_init_cmd(chip);
>   		rtsx_add_cmd(chip, WRITE_REG_CMD, SD_DCMPS_CTL, DCMPS_CHANGE,
> @@ -918,7 +918,7 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
>   				return retval;
>   		}
>   
> -		udelay(50);
> +		usleep_range(50);
>   	}
>   
>   	retval = rtsx_write_register(chip, SD_CFG1, SD_ASYNC_FIFO_NOT_RST, 0);
> @@ -1416,7 +1416,7 @@ static int sd_wait_data_idle(struct rtsx_chip *chip)
>   			retval = STATUS_SUCCESS;
>   			break;
>   		}
> -		udelay(100);
> +		usleep_range(100);
>   	}
>   	dev_dbg(rtsx_dev(chip), "SD_DATA_STATE: 0x%02x\n", val);
>   
