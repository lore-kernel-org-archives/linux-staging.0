Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617D02F23
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 20:58:54 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id o2so5658064lfu.13
        for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9tNvoCsfDcS/KAQ2EYnPv39GtEJ29zKgD8V1rLHIr7g=;
        b=QQ/wZ0DSPQ3Y+X2XG0uJ2UBBtbE4uITUlnhxX7vm5NQpjEhAvTpBNY9wEGSOXgK5q+
         aga2qMJaHHJ6PgzJ24K7xikAEYClC/+Z4NW3aeG3KHprnjEdNOJnWU9TiQimunUpygrw
         +pp5RqAgC14EQcx4YJ3dVfdKYzFgOxrnxFSlFeQsFSdDj2KwfZz34idpCBoFMw2kH+OK
         eul0wWDMSXVCGsNx9jusbmxenBtkC3ZkANpRgR/8+soHL805+vnxl+Fno1/F/Ny2t3NW
         7FaciLQyJYq5M8UErgNMW3bcOjtzb6v64L9c7G6cUPOKIlFxfWsrfz7+WB255XTOQJyC
         uKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9tNvoCsfDcS/KAQ2EYnPv39GtEJ29zKgD8V1rLHIr7g=;
        b=fNd9ZR9Fal1TAnEqzjhP4xg0Zalj+q5r/m+yUJ9I2jkTHfXDjfgToPRceWXbhjFvoF
         ROLO87QdDaubpCsiOnqCPKRUhPzXDIxCvBMqT7A4ipN+wou2M38Z1lDUdv4Hxxa85Uto
         uKHF29y0Rfu0/rcunJijpFRxshhIkP3AqUJDv4YfRuvaQoxQn6ZFMGZEB+dzX76vZfnG
         6ycxR1rhjlUSog7YXB64g98ETRQCo2+Fvil8nbTSLxwoYefebeo33MwA/hdeCeicS68P
         udQ27tcHtroC4kgvEOAj763XBUNaAwJwYFY43SOK2B8Rtciq4KmqleQYJPubr40QV1qC
         /+rQ==
X-Gm-Message-State: AOAM532UGcMHi6v1FxRY1CD44q9eajh0Wq+osl2yGJFOqSc1Ct+3AqEH
	PSShcBbZwhXwurqkI7kLaIw=
X-Google-Smtp-Source: ABdhPJzM9kM46Udo+tz9zqJpM9/3LCRejzmBpyLDD/ehzCKKjD89Q4kMFcjynTBugUpG++rLy2BG8Q==
X-Received: by 2002:a05:6512:2292:b0:46b:a65c:91b9 with SMTP id f18-20020a056512229200b0046ba65c91b9mr11181731lfu.663.1649883532358;
        Wed, 13 Apr 2022 13:58:52 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id s10-20020a19ad4a000000b0044826a25a2esm5284lfd.292.2022.04.13.13.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 13:58:52 -0700 (PDT)
Message-ID: <f819690c-b53e-4693-5de1-cc4cfa1db0da@gmail.com>
Date: Wed, 13 Apr 2022 23:58:51 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: staging: r8188eu: struct rt_firmware_header issues
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg KH <gregkh@linuxfoundation.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <94a72ecc-3acd-758b-15a4-a7d56bf03fbe@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <94a72ecc-3acd-758b-15a4-a7d56bf03fbe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michael,

