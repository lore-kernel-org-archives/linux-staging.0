Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED23168
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 11:35:24 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id i6so4930467pfq.1
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=99mlqRPqpltRyIkzBDkulZzreBwoyXNFz/QwaO6c5sE=;
        b=Lf7JdQpgE2BtfLvOWENxboAEdbIjgofEaFcEYibdAaOZbp6axxSsrmM7ZEZbC9hsSe
         v2tpFvZbeYB9S7fFZOZ32OdCuh7fC9/GLLeRPIn+yPxPeLyT5+81FmZEad3GLTuzjouy
         +/yaMzSgrpLcKWaBMi5Kex42f77V8mHnjdF5zn8gW7x2KRFUKWyYGOr+doAXzot82msd
         AfLww2TPCtHIfZG9Cvyzh2a+5yTHjn4X3bNPSOeORUZacw5UjFdINBTmZ3p1bRS04FOR
         CaCYVE2QUlDRb94iXpg+/VdRfxYlKcMyqeSQKMhAZ5QdpUAnRsNh6r3IxpvAkP8Ye2cH
         JbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=99mlqRPqpltRyIkzBDkulZzreBwoyXNFz/QwaO6c5sE=;
        b=IH3t3BH9ZT6TS3DRw2nlxNWApaTJpQAayAxjvPwFFmrUe00Ufst9BngwTZ73pi1jNZ
         JoLMzBSUGKUPnLWY+N3QVneqwCDuVZt8GL4imXVD4MexdD8xr/2TBXvZW/BTgAT3Dcwa
         hS82lCjj82DzcOSH8qpCICb+EOuXA0D5aVI9p6dP5kHVv+iOmM0u+UEIKYulpwK3kVZW
         OXBVMXOsTTutB0IbdMNyWGbwnonXLim/CI2aFrrQ7Bj7N05eC0+GSeu52ZoZFPOcE3VX
         KCb/qb4NjdzXiw7W8Nlwodf5+cRi5o3Zu0SO3lws+iiBZES1m5Bac5ZR8+j+O7pi5tiV
         LpHA==
X-Gm-Message-State: AOAM5339re4Si2T/QsUNSm2mQtAuDCOzsykigo4Si9VEUVYIjeqedHFY
	GH0w6ufO1sBCpuA541E4n70=
X-Google-Smtp-Source: ABdhPJyrrBQto0sQiE2RBettf8+KQU8CW527ig2S7ZxcNAMdt6g2Nn3Q3xxjp0WGkGg2YTioe9VMCQ==
X-Received: by 2002:a63:a80b:: with SMTP id o11mr4389582pgf.53.1624534523886;
        Thu, 24 Jun 2021 04:35:23 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id d2sm2116944pgh.59.2021.06.24.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 04:35:23 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 24 Jun 2021 19:33:53 +0800
To: Benjamin Poirier <benjamin.poirier@gmail.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 06/19] staging: qlge: disable flow control by default
Message-ID: <20210624113353.mdcalrw77d4he4j5@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-7-coiby.xu@gmail.com>
 <YNGWHxYF5UkPk2U5@d3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YNGWHxYF5UkPk2U5@d3>

On Tue, Jun 22, 2021 at 04:49:51PM +0900, Benjamin Poirier wrote:
>On 2021-06-21 21:48 +0800, Coiby Xu wrote:
>> According to the TODO item,
>> > * the flow control implementation in firmware is buggy (sends a flood of pause
>> >   frames, resets the link, device and driver buffer queues become
>> >   desynchronized), disable it by default
>>
>> Currently, qlge_mpi_port_cfg_work calls qlge_mb_get_port_cfg which gets
>> the link config from the firmware and saves it to qdev->link_config. By
>> default, flow control is enabled. This commit writes the
>> save the pause parameter of qdev->link_config and don't let it
>> overwritten by link settings of current port. Since qdev->link_config=0
>> when qdev is initialized, this could disable flow control by default and
>> the pause parameter value could also survive MPI resetting,
>>     $ ethtool -a enp94s0f0
>>     Pause parameters for enp94s0f0:
>>     Autonegotiate:  off
>>     RX:             off
>>     TX:             off
>>
>> The follow control can be enabled manually,
>>
>>     $ ethtool -A enp94s0f0 rx on tx on
>>     $ ethtool -a enp94s0f0
>>     Pause parameters for enp94s0f0:
>>     Autonegotiate:  off
>>     RX:             on
>>     TX:             on
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/staging/qlge/TODO       |  3 ---
>>  drivers/staging/qlge/qlge_mpi.c | 11 ++++++++++-
>>  2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/qlge/TODO b/drivers/staging/qlge/TODO
>> index b7a60425fcd2..8c84160b5993 100644
>> --- a/drivers/staging/qlge/TODO
>> +++ b/drivers/staging/qlge/TODO
>> @@ -4,9 +4,6 @@
>>    ql_build_rx_skb(). That function is now used exclusively to handle packets
>>    that underwent header splitting but it still contains code to handle non
>>    split cases.
>> -* the flow control implementation in firmware is buggy (sends a flood of pause
>> -  frames, resets the link, device and driver buffer queues become
>> -  desynchronized), disable it by default
>>  * some structures are initialized redundantly (ex. memset 0 after
>>    alloc_etherdev())
>>  * the driver has a habit of using runtime checks where compile time checks are
>> diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mpi.c
>> index 2630ebf50341..0f1c7da80413 100644
>> --- a/drivers/staging/qlge/qlge_mpi.c
>> +++ b/drivers/staging/qlge/qlge_mpi.c
>> @@ -806,6 +806,7 @@ int qlge_mb_get_port_cfg(struct qlge_adapter *qdev)
>>  {
>>  	struct mbox_params mbc;
>>  	struct mbox_params *mbcp = &mbc;
>> +	u32 saved_pause_link_config = 0;
>
>Initialization is not needed given the code below, 

Thanks for the spotting this issue!

> in fact the
>declaration can be moved to the block below.

I thought I need to put the declaration in the beginning of the
function. But it seems Linux kernel coding style doesn't require it.
I'll move it to the else block below then.

>
>>  	int status = 0;
>>
>>  	memset(mbcp, 0, sizeof(struct mbox_params));
>> @@ -826,7 +827,15 @@ int qlge_mb_get_port_cfg(struct qlge_adapter *qdev)
>>  	} else	{
>>  		netif_printk(qdev, drv, KERN_DEBUG, qdev->ndev,
>>  			     "Passed Get Port Configuration.\n");
>> -		qdev->link_config = mbcp->mbox_out[1];
>> +		/*
>> +		 * Don't let the pause parameter be overwritten by
>> +		 *
>> +		 * In this way, follow control can be disabled by default
>> +		 * and the setting could also survive the MPI reset
>> +		 */
>
>It seems this comment is incomplete. Also, it's "flow control", not
>"follow control".

Ah, yes. I should state it as "Don't let the pause parameter be 
overwritten by be overwritten by the firmware.". And thanks for
correcting the typo.
>
>> +		saved_pause_link_config = qdev->link_config & CFG_PAUSE_STD;
>> +		qdev->link_config = ~CFG_PAUSE_STD & mbcp->mbox_out[1];
>> +		qdev->link_config |= saved_pause_link_config;
>>  		qdev->max_frame_size = mbcp->mbox_out[2];
>>  	}
>>  	return status;
>> --
>> 2.32.0
>>

-- 
Best regards,
Coiby
