Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26BE2C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 11:54:27 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id a140-20020a1c7f92000000b0030d8315b593so7487782wmd.5
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A4dhr0/QMJPgHp0Of70iF+wfPRe7pjBKDhU+regt6Zs=;
        b=P4seYfHCQSCeFDUFXiUs6FJtDsVQKPPQi3pghmAPy4Bq9r7uBzV6QFJc9NydcewHsH
         pNObG8Kq94+aTDH0qrUVEDTi2Pv0+rZs78XsFQT8B6snhLtuTHVzUgcHcC1NJmf63T0Y
         JUZKVqfGi4pY1MCRi84UUXuoO7UkSBhgjqU8KBOVJgxdH0Mpj2XZ9a4lrDE1ORxcBF6n
         pbM8ItaHVUSe3tL2XCXPdXKE6C/t8Y9S1pVYSnspL3rLQPnHzNQk1W4MTSq6Sgzk7OTh
         NqYY3E6Ce1ZMlEUBx0Fg+eNcfnpaswLwGFBhlCBxAd272OXEMP3eQM4ZyUdN7vjlTinf
         FeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A4dhr0/QMJPgHp0Of70iF+wfPRe7pjBKDhU+regt6Zs=;
        b=emGTP+d+yN+ZXvCXVi+m2Aank7YUtdBqlH6mBhmN0dw8v4g1BBw3OLx8TEzWFBtN5y
         voy6cz5m9iAy3OSq3b4dh81TQgpbQ5pAHbqTyT1//U9+jlJtccxt9r9lCGYe8zbqZvt0
         zC/205HNG/oUtKRQMB47XoT3yxKeqNso0W9wRY+woHnFFHW2aOXhB0+iLfefEyuHPtvn
         jZL43oHas1zQwf8JSZFDAjJkyxckO6P3QF2HUldVSG8qZhqzohVqxl5HPnssA6KvnmO8
         0TGpfpt3kOB1Tgd7aYaSyIROK27EzErJogjgyzmm/NZGTNCED0agukIwtaaHS9IxjeNt
         EMsQ==
X-Gm-Message-State: AOAM531elhq62u1aleh509X9ooa4z7k9t8koDZQBWiwb3eIcJsQlEV4t
	egYkxHcHmPqkM9Kq6H7fobQUFSqvOYc=
X-Google-Smtp-Source: ABdhPJx5qErML70fVPXuvsW+XR5sO0EkSfFsU8g0FcuhTCMiWHELRradFGfdfivWfXoxct8xY7ae7A==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr24507218wma.161.1634471666238;
        Sun, 17 Oct 2021 04:54:26 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id j1sm11260710wrb.56.2021.10.17.04.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 04:54:25 -0700 (PDT)
Message-ID: <88147425-3137-53d9-3cba-2c52d8ac1556@gmail.com>
Date: Sun, 17 Oct 2021 13:54:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/8] staging: r8188eu: clean up Hal8188EPhyCfg.h
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016113008.27549-1-martin@kaiser.cx>
 <20211016113008.27549-7-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016113008.27549-7-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 13:30, Martin Kaiser wrote:
> Remove a bunch of unused structs, enums and defines
> from Hal8188EPhyCfg.h.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   .../staging/r8188eu/include/Hal8188EPhyCfg.h  | 59 -------------------
>   1 file changed, 59 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
> index feae0b32cac6..58377edf724d 100644
> --- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
> +++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
> @@ -21,23 +21,6 @@
>   /*--------------------------Define Parameters-------------------------------*/
>   
>   /*------------------------------Define structure----------------------------*/
> -enum sw_chnl_cmd_id {
> -	CmdID_End,
> -	CmdID_SetTxPowerLevel,
> -	CmdID_BBRegWrite10,
> -	CmdID_WritePortUlong,
> -	CmdID_WritePortUshort,
> -	CmdID_WritePortUchar,
> -	CmdID_RF_WriteReg,
> -};
> -
> -/* 1. Switch channel related */
> -struct sw_chnl_cmd {
> -	enum sw_chnl_cmd_id CmdID;
> -	u32 Para1;
> -	u32 Para2;
> -	u32 msDelay;
> -};
>   
>   enum hw90_block {
>   	HW90_BLOCK_MAC = 0,
> @@ -73,16 +56,6 @@ enum wireless_mode {
>   	WIRELESS_MODE_N_24G		= BIT(3),
>   };
>   
> -enum phy_rate_tx_offset_area {
> -	RA_OFFSET_LEGACY_OFDM1,
> -	RA_OFFSET_LEGACY_OFDM2,
> -	RA_OFFSET_HT_OFDM1,
> -	RA_OFFSET_HT_OFDM2,
> -	RA_OFFSET_HT_OFDM3,
> -	RA_OFFSET_HT_OFDM4,
> -	RA_OFFSET_HT_CCK,
> -};
> -
>   /* BB/RF related */
>   enum RF_TYPE_8190P {
>   	RF_TYPE_MIN,		/*  0 */
> @@ -141,24 +114,6 @@ struct bb_reg_def {
>   				 * Path A and B */
>   };
>   
> -struct ant_sel_ofdm {
> -	u32 r_tx_antenna:4;
> -	u32 r_ant_l:4;
> -	u32 r_ant_non_ht:4;
> -	u32 r_ant_ht1:4;
> -	u32 r_ant_ht2:4;
> -	u32 r_ant_ht_s1:4;
> -	u32 r_ant_non_ht_s1:4;
> -	u32 OFDM_TXSC:2;
> -	u32 reserved:2;
> -};
> -
> -struct ant_sel_cck {
> -	u8 r_cckrx_enable_2:2;
> -	u8 r_cckrx_enable:2;
> -	u8 r_ccktx_enable:4;
> -};
> -
>   /*------------------------------Define structure----------------------------*/
>   
>   /*------------------------Export global variable----------------------------*/
> @@ -208,18 +163,4 @@ void storePwrIndexDiffRateOffset(struct adapter *adapter, u32 regaddr,
>   #define PHY_SetRFReg(adapt, rfpath, regaddr, bitmask, data)	\
>   	rtl8188e_PHY_SetRFReg((adapt), (rfpath), (regaddr), (bitmask), (data))
>   
> -#define PHY_SetMacReg	PHY_SetBBReg
> -
> -#define	SIC_HW_SUPPORT			0
> -
> -#define	SIC_MAX_POLL_CNT		5
> -
> -#define	SIC_CMD_READY			0
> -#define	SIC_CMD_WRITE			1
> -#define	SIC_CMD_READ			2
> -
> -#define	SIC_CMD_REG			0x1EB		/*  1byte */
> -#define	SIC_ADDR_REG			0x1E8		/*  1b9~1ba, 2 bytes */
> -#define	SIC_DATA_REG			0x1EC		/*  1bc~1bf */
> -
>   #endif	/*  __INC_HAL8192CPHYCFG_H */
> 


Acked-by: Michael Straube <straube.linux@gmail.com>