On 4/13/22 19:27, Michael Straube wrote:
> Hi all,
> 
> I think the rt_firmware_hdr structure in rtw_fw.c has some issues.
> 
> 
> struct rt_firmware_hdr {
> 	/*  8-byte alinment required */
> 	/*  LONG WORD 0 ---- */
> 	__le16		Signature;	/* 92C0: test chip; 92C,
> 					 * 88C0: test chip; 88C1: MP A-cut;
> 					 * 92C1: MP A-cut */
> 	u8		Category;	/*  AP/NIC and USB/PCI */
> 	u8		Function;	/*  Reserved for different FW function
> 					 *  indcation, for further use when
> 					 *  driver needs to download different
> 					 *  FW for different conditions */
> 	__le16		Version;	/*  FW Version */
> 	u8		Subversion;	/*  FW Subversion, default 0x00 */
> 	u16		Rsvd1;
> 
> 	/*  LONG WORD 1 ---- */
> 	u8		Month;	/*  Release time Month field */
> 	u8		Date;	/*  Release time Date field */
> 	u8		Hour;	/*  Release time Hour field */
> 	u8		Minute;	/*  Release time Minute field */
> 	__le16		RamCodeSize;	/*  The size of RAM code */
> 	u8		Foundry;
> 	u8		Rsvd2;
> 
> 	/*  LONG WORD 2 ---- */
> 	__le32		SvnIdx;	/*  The SVN entry index */
> 	u32		Rsvd3;
> 
> 	/*  LONG WORD 3 ---- */
> 	u32		Rsvd4;
> 	u32		Rsvd5;
> };
> 
> 
> Then we have in rtl8188e_firmware_download():
> 
> 
> 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
> 
> 	<snip>
> 
> 	if (IS_FW_HEADER_EXIST(fwhdr)) {
> 		/*  Shift 32 bytes for FW header */
> 		fw_data = fw_data + 32;
> 		fw_size = fw_size - 32;
> 	}
> 
> We add/sub 32 bytes but the size of struct rt_firmware_hdr is actually
> 33 bytes. I noticed this when I wanted to replace:
> 

Looks like size of that structure is 36

└──$ pahole -C rt_firmware_hdr r8188eu.ko
struct rt_firmware_hdr {
	__le16                     Signature;            /*     0     2 */
	u8                         Category;             /*     2     1 */
	u8                         Function;             /*     3     1 */
	__le16                     Version;              /*     4     2 */
  	u8                         Subversion;           /*     6     1 */

  	/* XXX 1 byte hole, try to pack */

  	u16                        Rsvd1;                /*     8     2 */
  	u8                         Month;                /*    10     1 */
  	u8                         Date;                 /*    11     1 */
  	u8                         Hour;                 /*    12     1 */
  	u8                         Minute;               /*    13     1 */
  	__le16                     RamCodeSize;          /*    14     2 */
  	u8                         Foundry;              /*    16     1 */
  	u8                         Rsvd2;                /*    17     1 */

  	/* XXX 2 bytes hole, try to pack */

  	__le32                     SvnIdx;               /*    20     4 */
  	u32                        Rsvd3;                /*    24     4 */
  	u32                        Rsvd4;                /*    28     4 */
  	u32                        Rsvd5;                /*    32     4 */

  	/* size: 36, cachelines: 1, members: 17 */
  	/* sum members: 33, holes: 2, sum holes: 3 */
  	/* last cacheline: 36 bytes */
  };


And these comments like 'LONG WORD 1' looks misleading, maybe worth 
removing.


> 		fw_data = fw_data + 32;
> 		fw_size = fw_size - 32;
> 
> with:
> 		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
> 		fw_size = fw_size - sizeof(struct rt_firmware_hdr);;
> 
> To me it looks add/sub 32 is correct here but the struct is
> wrong. I don't know if the firmware for this driver is so much different
> from firmware for the drivers in drivers/net/wireless/realtek/rtlwifi.
> They use a struct of size 32.
> 

I am not sure about 32... Why non-packed structures are passed via 
wires? Maybe `__packed` is missing? Is realtek fw open-source?

Just thoughts.

> Also, souldn't the u16 and u32 variables in the struct be __le16 and
> __le32 ?
> 
> I wonder if we can just use the rtlwifi_firmware_header structure from
> drivers/net/wireless/realtek/rtlwifi/wifi.h ?
> 

We _should_ use it, since its size is indeed 32 bytes.

└──$ pahole -s vmlinux | rg rtlwifi_firmware_header
rtlwifi_firmware_header	32	0


Looks like you have found a real bug


With regards,
Pavel Skripkin
