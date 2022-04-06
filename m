Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6523216;
	Wed,  6 Apr 2022 18:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649270262; x=1680806262;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vwP7tqcATHHZbPTdGKag4qVPI+s/ZhYdH5Hhb5WB3pI=;
  b=Gg4UR9HqntYxCtf5LgzcrXZKlxl8zz1imOGJXG2SoyZE7+xH3s81d+7h
   nCpHpR696IeRNeUquxzLf9t6DFR6NfG8QQS3aKAcrJgfdxOXnmwMwdImV
   WD4J02sEUFQKELsapuKqbrQ9JDrpZvwm2uzadYPILbI5jUBmgG0X8DLh3
   Jmq4G7oi7XvUJrqKH9Xw5FHIRy06ldcaWCWxB/7FXffI45707o1CYk8zs
   3nRxdvPp0WehYwyorqsf4dE5PTAJacz1J3CDhqm49n/xJ81kTmMW0xSPY
   xJECPIL9qqFafhNQYJYVFtvZGd5T+JbIKxD7mE1zs7esGXj56t7r0LGHI
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="261306677"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="261306677"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 11:37:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="588483890"
Received: from djiang5-mobl1.amr.corp.intel.com (HELO [10.212.19.90]) ([10.212.19.90])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 11:37:40 -0700
Message-ID: <b19466ad-afae-7c70-cd28-73e3959c48f4@intel.com>
Date: Wed, 6 Apr 2022 11:37:40 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/4] staging: r8188eu: correct misspelling in comment
 'tppe' -> 'type'
Content-Language: en-US
To: Rebecca Mckeever <remckee0@gmail.com>, outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <cover.1649233201.git.remckee0@gmail.com>
 <edaab7d38893e4f1cbb3c281b617c74fa91f0fe7.1649233201.git.remckee0@gmail.com>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <edaab7d38893e4f1cbb3c281b617c74fa91f0fe7.1649233201.git.remckee0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/6/2022 1:30 AM, Rebecca Mckeever wrote:
> Correct spelling typo.
>
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index cd20811ae152..f4a277e6b654 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1162,7 +1162,7 @@ u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
>   	}
>   
>   	pdrvextra_cmd_parm->ec_id = P2P_PROTO_WK_CID;
> -	pdrvextra_cmd_parm->type_size = intCmdType;	/*	As the command tppe. */
> +	pdrvextra_cmd_parm->type_size = intCmdType;	/*	As the command type. */

Nothing to do with this patch. Just saw intCmdType. Suggest another 
patch to fix this mixed case function parameter. Maybe cmd_type instead?


>   	pdrvextra_cmd_parm->pbuf = NULL;		/*	Must be NULL here */
>   
>   	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
