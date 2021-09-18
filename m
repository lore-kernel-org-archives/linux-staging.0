Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351D472
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 14:42:51 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id eg28so18543543edb.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OHAXqZmW/hm/leBd0Sv6MalLTN836Msh4RCiA2OjwWI=;
        b=CnIxv2oDvziqoDVzvL5nxi4EqX2v6SZdEDs2xKOI4quxHJhijDNRiDBMP7j5bwuEGQ
         e36efLZzQ2hZsPENnNfVcE31q/xAVYxo/pVrN5+t0mHFd8FkZ+j96vZf5fki6Msbn53T
         Jry48sCeApv06AheEwv515vCPSLBvn+blQr9S9dlloZbiRCVjEtIMzX2V+66qUzHmsp3
         AyRQzSpCvDYTffS02uiaLQjrxiK3TsDu9po6ZQ0sKG0ZqpeUNuAPWo0MsJe+LsusJ4Mj
         gu9zYzARgZdyb3jdcJCaWaj+6h3MLJNLg0Lh8nEv2KHvwGSYp4O3WJwD6Dqfu0PLCKWU
         6AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OHAXqZmW/hm/leBd0Sv6MalLTN836Msh4RCiA2OjwWI=;
        b=hHvHQqVKv6NMY7oxTsMsz9JwSFtZBJoJJogZM21coWK0EJGFhez0KrQW4LfVVkU4ge
         jPBogJr0x/xbPkcXdSdhjtMSLnuNYugj2MuyBcFyIwK2AsfprZML+dh+Nr71/R+nAP/G
         S4DOyM9VCwyq9o3ErOjv3C3sh2q6cRFKgBn9vhCv87Ram+fjdipfhuY1FRvsosuYClbd
         gmk9vy1Vaz8dJzGEY4BO7s/TAfgTxboydLT3lUVcProUEMGzIfRogRfddA8XkKfdQs8e
         C6v78sCFrQql6VMdE9e+el/fwq3bMxrDFfBya5bq9amymD6Y9tqxQnqAEdvr9ahADw/C
         6B6A==
X-Gm-Message-State: AOAM531xXrr415wCJdYEiwqFQxKvJUpowutph73lR1Eg+vxnHCtEvXa8
	AbPgEeAP0Lg9bWOHanj/VEg=
X-Google-Smtp-Source: ABdhPJwRl3QPHusKRc4LHRJt5D3wvswrHC+SXx7bcn31446ADQt8+6zrtjZlvQ5/ulwde/ATCBERMQ==
X-Received: by 2002:a50:e1c4:: with SMTP id m4mr11098037edl.307.1631976169524;
        Sat, 18 Sep 2021 07:42:49 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::cde? ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id s26sm4355296edt.41.2021.09.18.07.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 07:42:49 -0700 (PDT)
Message-ID: <7907c680-e3fd-3dd9-983b-dcd2275cdedb@gmail.com>
Date: Sat, 18 Sep 2021 16:42:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] staging: r8188eu: remove unused defines from
 odm_RegDefine11N.h
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210918081120.2798-1-straube.linux@gmail.com>
 <YUX2mNXLzqJXmer4@kroah.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YUX2mNXLzqJXmer4@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/21 16:24, Greg KH wrote:
