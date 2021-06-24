Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0212FB7
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 12:00:43 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so5742766pjb.5
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YUdxYuClvDRmHqPmsuWUK5u98CIP+cWKtyMM1DPZLOY=;
        b=UTz+UmFTNa1qSkUmlCLB7WVVC9g1kbwD3dvQ0RbTBOQnD1Q/YA0DNcbjshDh7K9/2B
         ay/8b0+Un7GhGmDZDM8YRRuUWY8+vbicPGCRsIuqpgE/hhGZWJnyv2aWAPrqOCoblOtj
         WFpkHgq/qjygkSJ+5/0K9OOkyu7KbzDll6Hns0/kCpXdAETEH27U6Iw42Ld4az+OkoYv
         Qcv0LMcrhiZ6bCc7maERmuprC2Iz5zvatCL9ge1uN4vqKKNI+iPnGpYZoJqh6TS84TuP
         DQZibK4wruhGpxmPbPrp40aapvGdUp5bxoxa441VRo2A7V9HAJUezk09EidMO+U43sPY
         AGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YUdxYuClvDRmHqPmsuWUK5u98CIP+cWKtyMM1DPZLOY=;
        b=nraU9IaNOlBrW387WUxlW0PSZbLLoKPPqBIEfr/M1QbGPBzpuo6WNm9PPaF+FSfGAx
         CP6SlrZRiBCqJaAAwPqKbypLu+7OrhnB8xSqaF1zAvO9wyWRVDqHPHTffLcMfTftaeJw
         fejGtHh3jB7s8+0o3o8ZtRzbHWOGOsYdiu2jGrDN7TRbCyCpEFZg4CDSRnIHpyPulwKY
         qze2ugojD+7y1pjfbUkZOWW3rTwSicxhhtYO55noTMWLceczW1MO+uz7Z+828nTDLwAq
         ULaWC26rvsao3+33dB87cjSPfCsbIxuslyQZIMnxBpHYHav4ZJRf0Q4Iq9uMGEfZ0exH
         43Tw==
X-Gm-Message-State: AOAM530wMfdHrUXQeQ9CUA+dM5EKfMCshPTLzG3QFKuNTVG5au3cEX2Z
	vv35bzr76dL/FBGtvXbj1Ok=
X-Google-Smtp-Source: ABdhPJyRqHSvRYgXQ2+WgWDELsTdMQrdiwif2M/USvVlAWybsvolUNbiMruzbgseX4W6ghdnv4q/ng==
X-Received: by 2002:a17:90a:a611:: with SMTP id c17mr14623473pjq.184.1624536043137;
        Thu, 24 Jun 2021 05:00:43 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id w123sm2936836pff.186.2021.06.24.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 05:00:42 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 24 Jun 2021 19:56:44 +0800
To: Benjamin Poirier <benjamin.poirier@gmail.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 12/19] staging: qlge: rewrite do while loops as for loops
 in qlge_start_rx_ring
Message-ID: <20210624115644.dmjskfsbcu7xcat5@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-13-coiby.xu@gmail.com>
 <YNGVEiS8mITXQ5sS@d3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YNGVEiS8mITXQ5sS@d3>

On Tue, Jun 22, 2021 at 04:45:22PM +0900, Benjamin Poirier wrote:
>On 2021-06-21 21:48 +0800, Coiby Xu wrote:
>> Since MAX_DB_PAGES_PER_BQ > 0, the for loop is equivalent to do while
>> loop.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/staging/qlge/qlge_main.c | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
>> index 7aee9e904097..c5e161595b1f 100644
>> --- a/drivers/staging/qlge/qlge_main.c
>> +++ b/drivers/staging/qlge/qlge_main.c
>> @@ -3029,12 +3029,11 @@ static int qlge_start_cq(struct qlge_adapter *qdev, struct qlge_cq *cq)
>>  		tmp = (u64)rx_ring->lbq.base_dma;
>>  		base_indirect_ptr = rx_ring->lbq.base_indirect;
>>  		page_entries = 0;
>
>This initialization can be removed now. Same thing below.

Yes, thanks for the suggestion!

>
>> -		do {
>> +		for (page_entries = 0; page_entries < MAX_DB_PAGES_PER_BQ; page_entries++) {
>>  			*base_indirect_ptr = cpu_to_le64(tmp);
>>  			tmp += DB_PAGE_SIZE;
>>  			base_indirect_ptr++;
>> -			page_entries++;
>> -		} while (page_entries < MAX_DB_PAGES_PER_BQ);
>> +		}
>>  		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
>>  		cqicb->lbq_buf_size =
>>  			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
>> @@ -3046,12 +3045,11 @@ static int qlge_start_cq(struct qlge_adapter *qdev, struct qlge_cq *cq)
>>  		tmp = (u64)rx_ring->sbq.base_dma;
>>  		base_indirect_ptr = rx_ring->sbq.base_indirect;
>>  		page_entries = 0;
>> -		do {
>> +		for (page_entries = 0; page_entries < MAX_DB_PAGES_PER_BQ; page_entries++) {
>>  			*base_indirect_ptr = cpu_to_le64(tmp);
>>  			tmp += DB_PAGE_SIZE;
>>  			base_indirect_ptr++;
>> -			page_entries++;
>> -		} while (page_entries < MAX_DB_PAGES_PER_BQ);
>> +		}
>>  		cqicb->sbq_addr = cpu_to_le64(rx_ring->sbq.base_indirect_dma);
>>  		cqicb->sbq_buf_size = cpu_to_le16(QLGE_SMALL_BUFFER_SIZE);
>>  		cqicb->sbq_len = cpu_to_le16(QLGE_FIT16(QLGE_BQ_LEN));
>> --
>> 2.32.0
>>

-- 
Best regards,
Coiby