> On Sat, Sep 18, 2021 at 10:11:19AM +0200, Michael Straube wrote:
>> Remove unused defines from odm_RegDefine11N.h.
>>
>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>> ---
>>   .../r8188eu/include/odm_RegDefine11N.h        | 96 -------------------
>>   1 file changed, 96 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/include/odm_RegDefine11N.h b/drivers/staging/r8188eu/include/odm_RegDefine11N.h
>> index 5d1d73490c1c..3e2fd6b1c793 100644
>> --- a/drivers/staging/r8188eu/include/odm_RegDefine11N.h
>> +++ b/drivers/staging/r8188eu/include/odm_RegDefine11N.h
>> @@ -4,56 +4,20 @@
>>   #ifndef	__ODM_REGDEFINE11N_H__
>>   #define __ODM_REGDEFINE11N_H__
>>   
>> -/* 2 RF REG LIST */
>> -#define	ODM_REG_RF_MODE_11N				0x00
>> -#define	ODM_REG_RF_0B_11N				0x0B
>> -#define	ODM_REG_CHNBW_11N				0x18
>> -#define	ODM_REG_T_METER_11N				0x24
>> -#define	ODM_REG_RF_25_11N				0x25
>> -#define	ODM_REG_RF_26_11N				0x26
>> -#define	ODM_REG_RF_27_11N				0x27
>> -#define	ODM_REG_RF_2B_11N				0x2B
>> -#define	ODM_REG_RF_2C_11N				0x2C
>> -#define	ODM_REG_RXRF_A3_11N				0x3C
>> -#define	ODM_REG_T_METER_92D_11N			0x42
>> -#define	ODM_REG_T_METER_88E_11N			0x42
>> -
>>   /* 2 BB REG LIST */
>>   /* PAGE 8 */
>> -#define	ODM_REG_BB_CTRL_11N				0x800
>> -#define	ODM_REG_RF_PIN_11N				0x804
>> -#define	ODM_REG_PSD_CTRL_11N				0x808
>>   #define	ODM_REG_TX_ANT_CTRL_11N			0x80C
>> -#define	ODM_REG_BB_PWR_SAV5_11N			0x818
>> -#define	ODM_REG_CCK_RPT_FORMAT_11N		0x824
>>   #define	ODM_REG_RX_DEFUALT_A_11N		0x858
>> -#define	ODM_REG_RX_DEFUALT_B_11N		0x85A
>> -#define	ODM_REG_BB_PWR_SAV3_11N			0x85C
>>   #define	ODM_REG_ANTSEL_CTRL_11N			0x860
>>   #define	ODM_REG_RX_ANT_CTRL_11N			0x864
>>   #define	ODM_REG_PIN_CTRL_11N				0x870
>> -#define	ODM_REG_BB_PWR_SAV1_11N			0x874
>> -#define	ODM_REG_ANTSEL_PATH_11N			0x878
>> -#define	ODM_REG_BB_3WIRE_11N			0x88C
>>   #define	ODM_REG_SC_CNT_11N				0x8C4
>> -#define	ODM_REG_PSD_DATA_11N			0x8B4
>>   /* PAGE 9 */
>>   #define	ODM_REG_ANT_MAPPING1_11N		0x914
>> -#define	ODM_REG_ANT_MAPPING2_11N		0x918
>>   /* PAGE A */
>>   #define	ODM_REG_CCK_ANTDIV_PARA1_11N	0xA00
>>   #define	ODM_REG_CCK_CCA_11N				0xA0A
>>   #define	ODM_REG_CCK_ANTDIV_PARA2_11N	0xA0C
>> -#define	ODM_REG_CCK_ANTDIV_PARA3_11N	0xA10
>> -#define	ODM_REG_CCK_ANTDIV_PARA4_11N	0xA14
>> -#define	ODM_REG_CCK_FILTER_PARA1_11N	0xA22
>> -#define	ODM_REG_CCK_FILTER_PARA2_11N	0xA23
>> -#define	ODM_REG_CCK_FILTER_PARA3_11N	0xA24
>> -#define	ODM_REG_CCK_FILTER_PARA4_11N	0xA25
>> -#define	ODM_REG_CCK_FILTER_PARA5_11N	0xA26
>> -#define	ODM_REG_CCK_FILTER_PARA6_11N	0xA27
>> -#define	ODM_REG_CCK_FILTER_PARA7_11N	0xA28
>> -#define	ODM_REG_CCK_FILTER_PARA8_11N	0xA29
>>   #define	ODM_REG_CCK_FA_RST_11N			0xA2C
>>   #define	ODM_REG_CCK_FA_MSB_11N			0xA58
>>   #define	ODM_REG_CCK_FA_LSB_11N			0xA5C
>> @@ -61,28 +25,10 @@
>>   #define	ODM_REG_BB_PWR_SAV4_11N			0xA74
>>   /* PAGE B */
>>   #define	ODM_REG_LNA_SWITCH_11N			0xB2C
>> -#define	ODM_REG_PATH_SWITCH_11N			0xB30
>> -#define	ODM_REG_RSSI_CTRL_11N			0xB38
>> -#define	ODM_REG_CONFIG_ANTA_11N			0xB68
>> -#define	ODM_REG_RSSI_BT_11N				0xB9C
>>   /* PAGE C */
>>   #define	ODM_REG_OFDM_FA_HOLDC_11N		0xC00
>> -#define	ODM_REG_RX_PATH_11N				0xC04
>> -#define	ODM_REG_TRMUX_11N				0xC08
>>   #define	ODM_REG_OFDM_FA_RSTC_11N		0xC0C
>> -#define	ODM_REG_RXIQI_MATRIX_11N		0xC14
>> -#define	ODM_REG_TXIQK_MATRIX_LSB1_11N	0xC4C
>>   #define	ODM_REG_IGI_A_11N				0xC50
>> -#define	ODM_REG_ANTDIV_PARA2_11N		0xC54
>> -#define	ODM_REG_IGI_B_11N					0xC58
>> -#define	ODM_REG_ANTDIV_PARA3_11N		0xC5C
>> -#define	ODM_REG_BB_PWR_SAV2_11N			0xC70
>> -#define	ODM_REG_RX_OFF_11N				0xC7C
>> -#define	ODM_REG_TXIQK_MATRIXA_11N		0xC80
>> -#define	ODM_REG_TXIQK_MATRIXB_11N		0xC88
>> -#define	ODM_REG_TXIQK_MATRIXA_LSB2_11N	0xC94
>> -#define	ODM_REG_TXIQK_MATRIXB_LSB2_11N	0xC9C
>> -#define	ODM_REG_RXIQK_MATRIX_LSB_11N	0xCA0
>>   #define	ODM_REG_ANTDIV_PARA1_11N		0xCA4
>>   #define	ODM_REG_OFDM_FA_TYPE1_11N		0xCF0
>>   /* PAGE D */
>> @@ -90,52 +36,10 @@
>>   #define	ODM_REG_OFDM_FA_TYPE2_11N		0xDA0
>>   #define	ODM_REG_OFDM_FA_TYPE3_11N		0xDA4
>>   #define	ODM_REG_OFDM_FA_TYPE4_11N		0xDA8
>> -/* PAGE E */
>> -#define	ODM_REG_TXAGC_A_6_18_11N		0xE00
>> -#define	ODM_REG_TXAGC_A_24_54_11N		0xE04
>> -#define	ODM_REG_TXAGC_A_1_MCS32_11N	0xE08
>> -#define	ODM_REG_TXAGC_A_MCS0_3_11N		0xE10
>> -#define	ODM_REG_TXAGC_A_MCS4_7_11N		0xE14
>> -#define	ODM_REG_TXAGC_A_MCS8_11_11N	0xE18
>> -#define	ODM_REG_TXAGC_A_MCS12_15_11N	0xE1C
>> -#define	ODM_REG_FPGA0_IQK_11N			0xE28
>> -#define	ODM_REG_TXIQK_TONE_A_11N		0xE30
>> -#define	ODM_REG_RXIQK_TONE_A_11N		0xE34
>> -#define	ODM_REG_TXIQK_PI_A_11N			0xE38
>> -#define	ODM_REG_RXIQK_PI_A_11N			0xE3C
>> -#define	ODM_REG_TXIQK_11N				0xE40
>> -#define	ODM_REG_RXIQK_11N				0xE44
>> -#define	ODM_REG_IQK_AGC_PTS_11N			0xE48
>> -#define	ODM_REG_IQK_AGC_RSP_11N			0xE4C
>> -#define	ODM_REG_BLUETOOTH_11N			0xE6C
>> -#define	ODM_REG_RX_WAIT_CCA_11N			0xE70
>> -#define	ODM_REG_TX_CCK_RFON_11N			0xE74
>> -#define	ODM_REG_TX_CCK_BBON_11N			0xE78
>> -#define	ODM_REG_OFDM_RFON_11N			0xE7C
>> -#define	ODM_REG_OFDM_BBON_11N			0xE80
>> -#define		ODM_REG_TX2RX_11N				0xE84
>> -#define	ODM_REG_TX2TX_11N				0xE88
>> -#define	ODM_REG_RX_CCK_11N				0xE8C
>> -#define	ODM_REG_RX_OFDM_11N				0xED0
>> -#define	ODM_REG_RX_WAIT_RIFS_11N		0xED4
>> -#define	ODM_REG_RX2RX_11N				0xED8
>> -#define	ODM_REG_STANDBY_11N				0xEDC
>> -#define	ODM_REG_SLEEP_11N				0xEE0
>> -#define	ODM_REG_PMPD_ANAEN_11N			0xEEC
>>   
>>   /* 2 MAC REG LIST */
>> -#define	ODM_REG_BB_RST_11N				0x02
>>   #define	ODM_REG_ANTSEL_PIN_11N			0x4C
>> -#define	ODM_REG_EARLY_MODE_11N			0x4D0
>> -#define	ODM_REG_RSSI_MONITOR_11N		0x4FE
>> -#define	ODM_REG_EDCA_VO_11N				0x500
>> -#define	ODM_REG_EDCA_VI_11N				0x504
>> -#define	ODM_REG_EDCA_BE_11N				0x508
>> -#define	ODM_REG_EDCA_BK_11N				0x50C
>> -#define	ODM_REG_TXPAUSE_11N				0x522
>>   #define	ODM_REG_RESP_TX_11N				0x6D8
>> -#define	ODM_REG_ANT_TRAIN_PARA1_11N	0x7b0
>> -#define	ODM_REG_ANT_TRAIN_PARA2_11N	0x7b4
>>   
>>   /* DIG Related */
>>   #define	ODM_BIT_IGI_11N					0x0000007F
>> -- 
>> 2.33.0
>>
>>
> 
> I get the following build error after applying this series:
> 
> In file included from drivers/staging/r8188eu/hal/../include/odm_precomp.h:28,
>                   from drivers/staging/r8188eu/hal/odm.c:6:
> drivers/staging/r8188eu/hal/odm.c: In function ‘ODM_Write_DIG’:
> drivers/staging/r8188eu/hal/../include/odm_interface.h:30:41: error: ‘ODM_REG_IGI_B_11N’ undeclared (first use in this function); did you mean ‘ODM_REG_IGI_A_11N’?
>     30 | #define _reg_11N(_name)                 ODM_REG_##_name##_11N
>        |                                         ^~~~~~~~
> drivers/staging/r8188eu/hal/../include/odm_interface.h:37:52: note: in expansion of macro ‘_reg_11N’
>     37 |                 ((_ic_type) & ODM_IC_11N_SERIES) ? _func##_11N(_name) : \
>        |                                                    ^~~~~
> drivers/staging/r8188eu/hal/../include/odm_interface.h:45:34: note: in expansion of macro ‘_cat’
>     45 | #define ODM_REG(_name, _pDM_Odm) _cat(_name, _pDM_Odm->SupportICType, _reg)
>        |                                  ^~~~
> drivers/staging/r8188eu/hal/odm.c:486:55: note: in expansion of macro ‘ODM_REG’
>    486 |                                 ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
>        |                                                       ^~~~~~~
> drivers/staging/r8188eu/hal/../include/odm_interface.h:30:41: note: each undeclared identifier is reported only once for each function it appears in
>     30 | #define _reg_11N(_name)                 ODM_REG_##_name##_11N
>        |                                         ^~~~~~~~
> drivers/staging/r8188eu/hal/../include/odm_interface.h:37:52: note: in expansion of macro ‘_reg_11N’
>     37 |                 ((_ic_type) & ODM_IC_11N_SERIES) ? _func##_11N(_name) : \
>        |                                                    ^~~~~
> drivers/staging/r8188eu/hal/../include/odm_interface.h:45:34: note: in expansion of macro ‘_cat’
>     45 | #define ODM_REG(_name, _pDM_Odm) _cat(_name, _pDM_Odm->SupportICType, _reg)
>        |                                  ^~~~
> drivers/staging/r8188eu/hal/odm.c:486:55: note: in expansion of macro ‘ODM_REG’
>    486 |                                 ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
>        |                                                       ^~~~~~~
> make[3]: *** [scripts/Makefile.build:277: drivers/staging/r8188eu/hal/odm.o] Error 1
> 
> 
> 
> Looks like these defines are used :(
> 
> How did you test this?
> 
> greg k-h
> 

Hi Greg.

Ah, I'm sorry, this patch (and 2/2) dependeds on the patchset

[PATCH v2 00/12] staging: r8188eu: remove odm_RegDefine11AC.h

which, I guess, is below this patch in your review list?
Somehow I did not notice this dependency. :(

Should I send a v2?

Regards,
Michael
